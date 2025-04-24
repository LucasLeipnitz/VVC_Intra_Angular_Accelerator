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
		ref : IN sample_bus (0 to 34 );
		pred: OUT sample_bus (0 to 31 )
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


type t_mcm_output is array (0 to 226) of std_logic_vector( 15 downto 0);
type t_row is array (0 to 3) of std_logic_vector( 15 downto 0);
type t_eq_input is array (0 to 31) of t_row;
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
    m4 : MCM_3
    PORT MAP ( X => ref(4), Y1 => mcm_output(19), Y2 => mcm_output(20), Y3 => mcm_output(21), Y4 => mcm_output(22), Y5 => mcm_output(23), Y6 => mcm_output(24), Y7 => mcm_output(25) );
    m5 : MCM_3
    PORT MAP ( X => ref(5), Y1 => mcm_output(26), Y2 => mcm_output(27), Y3 => mcm_output(28), Y4 => mcm_output(29), Y5 => mcm_output(30), Y6 => mcm_output(31), Y7 => mcm_output(32) );
    m6 : MCM_3
    PORT MAP ( X => ref(6), Y1 => mcm_output(33), Y2 => mcm_output(34), Y3 => mcm_output(35), Y4 => mcm_output(36), Y5 => mcm_output(37), Y6 => mcm_output(38), Y7 => mcm_output(39) );
    m7 : MCM_3
    PORT MAP ( X => ref(7), Y1 => mcm_output(40), Y2 => mcm_output(41), Y3 => mcm_output(42), Y4 => mcm_output(43), Y5 => mcm_output(44), Y6 => mcm_output(45), Y7 => mcm_output(46) );
    m8 : MCM_3
    PORT MAP ( X => ref(8), Y1 => mcm_output(47), Y2 => mcm_output(48), Y3 => mcm_output(49), Y4 => mcm_output(50), Y5 => mcm_output(51), Y6 => mcm_output(52), Y7 => mcm_output(53) );
    m9 : MCM_3
    PORT MAP ( X => ref(9), Y1 => mcm_output(54), Y2 => mcm_output(55), Y3 => mcm_output(56), Y4 => mcm_output(57), Y5 => mcm_output(58), Y6 => mcm_output(59), Y7 => mcm_output(60) );
    m10 : MCM_3
    PORT MAP ( X => ref(10), Y1 => mcm_output(61), Y2 => mcm_output(62), Y3 => mcm_output(63), Y4 => mcm_output(64), Y5 => mcm_output(65), Y6 => mcm_output(66), Y7 => mcm_output(67) );
    m11 : MCM_3
    PORT MAP ( X => ref(11), Y1 => mcm_output(68), Y2 => mcm_output(69), Y3 => mcm_output(70), Y4 => mcm_output(71), Y5 => mcm_output(72), Y6 => mcm_output(73), Y7 => mcm_output(74) );
    m12 : MCM_3
    PORT MAP ( X => ref(12), Y1 => mcm_output(75), Y2 => mcm_output(76), Y3 => mcm_output(77), Y4 => mcm_output(78), Y5 => mcm_output(79), Y6 => mcm_output(80), Y7 => mcm_output(81) );
    m13 : MCM_3
    PORT MAP ( X => ref(13), Y1 => mcm_output(82), Y2 => mcm_output(83), Y3 => mcm_output(84), Y4 => mcm_output(85), Y5 => mcm_output(86), Y6 => mcm_output(87), Y7 => mcm_output(88) );
    m14 : MCM_3
    PORT MAP ( X => ref(14), Y1 => mcm_output(89), Y2 => mcm_output(90), Y3 => mcm_output(91), Y4 => mcm_output(92), Y5 => mcm_output(93), Y6 => mcm_output(94), Y7 => mcm_output(95) );
    m15 : MCM_3
    PORT MAP ( X => ref(15), Y1 => mcm_output(96), Y2 => mcm_output(97), Y3 => mcm_output(98), Y4 => mcm_output(99), Y5 => mcm_output(100), Y6 => mcm_output(101), Y7 => mcm_output(102) );
    m16 : MCM_3
    PORT MAP ( X => ref(16), Y1 => mcm_output(103), Y2 => mcm_output(104), Y3 => mcm_output(105), Y4 => mcm_output(106), Y5 => mcm_output(107), Y6 => mcm_output(108), Y7 => mcm_output(109) );
    m17 : MCM_3
    PORT MAP ( X => ref(17), Y1 => mcm_output(110), Y2 => mcm_output(111), Y3 => mcm_output(112), Y4 => mcm_output(113), Y5 => mcm_output(114), Y6 => mcm_output(115), Y7 => mcm_output(116) );
    m18 : MCM_3
    PORT MAP ( X => ref(18), Y1 => mcm_output(117), Y2 => mcm_output(118), Y3 => mcm_output(119), Y4 => mcm_output(120), Y5 => mcm_output(121), Y6 => mcm_output(122), Y7 => mcm_output(123) );
    m19 : MCM_3
    PORT MAP ( X => ref(19), Y1 => mcm_output(124), Y2 => mcm_output(125), Y3 => mcm_output(126), Y4 => mcm_output(127), Y5 => mcm_output(128), Y6 => mcm_output(129), Y7 => mcm_output(130) );
    m20 : MCM_3
    PORT MAP ( X => ref(20), Y1 => mcm_output(131), Y2 => mcm_output(132), Y3 => mcm_output(133), Y4 => mcm_output(134), Y5 => mcm_output(135), Y6 => mcm_output(136), Y7 => mcm_output(137) );
    m21 : MCM_3
    PORT MAP ( X => ref(21), Y1 => mcm_output(138), Y2 => mcm_output(139), Y3 => mcm_output(140), Y4 => mcm_output(141), Y5 => mcm_output(142), Y6 => mcm_output(143), Y7 => mcm_output(144) );
    m22 : MCM_3
    PORT MAP ( X => ref(22), Y1 => mcm_output(145), Y2 => mcm_output(146), Y3 => mcm_output(147), Y4 => mcm_output(148), Y5 => mcm_output(149), Y6 => mcm_output(150), Y7 => mcm_output(151) );
    m23 : MCM_3
    PORT MAP ( X => ref(23), Y1 => mcm_output(152), Y2 => mcm_output(153), Y3 => mcm_output(154), Y4 => mcm_output(155), Y5 => mcm_output(156), Y6 => mcm_output(157), Y7 => mcm_output(158) );
    m24 : MCM_3
    PORT MAP ( X => ref(24), Y1 => mcm_output(159), Y2 => mcm_output(160), Y3 => mcm_output(161), Y4 => mcm_output(162), Y5 => mcm_output(163), Y6 => mcm_output(164), Y7 => mcm_output(165) );
    m25 : MCM_3
    PORT MAP ( X => ref(25), Y1 => mcm_output(166), Y2 => mcm_output(167), Y3 => mcm_output(168), Y4 => mcm_output(169), Y5 => mcm_output(170), Y6 => mcm_output(171), Y7 => mcm_output(172) );
    m26 : MCM_3
    PORT MAP ( X => ref(26), Y1 => mcm_output(173), Y2 => mcm_output(174), Y3 => mcm_output(175), Y4 => mcm_output(176), Y5 => mcm_output(177), Y6 => mcm_output(178), Y7 => mcm_output(179) );
    m27 : MCM_3
    PORT MAP ( X => ref(27), Y1 => mcm_output(180), Y2 => mcm_output(181), Y3 => mcm_output(182), Y4 => mcm_output(183), Y5 => mcm_output(184), Y6 => mcm_output(185), Y7 => mcm_output(186) );
    m28 : MCM_3
    PORT MAP ( X => ref(28), Y1 => mcm_output(187), Y2 => mcm_output(188), Y3 => mcm_output(189), Y4 => mcm_output(190), Y5 => mcm_output(191), Y6 => mcm_output(192), Y7 => mcm_output(193) );
    m29 : MCM_3
    PORT MAP ( X => ref(29), Y1 => mcm_output(194), Y2 => mcm_output(195), Y3 => mcm_output(196), Y4 => mcm_output(197), Y5 => mcm_output(198), Y6 => mcm_output(199), Y7 => mcm_output(200) );
    m30 : MCM_3
    PORT MAP ( X => ref(30), Y1 => mcm_output(201), Y2 => mcm_output(202), Y3 => mcm_output(203), Y4 => mcm_output(204), Y5 => mcm_output(205), Y6 => mcm_output(206), Y7 => mcm_output(207) );
    m31 : MCM_3
    PORT MAP ( X => ref(31), Y1 => mcm_output(208), Y2 => mcm_output(209), Y3 => mcm_output(210), Y4 => mcm_output(211), Y5 => mcm_output(212), Y6 => mcm_output(213), Y7 => mcm_output(214) );
    m32 : MCM_4
    PORT MAP ( X => ref(32), Y1 => mcm_output(215), Y2 => mcm_output(216), Y3 => mcm_output(217), Y4 => mcm_output(218), Y5 => mcm_output(219), Y6 => mcm_output(220) );
    m33 : MCM_5
    PORT MAP ( X => ref(33), Y1 => mcm_output(221), Y2 => mcm_output(222), Y3 => mcm_output(223), Y4 => mcm_output(224) );
    m34 : MCM_6
    PORT MAP ( X => ref(34), Y1 => mcm_output(225), Y2 => mcm_output(226) );
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
    eq8: equation_block
    PORT MAP ( input_0 => eq_input(8)(0), input_1 => eq_input(8)(1), input_2 => eq_input(8)(2), input_3 => eq_input(8)(3), output => pred(8) );
    eq9: equation_block
    PORT MAP ( input_0 => eq_input(9)(0), input_1 => eq_input(9)(1), input_2 => eq_input(9)(2), input_3 => eq_input(9)(3), output => pred(9) );
    eq10: equation_block
    PORT MAP ( input_0 => eq_input(10)(0), input_1 => eq_input(10)(1), input_2 => eq_input(10)(2), input_3 => eq_input(10)(3), output => pred(10) );
    eq11: equation_block
    PORT MAP ( input_0 => eq_input(11)(0), input_1 => eq_input(11)(1), input_2 => eq_input(11)(2), input_3 => eq_input(11)(3), output => pred(11) );
    eq12: equation_block
    PORT MAP ( input_0 => eq_input(12)(0), input_1 => eq_input(12)(1), input_2 => eq_input(12)(2), input_3 => eq_input(12)(3), output => pred(12) );
    eq13: equation_block
    PORT MAP ( input_0 => eq_input(13)(0), input_1 => eq_input(13)(1), input_2 => eq_input(13)(2), input_3 => eq_input(13)(3), output => pred(13) );
    eq14: equation_block
    PORT MAP ( input_0 => eq_input(14)(0), input_1 => eq_input(14)(1), input_2 => eq_input(14)(2), input_3 => eq_input(14)(3), output => pred(14) );
    eq15: equation_block
    PORT MAP ( input_0 => eq_input(15)(0), input_1 => eq_input(15)(1), input_2 => eq_input(15)(2), input_3 => eq_input(15)(3), output => pred(15) );
    eq16: equation_block
    PORT MAP ( input_0 => eq_input(16)(0), input_1 => eq_input(16)(1), input_2 => eq_input(16)(2), input_3 => eq_input(16)(3), output => pred(16) );
    eq17: equation_block
    PORT MAP ( input_0 => eq_input(17)(0), input_1 => eq_input(17)(1), input_2 => eq_input(17)(2), input_3 => eq_input(17)(3), output => pred(17) );
    eq18: equation_block
    PORT MAP ( input_0 => eq_input(18)(0), input_1 => eq_input(18)(1), input_2 => eq_input(18)(2), input_3 => eq_input(18)(3), output => pred(18) );
    eq19: equation_block
    PORT MAP ( input_0 => eq_input(19)(0), input_1 => eq_input(19)(1), input_2 => eq_input(19)(2), input_3 => eq_input(19)(3), output => pred(19) );
    eq20: equation_block
    PORT MAP ( input_0 => eq_input(20)(0), input_1 => eq_input(20)(1), input_2 => eq_input(20)(2), input_3 => eq_input(20)(3), output => pred(20) );
    eq21: equation_block
    PORT MAP ( input_0 => eq_input(21)(0), input_1 => eq_input(21)(1), input_2 => eq_input(21)(2), input_3 => eq_input(21)(3), output => pred(21) );
    eq22: equation_block
    PORT MAP ( input_0 => eq_input(22)(0), input_1 => eq_input(22)(1), input_2 => eq_input(22)(2), input_3 => eq_input(22)(3), output => pred(22) );
    eq23: equation_block
    PORT MAP ( input_0 => eq_input(23)(0), input_1 => eq_input(23)(1), input_2 => eq_input(23)(2), input_3 => eq_input(23)(3), output => pred(23) );
    eq24: equation_block
    PORT MAP ( input_0 => eq_input(24)(0), input_1 => eq_input(24)(1), input_2 => eq_input(24)(2), input_3 => eq_input(24)(3), output => pred(24) );
    eq25: equation_block
    PORT MAP ( input_0 => eq_input(25)(0), input_1 => eq_input(25)(1), input_2 => eq_input(25)(2), input_3 => eq_input(25)(3), output => pred(25) );
    eq26: equation_block
    PORT MAP ( input_0 => eq_input(26)(0), input_1 => eq_input(26)(1), input_2 => eq_input(26)(2), input_3 => eq_input(26)(3), output => pred(26) );
    eq27: equation_block
    PORT MAP ( input_0 => eq_input(27)(0), input_1 => eq_input(27)(1), input_2 => eq_input(27)(2), input_3 => eq_input(27)(3), output => pred(27) );
    eq28: equation_block
    PORT MAP ( input_0 => eq_input(28)(0), input_1 => eq_input(28)(1), input_2 => eq_input(28)(2), input_3 => eq_input(28)(3), output => pred(28) );
    eq29: equation_block
    PORT MAP ( input_0 => eq_input(29)(0), input_1 => eq_input(29)(1), input_2 => eq_input(29)(2), input_3 => eq_input(29)(3), output => pred(29) );
    eq30: equation_block
    PORT MAP ( input_0 => eq_input(30)(0), input_1 => eq_input(30)(1), input_2 => eq_input(30)(2), input_3 => eq_input(30)(3), output => pred(30) );
    eq31: equation_block
    PORT MAP ( input_0 => eq_input(31)(0), input_1 => eq_input(31)(1), input_2 => eq_input(31)(2), input_3 => eq_input(31)(3), output => pred(31) );



    -- Eq 0 Line 0
    input(0)(0)(0) <= mcm_output(0); -- input 0,0 <= -3 * ref[0]
    input(0)(0)(1) <= mcm_output(4); -- input 0,1 <= 36 * ref[1]
    input(0)(0)(2) <= mcm_output(10); -- input 0,2 <= 34 * ref[2]
    input(0)(0)(3) <= mcm_output(12); -- input 0,3 <= -3 * ref[3]

    -- Eq 1 Line 0
    input(0)(1)(0) <= mcm_output(2); -- input 1,0 <= -3 * ref[1]
    input(0)(1)(1) <= mcm_output(8); -- input 1,1 <= 36 * ref[2]
    input(0)(1)(2) <= mcm_output(16); -- input 1,2 <= 34 * ref[3]
    input(0)(1)(3) <= mcm_output(19); -- input 1,3 <= -3 * ref[4]

    -- Eq 2 Line 0
    input(0)(2)(0) <= mcm_output(6); -- input 2,0 <= -3 * ref[2]
    input(0)(2)(1) <= mcm_output(14); -- input 2,1 <= 36 * ref[3]
    input(0)(2)(2) <= mcm_output(23); -- input 2,2 <= 34 * ref[4]
    input(0)(2)(3) <= mcm_output(26); -- input 2,3 <= -3 * ref[5]

    -- Eq 3 Line 0
    input(0)(3)(0) <= mcm_output(12); -- input 3,0 <= -3 * ref[3]
    input(0)(3)(1) <= mcm_output(21); -- input 3,1 <= 36 * ref[4]
    input(0)(3)(2) <= mcm_output(30); -- input 3,2 <= 34 * ref[5]
    input(0)(3)(3) <= mcm_output(33); -- input 3,3 <= -3 * ref[6]

    -- Eq 4 Line 0
    input(0)(4)(0) <= mcm_output(19); -- input 4,0 <= -3 * ref[4]
    input(0)(4)(1) <= mcm_output(28); -- input 4,1 <= 36 * ref[5]
    input(0)(4)(2) <= mcm_output(37); -- input 4,2 <= 34 * ref[6]
    input(0)(4)(3) <= mcm_output(40); -- input 4,3 <= -3 * ref[7]

    -- Eq 5 Line 0
    input(0)(5)(0) <= mcm_output(26); -- input 5,0 <= -3 * ref[5]
    input(0)(5)(1) <= mcm_output(35); -- input 5,1 <= 36 * ref[6]
    input(0)(5)(2) <= mcm_output(44); -- input 5,2 <= 34 * ref[7]
    input(0)(5)(3) <= mcm_output(47); -- input 5,3 <= -3 * ref[8]

    -- Eq 6 Line 0
    input(0)(6)(0) <= mcm_output(33); -- input 6,0 <= -3 * ref[6]
    input(0)(6)(1) <= mcm_output(42); -- input 6,1 <= 36 * ref[7]
    input(0)(6)(2) <= mcm_output(51); -- input 6,2 <= 34 * ref[8]
    input(0)(6)(3) <= mcm_output(54); -- input 6,3 <= -3 * ref[9]

    -- Eq 7 Line 0
    input(0)(7)(0) <= mcm_output(40); -- input 7,0 <= -3 * ref[7]
    input(0)(7)(1) <= mcm_output(49); -- input 7,1 <= 36 * ref[8]
    input(0)(7)(2) <= mcm_output(58); -- input 7,2 <= 34 * ref[9]
    input(0)(7)(3) <= mcm_output(61); -- input 7,3 <= -3 * ref[10]

    -- Eq 8 Line 0
    input(0)(8)(0) <= mcm_output(47); -- input 8,0 <= -3 * ref[8]
    input(0)(8)(1) <= mcm_output(56); -- input 8,1 <= 36 * ref[9]
    input(0)(8)(2) <= mcm_output(65); -- input 8,2 <= 34 * ref[10]
    input(0)(8)(3) <= mcm_output(68); -- input 8,3 <= -3 * ref[11]

    -- Eq 9 Line 0
    input(0)(9)(0) <= mcm_output(54); -- input 9,0 <= -3 * ref[9]
    input(0)(9)(1) <= mcm_output(63); -- input 9,1 <= 36 * ref[10]
    input(0)(9)(2) <= mcm_output(72); -- input 9,2 <= 34 * ref[11]
    input(0)(9)(3) <= mcm_output(75); -- input 9,3 <= -3 * ref[12]

    -- Eq 10 Line 0
    input(0)(10)(0) <= mcm_output(61); -- input 10,0 <= -3 * ref[10]
    input(0)(10)(1) <= mcm_output(70); -- input 10,1 <= 36 * ref[11]
    input(0)(10)(2) <= mcm_output(79); -- input 10,2 <= 34 * ref[12]
    input(0)(10)(3) <= mcm_output(82); -- input 10,3 <= -3 * ref[13]

    -- Eq 11 Line 0
    input(0)(11)(0) <= mcm_output(68); -- input 11,0 <= -3 * ref[11]
    input(0)(11)(1) <= mcm_output(77); -- input 11,1 <= 36 * ref[12]
    input(0)(11)(2) <= mcm_output(86); -- input 11,2 <= 34 * ref[13]
    input(0)(11)(3) <= mcm_output(89); -- input 11,3 <= -3 * ref[14]

    -- Eq 12 Line 0
    input(0)(12)(0) <= mcm_output(75); -- input 12,0 <= -3 * ref[12]
    input(0)(12)(1) <= mcm_output(84); -- input 12,1 <= 36 * ref[13]
    input(0)(12)(2) <= mcm_output(93); -- input 12,2 <= 34 * ref[14]
    input(0)(12)(3) <= mcm_output(96); -- input 12,3 <= -3 * ref[15]

    -- Eq 13 Line 0
    input(0)(13)(0) <= mcm_output(82); -- input 13,0 <= -3 * ref[13]
    input(0)(13)(1) <= mcm_output(91); -- input 13,1 <= 36 * ref[14]
    input(0)(13)(2) <= mcm_output(100); -- input 13,2 <= 34 * ref[15]
    input(0)(13)(3) <= mcm_output(103); -- input 13,3 <= -3 * ref[16]

    -- Eq 14 Line 0
    input(0)(14)(0) <= mcm_output(89); -- input 14,0 <= -3 * ref[14]
    input(0)(14)(1) <= mcm_output(98); -- input 14,1 <= 36 * ref[15]
    input(0)(14)(2) <= mcm_output(107); -- input 14,2 <= 34 * ref[16]
    input(0)(14)(3) <= mcm_output(110); -- input 14,3 <= -3 * ref[17]

    -- Eq 15 Line 0
    input(0)(15)(0) <= mcm_output(96); -- input 15,0 <= -3 * ref[15]
    input(0)(15)(1) <= mcm_output(105); -- input 15,1 <= 36 * ref[16]
    input(0)(15)(2) <= mcm_output(114); -- input 15,2 <= 34 * ref[17]
    input(0)(15)(3) <= mcm_output(117); -- input 15,3 <= -3 * ref[18]

    -- Eq 16 Line 0
    input(0)(16)(0) <= mcm_output(103); -- input 16,0 <= -3 * ref[16]
    input(0)(16)(1) <= mcm_output(112); -- input 16,1 <= 36 * ref[17]
    input(0)(16)(2) <= mcm_output(121); -- input 16,2 <= 34 * ref[18]
    input(0)(16)(3) <= mcm_output(124); -- input 16,3 <= -3 * ref[19]

    -- Eq 17 Line 0
    input(0)(17)(0) <= mcm_output(110); -- input 17,0 <= -3 * ref[17]
    input(0)(17)(1) <= mcm_output(119); -- input 17,1 <= 36 * ref[18]
    input(0)(17)(2) <= mcm_output(128); -- input 17,2 <= 34 * ref[19]
    input(0)(17)(3) <= mcm_output(131); -- input 17,3 <= -3 * ref[20]

    -- Eq 18 Line 0
    input(0)(18)(0) <= mcm_output(117); -- input 18,0 <= -3 * ref[18]
    input(0)(18)(1) <= mcm_output(126); -- input 18,1 <= 36 * ref[19]
    input(0)(18)(2) <= mcm_output(135); -- input 18,2 <= 34 * ref[20]
    input(0)(18)(3) <= mcm_output(138); -- input 18,3 <= -3 * ref[21]

    -- Eq 19 Line 0
    input(0)(19)(0) <= mcm_output(124); -- input 19,0 <= -3 * ref[19]
    input(0)(19)(1) <= mcm_output(133); -- input 19,1 <= 36 * ref[20]
    input(0)(19)(2) <= mcm_output(142); -- input 19,2 <= 34 * ref[21]
    input(0)(19)(3) <= mcm_output(145); -- input 19,3 <= -3 * ref[22]

    -- Eq 20 Line 0
    input(0)(20)(0) <= mcm_output(131); -- input 20,0 <= -3 * ref[20]
    input(0)(20)(1) <= mcm_output(140); -- input 20,1 <= 36 * ref[21]
    input(0)(20)(2) <= mcm_output(149); -- input 20,2 <= 34 * ref[22]
    input(0)(20)(3) <= mcm_output(152); -- input 20,3 <= -3 * ref[23]

    -- Eq 21 Line 0
    input(0)(21)(0) <= mcm_output(138); -- input 21,0 <= -3 * ref[21]
    input(0)(21)(1) <= mcm_output(147); -- input 21,1 <= 36 * ref[22]
    input(0)(21)(2) <= mcm_output(156); -- input 21,2 <= 34 * ref[23]
    input(0)(21)(3) <= mcm_output(159); -- input 21,3 <= -3 * ref[24]

    -- Eq 22 Line 0
    input(0)(22)(0) <= mcm_output(145); -- input 22,0 <= -3 * ref[22]
    input(0)(22)(1) <= mcm_output(154); -- input 22,1 <= 36 * ref[23]
    input(0)(22)(2) <= mcm_output(163); -- input 22,2 <= 34 * ref[24]
    input(0)(22)(3) <= mcm_output(166); -- input 22,3 <= -3 * ref[25]

    -- Eq 23 Line 0
    input(0)(23)(0) <= mcm_output(152); -- input 23,0 <= -3 * ref[23]
    input(0)(23)(1) <= mcm_output(161); -- input 23,1 <= 36 * ref[24]
    input(0)(23)(2) <= mcm_output(170); -- input 23,2 <= 34 * ref[25]
    input(0)(23)(3) <= mcm_output(173); -- input 23,3 <= -3 * ref[26]

    -- Eq 24 Line 0
    input(0)(24)(0) <= mcm_output(159); -- input 24,0 <= -3 * ref[24]
    input(0)(24)(1) <= mcm_output(168); -- input 24,1 <= 36 * ref[25]
    input(0)(24)(2) <= mcm_output(177); -- input 24,2 <= 34 * ref[26]
    input(0)(24)(3) <= mcm_output(180); -- input 24,3 <= -3 * ref[27]

    -- Eq 25 Line 0
    input(0)(25)(0) <= mcm_output(166); -- input 25,0 <= -3 * ref[25]
    input(0)(25)(1) <= mcm_output(175); -- input 25,1 <= 36 * ref[26]
    input(0)(25)(2) <= mcm_output(184); -- input 25,2 <= 34 * ref[27]
    input(0)(25)(3) <= mcm_output(187); -- input 25,3 <= -3 * ref[28]

    -- Eq 26 Line 0
    input(0)(26)(0) <= mcm_output(173); -- input 26,0 <= -3 * ref[26]
    input(0)(26)(1) <= mcm_output(182); -- input 26,1 <= 36 * ref[27]
    input(0)(26)(2) <= mcm_output(191); -- input 26,2 <= 34 * ref[28]
    input(0)(26)(3) <= mcm_output(194); -- input 26,3 <= -3 * ref[29]

    -- Eq 27 Line 0
    input(0)(27)(0) <= mcm_output(180); -- input 27,0 <= -3 * ref[27]
    input(0)(27)(1) <= mcm_output(189); -- input 27,1 <= 36 * ref[28]
    input(0)(27)(2) <= mcm_output(198); -- input 27,2 <= 34 * ref[29]
    input(0)(27)(3) <= mcm_output(201); -- input 27,3 <= -3 * ref[30]

    -- Eq 28 Line 0
    input(0)(28)(0) <= mcm_output(187); -- input 28,0 <= -3 * ref[28]
    input(0)(28)(1) <= mcm_output(196); -- input 28,1 <= 36 * ref[29]
    input(0)(28)(2) <= mcm_output(205); -- input 28,2 <= 34 * ref[30]
    input(0)(28)(3) <= mcm_output(208); -- input 28,3 <= -3 * ref[31]

    -- Eq 29 Line 0
    input(0)(29)(0) <= mcm_output(194); -- input 29,0 <= -3 * ref[29]
    input(0)(29)(1) <= mcm_output(203); -- input 29,1 <= 36 * ref[30]
    input(0)(29)(2) <= mcm_output(212); -- input 29,2 <= 34 * ref[31]
    input(0)(29)(3) <= mcm_output(219); -- input 29,3 <= -3 * ref[32]

    -- Eq 30 Line 0
    input(0)(30)(0) <= mcm_output(201); -- input 30,0 <= -3 * ref[30]
    input(0)(30)(1) <= mcm_output(210); -- input 30,1 <= 36 * ref[31]
    input(0)(30)(2) <= mcm_output(217); -- input 30,2 <= 34 * ref[32]
    input(0)(30)(3) <= mcm_output(223); -- input 30,3 <= -3 * ref[33]

    -- Eq 31 Line 0
    input(0)(31)(0) <= mcm_output(208); -- input 31,0 <= -3 * ref[31]
    input(0)(31)(1) <= mcm_output(215); -- input 31,1 <= 36 * ref[32]
    input(0)(31)(2) <= mcm_output(221); -- input 31,2 <= 34 * ref[33]
    input(0)(31)(3) <= mcm_output(225); -- input 31,3 <= -3 * ref[34]

    -- Eq 0 Line 1
    input(1)(0)(0) <= mcm_output(1); -- input 0,0 <= 8 * ref[0]
    input(1)(0)(1) <= mcm_output(5); -- input 0,1 <= 24 * ref[1]
    input(1)(0)(2) <= mcm_output(11); -- input 0,2 <= 23 * ref[2]
    input(1)(0)(3) <= mcm_output(18); -- input 0,3 <= 7 * ref[3]

    -- Eq 1 Line 1
    input(1)(1)(0) <= mcm_output(3); -- input 1,0 <= 8 * ref[1]
    input(1)(1)(1) <= mcm_output(9); -- input 1,1 <= 24 * ref[2]
    input(1)(1)(2) <= mcm_output(17); -- input 1,2 <= 23 * ref[3]
    input(1)(1)(3) <= mcm_output(25); -- input 1,3 <= 7 * ref[4]

    -- Eq 2 Line 1
    input(1)(2)(0) <= mcm_output(7); -- input 2,0 <= 8 * ref[2]
    input(1)(2)(1) <= mcm_output(15); -- input 2,1 <= 24 * ref[3]
    input(1)(2)(2) <= mcm_output(24); -- input 2,2 <= 23 * ref[4]
    input(1)(2)(3) <= mcm_output(32); -- input 2,3 <= 7 * ref[5]

    -- Eq 3 Line 1
    input(1)(3)(0) <= mcm_output(13); -- input 3,0 <= 8 * ref[3]
    input(1)(3)(1) <= mcm_output(22); -- input 3,1 <= 24 * ref[4]
    input(1)(3)(2) <= mcm_output(31); -- input 3,2 <= 23 * ref[5]
    input(1)(3)(3) <= mcm_output(39); -- input 3,3 <= 7 * ref[6]

    -- Eq 4 Line 1
    input(1)(4)(0) <= mcm_output(20); -- input 4,0 <= 8 * ref[4]
    input(1)(4)(1) <= mcm_output(29); -- input 4,1 <= 24 * ref[5]
    input(1)(4)(2) <= mcm_output(38); -- input 4,2 <= 23 * ref[6]
    input(1)(4)(3) <= mcm_output(46); -- input 4,3 <= 7 * ref[7]

    -- Eq 5 Line 1
    input(1)(5)(0) <= mcm_output(27); -- input 5,0 <= 8 * ref[5]
    input(1)(5)(1) <= mcm_output(36); -- input 5,1 <= 24 * ref[6]
    input(1)(5)(2) <= mcm_output(45); -- input 5,2 <= 23 * ref[7]
    input(1)(5)(3) <= mcm_output(53); -- input 5,3 <= 7 * ref[8]

    -- Eq 6 Line 1
    input(1)(6)(0) <= mcm_output(34); -- input 6,0 <= 8 * ref[6]
    input(1)(6)(1) <= mcm_output(43); -- input 6,1 <= 24 * ref[7]
    input(1)(6)(2) <= mcm_output(52); -- input 6,2 <= 23 * ref[8]
    input(1)(6)(3) <= mcm_output(60); -- input 6,3 <= 7 * ref[9]

    -- Eq 7 Line 1
    input(1)(7)(0) <= mcm_output(41); -- input 7,0 <= 8 * ref[7]
    input(1)(7)(1) <= mcm_output(50); -- input 7,1 <= 24 * ref[8]
    input(1)(7)(2) <= mcm_output(59); -- input 7,2 <= 23 * ref[9]
    input(1)(7)(3) <= mcm_output(67); -- input 7,3 <= 7 * ref[10]

    -- Eq 8 Line 1
    input(1)(8)(0) <= mcm_output(48); -- input 8,0 <= 8 * ref[8]
    input(1)(8)(1) <= mcm_output(57); -- input 8,1 <= 24 * ref[9]
    input(1)(8)(2) <= mcm_output(66); -- input 8,2 <= 23 * ref[10]
    input(1)(8)(3) <= mcm_output(74); -- input 8,3 <= 7 * ref[11]

    -- Eq 9 Line 1
    input(1)(9)(0) <= mcm_output(55); -- input 9,0 <= 8 * ref[9]
    input(1)(9)(1) <= mcm_output(64); -- input 9,1 <= 24 * ref[10]
    input(1)(9)(2) <= mcm_output(73); -- input 9,2 <= 23 * ref[11]
    input(1)(9)(3) <= mcm_output(81); -- input 9,3 <= 7 * ref[12]

    -- Eq 10 Line 1
    input(1)(10)(0) <= mcm_output(62); -- input 10,0 <= 8 * ref[10]
    input(1)(10)(1) <= mcm_output(71); -- input 10,1 <= 24 * ref[11]
    input(1)(10)(2) <= mcm_output(80); -- input 10,2 <= 23 * ref[12]
    input(1)(10)(3) <= mcm_output(88); -- input 10,3 <= 7 * ref[13]

    -- Eq 11 Line 1
    input(1)(11)(0) <= mcm_output(69); -- input 11,0 <= 8 * ref[11]
    input(1)(11)(1) <= mcm_output(78); -- input 11,1 <= 24 * ref[12]
    input(1)(11)(2) <= mcm_output(87); -- input 11,2 <= 23 * ref[13]
    input(1)(11)(3) <= mcm_output(95); -- input 11,3 <= 7 * ref[14]

    -- Eq 12 Line 1
    input(1)(12)(0) <= mcm_output(76); -- input 12,0 <= 8 * ref[12]
    input(1)(12)(1) <= mcm_output(85); -- input 12,1 <= 24 * ref[13]
    input(1)(12)(2) <= mcm_output(94); -- input 12,2 <= 23 * ref[14]
    input(1)(12)(3) <= mcm_output(102); -- input 12,3 <= 7 * ref[15]

    -- Eq 13 Line 1
    input(1)(13)(0) <= mcm_output(83); -- input 13,0 <= 8 * ref[13]
    input(1)(13)(1) <= mcm_output(92); -- input 13,1 <= 24 * ref[14]
    input(1)(13)(2) <= mcm_output(101); -- input 13,2 <= 23 * ref[15]
    input(1)(13)(3) <= mcm_output(109); -- input 13,3 <= 7 * ref[16]

    -- Eq 14 Line 1
    input(1)(14)(0) <= mcm_output(90); -- input 14,0 <= 8 * ref[14]
    input(1)(14)(1) <= mcm_output(99); -- input 14,1 <= 24 * ref[15]
    input(1)(14)(2) <= mcm_output(108); -- input 14,2 <= 23 * ref[16]
    input(1)(14)(3) <= mcm_output(116); -- input 14,3 <= 7 * ref[17]

    -- Eq 15 Line 1
    input(1)(15)(0) <= mcm_output(97); -- input 15,0 <= 8 * ref[15]
    input(1)(15)(1) <= mcm_output(106); -- input 15,1 <= 24 * ref[16]
    input(1)(15)(2) <= mcm_output(115); -- input 15,2 <= 23 * ref[17]
    input(1)(15)(3) <= mcm_output(123); -- input 15,3 <= 7 * ref[18]

    -- Eq 16 Line 1
    input(1)(16)(0) <= mcm_output(104); -- input 16,0 <= 8 * ref[16]
    input(1)(16)(1) <= mcm_output(113); -- input 16,1 <= 24 * ref[17]
    input(1)(16)(2) <= mcm_output(122); -- input 16,2 <= 23 * ref[18]
    input(1)(16)(3) <= mcm_output(130); -- input 16,3 <= 7 * ref[19]

    -- Eq 17 Line 1
    input(1)(17)(0) <= mcm_output(111); -- input 17,0 <= 8 * ref[17]
    input(1)(17)(1) <= mcm_output(120); -- input 17,1 <= 24 * ref[18]
    input(1)(17)(2) <= mcm_output(129); -- input 17,2 <= 23 * ref[19]
    input(1)(17)(3) <= mcm_output(137); -- input 17,3 <= 7 * ref[20]

    -- Eq 18 Line 1
    input(1)(18)(0) <= mcm_output(118); -- input 18,0 <= 8 * ref[18]
    input(1)(18)(1) <= mcm_output(127); -- input 18,1 <= 24 * ref[19]
    input(1)(18)(2) <= mcm_output(136); -- input 18,2 <= 23 * ref[20]
    input(1)(18)(3) <= mcm_output(144); -- input 18,3 <= 7 * ref[21]

    -- Eq 19 Line 1
    input(1)(19)(0) <= mcm_output(125); -- input 19,0 <= 8 * ref[19]
    input(1)(19)(1) <= mcm_output(134); -- input 19,1 <= 24 * ref[20]
    input(1)(19)(2) <= mcm_output(143); -- input 19,2 <= 23 * ref[21]
    input(1)(19)(3) <= mcm_output(151); -- input 19,3 <= 7 * ref[22]

    -- Eq 20 Line 1
    input(1)(20)(0) <= mcm_output(132); -- input 20,0 <= 8 * ref[20]
    input(1)(20)(1) <= mcm_output(141); -- input 20,1 <= 24 * ref[21]
    input(1)(20)(2) <= mcm_output(150); -- input 20,2 <= 23 * ref[22]
    input(1)(20)(3) <= mcm_output(158); -- input 20,3 <= 7 * ref[23]

    -- Eq 21 Line 1
    input(1)(21)(0) <= mcm_output(139); -- input 21,0 <= 8 * ref[21]
    input(1)(21)(1) <= mcm_output(148); -- input 21,1 <= 24 * ref[22]
    input(1)(21)(2) <= mcm_output(157); -- input 21,2 <= 23 * ref[23]
    input(1)(21)(3) <= mcm_output(165); -- input 21,3 <= 7 * ref[24]

    -- Eq 22 Line 1
    input(1)(22)(0) <= mcm_output(146); -- input 22,0 <= 8 * ref[22]
    input(1)(22)(1) <= mcm_output(155); -- input 22,1 <= 24 * ref[23]
    input(1)(22)(2) <= mcm_output(164); -- input 22,2 <= 23 * ref[24]
    input(1)(22)(3) <= mcm_output(172); -- input 22,3 <= 7 * ref[25]

    -- Eq 23 Line 1
    input(1)(23)(0) <= mcm_output(153); -- input 23,0 <= 8 * ref[23]
    input(1)(23)(1) <= mcm_output(162); -- input 23,1 <= 24 * ref[24]
    input(1)(23)(2) <= mcm_output(171); -- input 23,2 <= 23 * ref[25]
    input(1)(23)(3) <= mcm_output(179); -- input 23,3 <= 7 * ref[26]

    -- Eq 24 Line 1
    input(1)(24)(0) <= mcm_output(160); -- input 24,0 <= 8 * ref[24]
    input(1)(24)(1) <= mcm_output(169); -- input 24,1 <= 24 * ref[25]
    input(1)(24)(2) <= mcm_output(178); -- input 24,2 <= 23 * ref[26]
    input(1)(24)(3) <= mcm_output(186); -- input 24,3 <= 7 * ref[27]

    -- Eq 25 Line 1
    input(1)(25)(0) <= mcm_output(167); -- input 25,0 <= 8 * ref[25]
    input(1)(25)(1) <= mcm_output(176); -- input 25,1 <= 24 * ref[26]
    input(1)(25)(2) <= mcm_output(185); -- input 25,2 <= 23 * ref[27]
    input(1)(25)(3) <= mcm_output(193); -- input 25,3 <= 7 * ref[28]

    -- Eq 26 Line 1
    input(1)(26)(0) <= mcm_output(174); -- input 26,0 <= 8 * ref[26]
    input(1)(26)(1) <= mcm_output(183); -- input 26,1 <= 24 * ref[27]
    input(1)(26)(2) <= mcm_output(192); -- input 26,2 <= 23 * ref[28]
    input(1)(26)(3) <= mcm_output(200); -- input 26,3 <= 7 * ref[29]

    -- Eq 27 Line 1
    input(1)(27)(0) <= mcm_output(181); -- input 27,0 <= 8 * ref[27]
    input(1)(27)(1) <= mcm_output(190); -- input 27,1 <= 24 * ref[28]
    input(1)(27)(2) <= mcm_output(199); -- input 27,2 <= 23 * ref[29]
    input(1)(27)(3) <= mcm_output(207); -- input 27,3 <= 7 * ref[30]

    -- Eq 28 Line 1
    input(1)(28)(0) <= mcm_output(188); -- input 28,0 <= 8 * ref[28]
    input(1)(28)(1) <= mcm_output(197); -- input 28,1 <= 24 * ref[29]
    input(1)(28)(2) <= mcm_output(206); -- input 28,2 <= 23 * ref[30]
    input(1)(28)(3) <= mcm_output(214); -- input 28,3 <= 7 * ref[31]

    -- Eq 29 Line 1
    input(1)(29)(0) <= mcm_output(195); -- input 29,0 <= 8 * ref[29]
    input(1)(29)(1) <= mcm_output(204); -- input 29,1 <= 24 * ref[30]
    input(1)(29)(2) <= mcm_output(213); -- input 29,2 <= 23 * ref[31]
    input(1)(29)(3) <= mcm_output(220); -- input 29,3 <= 7 * ref[32]

    -- Eq 30 Line 1
    input(1)(30)(0) <= mcm_output(202); -- input 30,0 <= 8 * ref[30]
    input(1)(30)(1) <= mcm_output(211); -- input 30,1 <= 24 * ref[31]
    input(1)(30)(2) <= mcm_output(218); -- input 30,2 <= 23 * ref[32]
    input(1)(30)(3) <= mcm_output(224); -- input 30,3 <= 7 * ref[33]

    -- Eq 31 Line 1
    input(1)(31)(0) <= mcm_output(209); -- input 31,0 <= 8 * ref[31]
    input(1)(31)(1) <= mcm_output(216); -- input 31,1 <= 24 * ref[32]
    input(1)(31)(2) <= mcm_output(222); -- input 31,2 <= 23 * ref[33]
    input(1)(31)(3) <= mcm_output(226); -- input 31,3 <= 7 * ref[34]

	
	process (clk, rst)
	  begin
		if rst = '1' then
			for i in 0 to 31 loop 
				for j in 0 to 3 loop
					eq_input(i)(j) <= "0000000000000000";
				end loop;
			end loop;
		elsif clk'event and clk = '1' then
			
			for i in 0 to 31 loop 
				for j in 0 to 3 loop
		            eq_input(i)(j) <= input(to_integer(unsigned(control)))(i)(j);
				end loop;
			end loop;
		end if;
	end process;
END comportamental;