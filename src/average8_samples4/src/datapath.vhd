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
		control : IN std_logic_vector(2 downto 0);
		ref : IN sample_bus (0 to 6 );
		pred: OUT sample_bus (0 to 3 )
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
                Y1, -- Y1 = ref[1]*-2
                Y2, -- Y2 = ref[1]*-5
                Y3, -- Y3 = ref[1]*-3
                Y4, -- Y4 = ref[1]*-1
                Y5, -- Y5 = ref[1]*14
                Y6, -- Y6 = ref[1]*10
                Y7, -- Y7 = ref[1]*6
                Y8, -- Y8 = ref[1]*2
                Y9, -- Y9 = ref[1]*59
                Y10, -- Y10 = ref[1]*47
                Y11, -- Y11 = ref[1]*27
                Y12, -- Y12 = ref[1]*30
                Y13, -- Y13 = ref[1]*26
                Y14, -- Y14 = ref[1]*22
                Y15 : out std_logic_vector ( 15 downto 0 ) -- Y15 = ref[1]*18
        );
END COMPONENT;

COMPONENT MCM_2
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[2]*-2
                Y2, -- Y2 = ref[2]*-5
                Y3, -- Y3 = ref[2]*-3
                Y4, -- Y4 = ref[2]*-1
                Y5, -- Y5 = ref[2]*14
                Y6, -- Y6 = ref[2]*10
                Y7, -- Y7 = ref[2]*6
                Y8, -- Y8 = ref[2]*2
                Y9, -- Y9 = ref[2]*59
                Y10, -- Y10 = ref[2]*47
                Y11, -- Y11 = ref[2]*27
                Y12, -- Y12 = ref[2]*30
                Y13, -- Y13 = ref[2]*26
                Y14, -- Y14 = ref[2]*22
                Y15, -- Y15 = ref[2]*18
                Y16, -- Y16 = ref[2]*8
                Y17, -- Y17 = ref[2]*24
                Y18, -- Y18 = ref[2]*45
                Y19, -- Y19 = ref[2]*58
                Y20, -- Y20 = ref[2]*17
                Y21, -- Y21 = ref[2]*21
                Y22, -- Y22 = ref[2]*25
                Y23 : out std_logic_vector ( 15 downto 0 ) -- Y23 = ref[2]*29
        );
END COMPONENT;

COMPONENT MCM_3
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[3]*-2
                Y2, -- Y2 = ref[3]*-5
                Y3, -- Y3 = ref[3]*-3
                Y4, -- Y4 = ref[3]*-1
                Y5, -- Y5 = ref[3]*14
                Y6, -- Y6 = ref[3]*10
                Y7, -- Y7 = ref[3]*6
                Y8, -- Y8 = ref[3]*2
                Y9, -- Y9 = ref[3]*59
                Y10, -- Y10 = ref[3]*47
                Y11, -- Y11 = ref[3]*27
                Y12, -- Y12 = ref[3]*30
                Y13, -- Y13 = ref[3]*26
                Y14, -- Y14 = ref[3]*22
                Y15, -- Y15 = ref[3]*18
                Y16, -- Y16 = ref[3]*8
                Y17, -- Y17 = ref[3]*24
                Y18, -- Y18 = ref[3]*45
                Y19, -- Y19 = ref[3]*58
                Y20, -- Y20 = ref[3]*17
                Y21, -- Y21 = ref[3]*21
                Y22, -- Y22 = ref[3]*25
                Y23, -- Y23 = ref[3]*29
                Y24, -- Y24 = ref[3]*1
                Y25, -- Y25 = ref[3]*5
                Y26, -- Y26 = ref[3]*9
                Y27 : out std_logic_vector ( 15 downto 0 ) -- Y27 = ref[3]*13
        );
END COMPONENT;

COMPONENT MCM_4
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[4]*59
                Y2, -- Y2 = ref[4]*47
                Y3, -- Y3 = ref[4]*27
                Y4, -- Y4 = ref[4]*10
                Y5, -- Y5 = ref[4]*30
                Y6, -- Y6 = ref[4]*26
                Y7, -- Y7 = ref[4]*22
                Y8, -- Y8 = ref[4]*18
                Y9, -- Y9 = ref[4]*8
                Y10, -- Y10 = ref[4]*24
                Y11, -- Y11 = ref[4]*45
                Y12, -- Y12 = ref[4]*58
                Y13, -- Y13 = ref[4]*17
                Y14, -- Y14 = ref[4]*21
                Y15, -- Y15 = ref[4]*25
                Y16, -- Y16 = ref[4]*29
                Y17, -- Y17 = ref[4]*-1
                Y18, -- Y18 = ref[4]*-3
                Y19, -- Y19 = ref[4]*-5
                Y20, -- Y20 = ref[4]*-2
                Y21, -- Y21 = ref[4]*1
                Y22, -- Y22 = ref[4]*5
                Y23, -- Y23 = ref[4]*9
                Y24 : out std_logic_vector ( 15 downto 0 ) -- Y24 = ref[4]*13
        );
