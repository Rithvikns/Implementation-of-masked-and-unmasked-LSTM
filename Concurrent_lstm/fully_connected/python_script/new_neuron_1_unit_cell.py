def binary_16bit_to_float(binary_representation):
    # Extract sign bit
    sign_bit = -1 if binary_representation[0] == '1' else 1
    
    # Extract integer part
    integer_part = int(binary_representation[1:8], 2)
    
    # Extract fractional part
    fractional_part = int(binary_representation[8:], 2) / 256.0
    
    # Combine integer and fractional parts
    number = sign_bit * (integer_part + fractional_part)
    
    return number

def float_to_binary_16bit(number):
    # Handle sign
    sign_bit = '0' if number >= 0 else '1'
    
    # Split the number into integer and fractional parts
    integer_part = abs(int(number))
    fractional_part = abs(number) - integer_part
    
    # Convert integer part to 7-bit binary
    integer_binary = bin(integer_part)[2:].zfill(7)
    
    # Convert fractional part to 8-bit binary
    fractional_binary = format(int(fractional_part * 256), '08b')
    
    # Combine sign, integer, and fractional parts
    binary_representation = sign_bit + integer_binary + fractional_binary
    
    return binary_representation



uf=  -0.5890349 
ui=  -0.01003421
uc=   0.84638906
uo=   0.5272565


bf=  -2.7729793
bi=  -0.8716539
bc=   2.448193
bo=   2.0433068

# Array of provided weights (randomly generated here)
weights_array = [[ 0.33224416,  0.14884093,  0.17879291,  0.39319316 ],
       [ 1.0472579 ,  1.2588334 ,  0.5114607 ,  1.0756693 ],
       [ 0.11561527,  1.3247172 , -0.61314887, -0.44755054 ],
       [ 0.33669528,  1.2649802 , -0.78860235, -2.2756112 ],
       [-0.7896114 , -0.3366344 ,  0.52888453,  0.36286587 ],
       [-1.2631083 , -0.81931883,  0.59008163,  1.499566   ],
       [-1.0156833 , -0.7058552 ,  0.07594199,  0.38871494 ],
       [-0.88372207, -0.59667057,  0.27332443,  0.37103215 ],
       [-0.405807  , -0.3910177 ,  0.2941654 ,  0.8794109 ],
       [-1.1914335 , -1.1100818 ,  0.22091094,  0.8384945  ],
       [-0.93080634, -0.70898366,  0.6449562 ,  0.36483198],
       [ 0.40072367,  0.495397  , -0.77728266,  0.03031331 ],
       [ 1.2433556 ,  0.7945705 , -0.8298078 , -0.2894176   ],
       [ 1.5290803 ,  0.43897247, -0.1846336 , -0.23300365],
       [ 0.6644481 ,  0.20590855,  0.36334017, -0.38389194],
       [ 1.3508028 ,  0.5582957 , -0.19551627, -0.15683362],
       [ 1.4412634 ,  0.807298  , -0.37383986, -0.29703203],
       [ 1.3923311 ,  0.8010553 , -0.17208575, -0.03136092],
       [ 1.422803  ,  0.4248616 , -0.23620255,  0.01440935],
       [ 1.2552083 ,  0.9476372 , -0.41419348, -0.22199418],
       [ 1.5243686 ,  1.3809386 , -0.24312961, -0.1220632 ],
       [ 1.5347248 ,  1.7962694 , -0.24003008, -0.11161102],
       [ 1.5556872 ,  2.0124152 , -0.34332758, -0.33251858],
       [ 1.1359082 ,  3.2599285 , -0.3188354 ,  0.07010219],
       [ 0.57285696,  4.2273626 ,  0.21781343,  0.09760354],
       [ 0.79728013,  1.9504544 ,  1.7575148 , -0.72597104],
       [-0.65697014,  1.2535157 , -0.30727166,  0.6441095 ],
       [-0.13035749,  1.3943775 , -0.4075504 ,  0.3953773 ]]

