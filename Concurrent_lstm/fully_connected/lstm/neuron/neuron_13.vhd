library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity neuron_13 is
    port (
        x : in STD_LOGIC_VECTOR(15 downto 0);
        c_t_minus_in : in STD_LOGIC_VECTOR(15 downto 0);
        h_t_minus_in : in STD_LOGIC_VECTOR(15 downto 0);
        c_t_minus_out : out STD_LOGIC_VECTOR(15 downto 0);
        h_t_minus_out : out STD_LOGIC_VECTOR(15 downto 0);
        y : out STD_LOGIC_VECTOR(15 downto 0)
    );
end neuron_13 ;
architecture Behavioral of neuron_13 is
signal wf1 : STD_LOGIC_VECTOR(15 downto 0);
signal wf2 : STD_LOGIC_VECTOR(15 downto 0);
signal wf3 : STD_LOGIC_VECTOR(15 downto 0);
signal wf4 : STD_LOGIC_VECTOR(15 downto 0);
signal wf5 : STD_LOGIC_VECTOR(15 downto 0);
signal wf6 : STD_LOGIC_VECTOR(15 downto 0);
signal wf7 : STD_LOGIC_VECTOR(15 downto 0);
signal wf8 : STD_LOGIC_VECTOR(15 downto 0);
signal wf9 : STD_LOGIC_VECTOR(15 downto 0);
signal wf10 : STD_LOGIC_VECTOR(15 downto 0);
signal wf11 : STD_LOGIC_VECTOR(15 downto 0);
signal wf12 : STD_LOGIC_VECTOR(15 downto 0);
signal wf13 : STD_LOGIC_VECTOR(15 downto 0);
signal wf14 : STD_LOGIC_VECTOR(15 downto 0);
signal wf15 : STD_LOGIC_VECTOR(15 downto 0);
signal wf16 : STD_LOGIC_VECTOR(15 downto 0);
signal wf17 : STD_LOGIC_VECTOR(15 downto 0);
signal wf18 : STD_LOGIC_VECTOR(15 downto 0);
signal wf19 : STD_LOGIC_VECTOR(15 downto 0);
signal wf20 : STD_LOGIC_VECTOR(15 downto 0);
signal wf21 : STD_LOGIC_VECTOR(15 downto 0);
signal wf22 : STD_LOGIC_VECTOR(15 downto 0);
signal wf23 : STD_LOGIC_VECTOR(15 downto 0);
signal wf24 : STD_LOGIC_VECTOR(15 downto 0);
signal wf25 : STD_LOGIC_VECTOR(15 downto 0);
signal wf26 : STD_LOGIC_VECTOR(15 downto 0);
signal wf27 : STD_LOGIC_VECTOR(15 downto 0);
signal wf28 : STD_LOGIC_VECTOR(15 downto 0);
signal wf29 : STD_LOGIC_VECTOR(15 downto 0);
signal wf30 : STD_LOGIC_VECTOR(15 downto 0);
signal wf31 : STD_LOGIC_VECTOR(15 downto 0);
signal wf32 : STD_LOGIC_VECTOR(15 downto 0);
signal wf33 : STD_LOGIC_VECTOR(15 downto 0);
signal wf34 : STD_LOGIC_VECTOR(15 downto 0);
signal wf35 : STD_LOGIC_VECTOR(15 downto 0);
signal wf36 : STD_LOGIC_VECTOR(15 downto 0);
signal wf37 : STD_LOGIC_VECTOR(15 downto 0);
signal wf38 : STD_LOGIC_VECTOR(15 downto 0);
signal wf39 : STD_LOGIC_VECTOR(15 downto 0);
signal f_t : STD_LOGIC_VECTOR(15 downto 0);
signal i_t : STD_LOGIC_VECTOR(15 downto 0);
signal c_t : STD_LOGIC_VECTOR(15 downto 0);
signal o_t : STD_LOGIC_VECTOR(15 downto 0);
signal c_t_minus_1 : STD_LOGIC_VECTOR(15 downto 0);
signal h_t_minus_1 : STD_LOGIC_VECTOR(15 downto 0);
signal wf : STD_LOGIC_VECTOR(15 downto 0):= "0000000110000111";
signal wi : STD_LOGIC_VECTOR(15 downto 0):= "0000000001110000";
signal wc : STD_LOGIC_VECTOR(15 downto 0):= "1000000000101111";
signal wo : STD_LOGIC_VECTOR(15 downto 0):= "1000000000111011";
signal bf : STD_LOGIC_VECTOR(15 downto 0):= "1000001011000101";
signal bi : STD_LOGIC_VECTOR(15 downto 0):= "1000000011011111";
signal bc : STD_LOGIC_VECTOR(15 downto 0):= "0000001001110010";
signal bo : STD_LOGIC_VECTOR(15 downto 0):= "0000001000001011";
signal uf : STD_LOGIC_VECTOR(15 downto 0):= "1000000010010110";
signal ui : STD_LOGIC_VECTOR(15 downto 0):= "1000000000000010";
signal uc : STD_LOGIC_VECTOR(15 downto 0):= "0000000011011000";
signal uo : STD_LOGIC_VECTOR(15 downto 0):= "0000000010000110";
component  sigmoid is
	port (
		num:in integer ;
		y: out STD_LOGIC_VECTOR(15 downto 0)
		);
