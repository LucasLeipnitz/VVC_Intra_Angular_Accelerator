-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY datapath IS
	PORT (
		clk : IN  std_logic;
		rst : IN  std_logic;
		control : IN std_logic_vector(1 downto 0);
		ref : IN sample_bus (0 to 6 );
		pred: OUT sample_bus (0 to 3 )
	);
END datapath;

ARCHITECTURE comportamental OF datapath IS

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
                Y1, -- Y1 = ref[1]*-3
                Y2, -- Y2 = ref[1]*-2
                Y3, -- Y3 = ref[1]*12
                Y4, -- Y4 = ref[1]*4
                Y5, -- Y5 = ref[1]*53
                Y6, -- Y6 = ref[1]*18
                Y7, -- Y7 = ref[1]*28
                Y8 : out std_logic_vector ( 15 downto 0 ) -- Y8 = ref[1]*20
        );
END COMPONENT;

COMPONENT MCM_2
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[2]*-3
                Y2, -- Y2 = ref[2]*-2
                Y3, -- Y3 = ref[2]*12
                Y4, -- Y4 = ref[2]*4
                Y5, -- Y5 = ref[2]*53
                Y6, -- Y6 = ref[2]*18
                Y7, -- Y7 = ref[2]*28
                Y8, -- Y8 = ref[2]*20
                Y9, -- Y9 = ref[2]*16
                Y10, -- Y10 = ref[2]*51
                Y11, -- Y11 = ref[2]*19
                Y12 : out std_logic_vector ( 15 downto 0 ) -- Y12 = ref[2]*27
        );
END COMPONENT;

COMPONENT MCM_3
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[3]*-3
                Y2, -- Y2 = ref[3]*-2
                Y3, -- Y3 = ref[3]*12
                Y4, -- Y4 = ref[3]*4
                Y5, -- Y5 = ref[3]*53
                Y6, -- Y6 = ref[3]*18
                Y7, -- Y7 = ref[3]*28
                Y8, -- Y8 = ref[3]*20
                Y9, -- Y9 = ref[3]*16
                Y10, -- Y10 = ref[3]*51
                Y11, -- Y11 = ref[3]*19
                Y12, -- Y12 = ref[3]*27
                Y13, -- Y13 = ref[3]*3
                Y14 : out std_logic_vector ( 15 downto 0 ) -- Y14 = ref[3]*11
        );
END COMPONENT;

COMPONENT MCM_4
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[4]*53
                Y2, -- Y2 = ref[4]*18
                Y3, -- Y3 = ref[4]*28
                Y4, -- Y4 = ref[4]*20
                Y5, -- Y5 = ref[4]*16
                Y6, -- Y6 = ref[4]*51
                Y7, -- Y7 = ref[4]*19
                Y8, -- Y8 = ref[4]*27
                Y9, -- Y9 = ref[4]*-2
                Y10, -- Y10 = ref[4]*-3
                Y11, -- Y11 = ref[4]*3
                Y12 : out std_logic_vector ( 15 downto 0 ) -- Y12 = ref[4]*11
        );
END COMPONENT;

COMPONENT MCM_5
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[5]*16
                Y2, -- Y2 = ref[5]*51
                Y3, -- Y3 = ref[5]*19
                Y4, -- Y4 = ref[5]*27
                Y5, -- Y5 = ref[5]*-2
                Y6, -- Y6 = ref[5]*-3
                Y7, -- Y7 = ref[5]*3
                Y8 : out std_logic_vector ( 15 downto 0 ) -- Y8 = ref[5]*11
        );
END COMPONENT;

COMPONENT MCM_6
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[6]*-2
                Y2, -- Y2 = ref[6]*-3
                Y3, -- Y3 = ref[6]*3
                Y4 : out std_logic_vector ( 15 downto 0 ) -- Y4 = ref[6]*11
        );
END COMPONENT;