END COMPONENT;

COMPONENT MCM_5
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[5]*8
                Y2, -- Y2 = ref[5]*24
                Y3, -- Y3 = ref[5]*45
                Y4, -- Y4 = ref[5]*58
                Y5, -- Y5 = ref[5]*17
                Y6, -- Y6 = ref[5]*21
                Y7, -- Y7 = ref[5]*25
                Y8, -- Y8 = ref[5]*29
                Y9, -- Y9 = ref[5]*-1
                Y10, -- Y10 = ref[5]*-3
                Y11, -- Y11 = ref[5]*-5
                Y12, -- Y12 = ref[5]*-2
                Y13, -- Y13 = ref[5]*1
                Y14, -- Y14 = ref[5]*5
                Y15, -- Y15 = ref[5]*9
                Y16 : out std_logic_vector ( 15 downto 0 ) -- Y16 = ref[5]*13
        );
END COMPONENT;

COMPONENT MCM_6
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[6]*-1
                Y2, -- Y2 = ref[6]*-3
                Y3, -- Y3 = ref[6]*-5
                Y4, -- Y4 = ref[6]*-2
                Y5, -- Y5 = ref[6]*1
                Y6, -- Y6 = ref[6]*5
                Y7, -- Y7 = ref[6]*9
                Y8 : out std_logic_vector ( 15 downto 0 ) -- Y8 = ref[6]*13
        );
END COMPONENT;


COMPONENT equation_block
	PORT (
			input_0, input_1, input_2, input_3 : in std_logic_vector ( 15 downto 0 );
			output : out std_logic_vector ( 7 downto 0 )
	);
END COMPONENT;

type t_mcm_output is array (0 to 120) of std_logic_vector( 15 downto 0);
type t_row is array (0 to 3) of std_logic_vector( 15 downto 0);
type t_eq_input is array (0 to 3) of t_row;
type t_input is array (0 to 7) of t_eq_input;
signal 	mcm_output : t_mcm_output;
signal 	eq_input : t_eq_input;
signal 	input : t_input;

