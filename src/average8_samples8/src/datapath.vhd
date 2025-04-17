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
		ref : IN sample_bus (0 to 10 );
		pred: OUT sample_bus (0 to 7 )
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
                Y1, -- Y1 = ref[8]*59
                Y2, -- Y2 = ref[8]*47
                Y3, -- Y3 = ref[8]*27
                Y4, -- Y4 = ref[8]*10
                Y5, -- Y5 = ref[8]*30
                Y6, -- Y6 = ref[8]*26
                Y7, -- Y7 = ref[8]*22
                Y8, -- Y8 = ref[8]*18
                Y9, -- Y9 = ref[8]*8
                Y10, -- Y10 = ref[8]*24
                Y11, -- Y11 = ref[8]*45
                Y12, -- Y12 = ref[8]*58
                Y13, -- Y13 = ref[8]*17
                Y14, -- Y14 = ref[8]*21
                Y15, -- Y15 = ref[8]*25
                Y16, -- Y16 = ref[8]*29
                Y17, -- Y17 = ref[8]*-1
                Y18, -- Y18 = ref[8]*-3
                Y19, -- Y19 = ref[8]*-5
                Y20, -- Y20 = ref[8]*-2
                Y21, -- Y21 = ref[8]*1
                Y22, -- Y22 = ref[8]*5
                Y23, -- Y23 = ref[8]*9
                Y24 : out std_logic_vector ( 15 downto 0 ) -- Y24 = ref[8]*13
        );
END COMPONENT;

COMPONENT MCM_5
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[9]*8
                Y2, -- Y2 = ref[9]*24
                Y3, -- Y3 = ref[9]*45
                Y4, -- Y4 = ref[9]*58
                Y5, -- Y5 = ref[9]*17
                Y6, -- Y6 = ref[9]*21
                Y7, -- Y7 = ref[9]*25
                Y8, -- Y8 = ref[9]*29
                Y9, -- Y9 = ref[9]*-1
                Y10, -- Y10 = ref[9]*-3
                Y11, -- Y11 = ref[9]*-5
                Y12, -- Y12 = ref[9]*-2
                Y13, -- Y13 = ref[9]*1
                Y14, -- Y14 = ref[9]*5
                Y15, -- Y15 = ref[9]*9
                Y16 : out std_logic_vector ( 15 downto 0 ) -- Y16 = ref[9]*13
        );
END COMPONENT;

COMPONENT MCM_6
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[10]*-1
                Y2, -- Y2 = ref[10]*-3
                Y3, -- Y3 = ref[10]*-5
                Y4, -- Y4 = ref[10]*-2
                Y5, -- Y5 = ref[10]*1
                Y6, -- Y6 = ref[10]*5
                Y7, -- Y7 = ref[10]*9
                Y8 : out std_logic_vector ( 15 downto 0 ) -- Y8 = ref[10]*13
        );
END COMPONENT;

COMPONENT equation_block
	PORT (	
			input_0, input_1, input_2, input_3 : in std_logic_vector ( 15 downto 0 );
			output : out std_logic_vector ( 7 downto 0 )
	);
END COMPONENT;