end component sigmoid;

component  tanh is
	port (
		num:in integer ;
		y: out STD_LOGIC_VECTOR(15 downto 0)
		);
end component tanh;

component  nn_addition is
	Port (
		inputx : in STD_LOGIC_VECTOR(15 downto 0);
		inputy : in STD_LOGIC_VECTOR(15 downto 0);
		output : out STD_LOGIC_VECTOR(15 downto 0));
end component nn_addition;

component  nn_multiplication is
	Port (
		inputx : in STD_LOGIC_VECTOR(15 downto 0);
		inputy : in STD_LOGIC_VECTOR(15 downto 0);
		output : out STD_LOGIC_VECTOR(15 downto 0));
end component nn_multiplication;
begin
ut1_nn_multiplication: nn_multiplication port map( x,wf , wf1);
ut2_nn_multiplication: nn_multiplication port map( uf,h_t_minus_in , wf2);
ut1_nn_addition: nn_addition port map( wf1,wf2 , wf3);
ut2_nn_addition: nn_addition port map( wf3,bf , wf4);
ut1_sigmoid: sigmoid port map( to_integer(unsigned(wf4)),f_t);
ut3_nn_multiplication: nn_multiplication port map( x,wi , wf5);
ut4_nn_multiplication: nn_multiplication port map(ui,h_t_minus_in , wf6);
ut3_nn_addition: nn_addition port map( wf5,wf6 , wf7);
ut4_nn_addition: nn_addition port map( wf7,bi , wf8);
ut2_sigmoid: sigmoid port map( to_integer(unsigned(wf8)),i_t);
ut5_nn_multiplication: nn_multiplication port map( x,wc , wf9);
ut6_nn_multiplication: nn_multiplication port map( uc,h_t_minus_in , wf10);
ut5_nn_addition: nn_addition port map( wf9,wf10 , wf11);
ut6_nn_addition: nn_addition port map( wf11,bc , wf12);
ut1_tanh : tanh port map( to_integer(unsigned(wf12)),c_t);
ut7_nn_multiplication: nn_multiplication port map( x,wo , wf13);
ut8_nn_multiplication: nn_multiplication port map(uo,h_t_minus_in , wf14);
ut7_nn_addition: nn_addition port map( wf13,wf14 , wf15);
ut8_nn_addition: nn_addition port map( wf15,bo , wf16);
ut3_sigmoid: sigmoid port map( to_integer(unsigned(wf16)),o_t);
ut9_nn_multiplication: nn_multiplication port map( c_t_minus_in ,f_t , wf17);
ut10_nn_multiplication: nn_multiplication port map( i_t , c_t , wf18);
ut9_nn_addition: nn_addition port map( wf17,wf18 , c_t_minus_1);
ut2_tanh: tanh port map(to_integer(unsigned(c_t_minus_1)),wf19);
ut11_nn_multiplication: nn_multiplication port map( wf19 ,o_t , h_t_minus_1);
y <= "0000000000000000" when ((unsigned(h_t_minus_1)> "0000000001000001") and (unsigned(h_t_minus_1)< "0000000001010000")) else "0000000100000000" ;
h_t_minus_out <=  h_t_minus_1;
c_t_minus_out <=  c_t_minus_1;
end Behavioral;