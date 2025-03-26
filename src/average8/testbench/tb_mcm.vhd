-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mode_in_out.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
-----------------------------------------------

ENTITY tb_mcm IS
END tb_mcm;

ARCHITECTURE comportamental OF tb_mcm IS

SIGNAL ref : ref_bus (0 to 3 );

COMPONENT MCM_0
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1,   -- aaaa
			Y2, 
			Y3, 
			Y4, 
			Y5, 
			Y6, 
			Y7, 
			Y8 : out std_logic_vector ( 15 downto 0 ) -- aa
	);
END COMPONENT;

COMPONENT MCM_1
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_2
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

COMPONENT MCM_3
	PORT (
			X : in std_logic_vector ( 7 downto 0 );
			Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8 : out std_logic_vector ( 15 downto 0 )
	);
END COMPONENT;

type t_input is array (0 to 31) of std_logic_vector( 15 downto 0);
signal 	input : t_input;


BEGIN
	
	m0 : MCM_0
	PORT MAP ( X => ref(0), Y1 => input(0), Y2 => input(1), Y3 => input(2), Y4 => input(3), Y5 => input(4), Y6 => input(5), Y7 => input(6), Y8 => input(7) );
	m1 : MCM_1
	PORT MAP ( X => ref(1), Y1 => input(8), Y2 => input(9), Y3 => input(10), Y4 => input(11), Y5 => input(12), Y6 => input(13), Y7 => input(14), Y8 => input(15) );
	m2 : MCM_2
	PORT MAP ( X => ref(2), Y1 => input(16), Y2 => input(17), Y3 => input(18), Y4 => input(19), Y5 => input(20), Y6 => input(21), Y7 => input(22), Y8 => input(23) );
	m3 : MCM_3
	PORT MAP ( X => ref(3), Y1 => input(24), Y2 => input(25), Y3 => input(26), Y4 => input(27), Y5 => input(28), Y6 => input(29), Y7 => input(30), Y8 => input(31) );
	
	init: PROCESS
	BEGIN
		
		ref(0) <= "00000000";
		ref(1) <= "00000000"; 
		ref(2) <= "00000000";
		ref(3) <= "00000000";
		
		wait for 5 ns;
		
		ref(0) <= "00110101"; -- 53
		ref(1) <= "10101010"; -- 170
		ref(2) <= "11101111"; -- 239
		ref(3) <= "00001010"; -- 10
		
		wait;
		
	END PROCESS init;
END comportamental;