x_start = 0
x_end = 10
y_start = 0
y_end = 10
for i in range(4,27):
    with open(f"neuron_{i}.vhd", "w") as file:
            file.write("library IEEE;\n")
            file.write("use IEEE.STD_LOGIC_1164.ALL;\n")
            file.write("use IEEE.NUMERIC_STD.ALL;\n")
            file.write(f"entity neuron_{i} is\n")
            file.write("    port (\n")

            file.write(f"        x : in STD_LOGIC_VECTOR(7 downto 0);\n")
            file.write(f"        c_t_minus_in : in STD_LOGIC_VECTOR(15 downto 0);\n")
            file.write(f"        h_t_minus_in : in STD_LOGIC_VECTOR(15 downto 0);\n")
            file.write(f"        c_t_minus_out : out STD_LOGIC_VECTOR(15 downto 0);\n")
            file.write(f"        h_t_minus_out : out STD_LOGIC_VECTOR(15 downto 0);\n")
            file.write(f"        y : out STD_LOGIC_VECTOR(7 downto 0)\n")
            file.write("    );\n")
            file.write(f"end neuron_{i} ;\n")
            
            file.write(f"architecture Behavioral of neuron_{i} is\n")
            file.write(f"   signal x_op : STD_LOGIC_VECTOR(15 downto 0);\n")
            for k in range(1,40):
                 file.write(f"signal wf{k} : STD_LOGIC_VECTOR(15 downto 0);\n")

            file.write(f"signal f_t : STD_LOGIC_VECTOR(15 downto 0);\n")
            file.write(f"signal i_t : STD_LOGIC_VECTOR(15 downto 0);\n")
            file.write(f"signal c_t : STD_LOGIC_VECTOR(15 downto 0);\n")
            file.write(f"signal o_t : STD_LOGIC_VECTOR(15 downto 0);\n")
            file.write(f"signal c_t_minus_1 : STD_LOGIC_VECTOR(15 downto 0);\n")
            file.write(f"signal h_t_minus_1 : STD_LOGIC_VECTOR(15 downto 0);\n")

            a=weights_array[i]
            file.write(f"signal wf : STD_LOGIC_VECTOR(15 downto 0):= \"{float_to_binary_16bit(a[0])}\";\n")
            file.write(f"signal wi : STD_LOGIC_VECTOR(15 downto 0):= \"{float_to_binary_16bit(a[1])}\";\n")
            file.write(f"signal wc : STD_LOGIC_VECTOR(15 downto 0):= \"{float_to_binary_16bit(a[2])}\";\n")
            file.write(f"signal wo : STD_LOGIC_VECTOR(15 downto 0):= \"{float_to_binary_16bit(a[3])}\";\n")

            file.write(f"signal bf : STD_LOGIC_VECTOR(15 downto 0):= \"{float_to_binary_16bit(bf)}\";\n")
            file.write(f"signal bi : STD_LOGIC_VECTOR(15 downto 0):= \"{float_to_binary_16bit(bi)}\";\n")
            file.write(f"signal bc : STD_LOGIC_VECTOR(15 downto 0):= \"{float_to_binary_16bit(bc)}\";\n")
            file.write(f"signal bo : STD_LOGIC_VECTOR(15 downto 0):= \"{float_to_binary_16bit(bo)}\";\n")

            file.write(f"signal uf : STD_LOGIC_VECTOR(15 downto 0):= \"{float_to_binary_16bit(uf)}\";\n")
            file.write(f"signal ui : STD_LOGIC_VECTOR(15 downto 0):= \"{float_to_binary_16bit(ui)}\";\n")
            file.write(f"signal uc : STD_LOGIC_VECTOR(15 downto 0):= \"{float_to_binary_16bit(uc)}\";\n")
            file.write(f"signal uo : STD_LOGIC_VECTOR(15 downto 0):= \"{float_to_binary_16bit(uo)}\";\n")



            file.write("component  sigmoid_1 is\n")
            file.write("\tport (\n")
            file.write("\t\tnum:in integer ;\n")
            file.write("\t\ty: out STD_LOGIC_VECTOR(15 downto 0)\n")
            file.write("\t\t);\n")
            file.write("end component sigmoid_1;\n\n")

            file.write("component  tanh is\n")
            file.write("\tport (\n")
            file.write("\t\tnum:in integer ;\n")
            file.write("\t\ty: out STD_LOGIC_VECTOR(15 downto 0)\n")
            file.write("\t\t);\n")
            file.write("end component tanh;\n\n")

            file.write("component  nn_addition is\n")
            file.write("\tPort (\n")
            file.write("\t\tinputx : in STD_LOGIC_VECTOR(15 downto 0);\n")
            file.write("\t\tinputy : in STD_LOGIC_VECTOR(15 downto 0);\n")
            file.write("\t\toutput : out STD_LOGIC_VECTOR(15 downto 0));\n")
            file.write("end component nn_addition;\n\n")

            file.write("component  nn_multiplication is\n")
            file.write("\tPort (\n")
            file.write("\t\tinputx : in STD_LOGIC_VECTOR(15 downto 0);\n")
            file.write("\t\tinputy : in STD_LOGIC_VECTOR(15 downto 0);\n")
            file.write("\t\toutput : out STD_LOGIC_VECTOR(15 downto 0));\n")
            file.write("end component nn_multiplication;\n")

            file.write(f"begin\n")

            file.write(f"x_op <= \"00000000\" & x;\n")

            file.write(f"ut1_nn_multiplication: nn_multiplication port map( x_op,wf , wf1);\n")
            file.write(f"ut2_nn_multiplication: nn_multiplication port map( uf,h_t_minus_in , wf2);\n")
            file.write(f"ut1_nn_addition: nn_addition port map( wf1,wf2 , wf3);\n")
            file.write(f"ut2_nn_addition: nn_addition port map( wf3,bf , wf4);\n")
            file.write(f"ut1_sigmoid_1: sigmoid_1 port map( to_integer(unsigned(wf4)),f_t);\n")

            file.write(f"ut3_nn_multiplication: nn_multiplication port map( x_op,wi , wf5);\n")
            file.write(f"ut4_nn_multiplication: nn_multiplication port map(ui,h_t_minus_in , wf6);\n")
            file.write(f"ut3_nn_addition: nn_addition port map( wf5,wf6 , wf7);\n")
            file.write(f"ut4_nn_addition: nn_addition port map( wf7,bi , wf8);\n")
            file.write(f"ut2_sigmoid_1: sigmoid_1 port map( to_integer(unsigned(wf8)),i_t);\n")

            file.write(f"ut5_nn_multiplication: nn_multiplication port map( x_op,wc , wf9);\n")
            file.write(f"ut6_nn_multiplication: nn_multiplication port map( uc,h_t_minus_in , wf10);\n")
            file.write(f"ut5_nn_addition: nn_addition port map( wf9,wf10 , wf11);\n")
            file.write(f"ut6_nn_addition: nn_addition port map( wf11,bc , wf12);\n")
            file.write(f"ut1_tanh : tanh port map( to_integer(unsigned(wf12)),c_t);\n")

            file.write(f"ut7_nn_multiplication: nn_multiplication port map( x_op,wo , wf13);\n")
            file.write(f"ut8_nn_multiplication: nn_multiplication port map(uo,h_t_minus_in , wf14);\n")
            file.write(f"ut7_nn_addition: nn_addition port map( wf13,wf14 , wf15);\n")
            file.write(f"ut8_nn_addition: nn_addition port map( wf15,bo , wf16);\n")
            file.write(f"ut3_sigmoid_1: sigmoid_1 port map( to_integer(unsigned(wf16)),o_t);\n")

            file.write(f"ut9_nn_multiplication: nn_multiplication port map( c_t_minus_in ,f_t , wf17);\n")
            file.write(f"ut10_nn_multiplication: nn_multiplication port map( i_t , c_t , wf18);\n")
            file.write(f"ut9_nn_addition: nn_addition port map( wf17,wf18 , c_t_minus_1);\n")
            file.write(f"ut2_tanh: tanh port map(to_integer(unsigned(c_t_minus_1)),wf19);\n")
            file.write(f"ut11_nn_multiplication: nn_multiplication port map( wf19 ,o_t , h_t_minus_1);\n")

 
            file.write(f"y <= \"00000000\" when ((unsigned(h_t_minus_1)> \"0000000001000001\") and (unsigned(h_t_minus_1)< \"0000000001010000\")) else \"11111111\" ;\n")
            file.write(f"h_t_minus_out <=  h_t_minus_1;\n")
            file.write(f"c_t_minus_out <=  c_t_minus_1;\n")

            file.write(f"end Behavioral;")
