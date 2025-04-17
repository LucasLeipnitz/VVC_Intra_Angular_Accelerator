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
                Y1, -- Y1 = ref[0]*-3
                Y2, -- Y2 = ref[0]*-2
                Y3, -- Y3 = ref[0]*12
                Y4 : out std_logic_vector ( 15 downto 0 ) -- Y4 = ref[0]*4
        );
END COMPONENT;

COMPONENT MCM_1
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[1]*53
                Y2, -- Y2 = ref[1]*18
                Y3, -- Y3 = ref[1]*28
                Y4 : out std_logic_vector ( 15 downto 0 ) -- Y4 = ref[1]*20
        );
END COMPONENT;

COMPONENT MCM_2
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[2]*16
                Y2, -- Y2 = ref[2]*51
                Y3, -- Y3 = ref[2]*19
                Y4 : out std_logic_vector ( 15 downto 0 ) -- Y4 = ref[2]*27
        );
END COMPONENT;

COMPONENT MCM_3
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[3]*-2
                Y2, -- Y2 = ref[3]*-3
                Y3, -- Y3 = ref[3]*3
                Y4 : out std_logic_vector ( 15 downto 0 ) -- Y4 = ref[3]*11
        );
END COMPONENT;

COMPONENT equation_block
	PORT (
			input_0, input_1, input_2, input_3 : in std_logic_vector ( 15 downto 0 );
			output : out std_logic_vector ( 7 downto 0 )
	);
END COMPONENT;

type t_input is array (0 to 31) of std_logic_vector( 15 downto 0);
signal 	input : t_input;


BEGIN

	m0 : MCM_0
    PORT MAP ( X => ref(0), Y1 => input(0), Y2 => input(1), Y3 => input(2), Y4 => input(3) );
    m1 : MCM_1
    PORT MAP ( X => ref(1), Y1 => input(4), Y2 => input(5), Y3 => input(6), Y4 => input(7) );
    m2 : MCM_2
    PORT MAP ( X => ref(2), Y1 => input(8), Y2 => input(9), Y3 => input(10), Y4 => input(11) );
    m3 : MCM_3
    PORT MAP ( X => ref(3), Y1 => input(12), Y2 => input(13), Y3 => input(14), Y4 => input(15) );
	
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