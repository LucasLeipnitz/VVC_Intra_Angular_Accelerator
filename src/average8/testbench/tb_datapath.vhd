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
SIGNAL control : std_logic_vector(2 downto 0);

COMPONENT datapath
	PORT (
		control : IN std_logic_vector(2 downto 0);
		ref : IN ref_bus (0 to 3 );
		pred: OUT std_logic_vector(7 downto 0)
	);
END COMPONENT;

BEGIN
	
	i1 : datapath
	PORT MAP (control => control, ref => ref, pred => pred);
	
	init: PROCESS
	BEGIN
		
		control <= "000";
		ref(0) <= "00000000";
		ref(1) <= "00000000"; 
		ref(2) <= "00000000";
		ref(3) <= "00000000";
		
		wait for 5 ns;
		
		control <= "000";
		ref(0) <= "00110101"; -- 53
		ref(1) <= "10101010"; -- 170
		ref(2) <= "11101111"; -- 239
		ref(3) <= "00001010"; -- 10
		--p = 2E32 >> 6 = B9 
		
		wait for 5 ns;
		
		control <= "001";
		--p = (53*-5 + 170*47 + 239*24 + 10*-3 + 32) >> 6 = 13463 >> 6 = 210, D2
		
		wait for 5 ns;
		
		control <= "010";
		--p = (53*-3 + 170*27 + 239*45 + 10*-5 + 32) >> 6 = 15168 >> 6 = 237, ED 	
		
		wait for 5 ns;
		
		control <= "100";
		--p = (53*14 + 170*30 + 239*17 + 10*1 + 32) >> 6 = 9947 >> 6 = 155, 9B
		
		wait;
		
	END PROCESS init;
END comportamental;