BEGIN
	
	eq0: equation_block
	PORT MAP ( input_0 => eq_input(0)(0), input_1 => eq_input(0)(1), input_2 => eq_input(0)(2), input_3 => eq_input(0)(3), output => pred(0) );
	eq1: equation_block
	PORT MAP ( input_0 => eq_input(1)(0), input_1 => eq_input(1)(1), input_2 => eq_input(1)(2), input_3 => eq_input(1)(3), output => pred(1) );
	eq2: equation_block
	PORT MAP ( input_0 => eq_input(2)(0), input_1 => eq_input(2)(1), input_2 => eq_input(2)(2), input_3 => eq_input(2)(3), output => pred(2) );
	eq3: equation_block
	PORT MAP ( input_0 => eq_input(3)(0), input_1 => eq_input(3)(1), input_2 => eq_input(3)(2), input_3 => eq_input(3)(3), output => pred(3) );
	m0 : MCM_0
    PORT MAP ( X => ref(0), Y1 => mcm_output(0), Y2 => mcm_output(1), Y3 => mcm_output(2), Y4 => mcm_output(3), Y5 => mcm_output(4), Y6 => mcm_output(5), Y7 => mcm_output(6), Y8 => mcm_output(7) );
    m1 : MCM_1
    PORT MAP ( X => ref(1), Y1 => mcm_output(8), Y2 => mcm_output(9), Y3 => mcm_output(10), Y4 => mcm_output(11), Y5 => mcm_output(12), Y6 => mcm_output(13), Y7 => mcm_output(14), Y8 => mcm_output(15), Y9 => mcm_output(16), Y10 => mcm_output(17), Y11 => mcm_output(18), Y12 => mcm_output(19), Y13 => mcm_output(20), Y14 => mcm_output(21), Y15 => mcm_output(22) );
    m2 : MCM_2
    PORT MAP ( X => ref(2), Y1 => mcm_output(23), Y2 => mcm_output(24), Y3 => mcm_output(25), Y4 => mcm_output(26), Y5 => mcm_output(27), Y6 => mcm_output(28), Y7 => mcm_output(29), Y8 => mcm_output(30), Y9 => mcm_output(31), Y10 => mcm_output(32), Y11 => mcm_output(33), Y12 => mcm_output(34), Y13 => mcm_output(35), Y14 => mcm_output(36), Y15 => mcm_output(37), Y16 => mcm_output(38), Y17 => mcm_output(39), Y18 => mcm_output(40), Y19 => mcm_output(41), Y20 => mcm_output(42), Y21 => mcm_output(43), Y22 => mcm_output(44), Y23 => mcm_output(45) );
    m3 : MCM_3
    PORT MAP ( X => ref(3), Y1 => mcm_output(46), Y2 => mcm_output(47), Y3 => mcm_output(48), Y4 => mcm_output(49), Y5 => mcm_output(50), Y6 => mcm_output(51), Y7 => mcm_output(52), Y8 => mcm_output(53), Y9 => mcm_output(54), Y10 => mcm_output(55), Y11 => mcm_output(56), Y12 => mcm_output(57), Y13 => mcm_output(58), Y14 => mcm_output(59), Y15 => mcm_output(60), Y16 => mcm_output(61), Y17 => mcm_output(62), Y18 => mcm_output(63), Y19 => mcm_output(64), Y20 => mcm_output(65), Y21 => mcm_output(66), Y22 => mcm_output(67), Y23 => mcm_output(68), Y24 => mcm_output(69), Y25 => mcm_output(70), Y26 => mcm_output(71), Y27 => mcm_output(72) );
    m4 : MCM_4
    PORT MAP ( X => ref(4), Y1 => mcm_output(73), Y2 => mcm_output(74), Y3 => mcm_output(75), Y4 => mcm_output(76), Y5 => mcm_output(77), Y6 => mcm_output(78), Y7 => mcm_output(79), Y8 => mcm_output(80), Y9 => mcm_output(81), Y10 => mcm_output(82), Y11 => mcm_output(83), Y12 => mcm_output(84), Y13 => mcm_output(85), Y14 => mcm_output(86), Y15 => mcm_output(87), Y16 => mcm_output(88), Y17 => mcm_output(89), Y18 => mcm_output(90), Y19 => mcm_output(91), Y20 => mcm_output(92), Y21 => mcm_output(93), Y22 => mcm_output(94), Y23 => mcm_output(95), Y24 => mcm_output(96) );
    m5 : MCM_5
    PORT MAP ( X => ref(5), Y1 => mcm_output(97), Y2 => mcm_output(98), Y3 => mcm_output(99), Y4 => mcm_output(100), Y5 => mcm_output(101), Y6 => mcm_output(102), Y7 => mcm_output(103), Y8 => mcm_output(104), Y9 => mcm_output(105), Y10 => mcm_output(106), Y11 => mcm_output(107), Y12 => mcm_output(108), Y13 => mcm_output(109), Y14 => mcm_output(110), Y15 => mcm_output(111), Y16 => mcm_output(112) );
    m6 : MCM_6
    PORT MAP ( X => ref(6), Y1 => mcm_output(113), Y2 => mcm_output(114), Y3 => mcm_output(115), Y4 => mcm_output(116), Y5 => mcm_output(117), Y6 => mcm_output(118), Y7 => mcm_output(119), Y8 => mcm_output(120) );


    -- Eq 0 Line 0
    input(0)(0)(0) <= mcm_output(0); -- input 0,0 <= -2 * ref[0]
    input(0)(0)(1) <= mcm_output(16); -- input 0,1 <= 59 * ref[1]
    input(0)(0)(2) <= mcm_output(38); -- input 0,2 <= 8 * ref[2]
    input(0)(0)(3) <= mcm_output(49); -- input 0,3 <= -1 * ref[3]

    -- Eq 1 Line 0
    input(0)(1)(0) <= mcm_output(8); -- input 1,0 <= -2 * ref[1]
    input(0)(1)(1) <= mcm_output(31); -- input 1,1 <= 59 * ref[2]
    input(0)(1)(2) <= mcm_output(61); -- input 1,2 <= 8 * ref[3]
    input(0)(1)(3) <= mcm_output(89); -- input 1,3 <= -1 * ref[4]

    -- Eq 2 Line 0
    input(0)(2)(0) <= mcm_output(23); -- input 2,0 <= -2 * ref[2]
    input(0)(2)(1) <= mcm_output(54); -- input 2,1 <= 59 * ref[3]
    input(0)(2)(2) <= mcm_output(81); -- input 2,2 <= 8 * ref[4]
    input(0)(2)(3) <= mcm_output(105); -- input 2,3 <= -1 * ref[5]

    -- Eq 3 Line 0
    input(0)(3)(0) <= mcm_output(46); -- input 3,0 <= -2 * ref[3]
    input(0)(3)(1) <= mcm_output(73); -- input 3,1 <= 59 * ref[4]
    input(0)(3)(2) <= mcm_output(97); -- input 3,2 <= 8 * ref[5]
    input(0)(3)(3) <= mcm_output(113); -- input 3,3 <= -1 * ref[6]

    -- Eq 0 Line 1
    input(1)(0)(0) <= mcm_output(1); -- input 0,0 <= -5 * ref[0]
    input(1)(0)(1) <= mcm_output(17); -- input 0,1 <= 47 * ref[1]
    input(1)(0)(2) <= mcm_output(39); -- input 0,2 <= 24 * ref[2]
    input(1)(0)(3) <= mcm_output(48); -- input 0,3 <= -3 * ref[3]

    -- Eq 1 Line 1
    input(1)(1)(0) <= mcm_output(9); -- input 1,0 <= -5 * ref[1]
    input(1)(1)(1) <= mcm_output(32); -- input 1,1 <= 47 * ref[2]
    input(1)(1)(2) <= mcm_output(62); -- input 1,2 <= 24 * ref[3]
    input(1)(1)(3) <= mcm_output(90); -- input 1,3 <= -3 * ref[4]

    -- Eq 2 Line 1
    input(1)(2)(0) <= mcm_output(24); -- input 2,0 <= -5 * ref[2]
    input(1)(2)(1) <= mcm_output(55); -- input 2,1 <= 47 * ref[3]
    input(1)(2)(2) <= mcm_output(82); -- input 2,2 <= 24 * ref[4]
    input(1)(2)(3) <= mcm_output(106); -- input 2,3 <= -3 * ref[5]

    -- Eq 3 Line 1
    input(1)(3)(0) <= mcm_output(47); -- input 3,0 <= -5 * ref[3]
    input(1)(3)(1) <= mcm_output(74); -- input 3,1 <= 47 * ref[4]
    input(1)(3)(2) <= mcm_output(98); -- input 3,2 <= 24 * ref[5]
    input(1)(3)(3) <= mcm_output(114); -- input 3,3 <= -3 * ref[6]

    -- Eq 0 Line 2
    input(2)(0)(0) <= mcm_output(2); -- input 0,0 <= -3 * ref[0]
    input(2)(0)(1) <= mcm_output(18); -- input 0,1 <= 27 * ref[1]
    input(2)(0)(2) <= mcm_output(40); -- input 0,2 <= 45 * ref[2]
    input(2)(0)(3) <= mcm_output(47); -- input 0,3 <= -5 * ref[3]

    -- Eq 1 Line 2
    input(2)(1)(0) <= mcm_output(10); -- input 1,0 <= -3 * ref[1]
    input(2)(1)(1) <= mcm_output(33); -- input 1,1 <= 27 * ref[2]
    input(2)(1)(2) <= mcm_output(63); -- input 1,2 <= 45 * ref[3]
    input(2)(1)(3) <= mcm_output(91); -- input 1,3 <= -5 * ref[4]

    -- Eq 2 Line 2
    input(2)(2)(0) <= mcm_output(25); -- input 2,0 <= -3 * ref[2]
    input(2)(2)(1) <= mcm_output(56); -- input 2,1 <= 27 * ref[3]
    input(2)(2)(2) <= mcm_output(83); -- input 2,2 <= 45 * ref[4]
    input(2)(2)(3) <= mcm_output(107); -- input 2,3 <= -5 * ref[5]

    -- Eq 3 Line 2
    input(2)(3)(0) <= mcm_output(48); -- input 3,0 <= -3 * ref[3]
    input(2)(3)(1) <= mcm_output(75); -- input 3,1 <= 27 * ref[4]
    input(2)(3)(2) <= mcm_output(99); -- input 3,2 <= 45 * ref[5]
    input(2)(3)(3) <= mcm_output(115); -- input 3,3 <= -5 * ref[6]

    -- Eq 0 Line 3
    input(3)(0)(0) <= mcm_output(3); -- input 0,0 <= -1 * ref[0]
    input(3)(0)(1) <= mcm_output(13); -- input 0,1 <= 10 * ref[1]
    input(3)(0)(2) <= mcm_output(41); -- input 0,2 <= 58 * ref[2]
    input(3)(0)(3) <= mcm_output(46); -- input 0,3 <= -2 * ref[3]

    -- Eq 1 Line 3
    input(3)(1)(0) <= mcm_output(11); -- input 1,0 <= -1 * ref[1]
    input(3)(1)(1) <= mcm_output(28); -- input 1,1 <= 10 * ref[2]
    input(3)(1)(2) <= mcm_output(64); -- input 1,2 <= 58 * ref[3]
    input(3)(1)(3) <= mcm_output(92); -- input 1,3 <= -2 * ref[4]

    -- Eq 2 Line 3
    input(3)(2)(0) <= mcm_output(26); -- input 2,0 <= -1 * ref[2]
    input(3)(2)(1) <= mcm_output(51); -- input 2,1 <= 10 * ref[3]
    input(3)(2)(2) <= mcm_output(84); -- input 2,2 <= 58 * ref[4]
    input(3)(2)(3) <= mcm_output(108); -- input 2,3 <= -2 * ref[5]

    -- Eq 3 Line 3
    input(3)(3)(0) <= mcm_output(49); -- input 3,0 <= -1 * ref[3]
    input(3)(3)(1) <= mcm_output(76); -- input 3,1 <= 10 * ref[4]
    input(3)(3)(2) <= mcm_output(100); -- input 3,2 <= 58 * ref[5]
    input(3)(3)(3) <= mcm_output(116); -- input 3,3 <= -2 * ref[6]

    -- Eq 0 Line 4
    input(4)(0)(0) <= mcm_output(4); -- input 0,0 <= 14 * ref[0]
    input(4)(0)(1) <= mcm_output(19); -- input 0,1 <= 30 * ref[1]
    input(4)(0)(2) <= mcm_output(42); -- input 0,2 <= 17 * ref[2]
    input(4)(0)(3) <= mcm_output(69); -- input 0,3 <= 1 * ref[3]

    -- Eq 1 Line 4
    input(4)(1)(0) <= mcm_output(12); -- input 1,0 <= 14 * ref[1]
    input(4)(1)(1) <= mcm_output(34); -- input 1,1 <= 30 * ref[2]
    input(4)(1)(2) <= mcm_output(65); -- input 1,2 <= 17 * ref[3]
    input(4)(1)(3) <= mcm_output(93); -- input 1,3 <= 1 * ref[4]

    -- Eq 2 Line 4
    input(4)(2)(0) <= mcm_output(27); -- input 2,0 <= 14 * ref[2]
    input(4)(2)(1) <= mcm_output(57); -- input 2,1 <= 30 * ref[3]
    input(4)(2)(2) <= mcm_output(85); -- input 2,2 <= 17 * ref[4]
    input(4)(2)(3) <= mcm_output(109); -- input 2,3 <= 1 * ref[5]

    -- Eq 3 Line 4
    input(4)(3)(0) <= mcm_output(50); -- input 3,0 <= 14 * ref[3]
    input(4)(3)(1) <= mcm_output(77); -- input 3,1 <= 30 * ref[4]
    input(4)(3)(2) <= mcm_output(101); -- input 3,2 <= 17 * ref[5]
    input(4)(3)(3) <= mcm_output(117); -- input 3,3 <= 1 * ref[6]

    -- Eq 0 Line 5
    input(5)(0)(0) <= mcm_output(5); -- input 0,0 <= 10 * ref[0]
    input(5)(0)(1) <= mcm_output(20); -- input 0,1 <= 26 * ref[1]
    input(5)(0)(2) <= mcm_output(43); -- input 0,2 <= 21 * ref[2]
    input(5)(0)(3) <= mcm_output(70); -- input 0,3 <= 5 * ref[3]

    -- Eq 1 Line 5
    input(5)(1)(0) <= mcm_output(13); -- input 1,0 <= 10 * ref[1]
    input(5)(1)(1) <= mcm_output(35); -- input 1,1 <= 26 * ref[2]
    input(5)(1)(2) <= mcm_output(66); -- input 1,2 <= 21 * ref[3]
    input(5)(1)(3) <= mcm_output(94); -- input 1,3 <= 5 * ref[4]

    -- Eq 2 Line 5
    input(5)(2)(0) <= mcm_output(28); -- input 2,0 <= 10 * ref[2]
    input(5)(2)(1) <= mcm_output(58); -- input 2,1 <= 26 * ref[3]
    input(5)(2)(2) <= mcm_output(86); -- input 2,2 <= 21 * ref[4]
    input(5)(2)(3) <= mcm_output(110); -- input 2,3 <= 5 * ref[5]

    -- Eq 3 Line 5
    input(5)(3)(0) <= mcm_output(51); -- input 3,0 <= 10 * ref[3]
    input(5)(3)(1) <= mcm_output(78); -- input 3,1 <= 26 * ref[4]
    input(5)(3)(2) <= mcm_output(102); -- input 3,2 <= 21 * ref[5]
    input(5)(3)(3) <= mcm_output(118); -- input 3,3 <= 5 * ref[6]

    -- Eq 0 Line 6
    input(6)(0)(0) <= mcm_output(6); -- input 0,0 <= 6 * ref[0]
    input(6)(0)(1) <= mcm_output(21); -- input 0,1 <= 22 * ref[1]
    input(6)(0)(2) <= mcm_output(44); -- input 0,2 <= 25 * ref[2]
    input(6)(0)(3) <= mcm_output(71); -- input 0,3 <= 9 * ref[3]

    -- Eq 1 Line 6
    input(6)(1)(0) <= mcm_output(14); -- input 1,0 <= 6 * ref[1]
    input(6)(1)(1) <= mcm_output(36); -- input 1,1 <= 22 * ref[2]
    input(6)(1)(2) <= mcm_output(67); -- input 1,2 <= 25 * ref[3]
    input(6)(1)(3) <= mcm_output(95); -- input 1,3 <= 9 * ref[4]

    -- Eq 2 Line 6
    input(6)(2)(0) <= mcm_output(29); -- input 2,0 <= 6 * ref[2]
    input(6)(2)(1) <= mcm_output(59); -- input 2,1 <= 22 * ref[3]
    input(6)(2)(2) <= mcm_output(87); -- input 2,2 <= 25 * ref[4]
    input(6)(2)(3) <= mcm_output(111); -- input 2,3 <= 9 * ref[5]

    -- Eq 3 Line 6
    input(6)(3)(0) <= mcm_output(52); -- input 3,0 <= 6 * ref[3]
    input(6)(3)(1) <= mcm_output(79); -- input 3,1 <= 22 * ref[4]
    input(6)(3)(2) <= mcm_output(103); -- input 3,2 <= 25 * ref[5]
    input(6)(3)(3) <= mcm_output(119); -- input 3,3 <= 9 * ref[6]

    -- Eq 0 Line 7
    input(7)(0)(0) <= mcm_output(7); -- input 0,0 <= 2 * ref[0]
    input(7)(0)(1) <= mcm_output(22); -- input 0,1 <= 18 * ref[1]
    input(7)(0)(2) <= mcm_output(45); -- input 0,2 <= 29 * ref[2]
    input(7)(0)(3) <= mcm_output(72); -- input 0,3 <= 13 * ref[3]

    -- Eq 1 Line 7
    input(7)(1)(0) <= mcm_output(15); -- input 1,0 <= 2 * ref[1]
    input(7)(1)(1) <= mcm_output(37); -- input 1,1 <= 18 * ref[2]
    input(7)(1)(2) <= mcm_output(68); -- input 1,2 <= 29 * ref[3]
    input(7)(1)(3) <= mcm_output(96); -- input 1,3 <= 13 * ref[4]

    -- Eq 2 Line 7
    input(7)(2)(0) <= mcm_output(30); -- input 2,0 <= 2 * ref[2]
    input(7)(2)(1) <= mcm_output(60); -- input 2,1 <= 18 * ref[3]
    input(7)(2)(2) <= mcm_output(88); -- input 2,2 <= 29 * ref[4]
    input(7)(2)(3) <= mcm_output(112); -- input 2,3 <= 13 * ref[5]

    -- Eq 3 Line 7
    input(7)(3)(0) <= mcm_output(53); -- input 3,0 <= 2 * ref[3]
    input(7)(3)(1) <= mcm_output(80); -- input 3,1 <= 18 * ref[4]
    input(7)(3)(2) <= mcm_output(104); -- input 3,2 <= 29 * ref[5]
    input(7)(3)(3) <= mcm_output(120); -- input 3,3 <= 13 * ref[6]

	
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