COMPONENT equation_block
	PORT (
			input_0, input_1, input_2, input_3 : in std_logic_vector ( 15 downto 0 );
			output : out std_logic_vector ( 7 downto 0 )
	);
END COMPONENT;

type t_mcm_output is array (0 to 61) of std_logic_vector( 15 downto 0);
type t_row is array (0 to 3) of std_logic_vector( 15 downto 0);
type t_eq_input is array (0 to 3) of t_row;
type t_input is array (0 to 3) of t_eq_input;
signal 	mcm_output : t_mcm_output;
signal 	eq_input : t_eq_input;
signal 	input : t_input;

BEGIN
	
	m0 : MCM_0
    PORT MAP ( X => ref(0), Y1 => mcm_output(0), Y2 => mcm_output(1), Y3 => mcm_output(2), Y4 => mcm_output(3) );
    m1 : MCM_1
    PORT MAP ( X => ref(1), Y1 => mcm_output(4), Y2 => mcm_output(5), Y3 => mcm_output(6), Y4 => mcm_output(7), Y5 => mcm_output(8), Y6 => mcm_output(9), Y7 => mcm_output(10), Y8 => mcm_output(11) );
    m2 : MCM_2
    PORT MAP ( X => ref(2), Y1 => mcm_output(12), Y2 => mcm_output(13), Y3 => mcm_output(14), Y4 => mcm_output(15), Y5 => mcm_output(16), Y6 => mcm_output(17), Y7 => mcm_output(18), Y8 => mcm_output(19), Y9 => mcm_output(20), Y10 => mcm_output(21), Y11 => mcm_output(22), Y12 => mcm_output(23) );     
    m3 : MCM_3
    PORT MAP ( X => ref(3), Y1 => mcm_output(24), Y2 => mcm_output(25), Y3 => mcm_output(26), Y4 => mcm_output(27), Y5 => mcm_output(28), Y6 => mcm_output(29), Y7 => mcm_output(30), Y8 => mcm_output(31), Y9 => mcm_output(32), Y10 => mcm_output(33), Y11 => mcm_output(34), Y12 => mcm_output(35), Y13 => mcm_output(36), Y14 => mcm_output(37) );
    m4 : MCM_4
    PORT MAP ( X => ref(4), Y1 => mcm_output(38), Y2 => mcm_output(39), Y3 => mcm_output(40), Y4 => mcm_output(41), Y5 => mcm_output(42), Y6 => mcm_output(43), Y7 => mcm_output(44), Y8 => mcm_output(45), Y9 => mcm_output(46), Y10 => mcm_output(47), Y11 => mcm_output(48), Y12 => mcm_output(49) );     
    m5 : MCM_5
    PORT MAP ( X => ref(5), Y1 => mcm_output(50), Y2 => mcm_output(51), Y3 => mcm_output(52), Y4 => mcm_output(53), Y5 => mcm_output(54), Y6 => mcm_output(55), Y7 => mcm_output(56), Y8 => mcm_output(57) );
    m6 : MCM_6
    PORT MAP ( X => ref(6), Y1 => mcm_output(58), Y2 => mcm_output(59), Y3 => mcm_output(60), Y4 => mcm_output(61) );
    eq0: equation_block
    PORT MAP ( input_0 => eq_input(0)(0), input_1 => eq_input(0)(1), input_2 => eq_input(0)(2), input_3 => eq_input(0)(3), output => pred(0) );
    eq1: equation_block
    PORT MAP ( input_0 => eq_input(1)(0), input_1 => eq_input(1)(1), input_2 => eq_input(1)(2), input_3 => eq_input(1)(3), output => pred(1) );
    eq2: equation_block
    PORT MAP ( input_0 => eq_input(2)(0), input_1 => eq_input(2)(1), input_2 => eq_input(2)(2), input_3 => eq_input(2)(3), output => pred(2) );
    eq3: equation_block
    PORT MAP ( input_0 => eq_input(3)(0), input_1 => eq_input(3)(1), input_2 => eq_input(3)(2), input_3 => eq_input(3)(3), output => pred(3) );



    -- Eq 0 Line 0
    input(0)(0)(0) <= mcm_output(0); -- input 0,0 <= -3 * ref[0]
    input(0)(0)(1) <= mcm_output(8); -- input 0,1 <= 53 * ref[1]
    input(0)(0)(2) <= mcm_output(20); -- input 0,2 <= 16 * ref[2]
    input(0)(0)(3) <= mcm_output(25); -- input 0,3 <= -2 * ref[3]

    -- Eq 1 Line 0
    input(0)(1)(0) <= mcm_output(4); -- input 1,0 <= -3 * ref[1]
    input(0)(1)(1) <= mcm_output(16); -- input 1,1 <= 53 * ref[2]
    input(0)(1)(2) <= mcm_output(32); -- input 1,2 <= 16 * ref[3]
    input(0)(1)(3) <= mcm_output(46); -- input 1,3 <= -2 * ref[4]

    -- Eq 2 Line 0
    input(0)(2)(0) <= mcm_output(12); -- input 2,0 <= -3 * ref[2]
    input(0)(2)(1) <= mcm_output(28); -- input 2,1 <= 53 * ref[3]
    input(0)(2)(2) <= mcm_output(42); -- input 2,2 <= 16 * ref[4]
    input(0)(2)(3) <= mcm_output(54); -- input 2,3 <= -2 * ref[5]

    -- Eq 3 Line 0
    input(0)(3)(0) <= mcm_output(24); -- input 3,0 <= -3 * ref[3]
    input(0)(3)(1) <= mcm_output(38); -- input 3,1 <= 53 * ref[4]
    input(0)(3)(2) <= mcm_output(50); -- input 3,2 <= 16 * ref[5]
    input(0)(3)(3) <= mcm_output(58); -- input 3,3 <= -2 * ref[6]

    -- Eq 0 Line 1
    input(1)(0)(0) <= mcm_output(1); -- input 0,0 <= -2 * ref[0]
    input(1)(0)(1) <= mcm_output(9); -- input 0,1 <= 18 * ref[1]
    input(1)(0)(2) <= mcm_output(21); -- input 0,2 <= 51 * ref[2]
    input(1)(0)(3) <= mcm_output(24); -- input 0,3 <= -3 * ref[3]

    -- Eq 1 Line 1
    input(1)(1)(0) <= mcm_output(5); -- input 1,0 <= -2 * ref[1]
    input(1)(1)(1) <= mcm_output(17); -- input 1,1 <= 18 * ref[2]
    input(1)(1)(2) <= mcm_output(33); -- input 1,2 <= 51 * ref[3]
    input(1)(1)(3) <= mcm_output(47); -- input 1,3 <= -3 * ref[4]

    -- Eq 2 Line 1
    input(1)(2)(0) <= mcm_output(13); -- input 2,0 <= -2 * ref[2]
    input(1)(2)(1) <= mcm_output(29); -- input 2,1 <= 18 * ref[3]
    input(1)(2)(2) <= mcm_output(43); -- input 2,2 <= 51 * ref[4]
    input(1)(2)(3) <= mcm_output(55); -- input 2,3 <= -3 * ref[5]

    -- Eq 3 Line 1
    input(1)(3)(0) <= mcm_output(25); -- input 3,0 <= -2 * ref[3]
    input(1)(3)(1) <= mcm_output(39); -- input 3,1 <= 18 * ref[4]
    input(1)(3)(2) <= mcm_output(51); -- input 3,2 <= 51 * ref[5]
    input(1)(3)(3) <= mcm_output(59); -- input 3,3 <= -3 * ref[6]

    -- Eq 0 Line 2
    input(2)(0)(0) <= mcm_output(2); -- input 0,0 <= 12 * ref[0]
    input(2)(0)(1) <= mcm_output(10); -- input 0,1 <= 28 * ref[1]
    input(2)(0)(2) <= mcm_output(22); -- input 0,2 <= 19 * ref[2]
    input(2)(0)(3) <= mcm_output(36); -- input 0,3 <= 3 * ref[3]

    -- Eq 1 Line 2
    input(2)(1)(0) <= mcm_output(6); -- input 1,0 <= 12 * ref[1]
    input(2)(1)(1) <= mcm_output(18); -- input 1,1 <= 28 * ref[2]
    input(2)(1)(2) <= mcm_output(34); -- input 1,2 <= 19 * ref[3]
    input(2)(1)(3) <= mcm_output(48); -- input 1,3 <= 3 * ref[4]

    -- Eq 2 Line 2
    input(2)(2)(0) <= mcm_output(14); -- input 2,0 <= 12 * ref[2]
    input(2)(2)(1) <= mcm_output(30); -- input 2,1 <= 28 * ref[3]
    input(2)(2)(2) <= mcm_output(44); -- input 2,2 <= 19 * ref[4]
    input(2)(2)(3) <= mcm_output(56); -- input 2,3 <= 3 * ref[5]

    -- Eq 3 Line 2
    input(2)(3)(0) <= mcm_output(26); -- input 3,0 <= 12 * ref[3]
    input(2)(3)(1) <= mcm_output(40); -- input 3,1 <= 28 * ref[4]
    input(2)(3)(2) <= mcm_output(52); -- input 3,2 <= 19 * ref[5]
    input(2)(3)(3) <= mcm_output(60); -- input 3,3 <= 3 * ref[6]

    -- Eq 0 Line 3
    input(3)(0)(0) <= mcm_output(3); -- input 0,0 <= 4 * ref[0]
    input(3)(0)(1) <= mcm_output(11); -- input 0,1 <= 20 * ref[1]
    input(3)(0)(2) <= mcm_output(23); -- input 0,2 <= 27 * ref[2]
    input(3)(0)(3) <= mcm_output(37); -- input 0,3 <= 11 * ref[3]

    -- Eq 1 Line 3
    input(3)(1)(0) <= mcm_output(7); -- input 1,0 <= 4 * ref[1]
    input(3)(1)(1) <= mcm_output(19); -- input 1,1 <= 20 * ref[2]
    input(3)(1)(2) <= mcm_output(35); -- input 1,2 <= 27 * ref[3]
    input(3)(1)(3) <= mcm_output(49); -- input 1,3 <= 11 * ref[4]

    -- Eq 2 Line 3
    input(3)(2)(0) <= mcm_output(15); -- input 2,0 <= 4 * ref[2]
    input(3)(2)(1) <= mcm_output(31); -- input 2,1 <= 20 * ref[3]
    input(3)(2)(2) <= mcm_output(45); -- input 2,2 <= 27 * ref[4]
    input(3)(2)(3) <= mcm_output(57); -- input 2,3 <= 11 * ref[5]

    -- Eq 3 Line 3
    input(3)(3)(0) <= mcm_output(27); -- input 3,0 <= 4 * ref[3]
    input(3)(3)(1) <= mcm_output(41); -- input 3,1 <= 20 * ref[4]
    input(3)(3)(2) <= mcm_output(53); -- input 3,2 <= 27 * ref[5]
    input(3)(3)(3) <= mcm_output(61); -- input 3,3 <= 11 * ref[6]

	
	process (clk)
	  begin
		if rst = '1' then
			for i in 0 to 3 loop 
				for j in 0 to 3 loop
					eq_input(i)(j) <= "0000000000000000";
				end loop;
			end loop;
		elsif clk'event and clk = '1' then
			
			for i in 0 to 3 loop 
				for j in 0 to 3 loop
		            eq_input(i)(j) <= input(to_integer(unsigned(control)))(i)(j);
				end loop;
			end loop;
		end if;
	end process;
END comportamental;