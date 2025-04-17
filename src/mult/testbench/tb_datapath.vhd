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
SIGNAL const : ref_bus (0 to 3 );
SIGNAL pred : std_logic_vector(7 downto 0);

COMPONENT datapath
	PORT (
		ref : IN ref_bus (0 to 3 );
		const : IN ref_bus (0 to 3 );
		pred: OUT std_logic_vector(7 downto 0)
	);
END COMPONENT;

BEGIN
	
	i1 : datapath
	PORT MAP (const => const, ref => ref, pred => pred);
	
	init: PROCESS
	BEGIN
		
		ref(0) <= "00000000";
		ref(1) <= "00000000"; 
		ref(2) <= "00000000";
		ref(3) <= "00000000";
		const(0) <= "11111101";
		const(1) <= "00100100";
		const(2) <= "00100010";
		const(3) <= "11111101";
		
		wait for 5 ns;
		
		ref(0) <= "00110101"; -- 53
		ref(1) <= "10101010"; -- 170
		ref(2) <= "11101111"; -- 239
		ref(3) <= "00001010"; -- 10
		--p = (53*-3 + 170*36 + 239*34 + 10*-3 + 32) >> 6 = 14089 >> 6 = 220, DC 
		
		wait for 5 ns;
		
		ref(0) <= "00110101"; -- 53
		ref(1) <= "00000000"; -- 0
		ref(2) <= "00000000"; -- 0
		ref(3) <= "00001010"; -- 10
		--p = (53*-3 + 0*36 + 0*34 + 10*-3 + 32) >> 6 = 189 >> 6 = clip(3, FD) = 0
		
		wait;
		
	END PROCESS init;
END comportamental;