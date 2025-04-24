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
		control : IN std_logic_vector(0 downto 0);
		ref : IN sample_bus (0 to 6 );
		pred: OUT sample_bus (0 to 3 )
	);
END datapath;

ARCHITECTURE comportamental OF datapath IS

COMPONENT MCM_0
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[0]*-3
                Y2 : out std_logic_vector ( 15 downto 0 ) -- Y2 = ref[0]*8
        );
END COMPONENT;

COMPONENT MCM_1
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[1]*-3
                Y2, -- Y2 = ref[1]*8
                Y3, -- Y3 = ref[1]*36
                Y4 : out std_logic_vector ( 15 downto 0 ) -- Y4 = ref[1]*24
        );
END COMPONENT;

COMPONENT MCM_2
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[2]*-3
                Y2, -- Y2 = ref[2]*8
                Y3, -- Y3 = ref[2]*36
                Y4, -- Y4 = ref[2]*24
                Y5, -- Y5 = ref[2]*34
                Y6 : out std_logic_vector ( 15 downto 0 ) -- Y6 = ref[2]*23
        );
END COMPONENT;

COMPONENT MCM_3
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[3]*-3
                Y2, -- Y2 = ref[3]*8
                Y3, -- Y3 = ref[3]*36
                Y4, -- Y4 = ref[3]*24
                Y5, -- Y5 = ref[3]*34
                Y6, -- Y6 = ref[3]*23
                Y7 : out std_logic_vector ( 15 downto 0 ) -- Y7 = ref[3]*7
        );
END COMPONENT;

COMPONENT MCM_4
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[4]*36
                Y2, -- Y2 = ref[4]*24
                Y3, -- Y3 = ref[4]*34
                Y4, -- Y4 = ref[4]*23
                Y5, -- Y5 = ref[4]*-3
                Y6 : out std_logic_vector ( 15 downto 0 ) -- Y6 = ref[4]*7
        );
END COMPONENT;

COMPONENT MCM_5
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[5]*34
                Y2, -- Y2 = ref[5]*23
                Y3, -- Y3 = ref[5]*-3
                Y4 : out std_logic_vector ( 15 downto 0 ) -- Y4 = ref[5]*7
        );
END COMPONENT;

COMPONENT MCM_6
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[6]*-3
                Y2 : out std_logic_vector ( 15 downto 0 ) -- Y2 = ref[6]*7
        );
END COMPONENT;

COMPONENT equation_block
	PORT (
			input_0, input_1, input_2, input_3 : in std_logic_vector ( 15 downto 0 );
			output : out std_logic_vector ( 7 downto 0 )
	);
END COMPONENT;

type t_mcm_output is array (0 to 30) of std_logic_vector( 15 downto 0);
type t_row is array (0 to 3) of std_logic_vector( 15 downto 0);
type t_eq_input is array (0 to 3) of t_row;
type t_input is array (0 to 1) of t_eq_input;
signal 	mcm_output : t_mcm_output;
signal 	eq_input : t_eq_input;
signal 	input : t_input;

