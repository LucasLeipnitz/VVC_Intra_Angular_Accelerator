library ieee;
use ieee.std_logic_1164.all;

entity ROM is
  port (   
  		  rst : in std_logic;
  		  clk : in std_logic;
  		  address : in std_logic_vector(5 downto 0);
		  data_1 : out std_logic_vector(7 downto 0);
		  data_2 : out std_logic_vector(7 downto 0);
		  data_3 : out std_logic_vector(7 downto 0);
		  data_4 : out std_logic_vector(7 downto 0)
  );
end entity ROM;

architecture behavioral of ROM is
  type mem is array ( 0 to 57) of std_logic_vector(7 downto 0);
  constant coefficients : mem := (
    0 => "00000000",
    1 => "00000000",
    2 => "00000001",
    3 => "00000010",
    4 => "00000011",
    5 => "00000100",
    6 => "00000101",
    7 => "00000110",
    8 => "00000111",
    9 => "00001000",
    10 => "00001001",
    11 => "00001010",
    12 => "00001011",
    13 => "00001100",
    14 => "00001101",
    15 => "00001110",
    16 => "00001111",
    17 => "00010000",
    18 => "00010001",
    19 => "00010010",
    20 => "00010011",
    21 => "00010100",
    22 => "00010101",
    23 => "00010110",
    24 => "00010111",
    25 => "00011000",
    26 => "00011001",
    27 => "00011010",
    28 => "00011011",
    29 => "00011100",
    30 => "00011101",
    31 => "00011110",
    32 => "00011111",
    33 => "00100000",
    34 => "00100001",
    35 => "00100100",
    36 => "00100111",
    37 => "00101010",
    38 => "00101100",
    39 => "00101110",
    40 => "00110001",
    41 => "00110100",
    42 => "00110101",
    43 => "00110110",
    44 => "00110111",
    45 => "00111000",
    46 => "00111001",
    47 => "00111010",
    48 => "00111100",
    49 => "00111110",
    50 => "00111111",
    51 => "01000000",
    52 => "11111110",
    53 => "11111110",
    54 => "11111101",
    55 => "11111100",
    56 => "11111111",
    57 => "11111111");
