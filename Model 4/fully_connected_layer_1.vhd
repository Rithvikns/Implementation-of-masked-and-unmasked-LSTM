library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

entity fully_connected_layer_1 is

    port (

        clk : in std_logic;

        x_0 : in STD_LOGIC_VECTOR(7 downto 0);

        x_1 : in STD_LOGIC_VECTOR(7 downto 0);

        x_2 : in STD_LOGIC_VECTOR(7 downto 0);

        x_3 : in STD_LOGIC_VECTOR(7 downto 0);

        x_4 : in STD_LOGIC_VECTOR(7 downto 0);

        x_5 : in STD_LOGIC_VECTOR(7 downto 0);

        x_6 : in STD_LOGIC_VECTOR(7 downto 0);

        x_7 : in STD_LOGIC_VECTOR(7 downto 0);

        x_8 : in STD_LOGIC_VECTOR(7 downto 0);

        x_9 : in STD_LOGIC_VECTOR(7 downto 0);

        y : out STD_LOGIC_VECTOR(3 downto 0)

    );

end fully_connected_layer_1 ;

architecture Behavioral of fully_connected_layer_1 is
		 
shared variable max_index : STD_LOGIC_VECTOR(3 downto 0);


begin


    process (x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_7, x_8, x_9)
    begin
        max_index := "0000";
		  
		if (x_0 > x_1) and (x_0 > x_2) and (x_0 > x_3) and (x_0 > x_4) and (x_0 > x_5) and (x_0 > x_6) and (x_0 > x_7) and (x_0 > x_8) and (x_0 > x_9) then
            max_index := "0000" ;
        elsif (x_1 > x_2) and (x_1 > x_3) and (x_1 > x_4) and (x_1 > x_5) and (x_1 > x_6) and (x_1 > x_7) and (x_1 > x_8) and (x_1 > x_9) then
            max_index := "0001" ;
        elsif (x_2 > x_3) and (x_2 > x_4) and (x_2 > x_5) and (x_2 > x_6) and (x_2 > x_7) and (x_2 > x_8) and (x_2 > x_9) then
            max_index := "0010" ;
        elsif (x_3 > x_4) and (x_3 > x_5) and (x_3 > x_6) and (x_3 > x_7) and (x_3 > x_8) and (x_3 > x_9) then
            max_index := "0011" ;
        elsif (x_4 > x_5) and (x_4 > x_6) and (x_4 > x_7) and (x_4 > x_8) and (x_4 > x_9) then
            max_index := "0100" ;
        elsif (x_5 > x_6) and (x_5 > x_7) and (x_5 > x_8) and (x_5 > x_9) then
            max_index := "0101" ;
        elsif (x_6 > x_7) and (x_6 > x_8) and (x_6 > x_9) then
            max_index := "0110" ;
        elsif (x_7 > x_8) and (x_7 > x_9) then
            max_index := "0111" ;
        elsif (x_8 > x_9) then
            max_index := "1000" ;
        else
          max_index := "1001" ;
        end if;
        y <= max_index;
    end process;
end Behavioral;