type t_mcm_output is array (0 to 228) of std_logic_vector( 15 downto 0);
type t_row is array (0 to 3) of std_logic_vector( 15 downto 0);
type t_eq_input is array (0 to 7) of t_row;
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
	eq4: equation_block
	PORT MAP ( input_0 => eq_input(4)(0), input_1 => eq_input(4)(1), input_2 => eq_input(4)(2), input_3 => eq_input(4)(3), output => pred(4) );
	eq5: equation_block
	PORT MAP ( input_0 => eq_input(5)(0), input_1 => eq_input(5)(1), input_2 => eq_input(5)(2), input_3 => eq_input(5)(3), output => pred(5) );
	eq6: equation_block
	PORT MAP ( input_0 => eq_input(6)(0), input_1 => eq_input(6)(1), input_2 => eq_input(6)(2), input_3 => eq_input(6)(3), output => pred(6) );
	eq7: equation_block
	PORT MAP ( input_0 => eq_input(7)(0), input_1 => eq_input(7)(1), input_2 => eq_input(7)(2), input_3 => eq_input(7)(3), output => pred(7) );
    m0 : MCM_0
    PORT MAP ( X => ref(0), Y1 => mcm_output(0), Y2 => mcm_output(1), Y3 => mcm_output(2), Y4 => mcm_output(3), Y5 => mcm_output(4), Y6 => mcm_output(5), Y7 => mcm_output(6), Y8 => mcm_output(7) );
    m1 : MCM_1
    PORT MAP ( X => ref(1), Y1 => mcm_output(8), Y2 => mcm_output(9), Y3 => mcm_output(10), Y4 => mcm_output(11), Y5 => mcm_output(12), Y6 => mcm_output(13), Y7 => mcm_output(14), Y8 => mcm_output(15), Y9 => mcm_output(16), Y10 => mcm_output(17), Y11 => mcm_output(18), Y12 => mcm_output(19), Y13 => mcm_output(20), Y14 => mcm_output(21), Y15 => mcm_output(22) );
    m2 : MCM_2
    PORT MAP ( X => ref(2), Y1 => mcm_output(23), Y2 => mcm_output(24), Y3 => mcm_output(25), Y4 => mcm_output(26), Y5 => mcm_output(27), Y6 => mcm_output(28), Y7 => mcm_output(29), Y8 => mcm_output(30), Y9 => mcm_output(31), Y10 => mcm_output(32), Y11 => mcm_output(33), Y12 => mcm_output(34), Y13 => mcm_output(35), Y14 => mcm_output(36), Y15 => mcm_output(37), Y16 => mcm_output(38), Y17 => mcm_output(39), Y18 => mcm_output(40), Y19 => mcm_output(41), Y20 => mcm_output(42), Y21 => mcm_output(43), Y22 => mcm_output(44), Y23 => mcm_output(45) );
    m3 : MCM_3
    PORT MAP ( X => ref(3), Y1 => mcm_output(46), Y2 => mcm_output(47), Y3 => mcm_output(48), Y4 => mcm_output(49), Y5 => mcm_output(50), Y6 => mcm_output(51), Y7 => mcm_output(52), Y8 => mcm_output(53), Y9 => mcm_output(54), Y10 => mcm_output(55), Y11 => mcm_output(56), Y12 => mcm_output(57), Y13 =>
mcm_output(58), Y14 => mcm_output(59), Y15 => mcm_output(60), Y16 => mcm_output(61), Y17 => mcm_output(62), Y18 => mcm_output(63), Y19 => mcm_output(64), Y20 => mcm_output(65), Y21 => mcm_output(66), Y22 => mcm_output(67), Y23 => mcm_output(68), Y24 => mcm_output(69), Y25 => mcm_output(70), Y26 => mcm_output(71), Y27 => mcm_output(72) );
    m4 : MCM_3
    PORT MAP ( X => ref(4), Y1 => mcm_output(73), Y2 => mcm_output(74), Y3 => mcm_output(75), Y4 => mcm_output(76), Y5 => mcm_output(77), Y6 => mcm_output(78), Y7 => mcm_output(79), Y8 => mcm_output(80), Y9 => mcm_output(81), Y10 => mcm_output(82), Y11 => mcm_output(83), Y12 => mcm_output(84), Y13 =>
mcm_output(85), Y14 => mcm_output(86), Y15 => mcm_output(87), Y16 => mcm_output(88), Y17 => mcm_output(89), Y18 => mcm_output(90), Y19 => mcm_output(91), Y20 => mcm_output(92), Y21 => mcm_output(93), Y22 => mcm_output(94), Y23 => mcm_output(95), Y24 => mcm_output(96), Y25 => mcm_output(97), Y26 => mcm_output(98), Y27 => mcm_output(99) );
    m5 : MCM_3
    PORT MAP ( X => ref(5), Y1 => mcm_output(100), Y2 => mcm_output(101), Y3 => mcm_output(102), Y4 => mcm_output(103), Y5 => mcm_output(104), Y6 => mcm_output(105), Y7 => mcm_output(106), Y8 => mcm_output(107), Y9 => mcm_output(108), Y10 => mcm_output(109), Y11 => mcm_output(110), Y12 => mcm_output(
111), Y13 => mcm_output(112), Y14 => mcm_output(113), Y15 => mcm_output(114), Y16 => mcm_output(115), Y17 => mcm_output(116), Y18 => mcm_output(117), Y19 => mcm_output(118), Y20 => mcm_output(119), Y21 => mcm_output(120), Y22 => mcm_output(121), Y23 => mcm_output(122), Y24 => mcm_output(123), Y25 => mcm_output(124), Y26 => mcm_output(125), Y27 => mcm_output(126) );
    m6 : MCM_3
    PORT MAP ( X => ref(6), Y1 => mcm_output(127), Y2 => mcm_output(128), Y3 => mcm_output(129), Y4 => mcm_output(130), Y5 => mcm_output(131), Y6 => mcm_output(132), Y7 => mcm_output(133), Y8 => mcm_output(134), Y9 => mcm_output(135), Y10 => mcm_output(136), Y11 => mcm_output(137), Y12 => mcm_output(
138), Y13 => mcm_output(139), Y14 => mcm_output(140), Y15 => mcm_output(141), Y16 => mcm_output(142), Y17 => mcm_output(143), Y18 => mcm_output(144), Y19 => mcm_output(145), Y20 => mcm_output(146), Y21 => mcm_output(147), Y22 => mcm_output(148), Y23 => mcm_output(149), Y24 => mcm_output(150), Y25 => mcm_output(151), Y26 => mcm_output(152), Y27 => mcm_output(153) );
    m7 : MCM_3
    PORT MAP ( X => ref(7), Y1 => mcm_output(154), Y2 => mcm_output(155), Y3 => mcm_output(156), Y4 => mcm_output(157), Y5 => mcm_output(158), Y6 => mcm_output(159), Y7 => mcm_output(160), Y8 => mcm_output(161), Y9 => mcm_output(162), Y10 => mcm_output(163), Y11 => mcm_output(164), Y12 => mcm_output(
165), Y13 => mcm_output(166), Y14 => mcm_output(167), Y15 => mcm_output(168), Y16 => mcm_output(169), Y17 => mcm_output(170), Y18 => mcm_output(171), Y19 => mcm_output(172), Y20 => mcm_output(173), Y21 => mcm_output(174), Y22 => mcm_output(175), Y23 => mcm_output(176), Y24 => mcm_output(177), Y25 => mcm_output(178), Y26 => mcm_output(179), Y27 => mcm_output(180) );
    m8 : MCM_4
    PORT MAP ( X => ref(8), Y1 => mcm_output(181), Y2 => mcm_output(182), Y3 => mcm_output(183), Y4 => mcm_output(184), Y5 => mcm_output(185), Y6 => mcm_output(186), Y7 => mcm_output(187), Y8 => mcm_output(188), Y9 => mcm_output(189), Y10 => mcm_output(190), Y11 => mcm_output(191), Y12 => mcm_output(192), Y13 => mcm_output(193), Y14 => mcm_output(194), Y15 => mcm_output(195), Y16 => mcm_output(196), Y17 => mcm_output(197), Y18 => mcm_output(198), Y19 => mcm_output(199), Y20 => mcm_output(200), Y21 => mcm_output(201), Y22 => mcm_output(202), Y23 => mcm_output(203), Y24 => mcm_output(204) );
    m9 : MCM_5
    PORT MAP ( X => ref(9), Y1 => mcm_output(205), Y2 => mcm_output(206), Y3 => mcm_output(207), Y4 => mcm_output(208), Y5 => mcm_output(209), Y6 => mcm_output(210), Y7 => mcm_output(211), Y8 => mcm_output(212), Y9 => mcm_output(213), Y10 => mcm_output(214), Y11 => mcm_output(215), Y12 => mcm_output(216), Y13 => mcm_output(217), Y14 => mcm_output(218), Y15 => mcm_output(219), Y16 => mcm_output(220) );
    m10 : MCM_6
    PORT MAP ( X => ref(10), Y1 => mcm_output(221), Y2 => mcm_output(222), Y3 => mcm_output(223), Y4 => mcm_output(224), Y5 => mcm_output(225), Y6 => mcm_output(226), Y7 => mcm_output(227), Y8 => mcm_output(228) );


    -- Eq 0 Line 0
    input(0)(0)(0) <= mcm_output(0); -- input 0,0 <= -2 * ref[0]
    input(0)(0)(1) <= mcm_output(16); -- input 0,1 <= 59 * ref[1]
    input(0)(0)(2) <= mcm_output(38); -- input 0,2 <= 8 * ref[2]
    input(0)(0)(3) <= mcm_output(49); -- input 0,3 <= -1 * ref[3]

    -- Eq 1 Line 0
    input(0)(1)(0) <= mcm_output(8); -- input 1,0 <= -2 * ref[1]
    input(0)(1)(1) <= mcm_output(31); -- input 1,1 <= 59 * ref[2]
    input(0)(1)(2) <= mcm_output(61); -- input 1,2 <= 8 * ref[3]
    input(0)(1)(3) <= mcm_output(76); -- input 1,3 <= -1 * ref[4]

    -- Eq 2 Line 0
    input(0)(2)(0) <= mcm_output(23); -- input 2,0 <= -2 * ref[2]
    input(0)(2)(1) <= mcm_output(54); -- input 2,1 <= 59 * ref[3]
    input(0)(2)(2) <= mcm_output(88); -- input 2,2 <= 8 * ref[4]
    input(0)(2)(3) <= mcm_output(103); -- input 2,3 <= -1 * ref[5]

    -- Eq 3 Line 0
    input(0)(3)(0) <= mcm_output(46); -- input 3,0 <= -2 * ref[3]
    input(0)(3)(1) <= mcm_output(81); -- input 3,1 <= 59 * ref[4]
    input(0)(3)(2) <= mcm_output(115); -- input 3,2 <= 8 * ref[5]
    input(0)(3)(3) <= mcm_output(130); -- input 3,3 <= -1 * ref[6]

    -- Eq 4 Line 0
    input(0)(4)(0) <= mcm_output(73); -- input 4,0 <= -2 * ref[4]
    input(0)(4)(1) <= mcm_output(108); -- input 4,1 <= 59 * ref[5]
    input(0)(4)(2) <= mcm_output(142); -- input 4,2 <= 8 * ref[6]
    input(0)(4)(3) <= mcm_output(157); -- input 4,3 <= -1 * ref[7]

    -- Eq 5 Line 0
    input(0)(5)(0) <= mcm_output(100); -- input 5,0 <= -2 * ref[5]
    input(0)(5)(1) <= mcm_output(135); -- input 5,1 <= 59 * ref[6]
    input(0)(5)(2) <= mcm_output(169); -- input 5,2 <= 8 * ref[7]
    input(0)(5)(3) <= mcm_output(197); -- input 5,3 <= -1 * ref[8]

    -- Eq 6 Line 0
    input(0)(6)(0) <= mcm_output(127); -- input 6,0 <= -2 * ref[6]
    input(0)(6)(1) <= mcm_output(162); -- input 6,1 <= 59 * ref[7]
    input(0)(6)(2) <= mcm_output(189); -- input 6,2 <= 8 * ref[8]
    input(0)(6)(3) <= mcm_output(213); -- input 6,3 <= -1 * ref[9]

    -- Eq 7 Line 0
    input(0)(7)(0) <= mcm_output(154); -- input 7,0 <= -2 * ref[7]
    input(0)(7)(1) <= mcm_output(181); -- input 7,1 <= 59 * ref[8]
    input(0)(7)(2) <= mcm_output(205); -- input 7,2 <= 8 * ref[9]
    input(0)(7)(3) <= mcm_output(221); -- input 7,3 <= -1 * ref[10]

    -- Eq 0 Line 1
    input(1)(0)(0) <= mcm_output(1); -- input 0,0 <= -5 * ref[0]
    input(1)(0)(1) <= mcm_output(17); -- input 0,1 <= 47 * ref[1]
    input(1)(0)(2) <= mcm_output(39); -- input 0,2 <= 24 * ref[2]
    input(1)(0)(3) <= mcm_output(48); -- input 0,3 <= -3 * ref[3]

    -- Eq 1 Line 1
    input(1)(1)(0) <= mcm_output(9); -- input 1,0 <= -5 * ref[1]
    input(1)(1)(1) <= mcm_output(32); -- input 1,1 <= 47 * ref[2]
    input(1)(1)(2) <= mcm_output(62); -- input 1,2 <= 24 * ref[3]
    input(1)(1)(3) <= mcm_output(75); -- input 1,3 <= -3 * ref[4]

    -- Eq 2 Line 1
    input(1)(2)(0) <= mcm_output(24); -- input 2,0 <= -5 * ref[2]
    input(1)(2)(1) <= mcm_output(55); -- input 2,1 <= 47 * ref[3]
    input(1)(2)(2) <= mcm_output(89); -- input 2,2 <= 24 * ref[4]
    input(1)(2)(3) <= mcm_output(102); -- input 2,3 <= -3 * ref[5]

    -- Eq 3 Line 1
    input(1)(3)(0) <= mcm_output(47); -- input 3,0 <= -5 * ref[3]
    input(1)(3)(1) <= mcm_output(82); -- input 3,1 <= 47 * ref[4]
    input(1)(3)(2) <= mcm_output(116); -- input 3,2 <= 24 * ref[5]
    input(1)(3)(3) <= mcm_output(129); -- input 3,3 <= -3 * ref[6]

    -- Eq 4 Line 1
    input(1)(4)(0) <= mcm_output(74); -- input 4,0 <= -5 * ref[4]
    input(1)(4)(1) <= mcm_output(109); -- input 4,1 <= 47 * ref[5]
    input(1)(4)(2) <= mcm_output(143); -- input 4,2 <= 24 * ref[6]
    input(1)(4)(3) <= mcm_output(156); -- input 4,3 <= -3 * ref[7]

    -- Eq 5 Line 1
    input(1)(5)(0) <= mcm_output(101); -- input 5,0 <= -5 * ref[5]
    input(1)(5)(1) <= mcm_output(136); -- input 5,1 <= 47 * ref[6]
    input(1)(5)(2) <= mcm_output(170); -- input 5,2 <= 24 * ref[7]
    input(1)(5)(3) <= mcm_output(198); -- input 5,3 <= -3 * ref[8]

    -- Eq 6 Line 1
    input(1)(6)(0) <= mcm_output(128); -- input 6,0 <= -5 * ref[6]
    input(1)(6)(1) <= mcm_output(163); -- input 6,1 <= 47 * ref[7]
    input(1)(6)(2) <= mcm_output(190); -- input 6,2 <= 24 * ref[8]
    input(1)(6)(3) <= mcm_output(214); -- input 6,3 <= -3 * ref[9]

    -- Eq 7 Line 1
    input(1)(7)(0) <= mcm_output(155); -- input 7,0 <= -5 * ref[7]
    input(1)(7)(1) <= mcm_output(182); -- input 7,1 <= 47 * ref[8]
    input(1)(7)(2) <= mcm_output(206); -- input 7,2 <= 24 * ref[9]
    input(1)(7)(3) <= mcm_output(222); -- input 7,3 <= -3 * ref[10]

    -- Eq 0 Line 2
    input(2)(0)(0) <= mcm_output(2); -- input 0,0 <= -3 * ref[0]
    input(2)(0)(1) <= mcm_output(18); -- input 0,1 <= 27 * ref[1]
    input(2)(0)(2) <= mcm_output(40); -- input 0,2 <= 45 * ref[2]
    input(2)(0)(3) <= mcm_output(47); -- input 0,3 <= -5 * ref[3]

    -- Eq 1 Line 2
    input(2)(1)(0) <= mcm_output(10); -- input 1,0 <= -3 * ref[1]
    input(2)(1)(1) <= mcm_output(33); -- input 1,1 <= 27 * ref[2]
    input(2)(1)(2) <= mcm_output(63); -- input 1,2 <= 45 * ref[3]
    input(2)(1)(3) <= mcm_output(74); -- input 1,3 <= -5 * ref[4]

    -- Eq 2 Line 2
    input(2)(2)(0) <= mcm_output(25); -- input 2,0 <= -3 * ref[2]
    input(2)(2)(1) <= mcm_output(56); -- input 2,1 <= 27 * ref[3]
    input(2)(2)(2) <= mcm_output(90); -- input 2,2 <= 45 * ref[4]
    input(2)(2)(3) <= mcm_output(101); -- input 2,3 <= -5 * ref[5]

    -- Eq 3 Line 2
    input(2)(3)(0) <= mcm_output(48); -- input 3,0 <= -3 * ref[3]
    input(2)(3)(1) <= mcm_output(83); -- input 3,1 <= 27 * ref[4]
    input(2)(3)(2) <= mcm_output(117); -- input 3,2 <= 45 * ref[5]
    input(2)(3)(3) <= mcm_output(128); -- input 3,3 <= -5 * ref[6]

    -- Eq 4 Line 2
    input(2)(4)(0) <= mcm_output(75); -- input 4,0 <= -3 * ref[4]
    input(2)(4)(1) <= mcm_output(110); -- input 4,1 <= 27 * ref[5]
    input(2)(4)(2) <= mcm_output(144); -- input 4,2 <= 45 * ref[6]
    input(2)(4)(3) <= mcm_output(155); -- input 4,3 <= -5 * ref[7]

    -- Eq 5 Line 2
    input(2)(5)(0) <= mcm_output(102); -- input 5,0 <= -3 * ref[5]
    input(2)(5)(1) <= mcm_output(137); -- input 5,1 <= 27 * ref[6]
    input(2)(5)(2) <= mcm_output(171); -- input 5,2 <= 45 * ref[7]
    input(2)(5)(3) <= mcm_output(199); -- input 5,3 <= -5 * ref[8]

    -- Eq 6 Line 2
    input(2)(6)(0) <= mcm_output(129); -- input 6,0 <= -3 * ref[6]
    input(2)(6)(1) <= mcm_output(164); -- input 6,1 <= 27 * ref[7]
    input(2)(6)(2) <= mcm_output(191); -- input 6,2 <= 45 * ref[8]
    input(2)(6)(3) <= mcm_output(215); -- input 6,3 <= -5 * ref[9]

    -- Eq 7 Line 2
    input(2)(7)(0) <= mcm_output(156); -- input 7,0 <= -3 * ref[7]
    input(2)(7)(1) <= mcm_output(183); -- input 7,1 <= 27 * ref[8]
    input(2)(7)(2) <= mcm_output(207); -- input 7,2 <= 45 * ref[9]
    input(2)(7)(3) <= mcm_output(223); -- input 7,3 <= -5 * ref[10]

    -- Eq 0 Line 3
    input(3)(0)(0) <= mcm_output(3); -- input 0,0 <= -1 * ref[0]
    input(3)(0)(1) <= mcm_output(13); -- input 0,1 <= 10 * ref[1]
    input(3)(0)(2) <= mcm_output(41); -- input 0,2 <= 58 * ref[2]
    input(3)(0)(3) <= mcm_output(46); -- input 0,3 <= -2 * ref[3]

    -- Eq 1 Line 3
    input(3)(1)(0) <= mcm_output(11); -- input 1,0 <= -1 * ref[1]
    input(3)(1)(1) <= mcm_output(28); -- input 1,1 <= 10 * ref[2]
    input(3)(1)(2) <= mcm_output(64); -- input 1,2 <= 58 * ref[3]
    input(3)(1)(3) <= mcm_output(73); -- input 1,3 <= -2 * ref[4]

    -- Eq 2 Line 3
    input(3)(2)(0) <= mcm_output(26); -- input 2,0 <= -1 * ref[2]
    input(3)(2)(1) <= mcm_output(51); -- input 2,1 <= 10 * ref[3]
    input(3)(2)(2) <= mcm_output(91); -- input 2,2 <= 58 * ref[4]
    input(3)(2)(3) <= mcm_output(100); -- input 2,3 <= -2 * ref[5]

    -- Eq 3 Line 3
    input(3)(3)(0) <= mcm_output(49); -- input 3,0 <= -1 * ref[3]
    input(3)(3)(1) <= mcm_output(78); -- input 3,1 <= 10 * ref[4]
    input(3)(3)(2) <= mcm_output(118); -- input 3,2 <= 58 * ref[5]
    input(3)(3)(3) <= mcm_output(127); -- input 3,3 <= -2 * ref[6]

    -- Eq 4 Line 3
    input(3)(4)(0) <= mcm_output(76); -- input 4,0 <= -1 * ref[4]
    input(3)(4)(1) <= mcm_output(105); -- input 4,1 <= 10 * ref[5]
    input(3)(4)(2) <= mcm_output(145); -- input 4,2 <= 58 * ref[6]
    input(3)(4)(3) <= mcm_output(154); -- input 4,3 <= -2 * ref[7]

    -- Eq 5 Line 3
    input(3)(5)(0) <= mcm_output(103); -- input 5,0 <= -1 * ref[5]
    input(3)(5)(1) <= mcm_output(132); -- input 5,1 <= 10 * ref[6]
    input(3)(5)(2) <= mcm_output(172); -- input 5,2 <= 58 * ref[7]
    input(3)(5)(3) <= mcm_output(200); -- input 5,3 <= -2 * ref[8]

    -- Eq 6 Line 3
    input(3)(6)(0) <= mcm_output(130); -- input 6,0 <= -1 * ref[6]
    input(3)(6)(1) <= mcm_output(159); -- input 6,1 <= 10 * ref[7]
    input(3)(6)(2) <= mcm_output(192); -- input 6,2 <= 58 * ref[8]
    input(3)(6)(3) <= mcm_output(216); -- input 6,3 <= -2 * ref[9]

    -- Eq 7 Line 3
    input(3)(7)(0) <= mcm_output(157); -- input 7,0 <= -1 * ref[7]
    input(3)(7)(1) <= mcm_output(184); -- input 7,1 <= 10 * ref[8]
    input(3)(7)(2) <= mcm_output(208); -- input 7,2 <= 58 * ref[9]
    input(3)(7)(3) <= mcm_output(224); -- input 7,3 <= -2 * ref[10]

    -- Eq 0 Line 4
    input(4)(0)(0) <= mcm_output(4); -- input 0,0 <= 14 * ref[0]
    input(4)(0)(1) <= mcm_output(19); -- input 0,1 <= 30 * ref[1]
    input(4)(0)(2) <= mcm_output(42); -- input 0,2 <= 17 * ref[2]
    input(4)(0)(3) <= mcm_output(69); -- input 0,3 <= 1 * ref[3]

    -- Eq 1 Line 4
    input(4)(1)(0) <= mcm_output(12); -- input 1,0 <= 14 * ref[1]
    input(4)(1)(1) <= mcm_output(34); -- input 1,1 <= 30 * ref[2]
    input(4)(1)(2) <= mcm_output(65); -- input 1,2 <= 17 * ref[3]
    input(4)(1)(3) <= mcm_output(96); -- input 1,3 <= 1 * ref[4]

    -- Eq 2 Line 4
    input(4)(2)(0) <= mcm_output(27); -- input 2,0 <= 14 * ref[2]
    input(4)(2)(1) <= mcm_output(57); -- input 2,1 <= 30 * ref[3]
    input(4)(2)(2) <= mcm_output(92); -- input 2,2 <= 17 * ref[4]
    input(4)(2)(3) <= mcm_output(123); -- input 2,3 <= 1 * ref[5]

    -- Eq 3 Line 4
    input(4)(3)(0) <= mcm_output(50); -- input 3,0 <= 14 * ref[3]
    input(4)(3)(1) <= mcm_output(84); -- input 3,1 <= 30 * ref[4]
    input(4)(3)(2) <= mcm_output(119); -- input 3,2 <= 17 * ref[5]
    input(4)(3)(3) <= mcm_output(150); -- input 3,3 <= 1 * ref[6]

    -- Eq 4 Line 4
    input(4)(4)(0) <= mcm_output(77); -- input 4,0 <= 14 * ref[4]
    input(4)(4)(1) <= mcm_output(111); -- input 4,1 <= 30 * ref[5]
    input(4)(4)(2) <= mcm_output(146); -- input 4,2 <= 17 * ref[6]
    input(4)(4)(3) <= mcm_output(177); -- input 4,3 <= 1 * ref[7]

    -- Eq 5 Line 4
    input(4)(5)(0) <= mcm_output(104); -- input 5,0 <= 14 * ref[5]
    input(4)(5)(1) <= mcm_output(138); -- input 5,1 <= 30 * ref[6]
    input(4)(5)(2) <= mcm_output(173); -- input 5,2 <= 17 * ref[7]
    input(4)(5)(3) <= mcm_output(201); -- input 5,3 <= 1 * ref[8]

    -- Eq 6 Line 4
    input(4)(6)(0) <= mcm_output(131); -- input 6,0 <= 14 * ref[6]
    input(4)(6)(1) <= mcm_output(165); -- input 6,1 <= 30 * ref[7]
    input(4)(6)(2) <= mcm_output(193); -- input 6,2 <= 17 * ref[8]
    input(4)(6)(3) <= mcm_output(217); -- input 6,3 <= 1 * ref[9]

    -- Eq 7 Line 4
    input(4)(7)(0) <= mcm_output(158); -- input 7,0 <= 14 * ref[7]
    input(4)(7)(1) <= mcm_output(185); -- input 7,1 <= 30 * ref[8]
    input(4)(7)(2) <= mcm_output(209); -- input 7,2 <= 17 * ref[9]
    input(4)(7)(3) <= mcm_output(225); -- input 7,3 <= 1 * ref[10]

    -- Eq 0 Line 5
    input(5)(0)(0) <= mcm_output(5); -- input 0,0 <= 10 * ref[0]
    input(5)(0)(1) <= mcm_output(20); -- input 0,1 <= 26 * ref[1]
    input(5)(0)(2) <= mcm_output(43); -- input 0,2 <= 21 * ref[2]
    input(5)(0)(3) <= mcm_output(70); -- input 0,3 <= 5 * ref[3]

    -- Eq 1 Line 5
    input(5)(1)(0) <= mcm_output(13); -- input 1,0 <= 10 * ref[1]
    input(5)(1)(1) <= mcm_output(35); -- input 1,1 <= 26 * ref[2]
    input(5)(1)(2) <= mcm_output(66); -- input 1,2 <= 21 * ref[3]
    input(5)(1)(3) <= mcm_output(97); -- input 1,3 <= 5 * ref[4]

    -- Eq 2 Line 5
    input(5)(2)(0) <= mcm_output(28); -- input 2,0 <= 10 * ref[2]
    input(5)(2)(1) <= mcm_output(58); -- input 2,1 <= 26 * ref[3]
    input(5)(2)(2) <= mcm_output(93); -- input 2,2 <= 21 * ref[4]
    input(5)(2)(3) <= mcm_output(124); -- input 2,3 <= 5 * ref[5]

    -- Eq 3 Line 5
    input(5)(3)(0) <= mcm_output(51); -- input 3,0 <= 10 * ref[3]
    input(5)(3)(1) <= mcm_output(85); -- input 3,1 <= 26 * ref[4]
    input(5)(3)(2) <= mcm_output(120); -- input 3,2 <= 21 * ref[5]
    input(5)(3)(3) <= mcm_output(151); -- input 3,3 <= 5 * ref[6]

    -- Eq 4 Line 5
    input(5)(4)(0) <= mcm_output(78); -- input 4,0 <= 10 * ref[4]
    input(5)(4)(1) <= mcm_output(112); -- input 4,1 <= 26 * ref[5]
    input(5)(4)(2) <= mcm_output(147); -- input 4,2 <= 21 * ref[6]
    input(5)(4)(3) <= mcm_output(178); -- input 4,3 <= 5 * ref[7]

    -- Eq 5 Line 5
    input(5)(5)(0) <= mcm_output(105); -- input 5,0 <= 10 * ref[5]
    input(5)(5)(1) <= mcm_output(139); -- input 5,1 <= 26 * ref[6]
    input(5)(5)(2) <= mcm_output(174); -- input 5,2 <= 21 * ref[7]
    input(5)(5)(3) <= mcm_output(202); -- input 5,3 <= 5 * ref[8]

    -- Eq 6 Line 5
    input(5)(6)(0) <= mcm_output(132); -- input 6,0 <= 10 * ref[6]
    input(5)(6)(1) <= mcm_output(166); -- input 6,1 <= 26 * ref[7]
    input(5)(6)(2) <= mcm_output(194); -- input 6,2 <= 21 * ref[8]
    input(5)(6)(3) <= mcm_output(218); -- input 6,3 <= 5 * ref[9]

    -- Eq 7 Line 5
    input(5)(7)(0) <= mcm_output(159); -- input 7,0 <= 10 * ref[7]
    input(5)(7)(1) <= mcm_output(186); -- input 7,1 <= 26 * ref[8]
    input(5)(7)(2) <= mcm_output(210); -- input 7,2 <= 21 * ref[9]
    input(5)(7)(3) <= mcm_output(226); -- input 7,3 <= 5 * ref[10]

    -- Eq 0 Line 6
    input(6)(0)(0) <= mcm_output(6); -- input 0,0 <= 6 * ref[0]
    input(6)(0)(1) <= mcm_output(21); -- input 0,1 <= 22 * ref[1]
    input(6)(0)(2) <= mcm_output(44); -- input 0,2 <= 25 * ref[2]
    input(6)(0)(3) <= mcm_output(71); -- input 0,3 <= 9 * ref[3]

    -- Eq 1 Line 6
    input(6)(1)(0) <= mcm_output(14); -- input 1,0 <= 6 * ref[1]
    input(6)(1)(1) <= mcm_output(36); -- input 1,1 <= 22 * ref[2]
    input(6)(1)(2) <= mcm_output(67); -- input 1,2 <= 25 * ref[3]
    input(6)(1)(3) <= mcm_output(98); -- input 1,3 <= 9 * ref[4]

    -- Eq 2 Line 6
    input(6)(2)(0) <= mcm_output(29); -- input 2,0 <= 6 * ref[2]
    input(6)(2)(1) <= mcm_output(59); -- input 2,1 <= 22 * ref[3]
    input(6)(2)(2) <= mcm_output(94); -- input 2,2 <= 25 * ref[4]
    input(6)(2)(3) <= mcm_output(125); -- input 2,3 <= 9 * ref[5]

    -- Eq 3 Line 6
    input(6)(3)(0) <= mcm_output(52); -- input 3,0 <= 6 * ref[3]
    input(6)(3)(1) <= mcm_output(86); -- input 3,1 <= 22 * ref[4]
    input(6)(3)(2) <= mcm_output(121); -- input 3,2 <= 25 * ref[5]
    input(6)(3)(3) <= mcm_output(152); -- input 3,3 <= 9 * ref[6]

    -- Eq 4 Line 6
    input(6)(4)(0) <= mcm_output(79); -- input 4,0 <= 6 * ref[4]
    input(6)(4)(1) <= mcm_output(113); -- input 4,1 <= 22 * ref[5]
    input(6)(4)(2) <= mcm_output(148); -- input 4,2 <= 25 * ref[6]
    input(6)(4)(3) <= mcm_output(179); -- input 4,3 <= 9 * ref[7]

    -- Eq 5 Line 6
    input(6)(5)(0) <= mcm_output(106); -- input 5,0 <= 6 * ref[5]
    input(6)(5)(1) <= mcm_output(140); -- input 5,1 <= 22 * ref[6]
    input(6)(5)(2) <= mcm_output(175); -- input 5,2 <= 25 * ref[7]
    input(6)(5)(3) <= mcm_output(203); -- input 5,3 <= 9 * ref[8]

    -- Eq 6 Line 6
    input(6)(6)(0) <= mcm_output(133); -- input 6,0 <= 6 * ref[6]
    input(6)(6)(1) <= mcm_output(167); -- input 6,1 <= 22 * ref[7]
    input(6)(6)(2) <= mcm_output(195); -- input 6,2 <= 25 * ref[8]
    input(6)(6)(3) <= mcm_output(219); -- input 6,3 <= 9 * ref[9]

    -- Eq 7 Line 6
    input(6)(7)(0) <= mcm_output(160); -- input 7,0 <= 6 * ref[7]
    input(6)(7)(1) <= mcm_output(187); -- input 7,1 <= 22 * ref[8]
    input(6)(7)(2) <= mcm_output(211); -- input 7,2 <= 25 * ref[9]
    input(6)(7)(3) <= mcm_output(227); -- input 7,3 <= 9 * ref[10]

    -- Eq 0 Line 7
    input(7)(0)(0) <= mcm_output(7); -- input 0,0 <= 2 * ref[0]
    input(7)(0)(1) <= mcm_output(22); -- input 0,1 <= 18 * ref[1]
    input(7)(0)(2) <= mcm_output(45); -- input 0,2 <= 29 * ref[2]
    input(7)(0)(3) <= mcm_output(72); -- input 0,3 <= 13 * ref[3]

    -- Eq 1 Line 7
    input(7)(1)(0) <= mcm_output(15); -- input 1,0 <= 2 * ref[1]
    input(7)(1)(1) <= mcm_output(37); -- input 1,1 <= 18 * ref[2]
    input(7)(1)(2) <= mcm_output(68); -- input 1,2 <= 29 * ref[3]
    input(7)(1)(3) <= mcm_output(99); -- input 1,3 <= 13 * ref[4]

    -- Eq 2 Line 7
    input(7)(2)(0) <= mcm_output(30); -- input 2,0 <= 2 * ref[2]
    input(7)(2)(1) <= mcm_output(60); -- input 2,1 <= 18 * ref[3]
    input(7)(2)(2) <= mcm_output(95); -- input 2,2 <= 29 * ref[4]
    input(7)(2)(3) <= mcm_output(126); -- input 2,3 <= 13 * ref[5]

    -- Eq 3 Line 7
    input(7)(3)(0) <= mcm_output(53); -- input 3,0 <= 2 * ref[3]
    input(7)(3)(1) <= mcm_output(87); -- input 3,1 <= 18 * ref[4]
    input(7)(3)(2) <= mcm_output(122); -- input 3,2 <= 29 * ref[5]
    input(7)(3)(3) <= mcm_output(153); -- input 3,3 <= 13 * ref[6]

    -- Eq 4 Line 7
    input(7)(4)(0) <= mcm_output(80); -- input 4,0 <= 2 * ref[4]
    input(7)(4)(1) <= mcm_output(114); -- input 4,1 <= 18 * ref[5]
    input(7)(4)(2) <= mcm_output(149); -- input 4,2 <= 29 * ref[6]
    input(7)(4)(3) <= mcm_output(180); -- input 4,3 <= 13 * ref[7]

    -- Eq 5 Line 7
    input(7)(5)(0) <= mcm_output(107); -- input 5,0 <= 2 * ref[5]
    input(7)(5)(1) <= mcm_output(141); -- input 5,1 <= 18 * ref[6]
    input(7)(5)(2) <= mcm_output(176); -- input 5,2 <= 29 * ref[7]
    input(7)(5)(3) <= mcm_output(204); -- input 5,3 <= 13 * ref[8]

    -- Eq 6 Line 7
    input(7)(6)(0) <= mcm_output(134); -- input 6,0 <= 2 * ref[6]
    input(7)(6)(1) <= mcm_output(168); -- input 6,1 <= 18 * ref[7]
    input(7)(6)(2) <= mcm_output(196); -- input 6,2 <= 29 * ref[8]
    input(7)(6)(3) <= mcm_output(220); -- input 6,3 <= 13 * ref[9]

    -- Eq 7 Line 7
    input(7)(7)(0) <= mcm_output(161); -- input 7,0 <= 2 * ref[7]
    input(7)(7)(1) <= mcm_output(188); -- input 7,1 <= 18 * ref[8]
    input(7)(7)(2) <= mcm_output(212); -- input 7,2 <= 29 * ref[9]
    input(7)(7)(3) <= mcm_output(228); -- input 7,3 <= 13 * ref[10]

	
	process (clk)
	  begin
		if rst = '1' then
			for i in 0 to 7 loop 
				for j in 0 to 3 loop
					eq_input(i)(j) <= "0000000000000000";
				end loop;
			end loop;
		elsif clk'event and clk = '1' then
			
			for i in 0 to 7 loop 
				for j in 0 to 3 loop
		            eq_input(i)(j) <= input(to_integer(unsigned(control)))(i)(j);
				end loop;
			end loop;
		end if;
	end process;
END comportamental;