begin
   process (clk)
   begin
	  	if rst = '1' then
				data_1 <= "00000000"; data_2 <= "00000000"; data_3 <= "00000000"; data_4 <= "00000000";
		elsif clk'event and clk = '1' then
		     case address is
			    when "000000" => data_1 <= coefficients(0); data_2 <= coefficients(50); data_3 <= coefficients(0); data_4 <= coefficients(0);
		        when "000001" => data_1 <= coefficients(56); data_2 <= coefficients(49); data_3 <= coefficients(2); data_4 <= coefficients(0);
		        when "000010" => data_1 <= coefficients(51); data_2 <= coefficients(48); data_3 <= coefficients(4); data_4 <= coefficients(0);
		        when "000011" => data_1 <= coefficients(51); data_2 <= coefficients(47); data_3 <= coefficients(7); data_4 <= coefficients(56);
		        when "000100" => data_1 <= coefficients(51); data_2 <= coefficients(46); data_3 <= coefficients(10); data_4 <= coefficients(51);
		        when "000101" => data_1 <= coefficients(55); data_2 <= coefficients(45); data_3 <= coefficients(12); data_4 <= coefficients(51);
		        when "000110" => data_1 <= coefficients(54); data_2 <= coefficients(44); data_3 <= coefficients(14); data_4 <= coefficients(51);
		        when "000111" => data_1 <= coefficients(54); data_2 <= coefficients(43); data_3 <= coefficients(15); data_4 <= coefficients(51);
		        when "001000" => data_1 <= coefficients(54); data_2 <= coefficients(42); data_3 <= coefficients(16); data_4 <= coefficients(51);
		        when "001001" => data_1 <= coefficients(53); data_2 <= coefficients(41); data_3 <= coefficients(18); data_4 <= coefficients(51);
		        when "001010" => data_1 <= coefficients(52); data_2 <= coefficients(40); data_3 <= coefficients(20); data_4 <= coefficients(51);
		        when "001011" => data_1 <= coefficients(52); data_2 <= coefficients(39); data_3 <= coefficients(24); data_4 <= coefficients(55);
		        when "001100" => data_1 <= coefficients(52); data_2 <= coefficients(38); data_3 <= coefficients(28); data_4 <= coefficients(54);
		        when "001101" => data_1 <= coefficients(53); data_2 <= coefficients(37); data_3 <= coefficients(29); data_4 <= coefficients(54);
		        when "001110" => data_1 <= coefficients(54); data_2 <= coefficients(36); data_3 <= coefficients(30); data_4 <= coefficients(54);
		        when "001111" => data_1 <= coefficients(54); data_2 <= coefficients(35); data_3 <= coefficients(33); data_4 <= coefficients(54);
		        when "010000" => data_1 <= coefficients(54); data_2 <= coefficients(34); data_3 <= coefficients(34); data_4 <= coefficients(54);
		        when "010001" => data_1 <= coefficients(54); data_2 <= coefficients(33); data_3 <= coefficients(35); data_4 <= coefficients(54);
		        when "010010" => data_1 <= coefficients(54); data_2 <= coefficients(30); data_3 <= coefficients(36); data_4 <= coefficients(54);
		        when "010011" => data_1 <= coefficients(54); data_2 <= coefficients(29); data_3 <= coefficients(37); data_4 <= coefficients(53);
		        when "010100" => data_1 <= coefficients(54); data_2 <= coefficients(28); data_3 <= coefficients(38); data_4 <= coefficients(52);
		        when "010101" => data_1 <= coefficients(55); data_2 <= coefficients(24); data_3 <= coefficients(39); data_4 <= coefficients(52);
		        when "010110" => data_1 <= coefficients(51); data_2 <= coefficients(20); data_3 <= coefficients(40); data_4 <= coefficients(52);
		        when "010111" => data_1 <= coefficients(51); data_2 <= coefficients(18); data_3 <= coefficients(41); data_4 <= coefficients(53);
		        when "011000" => data_1 <= coefficients(51); data_2 <= coefficients(16); data_3 <= coefficients(42); data_4 <= coefficients(54);
		        when "011001" => data_1 <= coefficients(51); data_2 <= coefficients(15); data_3 <= coefficients(43); data_4 <= coefficients(54);
		        when "011010" => data_1 <= coefficients(51); data_2 <= coefficients(14); data_3 <= coefficients(44); data_4 <= coefficients(54);
		        when "011011" => data_1 <= coefficients(51); data_2 <= coefficients(12); data_3 <= coefficients(45); data_4 <= coefficients(55);
		        when "011100" => data_1 <= coefficients(51); data_2 <= coefficients(10); data_3 <= coefficients(46); data_4 <= coefficients(51);
		        when "011101" => data_1 <= coefficients(56); data_2 <= coefficients(7); data_3 <= coefficients(47); data_4 <= coefficients(51);
		        when "011110" => data_1 <= coefficients(0); data_2 <= coefficients(4); data_3 <= coefficients(48); data_4 <= coefficients(51);
		        when "011111" => data_1 <= coefficients(0); data_2 <= coefficients(2); data_3 <= coefficients(49); data_4 <= coefficients(56);
		        when "100000" => data_1 <= coefficients(16); data_2 <= coefficients(32); data_3 <= coefficients(16); data_4 <= coefficients(0);
		        when "100001" => data_1 <= coefficients(16); data_2 <= coefficients(32); data_3 <= coefficients(16); data_4 <= coefficients(0);
		        when "100010" => data_1 <= coefficients(15); data_2 <= coefficients(31); data_3 <= coefficients(17); data_4 <= coefficients(1);
		        when "100011" => data_1 <= coefficients(15); data_2 <= coefficients(31); data_3 <= coefficients(17); data_4 <= coefficients(1);
		        when "100100" => data_1 <= coefficients(14); data_2 <= coefficients(30); data_3 <= coefficients(18); data_4 <= coefficients(2);
		        when "100101" => data_1 <= coefficients(14); data_2 <= coefficients(30); data_3 <= coefficients(18); data_4 <= coefficients(2);
		        when "100110" => data_1 <= coefficients(13); data_2 <= coefficients(29); data_3 <= coefficients(19); data_4 <= coefficients(3);
		        when "100111" => data_1 <= coefficients(13); data_2 <= coefficients(29); data_3 <= coefficients(19); data_4 <= coefficients(3);
		        when "101000" => data_1 <= coefficients(12); data_2 <= coefficients(28); data_3 <= coefficients(20); data_4 <= coefficients(4);
		        when "101001" => data_1 <= coefficients(12); data_2 <= coefficients(28); data_3 <= coefficients(20); data_4 <= coefficients(4);
		        when "101010" => data_1 <= coefficients(11); data_2 <= coefficients(27); data_3 <= coefficients(21); data_4 <= coefficients(5);
		        when "101011" => data_1 <= coefficients(11); data_2 <= coefficients(27); data_3 <= coefficients(21); data_4 <= coefficients(5);
		        when "101100" => data_1 <= coefficients(10); data_2 <= coefficients(26); data_3 <= coefficients(22); data_4 <= coefficients(6);
		        when "101101" => data_1 <= coefficients(10); data_2 <= coefficients(26); data_3 <= coefficients(22); data_4 <= coefficients(6);
		        when "101110" => data_1 <= coefficients(9); data_2 <= coefficients(25); data_3 <= coefficients(23); data_4 <= coefficients(7);
		        when "101111" => data_1 <= coefficients(9); data_2 <= coefficients(25); data_3 <= coefficients(23); data_4 <= coefficients(7);
		        when "110000" => data_1 <= coefficients(8); data_2 <= coefficients(24); data_3 <= coefficients(24); data_4 <= coefficients(8);
		        when "110001" => data_1 <= coefficients(8); data_2 <= coefficients(24); data_3 <= coefficients(24); data_4 <= coefficients(8);
		        when "110010" => data_1 <= coefficients(7); data_2 <= coefficients(23); data_3 <= coefficients(25); data_4 <= coefficients(9);
		        when "110011" => data_1 <= coefficients(7); data_2 <= coefficients(23); data_3 <= coefficients(25); data_4 <= coefficients(9);
		        when "110100" => data_1 <= coefficients(6); data_2 <= coefficients(22); data_3 <= coefficients(26); data_4 <= coefficients(10);
		        when "110101" => data_1 <= coefficients(6); data_2 <= coefficients(22); data_3 <= coefficients(26); data_4 <= coefficients(10);
		        when "110110" => data_1 <= coefficients(5); data_2 <= coefficients(21); data_3 <= coefficients(27); data_4 <= coefficients(11);
		        when "110111" => data_1 <= coefficients(5); data_2 <= coefficients(21); data_3 <= coefficients(27); data_4 <= coefficients(11);
		        when "111000" => data_1 <= coefficients(4); data_2 <= coefficients(20); data_3 <= coefficients(28); data_4 <= coefficients(12);
		        when "111001" => data_1 <= coefficients(4); data_2 <= coefficients(20); data_3 <= coefficients(28); data_4 <= coefficients(12);
		        when "111010" => data_1 <= coefficients(3); data_2 <= coefficients(19); data_3 <= coefficients(29); data_4 <= coefficients(13);
		        when "111011" => data_1 <= coefficients(3); data_2 <= coefficients(19); data_3 <= coefficients(29); data_4 <= coefficients(13);
		        when "111100" => data_1 <= coefficients(2); data_2 <= coefficients(18); data_3 <= coefficients(30); data_4 <= coefficients(14);
		        when "111101" => data_1 <= coefficients(2); data_2 <= coefficients(18); data_3 <= coefficients(30); data_4 <= coefficients(14);
		        when "111110" => data_1 <= coefficients(1); data_2 <= coefficients(17); data_3 <= coefficients(31); data_4 <= coefficients(15);
		        when "111111" => data_1 <= coefficients(1); data_2 <= coefficients(17); data_3 <= coefficients(31); data_4 <= coefficients(15);
		       	when others => data_1 <= "00000000"; data_2 <= "00000000"; data_3 <= "00000000"; data_4 <= "00000000";
			 end case;
		end if;
  end process;
end architecture behavioral;