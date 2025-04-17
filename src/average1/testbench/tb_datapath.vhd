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
SIGNAL control : std_logic_vector(5 downto 0);

COMPONENT datapath
	PORT (
		control : IN std_logic_vector(5 downto 0);
		ref : IN ref_bus (0 to 3 );
		pred: OUT std_logic_vector(7 downto 0)
	);
END COMPONENT;

BEGIN
	
	i1 : datapath
	PORT MAP (control => control, ref => ref, pred => pred);
	
	init: PROCESS
	BEGIN
		
		control <= "000000";
		ref(0) <= "00000000";
		ref(1) <= "00000000"; 
		ref(2) <= "00000000";
		ref(3) <= "00000000";
		
		wait for 5 ns;
		
		control <= "000000";
		ref(0) <= "00110101"; -- 53
		ref(1) <= "10101010"; -- 170
		ref(2) <= "11101111"; -- 239
		ref(3) <= "00001010"; -- 10
		--p = (53*0 + 170*64 + 239*0 + 10*0 + 32) >> 6 = 10912 >> 6 = 170, AA 
		
		wait for 5 ns;
		
		control <= "000001";
		--p = (53*-1 + 170*63 + 239*2 + 10*0 + 32) >> 6 = 11167 >> 6 = 174, AE
		
		wait for 5 ns;
		
		control <= "000010";
		--p = (53*-2 + 170*62 + 239*4 + 10*0 + 32) >> 6 = 11422 >> 6 = 178, B2
		
		wait for 5 ns;
				
		control <= "100000";
		--p = (53*16 + 170*32 + 239*16 + 10*0 + 32) >> 6 = 10144 >> 6 = 158, 9E
		
		wait for 5 ns;
				
		control <= "111000";
		--p = (53*4 + 170*20 + 239*28 + 10*12 + 32) >> 6 = 10456 >> 6 = 163, A3
		
		wait;
		
	END PROCESS init;
END comportamental;