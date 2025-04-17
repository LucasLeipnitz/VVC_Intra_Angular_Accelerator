-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY tb_datapath IS
END tb_datapath;

ARCHITECTURE comportamental OF tb_datapath IS

SIGNAL clk : std_logic;
SIGNAL rst : std_logic;
SIGNAL ref : sample_bus (0 to 6 );
SIGNAL pred: sample_bus (0 to 3 );
SIGNAL control : std_logic_vector(2 downto 0);

COMPONENT datapath
	PORT (
		clk : IN  std_logic;
		rst : IN  std_logic;
		control : IN std_logic_vector(2 downto 0);
		ref : IN sample_bus (0 to 6 );
		pred: OUT sample_bus (0 to 3 )
	);
END COMPONENT;

BEGIN
	
	i1 : datapath
	PORT MAP (clk => clk, rst => rst, control => control, ref => ref, pred => pred);
	
	init: PROCESS
	BEGIN
		
		rst <= '1';
		clk <= '0';
		control <= "000";
		ref(0) <= "00110101"; -- 53
		ref(1) <= "10101010"; -- 170
		ref(2) <= "11101111"; -- 239
		ref(3) <= "00001010"; -- 10
		ref(4) <= "01100001"; -- 97
		ref(5) <= "10111001"; -- 185
		ref(6) <= "00000001"; -- 1
		
		wait for 5 ns;
		
		rst <= '0';
		clk <= '1';
		--p = (53*-2 + 170*59 + 239*8 + 10*-1 + 32) >> 6 = 11858 >> 6 = 185, B9
		--p = (170*-2 + 239*59 + 10*8 + 97*-1 + 32) >> 6 = 13776 >> 6 = 215, D7
		--p = (239*-2 + 10*59 + 97*8 + 185*-1 + 32) >> 6 = 735 >> 6 = 11, 0B
		--p = (10*-2 + 97*59 + 185*8 + 1*-1 + 32) >> 6 = 7214 >> 6 = 112, 70
		
		wait for 5 ns;
		
		clk <= '0';
		control <= "001";
		
		wait for 5 ns;
		
		clk <= '1';
		--p = (53*-5 + 170*47 + 239*24 + 10*-3 + 32) >> 6 = 13463 >> 6 = 210, D2
		--p = (170*-5 + 239*47 + 10*24 + 97*-3 + 32) >> 6 = 10364 >> 6 = 161, A1
		--p = (239*-5 + 10*47 + 97*24 + 185*-3 + 32) >> 6 = 1080 >> 6 = 16, 10
		--p = (10*-5 + 97*47 + 185*24 + 1*-3 + 32) >> 6 = 8978 >> 6 = 140, 8C
		
		wait;
		
	END PROCESS init;
END comportamental;