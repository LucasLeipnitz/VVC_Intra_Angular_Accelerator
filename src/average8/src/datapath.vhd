-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY datapath IS
	PORT (
		control : IN std_logic_vector(2 downto 0);
		ref : IN ref_bus (0 to 3 );
		pred: OUT std_logic_vector(7 downto 0)
	);
END datapath;

ARCHITECTURE comportamental OF datapath IS


COMPONENT MCM_0
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[0]*-2
                Y2, -- Y2 = ref[0]*-5
                Y3, -- Y3 = ref[0]*-3
                Y4, -- Y4 = ref[0]*-1
                Y5, -- Y5 = ref[0]*14
                Y6, -- Y6 = ref[0]*10
                Y7, -- Y7 = ref[0]*6
                Y8 : out std_logic_vector ( 15 downto 0 ) -- Y8 = ref[0]*2
        );
END COMPONENT;

COMPONENT MCM_1
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[1]*59
                Y2, -- Y2 = ref[1]*47
                Y3, -- Y3 = ref[1]*27
                Y4, -- Y4 = ref[1]*10
                Y5, -- Y5 = ref[1]*30
                Y6, -- Y6 = ref[1]*26
                Y7, -- Y7 = ref[1]*22
                Y8 : out std_logic_vector ( 15 downto 0 ) -- Y8 = ref[1]*18
        );
END COMPONENT;

COMPONENT MCM_2
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[2]*8
                Y2, -- Y2 = ref[2]*24
                Y3, -- Y3 = ref[2]*45
                Y4, -- Y4 = ref[2]*58
                Y5, -- Y5 = ref[2]*17
                Y6, -- Y6 = ref[2]*21
                Y7, -- Y7 = ref[2]*25
                Y8 : out std_logic_vector ( 15 downto 0 ) -- Y8 = ref[2]*29
        );
END COMPONENT;

COMPONENT MCM_3
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[3]*-1
                Y2, -- Y2 = ref[3]*-3
                Y3, -- Y3 = ref[3]*-5
                Y4, -- Y4 = ref[3]*-2
                Y5, -- Y5 = ref[3]*1
                Y6, -- Y6 = ref[3]*5
                Y7, -- Y7 = ref[3]*9
                Y8 : out std_logic_vector ( 15 downto 0 ) -- Y8 = ref[3]*13
        );
END COMPONENT;


COMPONENT equation_block
	PORT (
			input_0, input_1, input_2, input_3 : in std_logic_vector ( 15 downto 0 );
			output : out std_logic_vector ( 7 downto 0 )
	);
END COMPONENT;

type t_input is array (0 to 31) of std_logic_vector( 15 downto 0);
type t_eq_input is array (0 to 3) of std_logic_vector( 15 downto 0);
signal 	input : t_input;
signal 	eq_input : t_eq_input;

BEGIN
	
	eq:	equation_block
	PORT MAP ( input_0 => eq_input(0), input_1 => eq_input(1), input_2 => eq_input(2), input_3 => eq_input(3), output => pred );
	m0 : MCM_0
    PORT MAP ( X => ref(0), Y1 => input(0), Y2 => input(1), Y3 => input(2), Y4 => input(3), Y5 => input(4), Y6 => input(5), Y7 => input(6), Y8 => input(7) );
    m1 : MCM_1
    PORT MAP ( X => ref(1), Y1 => input(8), Y2 => input(9), Y3 => input(10), Y4 => input(11), Y5 => input(12), Y6 => input(13), Y7 => input(14), Y8 => input(15) );
    m2 : MCM_2
    PORT MAP ( X => ref(2), Y1 => input(16), Y2 => input(17), Y3 => input(18), Y4 => input(19), Y5 => input(20), Y6 => input(21), Y7 => input(22), Y8 => input(23) );
    m3 : MCM_3
    PORT MAP ( X => ref(3), Y1 => input(24), Y2 => input(25), Y3 => input(26), Y4 => input(27), Y5 => input(28), Y6 => input(29), Y7 => input(30), Y8 => input(31) );
 
	process (ref, control)
	  begin
	    case control is
	        when "000"=>
	                eq_input(0) <= input(0); -- input 0 <= -2 * ref[0]
	                eq_input(1) <= input(8); -- input 1 <= 59 * ref[1]
	                eq_input(2) <= input(16); -- input 2 <= 8 * ref[2]
	                eq_input(3) <= input(24); -- input 3 <= -1 * ref[3]
	        when "001"=>
	                eq_input(0) <= input(1); -- input 0 <= -5 * ref[0]
	                eq_input(1) <= input(9); -- input 1 <= 47 * ref[1]
	                eq_input(2) <= input(17); -- input 2 <= 24 * ref[2]
	                eq_input(3) <= input(25); -- input 3 <= -3 * ref[3]
	        when "010"=>
	                eq_input(0) <= input(2); -- input 0 <= -3 * ref[0]
	                eq_input(1) <= input(10); -- input 1 <= 27 * ref[1]
	                eq_input(2) <= input(18); -- input 2 <= 45 * ref[2]
	                eq_input(3) <= input(26); -- input 3 <= -5 * ref[3]
	        when "011"=>
	                eq_input(0) <= input(3); -- input 0 <= -1 * ref[0]
	                eq_input(1) <= input(11); -- input 1 <= 10 * ref[1]
	                eq_input(2) <= input(19); -- input 2 <= 58 * ref[2]
	                eq_input(3) <= input(27); -- input 3 <= -2 * ref[3]
	        when "100"=>
	                eq_input(0) <= input(4); -- input 0 <= 14 * ref[0]
	                eq_input(1) <= input(12); -- input 1 <= 30 * ref[1]
	                eq_input(2) <= input(20); -- input 2 <= 17 * ref[2]
	                eq_input(3) <= input(28); -- input 3 <= 1 * ref[3]
	        when "101"=>
	                eq_input(0) <= input(5); -- input 0 <= 10 * ref[0]
	                eq_input(1) <= input(13); -- input 1 <= 26 * ref[1]
	                eq_input(2) <= input(21); -- input 2 <= 21 * ref[2]
	                eq_input(3) <= input(29); -- input 3 <= 5 * ref[3]
	        when "110"=>
	                eq_input(0) <= input(6); -- input 0 <= 6 * ref[0]
	                eq_input(1) <= input(14); -- input 1 <= 22 * ref[1]
	                eq_input(2) <= input(22); -- input 2 <= 25 * ref[2]
	                eq_input(3) <= input(30); -- input 3 <= 9 * ref[3]
	        when "111"=>
	                eq_input(0) <= input(7); -- input 0 <= 2 * ref[0]
	                eq_input(1) <= input(15); -- input 1 <= 18 * ref[1]
	                eq_input(2) <= input(23); -- input 2 <= 29 * ref[2]
	                eq_input(3) <= input(31); -- input 3 <= 13 * ref[3]
	        when others => -- default case for not using latch
	                eq_input(0) <= "0000000000000000";
	                eq_input(1) <= "0000000000000000";
	                eq_input(2) <= "0000000000000000";
	                eq_input(3) <= "0000000000000000";
	    end case;
	  end process;
	
END comportamental;