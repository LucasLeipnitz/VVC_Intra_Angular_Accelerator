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
		ref : IN sample_bus (0 to 18 );
		pred: OUT sample_bus (0 to 15 )
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


type t_mcm_output is array (0 to 229) of std_logic_vector( 15 downto 0);
type t_row is array (0 to 3) of std_logic_vector( 15 downto 0);
type t_eq_input is array (0 to 15) of t_row;
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
    m4 : MCM_3
    PORT MAP ( X => ref(4), Y1 => mcm_output(38), Y2 => mcm_output(39), Y3 => mcm_output(40), Y4 => mcm_output(41), Y5 => mcm_output(42), Y6 => mcm_output(43), Y7 => mcm_output(44), Y8 => mcm_output(45), Y9 => mcm_output(46), Y10 => mcm_output(47), Y11 => mcm_output(48), Y12 => mcm_output(49), Y13 => mcm_output(50), Y14 => mcm_output(51) );
    m5 : MCM_3
    PORT MAP ( X => ref(5), Y1 => mcm_output(52), Y2 => mcm_output(53), Y3 => mcm_output(54), Y4 => mcm_output(55), Y5 => mcm_output(56), Y6 => mcm_output(57), Y7 => mcm_output(58), Y8 => mcm_output(59), Y9 => mcm_output(60), Y10 => mcm_output(61), Y11 => mcm_output(62), Y12 => mcm_output(63), Y13 => mcm_output(64), Y14 => mcm_output(65) );
    m6 : MCM_3
    PORT MAP ( X => ref(6), Y1 => mcm_output(66), Y2 => mcm_output(67), Y3 => mcm_output(68), Y4 => mcm_output(69), Y5 => mcm_output(70), Y6 => mcm_output(71), Y7 => mcm_output(72), Y8 => mcm_output(73), Y9 => mcm_output(74), Y10 => mcm_output(75), Y11 => mcm_output(76), Y12 => mcm_output(77), Y13 => mcm_output(78), Y14 => mcm_output(79) );
    m7 : MCM_3
    PORT MAP ( X => ref(7), Y1 => mcm_output(80), Y2 => mcm_output(81), Y3 => mcm_output(82), Y4 => mcm_output(83), Y5 => mcm_output(84), Y6 => mcm_output(85), Y7 => mcm_output(86), Y8 => mcm_output(87), Y9 => mcm_output(88), Y10 => mcm_output(89), Y11 => mcm_output(90), Y12 => mcm_output(91), Y13 => mcm_output(92), Y14 => mcm_output(93) );
    m8 : MCM_3
    PORT MAP ( X => ref(8), Y1 => mcm_output(94), Y2 => mcm_output(95), Y3 => mcm_output(96), Y4 => mcm_output(97), Y5 => mcm_output(98), Y6 => mcm_output(99), Y7 => mcm_output(100), Y8 => mcm_output(101), Y9 => mcm_output(102), Y10 => mcm_output(103), Y11 => mcm_output(104), Y12 => mcm_output(105), Y13 => mcm_output(106), Y14 => mcm_output(107) );
    m9 : MCM_3
    PORT MAP ( X => ref(9), Y1 => mcm_output(108), Y2 => mcm_output(109), Y3 => mcm_output(110), Y4 => mcm_output(111), Y5 => mcm_output(112), Y6 => mcm_output(113), Y7 => mcm_output(114), Y8 => mcm_output(115), Y9 => mcm_output(116), Y10 => mcm_output(117), Y11 => mcm_output(118), Y12 => mcm_output(119), Y13 => mcm_output(120), Y14 => mcm_output(121) );
    m10 : MCM_3
    PORT MAP ( X => ref(10), Y1 => mcm_output(122), Y2 => mcm_output(123), Y3 => mcm_output(124), Y4 => mcm_output(125), Y5 => mcm_output(126), Y6 => mcm_output(127), Y7 => mcm_output(128), Y8 => mcm_output(129), Y9 => mcm_output(130), Y10 => mcm_output(131), Y11 => mcm_output(132), Y12 => mcm_output(133), Y13 => mcm_output(134), Y14 => mcm_output(135) );
    m11 : MCM_3
    PORT MAP ( X => ref(11), Y1 => mcm_output(136), Y2 => mcm_output(137), Y3 => mcm_output(138), Y4 => mcm_output(139), Y5 => mcm_output(140), Y6 => mcm_output(141), Y7 => mcm_output(142), Y8 => mcm_output(143), Y9 => mcm_output(144), Y10 => mcm_output(145), Y11 => mcm_output(146), Y12 => mcm_output(147), Y13 => mcm_output(148), Y14 => mcm_output(149) );
    m12 : MCM_3
    PORT MAP ( X => ref(12), Y1 => mcm_output(150), Y2 => mcm_output(151), Y3 => mcm_output(152), Y4 => mcm_output(153), Y5 => mcm_output(154), Y6 => mcm_output(155), Y7 => mcm_output(156), Y8 => mcm_output(157), Y9 => mcm_output(158), Y10 => mcm_output(159), Y11 => mcm_output(160), Y12 => mcm_output(161), Y13 => mcm_output(162), Y14 => mcm_output(163) );
    m13 : MCM_3
    PORT MAP ( X => ref(13), Y1 => mcm_output(164), Y2 => mcm_output(165), Y3 => mcm_output(166), Y4 => mcm_output(167), Y5 => mcm_output(168), Y6 => mcm_output(169), Y7 => mcm_output(170), Y8 => mcm_output(171), Y9 => mcm_output(172), Y10 => mcm_output(173), Y11 => mcm_output(174), Y12 => mcm_output(175), Y13 => mcm_output(176), Y14 => mcm_output(177) );
    m14 : MCM_3
    PORT MAP ( X => ref(14), Y1 => mcm_output(178), Y2 => mcm_output(179), Y3 => mcm_output(180), Y4 => mcm_output(181), Y5 => mcm_output(182), Y6 => mcm_output(183), Y7 => mcm_output(184), Y8 => mcm_output(185), Y9 => mcm_output(186), Y10 => mcm_output(187), Y11 => mcm_output(188), Y12 => mcm_output(189), Y13 => mcm_output(190), Y14 => mcm_output(191) );
    m15 : MCM_3
    PORT MAP ( X => ref(15), Y1 => mcm_output(192), Y2 => mcm_output(193), Y3 => mcm_output(194), Y4 => mcm_output(195), Y5 => mcm_output(196), Y6 => mcm_output(197), Y7 => mcm_output(198), Y8 => mcm_output(199), Y9 => mcm_output(200), Y10 => mcm_output(201), Y11 => mcm_output(202), Y12 => mcm_output(203), Y13 => mcm_output(204), Y14 => mcm_output(205) );
    m16 : MCM_4
    PORT MAP ( X => ref(16), Y1 => mcm_output(206), Y2 => mcm_output(207), Y3 => mcm_output(208), Y4 => mcm_output(209), Y5 => mcm_output(210), Y6 => mcm_output(211), Y7 => mcm_output(212), Y8 => mcm_output(213), Y9 => mcm_output(214), Y10 => mcm_output(215), Y11 => mcm_output(216), Y12 => mcm_output(217) );
    m17 : MCM_5
    PORT MAP ( X => ref(17), Y1 => mcm_output(218), Y2 => mcm_output(219), Y3 => mcm_output(220), Y4 => mcm_output(221), Y5 => mcm_output(222), Y6 => mcm_output(223), Y7 => mcm_output(224), Y8 => mcm_output(225) );
    m18 : MCM_6
    PORT MAP ( X => ref(18), Y1 => mcm_output(226), Y2 => mcm_output(227), Y3 => mcm_output(228), Y4 => mcm_output(229) );
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



    -- Eq 0 Line 0
    input(0)(0)(0) <= mcm_output(0); -- input 0,0 <= -3 * ref[0]
    input(0)(0)(1) <= mcm_output(8); -- input 0,1 <= 53 * ref[1]
    input(0)(0)(2) <= mcm_output(20); -- input 0,2 <= 16 * ref[2]
    input(0)(0)(3) <= mcm_output(25); -- input 0,3 <= -2 * ref[3]

    -- Eq 1 Line 0
    input(0)(1)(0) <= mcm_output(4); -- input 1,0 <= -3 * ref[1]
    input(0)(1)(1) <= mcm_output(16); -- input 1,1 <= 53 * ref[2]
    input(0)(1)(2) <= mcm_output(32); -- input 1,2 <= 16 * ref[3]
    input(0)(1)(3) <= mcm_output(39); -- input 1,3 <= -2 * ref[4]

    -- Eq 2 Line 0
    input(0)(2)(0) <= mcm_output(12); -- input 2,0 <= -3 * ref[2]
    input(0)(2)(1) <= mcm_output(28); -- input 2,1 <= 53 * ref[3]
    input(0)(2)(2) <= mcm_output(46); -- input 2,2 <= 16 * ref[4]
    input(0)(2)(3) <= mcm_output(53); -- input 2,3 <= -2 * ref[5]

    -- Eq 3 Line 0
    input(0)(3)(0) <= mcm_output(24); -- input 3,0 <= -3 * ref[3]
    input(0)(3)(1) <= mcm_output(42); -- input 3,1 <= 53 * ref[4]
    input(0)(3)(2) <= mcm_output(60); -- input 3,2 <= 16 * ref[5]
    input(0)(3)(3) <= mcm_output(67); -- input 3,3 <= -2 * ref[6]

    -- Eq 4 Line 0
    input(0)(4)(0) <= mcm_output(38); -- input 4,0 <= -3 * ref[4]
    input(0)(4)(1) <= mcm_output(56); -- input 4,1 <= 53 * ref[5]
    input(0)(4)(2) <= mcm_output(74); -- input 4,2 <= 16 * ref[6]
    input(0)(4)(3) <= mcm_output(81); -- input 4,3 <= -2 * ref[7]

    -- Eq 5 Line 0
    input(0)(5)(0) <= mcm_output(52); -- input 5,0 <= -3 * ref[5]
    input(0)(5)(1) <= mcm_output(70); -- input 5,1 <= 53 * ref[6]
    input(0)(5)(2) <= mcm_output(88); -- input 5,2 <= 16 * ref[7]
    input(0)(5)(3) <= mcm_output(95); -- input 5,3 <= -2 * ref[8]

    -- Eq 6 Line 0
    input(0)(6)(0) <= mcm_output(66); -- input 6,0 <= -3 * ref[6]
    input(0)(6)(1) <= mcm_output(84); -- input 6,1 <= 53 * ref[7]
    input(0)(6)(2) <= mcm_output(102); -- input 6,2 <= 16 * ref[8]
    input(0)(6)(3) <= mcm_output(109); -- input 6,3 <= -2 * ref[9]

    -- Eq 7 Line 0
    input(0)(7)(0) <= mcm_output(80); -- input 7,0 <= -3 * ref[7]
    input(0)(7)(1) <= mcm_output(98); -- input 7,1 <= 53 * ref[8]
    input(0)(7)(2) <= mcm_output(116); -- input 7,2 <= 16 * ref[9]
    input(0)(7)(3) <= mcm_output(123); -- input 7,3 <= -2 * ref[10]

    -- Eq 8 Line 0
    input(0)(8)(0) <= mcm_output(94); -- input 8,0 <= -3 * ref[8]
    input(0)(8)(1) <= mcm_output(112); -- input 8,1 <= 53 * ref[9]
    input(0)(8)(2) <= mcm_output(130); -- input 8,2 <= 16 * ref[10]
    input(0)(8)(3) <= mcm_output(137); -- input 8,3 <= -2 * ref[11]

    -- Eq 9 Line 0
    input(0)(9)(0) <= mcm_output(108); -- input 9,0 <= -3 * ref[9]
    input(0)(9)(1) <= mcm_output(126); -- input 9,1 <= 53 * ref[10]
    input(0)(9)(2) <= mcm_output(144); -- input 9,2 <= 16 * ref[11]
    input(0)(9)(3) <= mcm_output(151); -- input 9,3 <= -2 * ref[12]

    -- Eq 10 Line 0
    input(0)(10)(0) <= mcm_output(122); -- input 10,0 <= -3 * ref[10]
    input(0)(10)(1) <= mcm_output(140); -- input 10,1 <= 53 * ref[11]
    input(0)(10)(2) <= mcm_output(158); -- input 10,2 <= 16 * ref[12]
    input(0)(10)(3) <= mcm_output(165); -- input 10,3 <= -2 * ref[13]

    -- Eq 11 Line 0
    input(0)(11)(0) <= mcm_output(136); -- input 11,0 <= -3 * ref[11]
    input(0)(11)(1) <= mcm_output(154); -- input 11,1 <= 53 * ref[12]
    input(0)(11)(2) <= mcm_output(172); -- input 11,2 <= 16 * ref[13]
    input(0)(11)(3) <= mcm_output(179); -- input 11,3 <= -2 * ref[14]

    -- Eq 12 Line 0
    input(0)(12)(0) <= mcm_output(150); -- input 12,0 <= -3 * ref[12]
    input(0)(12)(1) <= mcm_output(168); -- input 12,1 <= 53 * ref[13]
    input(0)(12)(2) <= mcm_output(186); -- input 12,2 <= 16 * ref[14]
    input(0)(12)(3) <= mcm_output(193); -- input 12,3 <= -2 * ref[15]

    -- Eq 13 Line 0
    input(0)(13)(0) <= mcm_output(164); -- input 13,0 <= -3 * ref[13]
    input(0)(13)(1) <= mcm_output(182); -- input 13,1 <= 53 * ref[14]
    input(0)(13)(2) <= mcm_output(200); -- input 13,2 <= 16 * ref[15]
    input(0)(13)(3) <= mcm_output(214); -- input 13,3 <= -2 * ref[16]

    -- Eq 14 Line 0
    input(0)(14)(0) <= mcm_output(178); -- input 14,0 <= -3 * ref[14]
    input(0)(14)(1) <= mcm_output(196); -- input 14,1 <= 53 * ref[15]
    input(0)(14)(2) <= mcm_output(210); -- input 14,2 <= 16 * ref[16]
    input(0)(14)(3) <= mcm_output(222); -- input 14,3 <= -2 * ref[17]

    -- Eq 15 Line 0
    input(0)(15)(0) <= mcm_output(192); -- input 15,0 <= -3 * ref[15]
    input(0)(15)(1) <= mcm_output(206); -- input 15,1 <= 53 * ref[16]
    input(0)(15)(2) <= mcm_output(218); -- input 15,2 <= 16 * ref[17]
    input(0)(15)(3) <= mcm_output(226); -- input 15,3 <= -2 * ref[18]

    -- Eq 0 Line 1
    input(1)(0)(0) <= mcm_output(1); -- input 0,0 <= -2 * ref[0]
    input(1)(0)(1) <= mcm_output(9); -- input 0,1 <= 18 * ref[1]
    input(1)(0)(2) <= mcm_output(21); -- input 0,2 <= 51 * ref[2]
    input(1)(0)(3) <= mcm_output(24); -- input 0,3 <= -3 * ref[3]

    -- Eq 1 Line 1
    input(1)(1)(0) <= mcm_output(5); -- input 1,0 <= -2 * ref[1]
    input(1)(1)(1) <= mcm_output(17); -- input 1,1 <= 18 * ref[2]
    input(1)(1)(2) <= mcm_output(33); -- input 1,2 <= 51 * ref[3]
    input(1)(1)(3) <= mcm_output(38); -- input 1,3 <= -3 * ref[4]

    -- Eq 2 Line 1
    input(1)(2)(0) <= mcm_output(13); -- input 2,0 <= -2 * ref[2]
    input(1)(2)(1) <= mcm_output(29); -- input 2,1 <= 18 * ref[3]
    input(1)(2)(2) <= mcm_output(47); -- input 2,2 <= 51 * ref[4]
    input(1)(2)(3) <= mcm_output(52); -- input 2,3 <= -3 * ref[5]

    -- Eq 3 Line 1
    input(1)(3)(0) <= mcm_output(25); -- input 3,0 <= -2 * ref[3]
    input(1)(3)(1) <= mcm_output(43); -- input 3,1 <= 18 * ref[4]
    input(1)(3)(2) <= mcm_output(61); -- input 3,2 <= 51 * ref[5]
    input(1)(3)(3) <= mcm_output(66); -- input 3,3 <= -3 * ref[6]

    -- Eq 4 Line 1
    input(1)(4)(0) <= mcm_output(39); -- input 4,0 <= -2 * ref[4]
    input(1)(4)(1) <= mcm_output(57); -- input 4,1 <= 18 * ref[5]
    input(1)(4)(2) <= mcm_output(75); -- input 4,2 <= 51 * ref[6]
    input(1)(4)(3) <= mcm_output(80); -- input 4,3 <= -3 * ref[7]

    -- Eq 5 Line 1
    input(1)(5)(0) <= mcm_output(53); -- input 5,0 <= -2 * ref[5]
    input(1)(5)(1) <= mcm_output(71); -- input 5,1 <= 18 * ref[6]
    input(1)(5)(2) <= mcm_output(89); -- input 5,2 <= 51 * ref[7]
    input(1)(5)(3) <= mcm_output(94); -- input 5,3 <= -3 * ref[8]

    -- Eq 6 Line 1
    input(1)(6)(0) <= mcm_output(67); -- input 6,0 <= -2 * ref[6]
    input(1)(6)(1) <= mcm_output(85); -- input 6,1 <= 18 * ref[7]
    input(1)(6)(2) <= mcm_output(103); -- input 6,2 <= 51 * ref[8]
    input(1)(6)(3) <= mcm_output(108); -- input 6,3 <= -3 * ref[9]

    -- Eq 7 Line 1
    input(1)(7)(0) <= mcm_output(81); -- input 7,0 <= -2 * ref[7]
    input(1)(7)(1) <= mcm_output(99); -- input 7,1 <= 18 * ref[8]
    input(1)(7)(2) <= mcm_output(117); -- input 7,2 <= 51 * ref[9]
    input(1)(7)(3) <= mcm_output(122); -- input 7,3 <= -3 * ref[10]

    -- Eq 8 Line 1
    input(1)(8)(0) <= mcm_output(95); -- input 8,0 <= -2 * ref[8]
    input(1)(8)(1) <= mcm_output(113); -- input 8,1 <= 18 * ref[9]
    input(1)(8)(2) <= mcm_output(131); -- input 8,2 <= 51 * ref[10]
    input(1)(8)(3) <= mcm_output(136); -- input 8,3 <= -3 * ref[11]

    -- Eq 9 Line 1
    input(1)(9)(0) <= mcm_output(109); -- input 9,0 <= -2 * ref[9]
    input(1)(9)(1) <= mcm_output(127); -- input 9,1 <= 18 * ref[10]
    input(1)(9)(2) <= mcm_output(145); -- input 9,2 <= 51 * ref[11]
    input(1)(9)(3) <= mcm_output(150); -- input 9,3 <= -3 * ref[12]

    -- Eq 10 Line 1
    input(1)(10)(0) <= mcm_output(123); -- input 10,0 <= -2 * ref[10]
    input(1)(10)(1) <= mcm_output(141); -- input 10,1 <= 18 * ref[11]
    input(1)(10)(2) <= mcm_output(159); -- input 10,2 <= 51 * ref[12]
    input(1)(10)(3) <= mcm_output(164); -- input 10,3 <= -3 * ref[13]

    -- Eq 11 Line 1
    input(1)(11)(0) <= mcm_output(137); -- input 11,0 <= -2 * ref[11]
    input(1)(11)(1) <= mcm_output(155); -- input 11,1 <= 18 * ref[12]
    input(1)(11)(2) <= mcm_output(173); -- input 11,2 <= 51 * ref[13]
    input(1)(11)(3) <= mcm_output(178); -- input 11,3 <= -3 * ref[14]

    -- Eq 12 Line 1
    input(1)(12)(0) <= mcm_output(151); -- input 12,0 <= -2 * ref[12]
    input(1)(12)(1) <= mcm_output(169); -- input 12,1 <= 18 * ref[13]
    input(1)(12)(2) <= mcm_output(187); -- input 12,2 <= 51 * ref[14]
    input(1)(12)(3) <= mcm_output(192); -- input 12,3 <= -3 * ref[15]

    -- Eq 13 Line 1
    input(1)(13)(0) <= mcm_output(165); -- input 13,0 <= -2 * ref[13]
    input(1)(13)(1) <= mcm_output(183); -- input 13,1 <= 18 * ref[14]
    input(1)(13)(2) <= mcm_output(201); -- input 13,2 <= 51 * ref[15]
    input(1)(13)(3) <= mcm_output(215); -- input 13,3 <= -3 * ref[16]

    -- Eq 14 Line 1
    input(1)(14)(0) <= mcm_output(179); -- input 14,0 <= -2 * ref[14]
    input(1)(14)(1) <= mcm_output(197); -- input 14,1 <= 18 * ref[15]
    input(1)(14)(2) <= mcm_output(211); -- input 14,2 <= 51 * ref[16]
    input(1)(14)(3) <= mcm_output(223); -- input 14,3 <= -3 * ref[17]

    -- Eq 15 Line 1
    input(1)(15)(0) <= mcm_output(193); -- input 15,0 <= -2 * ref[15]
    input(1)(15)(1) <= mcm_output(207); -- input 15,1 <= 18 * ref[16]
    input(1)(15)(2) <= mcm_output(219); -- input 15,2 <= 51 * ref[17]
    input(1)(15)(3) <= mcm_output(227); -- input 15,3 <= -3 * ref[18]

    -- Eq 0 Line 2
    input(2)(0)(0) <= mcm_output(2); -- input 0,0 <= 12 * ref[0]
    input(2)(0)(1) <= mcm_output(10); -- input 0,1 <= 28 * ref[1]
    input(2)(0)(2) <= mcm_output(22); -- input 0,2 <= 19 * ref[2]
    input(2)(0)(3) <= mcm_output(36); -- input 0,3 <= 3 * ref[3]

    -- Eq 1 Line 2
    input(2)(1)(0) <= mcm_output(6); -- input 1,0 <= 12 * ref[1]
    input(2)(1)(1) <= mcm_output(18); -- input 1,1 <= 28 * ref[2]
    input(2)(1)(2) <= mcm_output(34); -- input 1,2 <= 19 * ref[3]
    input(2)(1)(3) <= mcm_output(50); -- input 1,3 <= 3 * ref[4]

    -- Eq 2 Line 2
    input(2)(2)(0) <= mcm_output(14); -- input 2,0 <= 12 * ref[2]
    input(2)(2)(1) <= mcm_output(30); -- input 2,1 <= 28 * ref[3]
    input(2)(2)(2) <= mcm_output(48); -- input 2,2 <= 19 * ref[4]
    input(2)(2)(3) <= mcm_output(64); -- input 2,3 <= 3 * ref[5]

    -- Eq 3 Line 2
    input(2)(3)(0) <= mcm_output(26); -- input 3,0 <= 12 * ref[3]
    input(2)(3)(1) <= mcm_output(44); -- input 3,1 <= 28 * ref[4]
    input(2)(3)(2) <= mcm_output(62); -- input 3,2 <= 19 * ref[5]
    input(2)(3)(3) <= mcm_output(78); -- input 3,3 <= 3 * ref[6]

    -- Eq 4 Line 2
    input(2)(4)(0) <= mcm_output(40); -- input 4,0 <= 12 * ref[4]
    input(2)(4)(1) <= mcm_output(58); -- input 4,1 <= 28 * ref[5]
    input(2)(4)(2) <= mcm_output(76); -- input 4,2 <= 19 * ref[6]
    input(2)(4)(3) <= mcm_output(92); -- input 4,3 <= 3 * ref[7]

    -- Eq 5 Line 2
    input(2)(5)(0) <= mcm_output(54); -- input 5,0 <= 12 * ref[5]
    input(2)(5)(1) <= mcm_output(72); -- input 5,1 <= 28 * ref[6]
    input(2)(5)(2) <= mcm_output(90); -- input 5,2 <= 19 * ref[7]
    input(2)(5)(3) <= mcm_output(106); -- input 5,3 <= 3 * ref[8]

    -- Eq 6 Line 2
    input(2)(6)(0) <= mcm_output(68); -- input 6,0 <= 12 * ref[6]
    input(2)(6)(1) <= mcm_output(86); -- input 6,1 <= 28 * ref[7]
    input(2)(6)(2) <= mcm_output(104); -- input 6,2 <= 19 * ref[8]
    input(2)(6)(3) <= mcm_output(120); -- input 6,3 <= 3 * ref[9]

    -- Eq 7 Line 2
    input(2)(7)(0) <= mcm_output(82); -- input 7,0 <= 12 * ref[7]
    input(2)(7)(1) <= mcm_output(100); -- input 7,1 <= 28 * ref[8]
    input(2)(7)(2) <= mcm_output(118); -- input 7,2 <= 19 * ref[9]
    input(2)(7)(3) <= mcm_output(134); -- input 7,3 <= 3 * ref[10]

    -- Eq 8 Line 2
    input(2)(8)(0) <= mcm_output(96); -- input 8,0 <= 12 * ref[8]
    input(2)(8)(1) <= mcm_output(114); -- input 8,1 <= 28 * ref[9]
    input(2)(8)(2) <= mcm_output(132); -- input 8,2 <= 19 * ref[10]
    input(2)(8)(3) <= mcm_output(148); -- input 8,3 <= 3 * ref[11]

    -- Eq 9 Line 2
    input(2)(9)(0) <= mcm_output(110); -- input 9,0 <= 12 * ref[9]
    input(2)(9)(1) <= mcm_output(128); -- input 9,1 <= 28 * ref[10]
    input(2)(9)(2) <= mcm_output(146); -- input 9,2 <= 19 * ref[11]
    input(2)(9)(3) <= mcm_output(162); -- input 9,3 <= 3 * ref[12]

    -- Eq 10 Line 2
    input(2)(10)(0) <= mcm_output(124); -- input 10,0 <= 12 * ref[10]
    input(2)(10)(1) <= mcm_output(142); -- input 10,1 <= 28 * ref[11]
    input(2)(10)(2) <= mcm_output(160); -- input 10,2 <= 19 * ref[12]
    input(2)(10)(3) <= mcm_output(176); -- input 10,3 <= 3 * ref[13]

    -- Eq 11 Line 2
    input(2)(11)(0) <= mcm_output(138); -- input 11,0 <= 12 * ref[11]
    input(2)(11)(1) <= mcm_output(156); -- input 11,1 <= 28 * ref[12]
    input(2)(11)(2) <= mcm_output(174); -- input 11,2 <= 19 * ref[13]
    input(2)(11)(3) <= mcm_output(190); -- input 11,3 <= 3 * ref[14]

    -- Eq 12 Line 2
    input(2)(12)(0) <= mcm_output(152); -- input 12,0 <= 12 * ref[12]
    input(2)(12)(1) <= mcm_output(170); -- input 12,1 <= 28 * ref[13]
    input(2)(12)(2) <= mcm_output(188); -- input 12,2 <= 19 * ref[14]
    input(2)(12)(3) <= mcm_output(204); -- input 12,3 <= 3 * ref[15]

    -- Eq 13 Line 2
    input(2)(13)(0) <= mcm_output(166); -- input 13,0 <= 12 * ref[13]
    input(2)(13)(1) <= mcm_output(184); -- input 13,1 <= 28 * ref[14]
    input(2)(13)(2) <= mcm_output(202); -- input 13,2 <= 19 * ref[15]
    input(2)(13)(3) <= mcm_output(216); -- input 13,3 <= 3 * ref[16]

    -- Eq 14 Line 2
    input(2)(14)(0) <= mcm_output(180); -- input 14,0 <= 12 * ref[14]
    input(2)(14)(1) <= mcm_output(198); -- input 14,1 <= 28 * ref[15]
    input(2)(14)(2) <= mcm_output(212); -- input 14,2 <= 19 * ref[16]
    input(2)(14)(3) <= mcm_output(224); -- input 14,3 <= 3 * ref[17]

    -- Eq 15 Line 2
    input(2)(15)(0) <= mcm_output(194); -- input 15,0 <= 12 * ref[15]
    input(2)(15)(1) <= mcm_output(208); -- input 15,1 <= 28 * ref[16]
    input(2)(15)(2) <= mcm_output(220); -- input 15,2 <= 19 * ref[17]
    input(2)(15)(3) <= mcm_output(228); -- input 15,3 <= 3 * ref[18]

    -- Eq 0 Line 3
    input(3)(0)(0) <= mcm_output(3); -- input 0,0 <= 4 * ref[0]
    input(3)(0)(1) <= mcm_output(11); -- input 0,1 <= 20 * ref[1]
    input(3)(0)(2) <= mcm_output(23); -- input 0,2 <= 27 * ref[2]
    input(3)(0)(3) <= mcm_output(37); -- input 0,3 <= 11 * ref[3]

    -- Eq 1 Line 3
    input(3)(1)(0) <= mcm_output(7); -- input 1,0 <= 4 * ref[1]
    input(3)(1)(1) <= mcm_output(19); -- input 1,1 <= 20 * ref[2]
    input(3)(1)(2) <= mcm_output(35); -- input 1,2 <= 27 * ref[3]
    input(3)(1)(3) <= mcm_output(51); -- input 1,3 <= 11 * ref[4]

    -- Eq 2 Line 3
    input(3)(2)(0) <= mcm_output(15); -- input 2,0 <= 4 * ref[2]
    input(3)(2)(1) <= mcm_output(31); -- input 2,1 <= 20 * ref[3]
    input(3)(2)(2) <= mcm_output(49); -- input 2,2 <= 27 * ref[4]
    input(3)(2)(3) <= mcm_output(65); -- input 2,3 <= 11 * ref[5]

    -- Eq 3 Line 3
    input(3)(3)(0) <= mcm_output(27); -- input 3,0 <= 4 * ref[3]
    input(3)(3)(1) <= mcm_output(45); -- input 3,1 <= 20 * ref[4]
    input(3)(3)(2) <= mcm_output(63); -- input 3,2 <= 27 * ref[5]
    input(3)(3)(3) <= mcm_output(79); -- input 3,3 <= 11 * ref[6]

    -- Eq 4 Line 3
    input(3)(4)(0) <= mcm_output(41); -- input 4,0 <= 4 * ref[4]
    input(3)(4)(1) <= mcm_output(59); -- input 4,1 <= 20 * ref[5]
    input(3)(4)(2) <= mcm_output(77); -- input 4,2 <= 27 * ref[6]
    input(3)(4)(3) <= mcm_output(93); -- input 4,3 <= 11 * ref[7]

    -- Eq 5 Line 3
    input(3)(5)(0) <= mcm_output(55); -- input 5,0 <= 4 * ref[5]
    input(3)(5)(1) <= mcm_output(73); -- input 5,1 <= 20 * ref[6]
    input(3)(5)(2) <= mcm_output(91); -- input 5,2 <= 27 * ref[7]
    input(3)(5)(3) <= mcm_output(107); -- input 5,3 <= 11 * ref[8]

    -- Eq 6 Line 3
    input(3)(6)(0) <= mcm_output(69); -- input 6,0 <= 4 * ref[6]
    input(3)(6)(1) <= mcm_output(87); -- input 6,1 <= 20 * ref[7]
    input(3)(6)(2) <= mcm_output(105); -- input 6,2 <= 27 * ref[8]
    input(3)(6)(3) <= mcm_output(121); -- input 6,3 <= 11 * ref[9]

    -- Eq 7 Line 3
    input(3)(7)(0) <= mcm_output(83); -- input 7,0 <= 4 * ref[7]
    input(3)(7)(1) <= mcm_output(101); -- input 7,1 <= 20 * ref[8]
    input(3)(7)(2) <= mcm_output(119); -- input 7,2 <= 27 * ref[9]
    input(3)(7)(3) <= mcm_output(135); -- input 7,3 <= 11 * ref[10]

    -- Eq 8 Line 3
    input(3)(8)(0) <= mcm_output(97); -- input 8,0 <= 4 * ref[8]
    input(3)(8)(1) <= mcm_output(115); -- input 8,1 <= 20 * ref[9]
    input(3)(8)(2) <= mcm_output(133); -- input 8,2 <= 27 * ref[10]
    input(3)(8)(3) <= mcm_output(149); -- input 8,3 <= 11 * ref[11]

    -- Eq 9 Line 3
    input(3)(9)(0) <= mcm_output(111); -- input 9,0 <= 4 * ref[9]
    input(3)(9)(1) <= mcm_output(129); -- input 9,1 <= 20 * ref[10]
    input(3)(9)(2) <= mcm_output(147); -- input 9,2 <= 27 * ref[11]
    input(3)(9)(3) <= mcm_output(163); -- input 9,3 <= 11 * ref[12]

    -- Eq 10 Line 3
    input(3)(10)(0) <= mcm_output(125); -- input 10,0 <= 4 * ref[10]
    input(3)(10)(1) <= mcm_output(143); -- input 10,1 <= 20 * ref[11]
    input(3)(10)(2) <= mcm_output(161); -- input 10,2 <= 27 * ref[12]
    input(3)(10)(3) <= mcm_output(177); -- input 10,3 <= 11 * ref[13]

    -- Eq 11 Line 3
    input(3)(11)(0) <= mcm_output(139); -- input 11,0 <= 4 * ref[11]
    input(3)(11)(1) <= mcm_output(157); -- input 11,1 <= 20 * ref[12]
    input(3)(11)(2) <= mcm_output(175); -- input 11,2 <= 27 * ref[13]
    input(3)(11)(3) <= mcm_output(191); -- input 11,3 <= 11 * ref[14]

    -- Eq 12 Line 3
    input(3)(12)(0) <= mcm_output(153); -- input 12,0 <= 4 * ref[12]
    input(3)(12)(1) <= mcm_output(171); -- input 12,1 <= 20 * ref[13]
    input(3)(12)(2) <= mcm_output(189); -- input 12,2 <= 27 * ref[14]
    input(3)(12)(3) <= mcm_output(205); -- input 12,3 <= 11 * ref[15]

    -- Eq 13 Line 3
    input(3)(13)(0) <= mcm_output(167); -- input 13,0 <= 4 * ref[13]
    input(3)(13)(1) <= mcm_output(185); -- input 13,1 <= 20 * ref[14]
    input(3)(13)(2) <= mcm_output(203); -- input 13,2 <= 27 * ref[15]
    input(3)(13)(3) <= mcm_output(217); -- input 13,3 <= 11 * ref[16]

    -- Eq 14 Line 3
    input(3)(14)(0) <= mcm_output(181); -- input 14,0 <= 4 * ref[14]
    input(3)(14)(1) <= mcm_output(199); -- input 14,1 <= 20 * ref[15]
    input(3)(14)(2) <= mcm_output(213); -- input 14,2 <= 27 * ref[16]
    input(3)(14)(3) <= mcm_output(225); -- input 14,3 <= 11 * ref[17]

    -- Eq 15 Line 3
    input(3)(15)(0) <= mcm_output(195); -- input 15,0 <= 4 * ref[15]
    input(3)(15)(1) <= mcm_output(209); -- input 15,1 <= 20 * ref[16]
    input(3)(15)(2) <= mcm_output(221); -- input 15,2 <= 27 * ref[17]
    input(3)(15)(3) <= mcm_output(229); -- input 15,3 <= 11 * ref[18]

	
	process (clk, rst)
	  begin
		if rst = '1' then
			for i in 0 to 15 loop 
				for j in 0 to 3 loop
					eq_input(i)(j) <= "0000000000000000";
				end loop;
			end loop;
		elsif clk'event and clk = '1' then
			
			for i in 0 to 15 loop 
				for j in 0 to 3 loop
		            eq_input(i)(j) <= input(to_integer(unsigned(control)))(i)(j);
				end loop;
			end loop;
		end if;
	end process;
END comportamental;