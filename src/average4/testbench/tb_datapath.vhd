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

SIGNAL ref : ref_bus (0 to 3 );
SIGNAL pred : std_logic_vector(7 downto 0);
SIGNAL control : std_logic_vector(3 downto 0);

COMPONENT datapath
	PORT (
		control : IN std_logic_vector(3 downto 0);
		ref : IN ref_bus (0 to 3 );
		pred: OUT std_logic_vector(7 downto 0)
	);
END COMPONENT;

BEGIN
	
	i1 : datapath
	PORT MAP (control => control, ref => ref, pred => pred);
	
	init: PROCESS
	BEGIN
		
		control <= "0000";
		ref(0) <= "00000000";
		ref(1) <= "00000000"; 
		ref(2) <= "00000000";
		ref(3) <= "00000000";
		
		wait for 5 ns;
		
		control <= "0000";
		ref(0) <= "00110101"; -- 53
		ref(1) <= "10101010"; -- 170
		ref(2) <= "11101111"; -- 239
		ref(3) <= "00001010"; -- 10
		--p = (53*-1 + 170*62 + 239*3 + 10*0 + 32) >> 6 = 11236 >> 6 = 175, AF 
		
		wait for 5 ns;
		
		control <= "0001";
		--p = (53*-3 + 170*56 + 239*12 + 10*-2 + 32) >> 6 = 12241 >> 6 = 191, BF
		
		wait for 5 ns;
		
		control <= "0010";
		--p = (53*-5 + 170*52 + 239*19 + 10*-2 + 32) >> 6 = 13128 >> 6 = 205, CD
		
		wait for 5 ns;
		
		control <= "0100";
		--p = (53*-4 + 170*32 + 239*40 + 10*-4 + 32) >> 6 = 14780 >> 6 = 230, E6
		
		wait for 5 ns;
		
		control <= "1000";
		--p = (53*15 + 170*31 + 239*16 + 10*0 + 32) >> 6 = 9921 >> 6 = 155, 9B
		
		wait;
		
	END PROCESS init;
END comportamental;