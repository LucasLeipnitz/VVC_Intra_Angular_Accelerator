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
SIGNAL control : std_logic_vector(4 downto 0);

COMPONENT datapath
	PORT (
		control : IN std_logic_vector(4 downto 0);
		ref : IN ref_bus (0 to 3 );
		pred: OUT std_logic_vector(7 downto 0)
	);
END COMPONENT;

BEGIN
	
	i1 : datapath
	PORT MAP (control => control, ref => ref, pred => pred);
	
	init: PROCESS
	BEGIN
		
		control <= "00000";
		ref(0) <= "00000000";
		ref(1) <= "00000000"; 
		ref(2) <= "00000000";
		ref(3) <= "00000000";
		
		wait for 5 ns;
		
		control <= "00000";
		ref(0) <= "00110101"; -- 53
		ref(1) <= "10101010"; -- 170
		ref(2) <= "11101111"; -- 239
		ref(3) <= "00001010"; -- 10
		--p = (53*0 + 170*63 + 239*1 + 10*0 + 32) >> 6 = 10981 >> 6 = 171, AB 
		
		wait for 5 ns;
		
		control <= "00001";
		--p = (53*-2 + 170*61 + 239*5 + 10*0 + 32) >> 6 = 11491 >> 6 = 179, B3
		
		wait for 5 ns;
		
		control <= "00010";
		--p = (53*-2 + 170*57 + 239*11 + 10*-2 + 32) >> 6 = 12225 >> 6 = 191, BF
		
		wait for 5 ns;
		
		control <= "00100";
		--p = (53*-4 + 170*53 + 239*17 + 10*-2 + 32) >> 6 = 12873 >> 6 = 201, C9
		
		wait for 5 ns;
		
		control <= "01000";
		--p = (53*-4 + 170*34 + 239*37 + 10*-4 + 32) >> 6 = 14403 >> 6 = 225, E1
		
		wait for 5 ns;
		
		control <= "10000";
		--p = (53*16 + 170*32 + 239*16 + 10*0 + 32) >> 6 = 10144 >> 6 = 158, 9E
		
		wait;
		
	END PROCESS init;
END comportamental;