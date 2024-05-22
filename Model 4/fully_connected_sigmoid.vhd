-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity f_c_sig is
	port (
		num:in integer ;
		y: out STD_LOGIC_VECTOR(15 downto 0)
		);
end f_c_sig;

architecture Behavioral of f_c_sig is
begin 

        
                 
      y <=    "1111000010000000"  when  (((num >= 0) and (num <= 64)) or (num = 32768))   else
"1110101010000001" when  ((num >= 65) and (num <= 128))   else
"0101110010000010" when  ((num >= 129) and (num <= 192))   else
"0111011010000011" when  ((num >= 193) and (num <= 256))   else
"0100001110000100" when  ((num >= 257) and (num <= 320))   else
"1010110010000101" when  ((num >= 321) and (num <= 384))   else
"0110011010000110" when  ((num >= 385) and (num <= 448))   else
"0001110110000111" when  ((num >= 449) and (num <= 512))   else
"1110101010001000" when  ((num >= 513) and (num <= 576))   else
"1010111110001001" when  ((num >= 577) and (num <= 641))   else
"0111110110001010" when  ((num >= 642) and (num <= 705))   else
"0000010110001011" when  ((num >= 706) and (num <= 770))   else
"0000110110001100" when  ((num >= 771) and (num <= 834))   else
"0111101110001101" when  ((num >= 835) and (num <= 899))   else
"0010111010001110" when  ((num >= 900) and (num <= 964))   else
"0111110110001111" when  ((num >= 965) and (num <= 1029))   else
"1110110110010000" when  ((num >= 1030) and (num <= 1094))   else
"0110011010010001" when  ((num >= 1095) and (num <= 1159))   else
"0011000010010010" when  ((num >= 1160) and (num <= 1225))   else
"1111100010010011" when  ((num >= 1226) and (num <= 1290))   else
"0000110010010100" when  ((num >= 1291) and (num <= 1356))   else
"0010011110010101" when  ((num >= 1357) and (num <= 1422))   else
"0110110010010110" when  ((num >= 1423) and (num <= 1488))   else
"0101011010010111" when  ((num >= 1489) and (num <= 1554))   else
"0101100010011000" when  ((num >= 1555) and (num <= 1620))   else
"0001010010011001" when  ((num >= 1621) and (num <= 1687))   else
"0110100110011010" when  ((num >= 1688) and (num <= 1754))   else
"1001000010011011" when  ((num >= 1755) and (num <= 1821))   else
"0001111110011100" when  ((num >= 1822) and (num <= 1888))   else
"0000000110011101" when  ((num >= 1889) and (num <= 1956))   else
"0001101010011110" when  ((num >= 1957) and (num <= 2024))   else
"1100001110011111" when  ((num >= 2025) and (num <= 2092))   else
"1101011110100000" when  ((num >= 2093) and (num <= 2160))   else
"0111000010100001" when  ((num >= 2161) and (num <= 2229))   else
"0010000010100010" when  ((num >= 2230) and (num <= 2298))   else
"1011111110100011" when  ((num >= 2299) and (num <= 2367))   else
"0000000010100100" when  ((num >= 2368) and (num <= 2437))   else
"1100010010100101" when  ((num >= 2438) and (num <= 2507))   else
"0011111010100110" when  ((num >= 2508) and (num <= 2577))   else
"0110111010100111" when  ((num >= 2578) and (num <= 2648))   else
"0010001110101000" when  ((num >= 2649) and (num <= 2719))   else
"0101111010101001" when  ((num >= 2720) and (num <= 2791))   else
"1110001010101010" when  ((num >= 2792) and (num <= 2863))   else
"1100001010101011" when  ((num >= 2864) and (num <= 2935))   else
"1010100110101100" when  ((num >= 2936) and (num <= 3008))   else
"1000011010101101" when  ((num >= 3009) and (num <= 3081))   else
"0100000010101110" when  ((num >= 3082) and (num <= 3155))   else
"1010000110101111" when  ((num >= 3156) and (num <= 3229))   else
"1101111010110000" when  ((num >= 3230) and (num <= 3304))   else
"1010010110110001" when  ((num >= 3305) and (num <= 3379))   else
"1101100010110010" when  ((num >= 3380) and (num <= 3455))   else
"1001010010110011" when  ((num >= 3456) and (num <= 3531))   else
"1000010110110100" when  ((num >= 3532) and (num <= 3608))   else
"0000001110110101" when  ((num >= 3609) and (num <= 3686))   else
"1000000010110110" when  ((num >= 3687) and (num <= 3764))   else
"0100011010110111" when  ((num >= 3765) and (num <= 3843))   else
"1111110110111000" when  ((num >= 3844) and (num <= 3922))   else
"0010101110111001" when  ((num >= 3923) and (num <= 4002))   else
"1101001110111010" when  ((num >= 4003) and (num <= 4083))   else
"1111011110111011" when  ((num >= 4084) and (num <= 4165))   else
"0110011010111100" when  ((num >= 4166) and (num <= 4247))   else
"0000111010111101" when  ((num >= 4248) and (num <= 4330))   else
"0100110110111110" when  ((num >= 4331) and (num <= 4415))   else
"1010101010111111" when  ((num >= 4416) and (num <= 4499))   else
"0100011011000000" when  ((num >= 4500) and (num <= 4585))   else
"0111101011000001" when  ((num >= 4586) and (num <= 4672))   else
"0010001111000010" when  ((num >= 4673) and (num <= 4760))   else
"0101111111000011" when  ((num >= 4761) and (num <= 4848))   else
"0100110011000100" when  ((num >= 4849) and (num <= 4938))   else
"1010011111000101" when  ((num >= 4939) and (num <= 5029))   else
"0110010111000110" when  ((num >= 5030) and (num <= 5121))   else
"1101011011000111" when  ((num >= 5122) and (num <= 5214))   else
"0001000011001000" when  ((num >= 5215) and (num <= 5308))   else
"1011111111001001" when  ((num >= 5309) and (num <= 5403))   else
"0000010111001010" when  ((num >= 5404) and (num <= 5500))   else
"1010001111001011" when  ((num >= 5501) and (num <= 5598))   else
"1010001011001100" when  ((num >= 5599) and (num <= 5698))   else
"1101011111001101" when  ((num >= 5699) and (num <= 5799))   else
"1111010011001110" when  ((num >= 5800) and (num <= 5901))   else
"0111011011001111" when  ((num >= 5902) and (num <= 6006))   else
"0010111111010000" when  ((num >= 6007) and (num <= 6111))   else
"0111001111010001" when  ((num >= 6112) and (num <= 6219))   else
"0111101111010010" when  ((num >= 6220) and (num <= 6329))   else
"1010111111010011" when  ((num >= 6330) and (num <= 6440))   else
"0001010111010100" when  ((num >= 6441) and (num <= 6553))   else
"0101100111010101" when  ((num >= 6554) and (num <= 6669))   else
"1010100011010110" when  ((num >= 6670) and (num <= 6787))   else
"0001001111010111" when  ((num >= 6788) and (num <= 6907))   else
"0111000011011000" when  ((num >= 6908) and (num <= 7030))   else
"0100101111011001" when  ((num >= 7031) and (num <= 7155))   else
"1010110111011010" when  ((num >= 7156) and (num <= 7283))   else
"1010001111011011" when  ((num >= 7284) and (num <= 7414))   else
"1010010111011100" when  ((num >= 7415) and (num <= 7548))   else
"0010110111011101" when  ((num >= 7549) and (num <= 7685))   else
"0111001111011110" when  ((num >= 7686) and (num <= 7826))   else
"1001011111011111" when  ((num >= 7827) and (num <= 7970))   else
"1100110111100000" when  ((num >= 7971) and (num <= 8118))   else
"1111000111100001" when  ((num >= 8119) and (num <= 8271))   else
"1000101011100010" when  ((num >= 8272) and (num <= 8428))   else
"0100101111100011" when  ((num >= 8429) and (num <= 8589))   else
"0110000011100100" when  ((num >= 8590) and (num <= 8756))   else
"1110100011100101" when  ((num >= 8757) and (num <= 8929))   else
"0000100111100110" when  ((num >= 8930) and (num <= 9107))   else
"0011101011100111" when  ((num >= 9108) and (num <= 9292))   else
"1010100111101000" when  ((num >= 9293) and (num <= 9484))   else
"0000111111101001" when  ((num >= 9485) and (num <= 9684))   else
"0111110011101010" when  ((num >= 9685) and (num <= 9892))   else
"0100001111101011" when  ((num >= 9893) and (num <= 10109))   else
"1100100011101100" when  ((num >= 10110) and (num <= 10336))   else
"0101010111101101" when  ((num >= 10337) and (num <= 10575))   else
"0100001111101110" when  ((num >= 10576) and (num <= 10826))   else
"0110001111101111" when  ((num >= 10827) and (num <= 11092))   else
"1100010011110000" when  ((num >= 11093) and (num <= 11373))   else
"1000001011110001" when  ((num >= 11374) and (num <= 11673))   else
"1110001111110010" when  ((num >= 11674) and (num <= 11993))   else
"0110100011110011" when  ((num >= 11994) and (num <= 12338))   else
"0100111111110100" when  ((num >= 12339) and (num <= 12711))   else
"1000000011110101" when  ((num >= 12712) and (num <= 13118))   else
"0001110111110110" when  ((num >= 13119) and (num <= 13566))   else
"0110101011110111" when  ((num >= 13567) and (num <= 14065))   else
"1111001011111000" when  ((num >= 14066) and (num <= 14629))   else
"0100000011111001" when  ((num >= 14630) and (num <= 15276))   else
"0111000111111010" when  ((num >= 15277) and (num <= 16039))   else
"1011111111111011" when  ((num >= 16040) and (num <= 16970))   else
"1111010011111100" when  ((num >= 16971) and (num <= 18164))   else
"1101000111111101" when  ((num >= 18165) and (num <= 19841))   else
"0110110111111110" when  ((num >= 19842) and (num <= 22697))   else
"1100100011111111" when  ((num >= 22698) and (num <= 32767))   else
"1100010001111111" when  ((num >= 32769) and (num <= 32832))   else
"1001101101111110" when  ((num >= 32833) and (num <= 32896))   else
"0111100001111101" when  ((num >= 32897) and (num <= 32960))   else
"0101011101111100" when  ((num >= 32961) and (num <= 33024))   else
"0010011101111011" when  ((num >= 33025) and (num <= 33088))   else
"0110000001111010" when  ((num >= 33089) and (num <= 33152))   else
"0011011001111001" when  ((num >= 33153) and (num <= 33216))   else
"0100011101111000" when  ((num >= 33217) and (num <= 33280))   else
"0111100001110111" when  ((num >= 33281) and (num <= 33344))   else
"0001010001110110" when  ((num >= 33345) and (num <= 33409))   else
"1000001001110101" when  ((num >= 33410) and (num <= 33473))   else
"0001000001110100" when  ((num >= 33474) and (num <= 33538))   else
"0001010101110011" when  ((num >= 33539) and (num <= 33602))   else
"0000001101110010" when  ((num >= 33603) and (num <= 33667))   else
"0011101001110001" when  ((num >= 33668) and (num <= 33732))   else
"0111100101110000" when  ((num >= 33733) and (num <= 33797))   else
"0000110101101111" when  ((num >= 33798) and (num <= 33862))   else
"0100000101101110" when  ((num >= 33863) and (num <= 33927))   else
"1110001001101101" when  ((num >= 33928) and (num <= 33993))   else
"1100101101101100" when  ((num >= 33994) and (num <= 34058))   else
"0101100101101011" when  ((num >= 34059) and (num <= 34124))   else
"0101110101101010" when  ((num >= 34125) and (num <= 34190))   else
"0011001001101001" when  ((num >= 34191) and (num <= 34256))   else
"0101100101101000" when  ((num >= 34257) and (num <= 34322))   else
"0001000101100111" when  ((num >= 34323) and (num <= 34388))   else
"1000101001100110" when  ((num >= 34389) and (num <= 34455))   else
"1100010101100101" when  ((num >= 34456) and (num <= 34522))   else
"1011111101100100" when  ((num >= 34523) and (num <= 34589))   else
"0000110101100011" when  ((num >= 34590) and (num <= 34656))   else
"0010101001100010" when  ((num >= 34657) and (num <= 34724))   else
"1001010101100001" when  ((num >= 34725) and (num <= 34792))   else
"1111010101100000" when  ((num >= 34793) and (num <= 34860))   else
"0100110001011111" when  ((num >= 34861) and (num <= 34928))   else
"1000011101011110" when  ((num >= 34929) and (num <= 34997))   else
"1100010101011101" when  ((num >= 34998) and (num <= 35066))   else
"0011100101011100" when  ((num >= 35067) and (num <= 35135))   else
"0001000001011011" when  ((num >= 35136) and (num <= 35205))   else
"0100101001011010" when  ((num >= 35206) and (num <= 35275))   else
"0000100101011001" when  ((num >= 35276) and (num <= 35345))   else
"1001000101011000" when  ((num >= 35346) and (num <= 35416))   else
"0111111001010111" when  ((num >= 35417) and (num <= 35487))   else
"0110100001010110" when  ((num >= 35488) and (num <= 35559))   else
"1000011101010101" when  ((num >= 35560) and (num <= 35631))   else
"1010011101010100" when  ((num >= 35632) and (num <= 35703))   else
"1110011101010011" when  ((num >= 35704) and (num <= 35776))   else
"1010101001010010" when  ((num >= 35777) and (num <= 35849))   else
"0011010101010001" when  ((num >= 35850) and (num <= 35923))   else
"1100001001010000" when  ((num >= 35924) and (num <= 35997))   else
"0001011001001111" when  ((num >= 35998) and (num <= 36072))   else
"1011111001001110" when  ((num >= 36073) and (num <= 36147))   else
"0101000001001101" when  ((num >= 36148) and (num <= 36223))   else
"1010100001001100" when  ((num >= 36224) and (num <= 36299))   else
"1010011101001011" when  ((num >= 36300) and (num <= 36376))   else
"1001111001001010" when  ((num >= 36377) and (num <= 36454))   else
"0010011001001001" when  ((num >= 36455) and (num <= 36532))   else
"0000011101001000" when  ((num >= 36533) and (num <= 36611))   else
"0100100001000111" when  ((num >= 36612) and (num <= 36690))   else
"1000100001000110" when  ((num >= 36691) and (num <= 36770))   else
"1001010101000101" when  ((num >= 36771) and (num <= 36851))   else
"0011100001000100" when  ((num >= 36852) and (num <= 36933))   else
"0101101001000011" when  ((num >= 36934) and (num <= 37015))   else
"0011110001000010" when  ((num >= 37016) and (num <= 37098))   else
"1100100001000001" when  ((num >= 37099) and (num <= 37183))   else
"0001011101000000" when  ((num >= 37184) and (num <= 37267))   else
"1001010100111111" when  ((num >= 37268) and (num <= 37353))   else
"1000000100111110" when  ((num >= 37354) and (num <= 37440))   else
"0110000100111101" when  ((num >= 37441) and (num <= 37528))   else
"1110011100111100" when  ((num >= 37529) and (num <= 37616))   else
"0110101000111011" when  ((num >= 37617) and (num <= 37706))   else
"0101101100111010" when  ((num >= 37707) and (num <= 37797))   else
"0110111100111001" when  ((num >= 37798) and (num <= 37889))   else
"1011000100111000" when  ((num >= 37890) and (num <= 37982))   else
"1011101100110111" when  ((num >= 37983) and (num <= 38076))   else
"0010001000110110" when  ((num >= 38077) and (num <= 38171))   else
"1110001100110101" when  ((num >= 38172) and (num <= 38268))   else
"1111101100110100" when  ((num >= 38269) and (num <= 38366))   else
"0011000000110011" when  ((num >= 38367) and (num <= 38466))   else
"1000011000110010" when  ((num >= 38467) and (num <= 38567))   else
"1010010100110001" when  ((num >= 38568) and (num <= 38669))   else
"1101001000110000" when  ((num >= 38670) and (num <= 38774))   else
"1100011100101111" when  ((num >= 38775) and (num <= 38879))   else
"0011110000101110" when  ((num >= 38880) and (num <= 38987))   else
"1001101100101101" when  ((num >= 38988) and (num <= 39097))   else
"1001101100101100" when  ((num >= 39098) and (num <= 39208))   else
"0010000100101011" when  ((num >= 39209) and (num <= 39321))   else
"1010101100101010" when  ((num >= 39322) and (num <= 39437))   else
"1101011100101001" when  ((num >= 39438) and (num <= 39555))   else
"0010011100101000" when  ((num >= 39556) and (num <= 39675))   else
"1111101100100111" when  ((num >= 39676) and (num <= 39798))   else
"1011001100100110" when  ((num >= 39799) and (num <= 39923))   else
"0101011100100101" when  ((num >= 39924) and (num <= 40051))   else
"1110001100100100" when  ((num >= 40052) and (num <= 40182))   else
"1010110000100011" when  ((num >= 40183) and (num <= 40316))   else
"1110110000100010" when  ((num >= 40317) and (num <= 40453))   else
"1100111100100001" when  ((num >= 40454) and (num <= 40594))   else
"1110010000100000" when  ((num >= 40595) and (num <= 40738))   else
"1010010100011111" when  ((num >= 40739) and (num <= 40886))   else
"0110110100011110" when  ((num >= 40887) and (num <= 41039))   else
"1100110000011101" when  ((num >= 41040) and (num <= 41196))   else
"0001001100011100" when  ((num >= 41197) and (num <= 41357))   else
"0001111100011011" when  ((num >= 41358) and (num <= 41524))   else
"1000101100011010" when  ((num >= 41525) and (num <= 41697))   else
"1111101100011001" when  ((num >= 41698) and (num <= 41875))   else
"1111111100011000" when  ((num >= 41876) and (num <= 42060))   else
"1010000100010111" when  ((num >= 42061) and (num <= 42252))   else
"0100110000010110" when  ((num >= 42253) and (num <= 42452))   else
"1111110100010101" when  ((num >= 42453) and (num <= 42660))   else
"1101110100010100" when  ((num >= 42661) and (num <= 42877))   else
"1010110000010011" when  ((num >= 42878) and (num <= 43104))   else
"1000111100010010" when  ((num >= 43105) and (num <= 43343))   else
"1011110100010001" when  ((num >= 43344) and (num <= 43594))   else
"1011001100010000" when  ((num >= 43595) and (num <= 43860))   else
"1101110100001111" when  ((num >= 43861) and (num <= 44141))   else
"1000101000001110" when  ((num >= 44142) and (num <= 44441))   else
"1101011000001101" when  ((num >= 44442) and (num <= 44761))   else
"1000001100001100" when  ((num >= 44762) and (num <= 45106))   else
"0100010000001011" when  ((num >= 45107) and (num <= 45479))   else
"1000101000001010" when  ((num >= 45480) and (num <= 45886))   else
"0110011100001001" when  ((num >= 45887) and (num <= 46334))   else
"0111100100001000" when  ((num >= 46335) and (num <= 46833))   else
"1101111000000111" when  ((num >= 46834) and (num <= 47397))   else
"1010111100000110" when  ((num >= 47398) and (num <= 48044))   else
"1100110000000101" when  ((num >= 48045) and (num <= 48807))   else
"1001010100000100" when  ((num >= 48808) and (num <= 49738))   else
"1111000000000011" when  ((num >= 49739) and (num <= 50932))   else
"0100000100000010" when  ((num >= 50933) and (num <= 52609))   else
"0110000100000001" when  ((num >= 52610) and (num <= 55465))   else
"0000000000000000" ;


end Behavioral;