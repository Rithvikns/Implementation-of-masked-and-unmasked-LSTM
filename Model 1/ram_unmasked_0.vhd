library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ram_0 is
    Port ( clk : in std_logic;
we : in std_logic;
a : in STD_LOGIC_vector(9 downto 0);
di : in std_logic_vector(15 downto 0);
do : out std_logic_vector(15 downto 0)
);
end ram_0;

architecture syn of ram_0 is

    type ram_type is array (0 to 783) of std_logic_vector(15 downto 0);
    signal ram : ram_type := ( 
"0000000000000101","0000000000010100","0000000000001111","1000000000010100","1000000000010010","0000000000010010","0000000000000010","1000000000010000","0000000000010100","0000000000000100","0000000000001000","1000000000001101","0000000010000001","0000000001101000","1000000000001001","1000000000001100","1000000000001110","1000000000000011","1000000000010100","1000000000000010","0000000000000010","0000000000000101","0000000000000000","1000000000001001","0000000000000110","0000000000001110","0000000000000100","1000000000001101","1000000000010100","1000000000000001","0000000000001000","1000000000001011","0000000000011001","0000000001111001","0000000011110010","0000000101011100","0000000010110000","0000000110010011","0000000111000111","0000000000100110","0000000000110000","0000000001100111","0000000010001100","0000000100111001","0000000011101000","0000000100000111","0000000110111110","0000000101011110","0000000100000100","0000000100000010","0000000011001100","0000000001101010","0000000000000101","0000000000001110","1000000000000100","1000000000010011","0000000000001111","0000000000010100","0000000001100110","1000000000111011","1000000001000000","0000000100010000","0000000010000010","0000000100001000","0000000111111010","0000001100000001","0000001100001111","0000001011011000","0000001011110100","0000000111000110","0000001001000011","0000001001011101","0000000111011101","0000000110001011","0000001001101101","0000000111010110","0000000111101100","0000000111000110","0000000011111010","0000000101011011","0000000100001011","0000000010010000","0000000000001111","0000000000001001","1000000000000101","0000000000000111","0000000001101110","0000000001101001","1000000010000110","1000000000001010","0000000100110001","0000000101001001","0000000001111000","0000000101000110","0000000010100100","0000000001100001","0000000101101010","0000000110101111","0000000011110010","0000000100000110","0000000001101011","0000000000011110","0000000011001111","0000000100101011","0000000100101000","0000000011011001","0000000101110100","0000000100110010","0000000001011110","1000000000010001","1000000001100111","0000000000001010","1000000000000111","0000000001111101","0000000000000101","1000000001000010","1000000001000111","0000000000111101","0000000000111000","0000000000001000","1000000000001001","1000000000001010","1000000000011111","1000000001001010","0000000010000011","0000000010100010","0000000101000001","0000000001100011","0000000001101100","1000000000000001","0000000000010010","0000000000110011","0000000010100100","0000000001100010","0000000001000101","0000000001011000","1000000001110101","1000000001101000","0000000001110101","0000000010111010","1000000000001000","0000000000000111","0000000100010101","1000000010010001","0000000001101011","1000000000101100","1000000001011010","0000000000101000","1000000001001100","1000000001011000","1000000001111001","1000000010011101","0000000000100000","1000000000000101","0000000001001000","0000000000011111","0000000010101010","1000000000000111","1000000000010111","1000000000101001","0000000000110000","0000000001101001","0000000000100000","0000000000100011","1000000001100101","0000000000000001","1000000000001111","0000000011101110","1000000000001111","0000000001000110","0000000000000000","0000000010000100","0000000000100111","1000000001101111","1000000000110011","0000000000011010","1000000000111001","1000000000011000","1000000010001011","1000000001101010","1000000000010111","1000000001100011","1000000001000101","0000000000011110","1000000000010100","1000000010001011","1000000010111011","1000000000011111","1000000000001010","1000000000100011","0000000000011111","1000000000000001","0000000010000001","0000000010000110","1000000000001010","0000000001110111","0000000000001001","0000000100010111","0000000110001110","0000000001001011","0000000100101110","0000000000100001","1000000000000111","0000000001010010","0000000000011010","1000000000101111","1000000001001010","1000000001000110","1000000001011000","1000000001100101","1000000001001001","1000000001001111","1000000001111101","1000000010011101","1000000001001100","1000000000101110","1000000000100000","0000000000101010","0000000000111000","1000000000111001","0000000001111010","1000000001001111","1000000001000010","1000000000100000","1000000000010101","0000000101010000","0000000000110111","0000000010001101","0000000001101000","0000000000011101","0000000000100101","1000000000111100","1000000000101000","1000000000000010","0000000000001111","0000000000001100","0000000000101111","0000000000100111","1000000001010001","1000000001101011","1000000010010001","1000000010010100","1000000001110110","1000000000100010","0000000000101011","1000000001000100","0000000000111100","0000000000110011","0000000010011100","0000000000111011","0000000010110011","0000000001011001","0000000010100101","0000000101110110","0000000001101111","0000000001111000","0000000011101010","0000000010010111","0000000001111011","0000000000010010","1000000000000110","0000000001001000","1000000000111001","0000000000110111","0000000001000100","1000000000000111","1000000000011001","1000000001110011","1000000001101001","1000000001100101","1000000010010000","1000000000100100","0000000000001110","0000000000110010","1000000000000011","1000000000110010","0000000000011000","0000000010111110","0000000011111011","0000000000000001","0000000010011110","0000000110101001","0000000010100001","1000000000010000","0000000001111100","1000000001110110","0000000000000110","0000000000100110","0000000000111011","1000000000010100","0000000000000100","1000000000001001","1000000000110001","0000000010100011","0000000001101011","1000000001011110","1000000001000011","1000000000010110","1000000000001010","1000000000101100","0000000001000101","1000000000011101","0000000000010111","0000000000001011","0000000000011000","1000000000101001","0000000010111101","0000000011001001","0000000011000011","1000000000101110","0000000010010011","0000000101000000","0000000010100100","1000000000001000","0000000001011111","0000000000010000","1000000000000101","1000000000010000","1000000001011011","1000000010110101","1000000001110001","0000000001011110","0000000011001100","1000000000100001","1000000010000001","1000000011001001","1000000001101001","1000000000000101","1000000000000110","1000000000011110","0000000000001010","0000000000100111","0000000010010100","0000000000101111","1000000001000110","0000000011100111","0000000001111110","0000000100110110","0000000000011100","1000000000000011","1000000000000100","0000000000011100","1000000000100001","1000000001001011","1000000001100100","1000000001101000","1000000011111100","1000000011010001","1000000001010000","0000000001011010","0000000011110000","0000000001111001","1000000000110111","1000000011000100","1000000000100101","0000000000001010","0000000000000000","0000000001001111","1000000001100101","0000000000001110","0000000001000011","0000000001101001","0000000010011101","0000000011010101","0000000000100000","0000000000010101","1000000000011011","1000000001011101","1000000101000110","1000000100001101","1000000011000111","1000000100000101","1000000001101110","1000000001110101","1000000011001100","1000000001000100","0000000001101010","0000000011100111","0000000011010110","0000000010010100","0000000000001101","1000000010000100","0000000000001000","0000000000100101","0000000001001000","0000000000101111","1000000000101011","0000000000100010","0000000000101100","0000000001011101","0000000010110100","0000000011110110","0000000000111100","0000000001101000","0000000010010011","1000000011000000","1000001000101010","1000000101011000","1000000001111001","1000000011011101","1000000001011101","1000000010101010","1000000000101001","0000000010001010","0000000010011111","0000000011110111","0000000100001101","0000000010010010","0000000000000111","1000000001111001","0000000000011000","0000000000001000","1000000000010110","1000000000111000","1000000000110100","1000000001101100","1000000010100110","0000000000101110","0000000011111010","0000000011001010","0000000010010101","1000000000101000","0000000011101000","1000000001011110","1000000010001000","1000000001000111","1000000000011010","1000000010101111","1000000001101011","1000000000000011","1000000000010011","0000000000011101","0000000001111001","0000000100100111","0000000101111000","0000000010010110","1000000000001101","1000000010010011","1000000000001101","1000000000101001","1000000000101000","1000000000100001","1000000000101010","1000000001000110","1000000000010010","0000000000110111","1000000000101011","0000000001111110","0000000010000110","1000000010001000","0000000011010000","0000000010010000","0000000000100110","1000000000011100","1000000001001011","1000000001110101","1000000000100111","0000000000110101","0000000000110101","0000000001000000","0000000010000001","0000000101001001","0000000100011011","0000000010000100","0000000000000001","1000000001100100","1000000001001001","1000000000011100","1000000010001110","1000000000010111","0000000000000111","0000000000111001","0000000000110111","0000000100011100","0000000101111010","0000000000001011","1000000000010101","1000000001101101","0000000001101111","0000000001111100","0000000001011011","1000000000000001","0000000000010001","0000000000001110","0000000001000110","0000000000011000","0000000000001000","0000000001010000","0000000010110110","0000000100001111","0000000010100011","0000000001010000","1000000000000001","1000000010010110","0000000000000101","0000000000100001","1000000000100111","0000000000101011","0000000000001101","0000000000011111","0000000001111111","0000000010100001","0000000011110110","1000000001001100","1000000000101101","1000000000001001","0000000000111010","0000000010010010","0000000000010000","0000000001000011","0000000000011111","0000000000110100","0000000001101001","1000000000101111","1000000000000010","0000000000010000","0000000100001001","0000000100001010","0000000000111110","0000000001000100","0000000000000110","1000000000000101","0000000001101001","0000000001010000","0000000000110010","1000000000010001","0000000000011000","0000000000110011","0000000100011011","0000000010110110","0000000010011010","0000000001100101","0000000000100111","1000000001011011","1000000001011111","1000000001101010","0000000000011111","0000000000100000","0000000000111100","0000000010000101","0000000001101110","0000000010011111","0000000010101110","0000000010010111","0000000010110011","0000000001111111","0000000000100110","0000000001101001","0000000000000000","0000000000110100","1000000000000000","0000000000100011","0000000000101010","0000000001000110","0000000010110110","0000000010101100","0000000001101011","0000000001101010","0000000011011100","0000000001110100","0000000000000010","1000000001111010","1000000001010100","0000000001011011","0000000000001000","1000000000110101","0000000001001010","0000000010011010","0000000010100010","0000000011001010","0000000010100001","0000000010011110","0000000010011001","0000000000110010","0000000000001100","0000000000110001","1000000001011101","1000000001111000","1000000001001001","1000000000111010","0000000001010001","0000000000110111","0000000001111001","0000000011101011","1000000000110100","1000000000111101","0000000001011010","1000000000110111","0000000000101010","0000000011100111","1000000001000100","1000000000000000","1000000001100100","1000000001010011","1000000000101011","0000000000001011","0000000000011111","0000000000100000","1000000000010111","0000000000011001","0000000001010000","0000000001100111","0000000010001000","1000000000011001","1000000001010101","1000000000001001","1000000000100001","0000000000110100","0000000001000001","1000000000011000","0000000000100111","0000000011001110","0000000000001000","1000000000110010","0000000001000000","1000000001100110","0000000000101010","0000000001111100","0000000011001100","1000000000010000","0000000010010101","0000000001100011","0000000000100110","0000000001001011","1000000000100011","1000000000010110","1000000001001001","1000000001001100","0000000000001011","1000000000000111","0000000000101000","0000000000111000","0000000000001110","0000000000001111","1000000000010111","1000000000010111","0000000001000001","0000000000011010","1000000001101011","0000000000010001","0000000000100000","1000000000111100","1000000010011111","1000000001101100","1000000000001000","0000000000001111","0000000000101000","1000000001010010","1000000000000011","0000000011101100","0000000000100100","1000000000101100","1000000000101100","1000000000110000","1000000010101110","1000000000110010","0000000000101101","0000000001010110","0000000000010110","0000000001001110","0000000001011111","1000000001011110","1000000000001111","1000000000010100","0000000000100000","0000000000010101","0000000000111110","1000000000001100","1000000010000111","0000000000010101","1000000001001011","1000000000001011","1000000000001100","0000000000001100","0000000011111010","1000000001001100","1000000110001110","1000000011111100","1000000011100100","1000000011000010","1000000001111001","1000000001011010","1000000001101101","0000000001111011","0000000001111011","0000000001011110","0000000001110101","0000000000110010","0000000000000011","1000000011000011","1000000001011111","0000000000110011","0000000000100110","1000000001001010","1000000001010111","1000000011011000","1000000010001001","0000000000100010","0000000010101001","1000000000000101","1000000000000111","1000000000000101","1000000010000010","0000000001000100","1000000101010110","1000000101101111","1000000101001111","1000000100001011","1000000010101011","1000000010111011","1000000011111110","1000000000110110","1000000000101010","1000000001001110","1000000000000101","0000000001000001","1000000001110000","1000000011001011","1000000001110111","1000000001101111","1000000001011010","1000000010111100","1000000100011111","1000000001110001","1000000010010000","1000000001000100","0000000001101110","0000000000000011","0000000000000010","0000000000001111","1000000000001001","1000000010001001","1000000100001110","1000000011001110","1000000010011111","1000000000110000","1000000000001101","1000000011011000","1000000000111011","1000000001110000","1000000000111110","1000000001000001","1000000010110111","1000000100010001","1000000101010001","1000000011001000","1000000100110100","1000000101011011","1000000101111001","1000000110000110","1000000011110010","1000000001100010","0000000001001000","0000000001111111","1000000000001100","0000000000001101","1000000000000000","0000000000010101","1000000000001100","0000000000001010","0000000010101010","0000000100010100","0000000000000111","0000000010000100","0000000001101001","0000000100001111","0000000100100010","0000000101001001","0000000101111111","0000001011011101","0000000100111001","0000001000100111","0000001011010110","0000001000010010","0000000010000011","0000000100001000","1000000001010101","1000000010101000","1000000001011010","0000000010010101","1000000000001100","0000000000010101","0000000000000101","1000000000010010");
begin
process (clk)
begin
if (clk'event and clk = '1') then
if (we = '1') then
RAM(conv_integer(a)) <= di;
end if;
end if;
end process;
do <= RAM(conv_integer(a));
end syn;