BEGIN
	
    m0 : MCM_0
    PORT MAP ( X => ref(0), Y1 => mcm_output(0), Y2 => mcm_output(1) );
    m1 : MCM_1
    PORT MAP ( X => ref(1), Y1 => mcm_output(2), Y2 => mcm_output(3), Y3 => mcm_output(4), Y4 => mcm_output(5) );
    m2 : MCM_2
    PORT MAP ( X => ref(2), Y1 => mcm_output(6), Y2 => mcm_output(7), Y3 => mcm_output(8), Y4 => mcm_output(9), Y5 => mcm_output(10), Y6 => mcm_output(11) );
    m3 : MCM_3
    PORT MAP ( X => ref(3), Y1 => mcm_output(12), Y2 => mcm_output(13), Y3 => mcm_output(14), Y4 => mcm_output(15), Y5 => mcm_output(16), Y6 => mcm_output(17), Y7 => mcm_output(18) );
    m4 : MCM_4
    PORT MAP ( X => ref(4), Y1 => mcm_output(19), Y2 => mcm_output(20), Y3 => mcm_output(21), Y4 => mcm_output(22), Y5 => mcm_output(23), Y6 => mcm_output(24) );
    m5 : MCM_5
    PORT MAP ( X => ref(5), Y1 => mcm_output(25), Y2 => mcm_output(26), Y3 => mcm_output(27), Y4 => mcm_output(28) );
    m6 : MCM_6
    PORT MAP ( X => ref(6), Y1 => mcm_output(29), Y2 => mcm_output(30) );
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
    input(0)(0)(1) <= mcm_output(4); -- input 0,1 <= 36 * ref[1]
    input(0)(0)(2) <= mcm_output(10); -- input 0,2 <= 34 * ref[2]
    input(0)(0)(3) <= mcm_output(12); -- input 0,3 <= -3 * ref[3]

    -- Eq 1 Line 0
    input(0)(1)(0) <= mcm_output(2); -- input 1,0 <= -3 * ref[1]
    input(0)(1)(1) <= mcm_output(8); -- input 1,1 <= 36 * ref[2]
    input(0)(1)(2) <= mcm_output(16); -- input 1,2 <= 34 * ref[3]
    input(0)(1)(3) <= mcm_output(23); -- input 1,3 <= -3 * ref[4]

    -- Eq 2 Line 0
    input(0)(2)(0) <= mcm_output(6); -- input 2,0 <= -3 * ref[2]
    input(0)(2)(1) <= mcm_output(14); -- input 2,1 <= 36 * ref[3]
    input(0)(2)(2) <= mcm_output(21); -- input 2,2 <= 34 * ref[4]
    input(0)(2)(3) <= mcm_output(27); -- input 2,3 <= -3 * ref[5]

    -- Eq 3 Line 0
    input(0)(3)(0) <= mcm_output(12); -- input 3,0 <= -3 * ref[3]
    input(0)(3)(1) <= mcm_output(19); -- input 3,1 <= 36 * ref[4]
    input(0)(3)(2) <= mcm_output(25); -- input 3,2 <= 34 * ref[5]
    input(0)(3)(3) <= mcm_output(29); -- input 3,3 <= -3 * ref[6]

    -- Eq 0 Line 1
    input(1)(0)(0) <= mcm_output(1); -- input 0,0 <= 8 * ref[0]
    input(1)(0)(1) <= mcm_output(5); -- input 0,1 <= 24 * ref[1]
    input(1)(0)(2) <= mcm_output(11); -- input 0,2 <= 23 * ref[2]
    input(1)(0)(3) <= mcm_output(18); -- input 0,3 <= 7 * ref[3]

    -- Eq 1 Line 1
    input(1)(1)(0) <= mcm_output(3); -- input 1,0 <= 8 * ref[1]
    input(1)(1)(1) <= mcm_output(9); -- input 1,1 <= 24 * ref[2]
    input(1)(1)(2) <= mcm_output(17); -- input 1,2 <= 23 * ref[3]
    input(1)(1)(3) <= mcm_output(24); -- input 1,3 <= 7 * ref[4]

    -- Eq 2 Line 1
    input(1)(2)(0) <= mcm_output(7); -- input 2,0 <= 8 * ref[2]
    input(1)(2)(1) <= mcm_output(15); -- input 2,1 <= 24 * ref[3]
    input(1)(2)(2) <= mcm_output(22); -- input 2,2 <= 23 * ref[4]
    input(1)(2)(3) <= mcm_output(28); -- input 2,3 <= 7 * ref[5]

    -- Eq 3 Line 1
    input(1)(3)(0) <= mcm_output(13); -- input 3,0 <= 8 * ref[3]
    input(1)(3)(1) <= mcm_output(20); -- input 3,1 <= 24 * ref[4]
    input(1)(3)(2) <= mcm_output(26); -- input 3,2 <= 23 * ref[5]
    input(1)(3)(3) <= mcm_output(30); -- input 3,3 <= 7 * ref[6]

	
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