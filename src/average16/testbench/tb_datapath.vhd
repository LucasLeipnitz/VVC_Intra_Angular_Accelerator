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
SIGNAL control : std_logic_vector(1 downto 0);

COMPONENT datapath
	PORT (
		control : IN std_logic_vector(1 downto 0);
		ref : IN ref_bus (0 to 3 );
		pred: OUT std_logic_vector(7 downto 0)
	);
END COMPONENT;

BEGIN
	
	i1 : datapath
	PORT MAP (control => control, ref => ref, pred => pred);
	
	init: PROCESS
	BEGIN
		
		control <= "00";
		ref(0) <= "00000000";
		ref(1) <= "00000000"; 
		ref(2) <= "00000000";
		ref(3) <= "00000000";
		
		wait for 5 ns;
		
		control <= "00";
		ref(0) <= "00110101"; -- 53
		ref(1) <= "10101010"; -- 170
		ref(2) <= "11101111"; -- 239
		ref(3) <= "00001010"; -- 10
		--p = (53*-3 + 170*53 + 239*16 + 10*-2 + 32) >> 6 = 12687 >> 6 = 198, C6 
		
		wait for 5 ns;
		
		control <= "01";
		--p = (53*-2 + 170*18 + 239*51 + 10*-3 + 32) >> 6 = 15145 >> 6 = 236, EC
		
		wait for 5 ns;
		
		control <= "10";
		--p = (53*12 + 170*28 + 239*19 + 10*3 + 32) >> 6 = 9.999 >> 6 = 156, 9C 	
		
		wait;
		
	END PROCESS init;
END comportamental;