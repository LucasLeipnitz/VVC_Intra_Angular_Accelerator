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
		ref : IN sample_bus (0 to 34 );
		pred: OUT sample_bus (0 to 31 )
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


type t_mcm_output is array (0 to 876) of std_logic_vector( 15 downto 0);
type t_row is array (0 to 3) of std_logic_vector( 15 downto 0);
type t_eq_input is array (0 to 31) of t_row;
type t_input is array (0 to 7) of t_eq_input;
signal 	mcm_output : t_mcm_output;
signal 	eq_input : t_eq_input;
signal 	input : t_input;


BEGIN
	
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
    m8 : MCM_3
    PORT MAP ( X => ref(8), Y1 => mcm_output(181), Y2 => mcm_output(182), Y3 => mcm_output(183), Y4 => mcm_output(184), Y5 => mcm_output(185), Y6 => mcm_output(186), Y7 => mcm_output(187), Y8 => mcm_output(188), Y9 => mcm_output(189), Y10 => mcm_output(190), Y11 => mcm_output(191), Y12 => mcm_output(
192), Y13 => mcm_output(193), Y14 => mcm_output(194), Y15 => mcm_output(195), Y16 => mcm_output(196), Y17 => mcm_output(197), Y18 => mcm_output(198), Y19 => mcm_output(199), Y20 => mcm_output(200), Y21 => mcm_output(201), Y22 => mcm_output(202), Y23 => mcm_output(203), Y24 => mcm_output(204), Y25 => mcm_output(205), Y26 => mcm_output(206), Y27 => mcm_output(207) );
    m9 : MCM_3
    PORT MAP ( X => ref(9), Y1 => mcm_output(208), Y2 => mcm_output(209), Y3 => mcm_output(210), Y4 => mcm_output(211), Y5 => mcm_output(212), Y6 => mcm_output(213), Y7 => mcm_output(214), Y8 => mcm_output(215), Y9 => mcm_output(216), Y10 => mcm_output(217), Y11 => mcm_output(218), Y12 => mcm_output(
219), Y13 => mcm_output(220), Y14 => mcm_output(221), Y15 => mcm_output(222), Y16 => mcm_output(223), Y17 => mcm_output(224), Y18 => mcm_output(225), Y19 => mcm_output(226), Y20 => mcm_output(227), Y21 => mcm_output(228), Y22 => mcm_output(229), Y23 => mcm_output(230), Y24 => mcm_output(231), Y25 => mcm_output(232), Y26 => mcm_output(233), Y27 => mcm_output(234) );
    m10 : MCM_3
    PORT MAP ( X => ref(10), Y1 => mcm_output(235), Y2 => mcm_output(236), Y3 => mcm_output(237), Y4 => mcm_output(238), Y5 => mcm_output(239), Y6 => mcm_output(240), Y7 => mcm_output(241), Y8 => mcm_output(242), Y9 => mcm_output(243), Y10 => mcm_output(244), Y11 => mcm_output(245), Y12 => mcm_output
(246), Y13 => mcm_output(247), Y14 => mcm_output(248), Y15 => mcm_output(249), Y16 => mcm_output(250), Y17 => mcm_output(251), Y18 => mcm_output(252), Y19 => mcm_output(253), Y20 => mcm_output(254), Y21 => mcm_output(255), Y22 => mcm_output(256), Y23 => mcm_output(257), Y24 => mcm_output(258), Y25 => mcm_output(259), Y26 => mcm_output(260), Y27 => mcm_output(261) );
    m11 : MCM_3
    PORT MAP ( X => ref(11), Y1 => mcm_output(262), Y2 => mcm_output(263), Y3 => mcm_output(264), Y4 => mcm_output(265), Y5 => mcm_output(266), Y6 => mcm_output(267), Y7 => mcm_output(268), Y8 => mcm_output(269), Y9 => mcm_output(270), Y10 => mcm_output(271), Y11 => mcm_output(272), Y12 => mcm_output
(273), Y13 => mcm_output(274), Y14 => mcm_output(275), Y15 => mcm_output(276), Y16 => mcm_output(277), Y17 => mcm_output(278), Y18 => mcm_output(279), Y19 => mcm_output(280), Y20 => mcm_output(281), Y21 => mcm_output(282), Y22 => mcm_output(283), Y23 => mcm_output(284), Y24 => mcm_output(285), Y25 => mcm_output(286), Y26 => mcm_output(287), Y27 => mcm_output(288) );
    m12 : MCM_3
    PORT MAP ( X => ref(12), Y1 => mcm_output(289), Y2 => mcm_output(290), Y3 => mcm_output(291), Y4 => mcm_output(292), Y5 => mcm_output(293), Y6 => mcm_output(294), Y7 => mcm_output(295), Y8 => mcm_output(296), Y9 => mcm_output(297), Y10 => mcm_output(298), Y11 => mcm_output(299), Y12 => mcm_output
(300), Y13 => mcm_output(301), Y14 => mcm_output(302), Y15 => mcm_output(303), Y16 => mcm_output(304), Y17 => mcm_output(305), Y18 => mcm_output(306), Y19 => mcm_output(307), Y20 => mcm_output(308), Y21 => mcm_output(309), Y22 => mcm_output(310), Y23 => mcm_output(311), Y24 => mcm_output(312), Y25 => mcm_output(313), Y26 => mcm_output(314), Y27 => mcm_output(315) );
    m13 : MCM_3
    PORT MAP ( X => ref(13), Y1 => mcm_output(316), Y2 => mcm_output(317), Y3 => mcm_output(318), Y4 => mcm_output(319), Y5 => mcm_output(320), Y6 => mcm_output(321), Y7 => mcm_output(322), Y8 => mcm_output(323), Y9 => mcm_output(324), Y10 => mcm_output(325), Y11 => mcm_output(326), Y12 => mcm_output
(327), Y13 => mcm_output(328), Y14 => mcm_output(329), Y15 => mcm_output(330), Y16 => mcm_output(331), Y17 => mcm_output(332), Y18 => mcm_output(333), Y19 => mcm_output(334), Y20 => mcm_output(335), Y21 => mcm_output(336), Y22 => mcm_output(337), Y23 => mcm_output(338), Y24 => mcm_output(339), Y25 => mcm_output(340), Y26 => mcm_output(341), Y27 => mcm_output(342) );
    m14 : MCM_3
    PORT MAP ( X => ref(14), Y1 => mcm_output(343), Y2 => mcm_output(344), Y3 => mcm_output(345), Y4 => mcm_output(346), Y5 => mcm_output(347), Y6 => mcm_output(348), Y7 => mcm_output(349), Y8 => mcm_output(350), Y9 => mcm_output(351), Y10 => mcm_output(352), Y11 => mcm_output(353), Y12 => mcm_output
(354), Y13 => mcm_output(355), Y14 => mcm_output(356), Y15 => mcm_output(357), Y16 => mcm_output(358), Y17 => mcm_output(359), Y18 => mcm_output(360), Y19 => mcm_output(361), Y20 => mcm_output(362), Y21 => mcm_output(363), Y22 => mcm_output(364), Y23 => mcm_output(365), Y24 => mcm_output(366), Y25 => mcm_output(367), Y26 => mcm_output(368), Y27 => mcm_output(369) );
    m15 : MCM_3
    PORT MAP ( X => ref(15), Y1 => mcm_output(370), Y2 => mcm_output(371), Y3 => mcm_output(372), Y4 => mcm_output(373), Y5 => mcm_output(374), Y6 => mcm_output(375), Y7 => mcm_output(376), Y8 => mcm_output(377), Y9 => mcm_output(378), Y10 => mcm_output(379), Y11 => mcm_output(380), Y12 => mcm_output
(381), Y13 => mcm_output(382), Y14 => mcm_output(383), Y15 => mcm_output(384), Y16 => mcm_output(385), Y17 => mcm_output(386), Y18 => mcm_output(387), Y19 => mcm_output(388), Y20 => mcm_output(389), Y21 => mcm_output(390), Y22 => mcm_output(391), Y23 => mcm_output(392), Y24 => mcm_output(393), Y25 => mcm_output(394), Y26 => mcm_output(395), Y27 => mcm_output(396) );
    m16 : MCM_3
    PORT MAP ( X => ref(16), Y1 => mcm_output(397), Y2 => mcm_output(398), Y3 => mcm_output(399), Y4 => mcm_output(400), Y5 => mcm_output(401), Y6 => mcm_output(402), Y7 => mcm_output(403), Y8 => mcm_output(404), Y9 => mcm_output(405), Y10 => mcm_output(406), Y11 => mcm_output(407), Y12 => mcm_output
(408), Y13 => mcm_output(409), Y14 => mcm_output(410), Y15 => mcm_output(411), Y16 => mcm_output(412), Y17 => mcm_output(413), Y18 => mcm_output(414), Y19 => mcm_output(415), Y20 => mcm_output(416), Y21 => mcm_output(417), Y22 => mcm_output(418), Y23 => mcm_output(419), Y24 => mcm_output(420), Y25 => mcm_output(421), Y26 => mcm_output(422), Y27 => mcm_output(423) );
    m17 : MCM_3
    PORT MAP ( X => ref(17), Y1 => mcm_output(424), Y2 => mcm_output(425), Y3 => mcm_output(426), Y4 => mcm_output(427), Y5 => mcm_output(428), Y6 => mcm_output(429), Y7 => mcm_output(430), Y8 => mcm_output(431), Y9 => mcm_output(432), Y10 => mcm_output(433), Y11 => mcm_output(434), Y12 => mcm_output
(435), Y13 => mcm_output(436), Y14 => mcm_output(437), Y15 => mcm_output(438), Y16 => mcm_output(439), Y17 => mcm_output(440), Y18 => mcm_output(441), Y19 => mcm_output(442), Y20 => mcm_output(443), Y21 => mcm_output(444), Y22 => mcm_output(445), Y23 => mcm_output(446), Y24 => mcm_output(447), Y25 => mcm_output(448), Y26 => mcm_output(449), Y27 => mcm_output(450) );
    m18 : MCM_3
    PORT MAP ( X => ref(18), Y1 => mcm_output(451), Y2 => mcm_output(452), Y3 => mcm_output(453), Y4 => mcm_output(454), Y5 => mcm_output(455), Y6 => mcm_output(456), Y7 => mcm_output(457), Y8 => mcm_output(458), Y9 => mcm_output(459), Y10 => mcm_output(460), Y11 => mcm_output(461), Y12 => mcm_output
(462), Y13 => mcm_output(463), Y14 => mcm_output(464), Y15 => mcm_output(465), Y16 => mcm_output(466), Y17 => mcm_output(467), Y18 => mcm_output(468), Y19 => mcm_output(469), Y20 => mcm_output(470), Y21 => mcm_output(471), Y22 => mcm_output(472), Y23 => mcm_output(473), Y24 => mcm_output(474), Y25 => mcm_output(475), Y26 => mcm_output(476), Y27 => mcm_output(477) );
    m19 : MCM_3
    PORT MAP ( X => ref(19), Y1 => mcm_output(478), Y2 => mcm_output(479), Y3 => mcm_output(480), Y4 => mcm_output(481), Y5 => mcm_output(482), Y6 => mcm_output(483), Y7 => mcm_output(484), Y8 => mcm_output(485), Y9 => mcm_output(486), Y10 => mcm_output(487), Y11 => mcm_output(488), Y12 => mcm_output
(489), Y13 => mcm_output(490), Y14 => mcm_output(491), Y15 => mcm_output(492), Y16 => mcm_output(493), Y17 => mcm_output(494), Y18 => mcm_output(495), Y19 => mcm_output(496), Y20 => mcm_output(497), Y21 => mcm_output(498), Y22 => mcm_output(499), Y23 => mcm_output(500), Y24 => mcm_output(501), Y25 => mcm_output(502), Y26 => mcm_output(503), Y27 => mcm_output(504) );
    m20 : MCM_3
    PORT MAP ( X => ref(20), Y1 => mcm_output(505), Y2 => mcm_output(506), Y3 => mcm_output(507), Y4 => mcm_output(508), Y5 => mcm_output(509), Y6 => mcm_output(510), Y7 => mcm_output(511), Y8 => mcm_output(512), Y9 => mcm_output(513), Y10 => mcm_output(514), Y11 => mcm_output(515), Y12 => mcm_output
(516), Y13 => mcm_output(517), Y14 => mcm_output(518), Y15 => mcm_output(519), Y16 => mcm_output(520), Y17 => mcm_output(521), Y18 => mcm_output(522), Y19 => mcm_output(523), Y20 => mcm_output(524), Y21 => mcm_output(525), Y22 => mcm_output(526), Y23 => mcm_output(527), Y24 => mcm_output(528), Y25 => mcm_output(529), Y26 => mcm_output(530), Y27 => mcm_output(531) );
    m21 : MCM_3
    PORT MAP ( X => ref(21), Y1 => mcm_output(532), Y2 => mcm_output(533), Y3 => mcm_output(534), Y4 => mcm_output(535), Y5 => mcm_output(536), Y6 => mcm_output(537), Y7 => mcm_output(538), Y8 => mcm_output(539), Y9 => mcm_output(540), Y10 => mcm_output(541), Y11 => mcm_output(542), Y12 => mcm_output
(543), Y13 => mcm_output(544), Y14 => mcm_output(545), Y15 => mcm_output(546), Y16 => mcm_output(547), Y17 => mcm_output(548), Y18 => mcm_output(549), Y19 => mcm_output(550), Y20 => mcm_output(551), Y21 => mcm_output(552), Y22 => mcm_output(553), Y23 => mcm_output(554), Y24 => mcm_output(555), Y25 => mcm_output(556), Y26 => mcm_output(557), Y27 => mcm_output(558) );
    m22 : MCM_3
    PORT MAP ( X => ref(22), Y1 => mcm_output(559), Y2 => mcm_output(560), Y3 => mcm_output(561), Y4 => mcm_output(562), Y5 => mcm_output(563), Y6 => mcm_output(564), Y7 => mcm_output(565), Y8 => mcm_output(566), Y9 => mcm_output(567), Y10 => mcm_output(568), Y11 => mcm_output(569), Y12 => mcm_output
(570), Y13 => mcm_output(571), Y14 => mcm_output(572), Y15 => mcm_output(573), Y16 => mcm_output(574), Y17 => mcm_output(575), Y18 => mcm_output(576), Y19 => mcm_output(577), Y20 => mcm_output(578), Y21 => mcm_output(579), Y22 => mcm_output(580), Y23 => mcm_output(581), Y24 => mcm_output(582), Y25 => mcm_output(583), Y26 => mcm_output(584), Y27 => mcm_output(585) );
    m23 : MCM_3
    PORT MAP ( X => ref(23), Y1 => mcm_output(586), Y2 => mcm_output(587), Y3 => mcm_output(588), Y4 => mcm_output(589), Y5 => mcm_output(590), Y6 => mcm_output(591), Y7 => mcm_output(592), Y8 => mcm_output(593), Y9 => mcm_output(594), Y10 => mcm_output(595), Y11 => mcm_output(596), Y12 => mcm_output
(597), Y13 => mcm_output(598), Y14 => mcm_output(599), Y15 => mcm_output(600), Y16 => mcm_output(601), Y17 => mcm_output(602), Y18 => mcm_output(603), Y19 => mcm_output(604), Y20 => mcm_output(605), Y21 => mcm_output(606), Y22 => mcm_output(607), Y23 => mcm_output(608), Y24 => mcm_output(609), Y25 => mcm_output(610), Y26 => mcm_output(611), Y27 => mcm_output(612) );
    m24 : MCM_3
    PORT MAP ( X => ref(24), Y1 => mcm_output(613), Y2 => mcm_output(614), Y3 => mcm_output(615), Y4 => mcm_output(616), Y5 => mcm_output(617), Y6 => mcm_output(618), Y7 => mcm_output(619), Y8 => mcm_output(620), Y9 => mcm_output(621), Y10 => mcm_output(622), Y11 => mcm_output(623), Y12 => mcm_output
(624), Y13 => mcm_output(625), Y14 => mcm_output(626), Y15 => mcm_output(627), Y16 => mcm_output(628), Y17 => mcm_output(629), Y18 => mcm_output(630), Y19 => mcm_output(631), Y20 => mcm_output(632), Y21 => mcm_output(633), Y22 => mcm_output(634), Y23 => mcm_output(635), Y24 => mcm_output(636), Y25 => mcm_output(637), Y26 => mcm_output(638), Y27 => mcm_output(639) );
    m25 : MCM_3
    PORT MAP ( X => ref(25), Y1 => mcm_output(640), Y2 => mcm_output(641), Y3 => mcm_output(642), Y4 => mcm_output(643), Y5 => mcm_output(644), Y6 => mcm_output(645), Y7 => mcm_output(646), Y8 => mcm_output(647), Y9 => mcm_output(648), Y10 => mcm_output(649), Y11 => mcm_output(650), Y12 => mcm_output
(651), Y13 => mcm_output(652), Y14 => mcm_output(653), Y15 => mcm_output(654), Y16 => mcm_output(655), Y17 => mcm_output(656), Y18 => mcm_output(657), Y19 => mcm_output(658), Y20 => mcm_output(659), Y21 => mcm_output(660), Y22 => mcm_output(661), Y23 => mcm_output(662), Y24 => mcm_output(663), Y25 => mcm_output(664), Y26 => mcm_output(665), Y27 => mcm_output(666) );
    m26 : MCM_3
    PORT MAP ( X => ref(26), Y1 => mcm_output(667), Y2 => mcm_output(668), Y3 => mcm_output(669), Y4 => mcm_output(670), Y5 => mcm_output(671), Y6 => mcm_output(672), Y7 => mcm_output(673), Y8 => mcm_output(674), Y9 => mcm_output(675), Y10 => mcm_output(676), Y11 => mcm_output(677), Y12 => mcm_output
(678), Y13 => mcm_output(679), Y14 => mcm_output(680), Y15 => mcm_output(681), Y16 => mcm_output(682), Y17 => mcm_output(683), Y18 => mcm_output(684), Y19 => mcm_output(685), Y20 => mcm_output(686), Y21 => mcm_output(687), Y22 => mcm_output(688), Y23 => mcm_output(689), Y24 => mcm_output(690), Y25 => mcm_output(691), Y26 => mcm_output(692), Y27 => mcm_output(693) );
    m27 : MCM_3
    PORT MAP ( X => ref(27), Y1 => mcm_output(694), Y2 => mcm_output(695), Y3 => mcm_output(696), Y4 => mcm_output(697), Y5 => mcm_output(698), Y6 => mcm_output(699), Y7 => mcm_output(700), Y8 => mcm_output(701), Y9 => mcm_output(702), Y10 => mcm_output(703), Y11 => mcm_output(704), Y12 => mcm_output
(705), Y13 => mcm_output(706), Y14 => mcm_output(707), Y15 => mcm_output(708), Y16 => mcm_output(709), Y17 => mcm_output(710), Y18 => mcm_output(711), Y19 => mcm_output(712), Y20 => mcm_output(713), Y21 => mcm_output(714), Y22 => mcm_output(715), Y23 => mcm_output(716), Y24 => mcm_output(717), Y25 => mcm_output(718), Y26 => mcm_output(719), Y27 => mcm_output(720) );
    m28 : MCM_3
    PORT MAP ( X => ref(28), Y1 => mcm_output(721), Y2 => mcm_output(722), Y3 => mcm_output(723), Y4 => mcm_output(724), Y5 => mcm_output(725), Y6 => mcm_output(726), Y7 => mcm_output(727), Y8 => mcm_output(728), Y9 => mcm_output(729), Y10 => mcm_output(730), Y11 => mcm_output(731), Y12 => mcm_output
(732), Y13 => mcm_output(733), Y14 => mcm_output(734), Y15 => mcm_output(735), Y16 => mcm_output(736), Y17 => mcm_output(737), Y18 => mcm_output(738), Y19 => mcm_output(739), Y20 => mcm_output(740), Y21 => mcm_output(741), Y22 => mcm_output(742), Y23 => mcm_output(743), Y24 => mcm_output(744), Y25 => mcm_output(745), Y26 => mcm_output(746), Y27 => mcm_output(747) );
    m29 : MCM_3
    PORT MAP ( X => ref(29), Y1 => mcm_output(748), Y2 => mcm_output(749), Y3 => mcm_output(750), Y4 => mcm_output(751), Y5 => mcm_output(752), Y6 => mcm_output(753), Y7 => mcm_output(754), Y8 => mcm_output(755), Y9 => mcm_output(756), Y10 => mcm_output(757), Y11 => mcm_output(758), Y12 => mcm_output
(759), Y13 => mcm_output(760), Y14 => mcm_output(761), Y15 => mcm_output(762), Y16 => mcm_output(763), Y17 => mcm_output(764), Y18 => mcm_output(765), Y19 => mcm_output(766), Y20 => mcm_output(767), Y21 => mcm_output(768), Y22 => mcm_output(769), Y23 => mcm_output(770), Y24 => mcm_output(771), Y25 => mcm_output(772), Y26 => mcm_output(773), Y27 => mcm_output(774) );
    m30 : MCM_3
    PORT MAP ( X => ref(30), Y1 => mcm_output(775), Y2 => mcm_output(776), Y3 => mcm_output(777), Y4 => mcm_output(778), Y5 => mcm_output(779), Y6 => mcm_output(780), Y7 => mcm_output(781), Y8 => mcm_output(782), Y9 => mcm_output(783), Y10 => mcm_output(784), Y11 => mcm_output(785), Y12 => mcm_output
(786), Y13 => mcm_output(787), Y14 => mcm_output(788), Y15 => mcm_output(789), Y16 => mcm_output(790), Y17 => mcm_output(791), Y18 => mcm_output(792), Y19 => mcm_output(793), Y20 => mcm_output(794), Y21 => mcm_output(795), Y22 => mcm_output(796), Y23 => mcm_output(797), Y24 => mcm_output(798), Y25 => mcm_output(799), Y26 => mcm_output(800), Y27 => mcm_output(801) );
    m31 : MCM_3
    PORT MAP ( X => ref(31), Y1 => mcm_output(802), Y2 => mcm_output(803), Y3 => mcm_output(804), Y4 => mcm_output(805), Y5 => mcm_output(806), Y6 => mcm_output(807), Y7 => mcm_output(808), Y8 => mcm_output(809), Y9 => mcm_output(810), Y10 => mcm_output(811), Y11 => mcm_output(812), Y12 => mcm_output
(813), Y13 => mcm_output(814), Y14 => mcm_output(815), Y15 => mcm_output(816), Y16 => mcm_output(817), Y17 => mcm_output(818), Y18 => mcm_output(819), Y19 => mcm_output(820), Y20 => mcm_output(821), Y21 => mcm_output(822), Y22 => mcm_output(823), Y23 => mcm_output(824), Y24 => mcm_output(825), Y25 => mcm_output(826), Y26 => mcm_output(827), Y27 => mcm_output(828) );
    m32 : MCM_4
    PORT MAP ( X => ref(32), Y1 => mcm_output(829), Y2 => mcm_output(830), Y3 => mcm_output(831), Y4 => mcm_output(832), Y5 => mcm_output(833), Y6 => mcm_output(834), Y7 => mcm_output(835), Y8 => mcm_output(836), Y9 => mcm_output(837), Y10 => mcm_output(838), Y11 => mcm_output(839), Y12 => mcm_output(840), Y13 => mcm_output(841), Y14 => mcm_output(842), Y15 => mcm_output(843), Y16 => mcm_output(844), Y17 => mcm_output(845), Y18 => mcm_output(846), Y19 => mcm_output(847), Y20 => mcm_output(848), Y21 => mcm_output(849), Y22 => mcm_output(850), Y23 => mcm_output(851), Y24 => mcm_output(852) );
    m33 : MCM_5
    PORT MAP ( X => ref(33), Y1 => mcm_output(853), Y2 => mcm_output(854), Y3 => mcm_output(855), Y4 => mcm_output(856), Y5 => mcm_output(857), Y6 => mcm_output(858), Y7 => mcm_output(859), Y8 => mcm_output(860), Y9 => mcm_output(861), Y10 => mcm_output(862), Y11 => mcm_output(863), Y12 => mcm_output(864), Y13 => mcm_output(865), Y14 => mcm_output(866), Y15 => mcm_output(867), Y16 => mcm_output(868) );
    m34 : MCM_6
    PORT MAP ( X => ref(34), Y1 => mcm_output(869), Y2 => mcm_output(870), Y3 => mcm_output(871), Y4 => mcm_output(872), Y5 => mcm_output(873), Y6 => mcm_output(874), Y7 => mcm_output(875), Y8 => mcm_output(876) );
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
    input(0)(5)(3) <= mcm_output(184); -- input 5,3 <= -1 * ref[8]

    -- Eq 6 Line 0
    input(0)(6)(0) <= mcm_output(127); -- input 6,0 <= -2 * ref[6]
    input(0)(6)(1) <= mcm_output(162); -- input 6,1 <= 59 * ref[7]
    input(0)(6)(2) <= mcm_output(196); -- input 6,2 <= 8 * ref[8]
    input(0)(6)(3) <= mcm_output(211); -- input 6,3 <= -1 * ref[9]

    -- Eq 7 Line 0
    input(0)(7)(0) <= mcm_output(154); -- input 7,0 <= -2 * ref[7]
    input(0)(7)(1) <= mcm_output(189); -- input 7,1 <= 59 * ref[8]
    input(0)(7)(2) <= mcm_output(223); -- input 7,2 <= 8 * ref[9]
    input(0)(7)(3) <= mcm_output(238); -- input 7,3 <= -1 * ref[10]

    -- Eq 8 Line 0
    input(0)(8)(0) <= mcm_output(181); -- input 8,0 <= -2 * ref[8]
    input(0)(8)(1) <= mcm_output(216); -- input 8,1 <= 59 * ref[9]
    input(0)(8)(2) <= mcm_output(250); -- input 8,2 <= 8 * ref[10]
    input(0)(8)(3) <= mcm_output(265); -- input 8,3 <= -1 * ref[11]

    -- Eq 9 Line 0
    input(0)(9)(0) <= mcm_output(208); -- input 9,0 <= -2 * ref[9]
    input(0)(9)(1) <= mcm_output(243); -- input 9,1 <= 59 * ref[10]
    input(0)(9)(2) <= mcm_output(277); -- input 9,2 <= 8 * ref[11]
    input(0)(9)(3) <= mcm_output(292); -- input 9,3 <= -1 * ref[12]

    -- Eq 10 Line 0
    input(0)(10)(0) <= mcm_output(235); -- input 10,0 <= -2 * ref[10]
    input(0)(10)(1) <= mcm_output(270); -- input 10,1 <= 59 * ref[11]
    input(0)(10)(2) <= mcm_output(304); -- input 10,2 <= 8 * ref[12]
    input(0)(10)(3) <= mcm_output(319); -- input 10,3 <= -1 * ref[13]

    -- Eq 11 Line 0
    input(0)(11)(0) <= mcm_output(262); -- input 11,0 <= -2 * ref[11]
    input(0)(11)(1) <= mcm_output(297); -- input 11,1 <= 59 * ref[12]
    input(0)(11)(2) <= mcm_output(331); -- input 11,2 <= 8 * ref[13]
    input(0)(11)(3) <= mcm_output(346); -- input 11,3 <= -1 * ref[14]

    -- Eq 12 Line 0
    input(0)(12)(0) <= mcm_output(289); -- input 12,0 <= -2 * ref[12]
    input(0)(12)(1) <= mcm_output(324); -- input 12,1 <= 59 * ref[13]
    input(0)(12)(2) <= mcm_output(358); -- input 12,2 <= 8 * ref[14]
    input(0)(12)(3) <= mcm_output(373); -- input 12,3 <= -1 * ref[15]

    -- Eq 13 Line 0
    input(0)(13)(0) <= mcm_output(316); -- input 13,0 <= -2 * ref[13]
    input(0)(13)(1) <= mcm_output(351); -- input 13,1 <= 59 * ref[14]
    input(0)(13)(2) <= mcm_output(385); -- input 13,2 <= 8 * ref[15]
    input(0)(13)(3) <= mcm_output(400); -- input 13,3 <= -1 * ref[16]

    -- Eq 14 Line 0
    input(0)(14)(0) <= mcm_output(343); -- input 14,0 <= -2 * ref[14]
    input(0)(14)(1) <= mcm_output(378); -- input 14,1 <= 59 * ref[15]
    input(0)(14)(2) <= mcm_output(412); -- input 14,2 <= 8 * ref[16]
    input(0)(14)(3) <= mcm_output(427); -- input 14,3 <= -1 * ref[17]

    -- Eq 15 Line 0
    input(0)(15)(0) <= mcm_output(370); -- input 15,0 <= -2 * ref[15]
    input(0)(15)(1) <= mcm_output(405); -- input 15,1 <= 59 * ref[16]
    input(0)(15)(2) <= mcm_output(439); -- input 15,2 <= 8 * ref[17]
    input(0)(15)(3) <= mcm_output(454); -- input 15,3 <= -1 * ref[18]

    -- Eq 16 Line 0
    input(0)(16)(0) <= mcm_output(397); -- input 16,0 <= -2 * ref[16]
    input(0)(16)(1) <= mcm_output(432); -- input 16,1 <= 59 * ref[17]
    input(0)(16)(2) <= mcm_output(466); -- input 16,2 <= 8 * ref[18]
    input(0)(16)(3) <= mcm_output(481); -- input 16,3 <= -1 * ref[19]

    -- Eq 17 Line 0
    input(0)(17)(0) <= mcm_output(424); -- input 17,0 <= -2 * ref[17]
    input(0)(17)(1) <= mcm_output(459); -- input 17,1 <= 59 * ref[18]
    input(0)(17)(2) <= mcm_output(493); -- input 17,2 <= 8 * ref[19]
    input(0)(17)(3) <= mcm_output(508); -- input 17,3 <= -1 * ref[20]

    -- Eq 18 Line 0
    input(0)(18)(0) <= mcm_output(451); -- input 18,0 <= -2 * ref[18]
    input(0)(18)(1) <= mcm_output(486); -- input 18,1 <= 59 * ref[19]
    input(0)(18)(2) <= mcm_output(520); -- input 18,2 <= 8 * ref[20]
    input(0)(18)(3) <= mcm_output(535); -- input 18,3 <= -1 * ref[21]

    -- Eq 19 Line 0
    input(0)(19)(0) <= mcm_output(478); -- input 19,0 <= -2 * ref[19]
    input(0)(19)(1) <= mcm_output(513); -- input 19,1 <= 59 * ref[20]
    input(0)(19)(2) <= mcm_output(547); -- input 19,2 <= 8 * ref[21]
    input(0)(19)(3) <= mcm_output(562); -- input 19,3 <= -1 * ref[22]

    -- Eq 20 Line 0
    input(0)(20)(0) <= mcm_output(505); -- input 20,0 <= -2 * ref[20]
    input(0)(20)(1) <= mcm_output(540); -- input 20,1 <= 59 * ref[21]
    input(0)(20)(2) <= mcm_output(574); -- input 20,2 <= 8 * ref[22]
    input(0)(20)(3) <= mcm_output(589); -- input 20,3 <= -1 * ref[23]

    -- Eq 21 Line 0
    input(0)(21)(0) <= mcm_output(532); -- input 21,0 <= -2 * ref[21]
    input(0)(21)(1) <= mcm_output(567); -- input 21,1 <= 59 * ref[22]
    input(0)(21)(2) <= mcm_output(601); -- input 21,2 <= 8 * ref[23]
    input(0)(21)(3) <= mcm_output(616); -- input 21,3 <= -1 * ref[24]

    -- Eq 22 Line 0
    input(0)(22)(0) <= mcm_output(559); -- input 22,0 <= -2 * ref[22]
    input(0)(22)(1) <= mcm_output(594); -- input 22,1 <= 59 * ref[23]
    input(0)(22)(2) <= mcm_output(628); -- input 22,2 <= 8 * ref[24]
    input(0)(22)(3) <= mcm_output(643); -- input 22,3 <= -1 * ref[25]

    -- Eq 23 Line 0
    input(0)(23)(0) <= mcm_output(586); -- input 23,0 <= -2 * ref[23]
    input(0)(23)(1) <= mcm_output(621); -- input 23,1 <= 59 * ref[24]
    input(0)(23)(2) <= mcm_output(655); -- input 23,2 <= 8 * ref[25]
    input(0)(23)(3) <= mcm_output(670); -- input 23,3 <= -1 * ref[26]

    -- Eq 24 Line 0
    input(0)(24)(0) <= mcm_output(613); -- input 24,0 <= -2 * ref[24]
    input(0)(24)(1) <= mcm_output(648); -- input 24,1 <= 59 * ref[25]
    input(0)(24)(2) <= mcm_output(682); -- input 24,2 <= 8 * ref[26]
    input(0)(24)(3) <= mcm_output(697); -- input 24,3 <= -1 * ref[27]

    -- Eq 25 Line 0
    input(0)(25)(0) <= mcm_output(640); -- input 25,0 <= -2 * ref[25]
    input(0)(25)(1) <= mcm_output(675); -- input 25,1 <= 59 * ref[26]
    input(0)(25)(2) <= mcm_output(709); -- input 25,2 <= 8 * ref[27]
    input(0)(25)(3) <= mcm_output(724); -- input 25,3 <= -1 * ref[28]

    -- Eq 26 Line 0
    input(0)(26)(0) <= mcm_output(667); -- input 26,0 <= -2 * ref[26]
    input(0)(26)(1) <= mcm_output(702); -- input 26,1 <= 59 * ref[27]
    input(0)(26)(2) <= mcm_output(736); -- input 26,2 <= 8 * ref[28]
    input(0)(26)(3) <= mcm_output(751); -- input 26,3 <= -1 * ref[29]

    -- Eq 27 Line 0
    input(0)(27)(0) <= mcm_output(694); -- input 27,0 <= -2 * ref[27]
    input(0)(27)(1) <= mcm_output(729); -- input 27,1 <= 59 * ref[28]
    input(0)(27)(2) <= mcm_output(763); -- input 27,2 <= 8 * ref[29]
    input(0)(27)(3) <= mcm_output(778); -- input 27,3 <= -1 * ref[30]

    -- Eq 28 Line 0
    input(0)(28)(0) <= mcm_output(721); -- input 28,0 <= -2 * ref[28]
    input(0)(28)(1) <= mcm_output(756); -- input 28,1 <= 59 * ref[29]
    input(0)(28)(2) <= mcm_output(790); -- input 28,2 <= 8 * ref[30]
    input(0)(28)(3) <= mcm_output(805); -- input 28,3 <= -1 * ref[31]

    -- Eq 29 Line 0
    input(0)(29)(0) <= mcm_output(748); -- input 29,0 <= -2 * ref[29]
    input(0)(29)(1) <= mcm_output(783); -- input 29,1 <= 59 * ref[30]
    input(0)(29)(2) <= mcm_output(817); -- input 29,2 <= 8 * ref[31]
    input(0)(29)(3) <= mcm_output(845); -- input 29,3 <= -1 * ref[32]

    -- Eq 30 Line 0
    input(0)(30)(0) <= mcm_output(775); -- input 30,0 <= -2 * ref[30]
    input(0)(30)(1) <= mcm_output(810); -- input 30,1 <= 59 * ref[31]
    input(0)(30)(2) <= mcm_output(837); -- input 30,2 <= 8 * ref[32]
    input(0)(30)(3) <= mcm_output(861); -- input 30,3 <= -1 * ref[33]

    -- Eq 31 Line 0
    input(0)(31)(0) <= mcm_output(802); -- input 31,0 <= -2 * ref[31]
    input(0)(31)(1) <= mcm_output(829); -- input 31,1 <= 59 * ref[32]
    input(0)(31)(2) <= mcm_output(853); -- input 31,2 <= 8 * ref[33]
    input(0)(31)(3) <= mcm_output(869); -- input 31,3 <= -1 * ref[34]

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
    input(1)(5)(3) <= mcm_output(183); -- input 5,3 <= -3 * ref[8]

    -- Eq 6 Line 1
    input(1)(6)(0) <= mcm_output(128); -- input 6,0 <= -5 * ref[6]
    input(1)(6)(1) <= mcm_output(163); -- input 6,1 <= 47 * ref[7]
    input(1)(6)(2) <= mcm_output(197); -- input 6,2 <= 24 * ref[8]
    input(1)(6)(3) <= mcm_output(210); -- input 6,3 <= -3 * ref[9]

    -- Eq 7 Line 1
    input(1)(7)(0) <= mcm_output(155); -- input 7,0 <= -5 * ref[7]
    input(1)(7)(1) <= mcm_output(190); -- input 7,1 <= 47 * ref[8]
    input(1)(7)(2) <= mcm_output(224); -- input 7,2 <= 24 * ref[9]
    input(1)(7)(3) <= mcm_output(237); -- input 7,3 <= -3 * ref[10]

    -- Eq 8 Line 1
    input(1)(8)(0) <= mcm_output(182); -- input 8,0 <= -5 * ref[8]
    input(1)(8)(1) <= mcm_output(217); -- input 8,1 <= 47 * ref[9]
    input(1)(8)(2) <= mcm_output(251); -- input 8,2 <= 24 * ref[10]
    input(1)(8)(3) <= mcm_output(264); -- input 8,3 <= -3 * ref[11]

    -- Eq 9 Line 1
    input(1)(9)(0) <= mcm_output(209); -- input 9,0 <= -5 * ref[9]
    input(1)(9)(1) <= mcm_output(244); -- input 9,1 <= 47 * ref[10]
    input(1)(9)(2) <= mcm_output(278); -- input 9,2 <= 24 * ref[11]
    input(1)(9)(3) <= mcm_output(291); -- input 9,3 <= -3 * ref[12]

    -- Eq 10 Line 1
    input(1)(10)(0) <= mcm_output(236); -- input 10,0 <= -5 * ref[10]
    input(1)(10)(1) <= mcm_output(271); -- input 10,1 <= 47 * ref[11]
    input(1)(10)(2) <= mcm_output(305); -- input 10,2 <= 24 * ref[12]
    input(1)(10)(3) <= mcm_output(318); -- input 10,3 <= -3 * ref[13]

    -- Eq 11 Line 1
    input(1)(11)(0) <= mcm_output(263); -- input 11,0 <= -5 * ref[11]
    input(1)(11)(1) <= mcm_output(298); -- input 11,1 <= 47 * ref[12]
    input(1)(11)(2) <= mcm_output(332); -- input 11,2 <= 24 * ref[13]
    input(1)(11)(3) <= mcm_output(345); -- input 11,3 <= -3 * ref[14]

    -- Eq 12 Line 1
    input(1)(12)(0) <= mcm_output(290); -- input 12,0 <= -5 * ref[12]
    input(1)(12)(1) <= mcm_output(325); -- input 12,1 <= 47 * ref[13]
    input(1)(12)(2) <= mcm_output(359); -- input 12,2 <= 24 * ref[14]
    input(1)(12)(3) <= mcm_output(372); -- input 12,3 <= -3 * ref[15]

    -- Eq 13 Line 1
    input(1)(13)(0) <= mcm_output(317); -- input 13,0 <= -5 * ref[13]
    input(1)(13)(1) <= mcm_output(352); -- input 13,1 <= 47 * ref[14]
    input(1)(13)(2) <= mcm_output(386); -- input 13,2 <= 24 * ref[15]
    input(1)(13)(3) <= mcm_output(399); -- input 13,3 <= -3 * ref[16]

    -- Eq 14 Line 1
    input(1)(14)(0) <= mcm_output(344); -- input 14,0 <= -5 * ref[14]
    input(1)(14)(1) <= mcm_output(379); -- input 14,1 <= 47 * ref[15]
    input(1)(14)(2) <= mcm_output(413); -- input 14,2 <= 24 * ref[16]
    input(1)(14)(3) <= mcm_output(426); -- input 14,3 <= -3 * ref[17]

    -- Eq 15 Line 1
    input(1)(15)(0) <= mcm_output(371); -- input 15,0 <= -5 * ref[15]
    input(1)(15)(1) <= mcm_output(406); -- input 15,1 <= 47 * ref[16]
    input(1)(15)(2) <= mcm_output(440); -- input 15,2 <= 24 * ref[17]
    input(1)(15)(3) <= mcm_output(453); -- input 15,3 <= -3 * ref[18]

    -- Eq 16 Line 1
    input(1)(16)(0) <= mcm_output(398); -- input 16,0 <= -5 * ref[16]
    input(1)(16)(1) <= mcm_output(433); -- input 16,1 <= 47 * ref[17]
    input(1)(16)(2) <= mcm_output(467); -- input 16,2 <= 24 * ref[18]
    input(1)(16)(3) <= mcm_output(480); -- input 16,3 <= -3 * ref[19]

    -- Eq 17 Line 1
    input(1)(17)(0) <= mcm_output(425); -- input 17,0 <= -5 * ref[17]
    input(1)(17)(1) <= mcm_output(460); -- input 17,1 <= 47 * ref[18]
    input(1)(17)(2) <= mcm_output(494); -- input 17,2 <= 24 * ref[19]
    input(1)(17)(3) <= mcm_output(507); -- input 17,3 <= -3 * ref[20]

    -- Eq 18 Line 1
    input(1)(18)(0) <= mcm_output(452); -- input 18,0 <= -5 * ref[18]
    input(1)(18)(1) <= mcm_output(487); -- input 18,1 <= 47 * ref[19]
    input(1)(18)(2) <= mcm_output(521); -- input 18,2 <= 24 * ref[20]
    input(1)(18)(3) <= mcm_output(534); -- input 18,3 <= -3 * ref[21]

    -- Eq 19 Line 1
    input(1)(19)(0) <= mcm_output(479); -- input 19,0 <= -5 * ref[19]
    input(1)(19)(1) <= mcm_output(514); -- input 19,1 <= 47 * ref[20]
    input(1)(19)(2) <= mcm_output(548); -- input 19,2 <= 24 * ref[21]
    input(1)(19)(3) <= mcm_output(561); -- input 19,3 <= -3 * ref[22]

    -- Eq 20 Line 1
    input(1)(20)(0) <= mcm_output(506); -- input 20,0 <= -5 * ref[20]
    input(1)(20)(1) <= mcm_output(541); -- input 20,1 <= 47 * ref[21]
    input(1)(20)(2) <= mcm_output(575); -- input 20,2 <= 24 * ref[22]
    input(1)(20)(3) <= mcm_output(588); -- input 20,3 <= -3 * ref[23]

    -- Eq 21 Line 1
    input(1)(21)(0) <= mcm_output(533); -- input 21,0 <= -5 * ref[21]
    input(1)(21)(1) <= mcm_output(568); -- input 21,1 <= 47 * ref[22]
    input(1)(21)(2) <= mcm_output(602); -- input 21,2 <= 24 * ref[23]
    input(1)(21)(3) <= mcm_output(615); -- input 21,3 <= -3 * ref[24]

    -- Eq 22 Line 1
    input(1)(22)(0) <= mcm_output(560); -- input 22,0 <= -5 * ref[22]
    input(1)(22)(1) <= mcm_output(595); -- input 22,1 <= 47 * ref[23]
    input(1)(22)(2) <= mcm_output(629); -- input 22,2 <= 24 * ref[24]
    input(1)(22)(3) <= mcm_output(642); -- input 22,3 <= -3 * ref[25]

    -- Eq 23 Line 1
    input(1)(23)(0) <= mcm_output(587); -- input 23,0 <= -5 * ref[23]
    input(1)(23)(1) <= mcm_output(622); -- input 23,1 <= 47 * ref[24]
    input(1)(23)(2) <= mcm_output(656); -- input 23,2 <= 24 * ref[25]
    input(1)(23)(3) <= mcm_output(669); -- input 23,3 <= -3 * ref[26]

    -- Eq 24 Line 1
    input(1)(24)(0) <= mcm_output(614); -- input 24,0 <= -5 * ref[24]
    input(1)(24)(1) <= mcm_output(649); -- input 24,1 <= 47 * ref[25]
    input(1)(24)(2) <= mcm_output(683); -- input 24,2 <= 24 * ref[26]
    input(1)(24)(3) <= mcm_output(696); -- input 24,3 <= -3 * ref[27]

    -- Eq 25 Line 1
    input(1)(25)(0) <= mcm_output(641); -- input 25,0 <= -5 * ref[25]
    input(1)(25)(1) <= mcm_output(676); -- input 25,1 <= 47 * ref[26]
    input(1)(25)(2) <= mcm_output(710); -- input 25,2 <= 24 * ref[27]
    input(1)(25)(3) <= mcm_output(723); -- input 25,3 <= -3 * ref[28]

    -- Eq 26 Line 1
    input(1)(26)(0) <= mcm_output(668); -- input 26,0 <= -5 * ref[26]
    input(1)(26)(1) <= mcm_output(703); -- input 26,1 <= 47 * ref[27]
    input(1)(26)(2) <= mcm_output(737); -- input 26,2 <= 24 * ref[28]
    input(1)(26)(3) <= mcm_output(750); -- input 26,3 <= -3 * ref[29]

    -- Eq 27 Line 1
    input(1)(27)(0) <= mcm_output(695); -- input 27,0 <= -5 * ref[27]
    input(1)(27)(1) <= mcm_output(730); -- input 27,1 <= 47 * ref[28]
    input(1)(27)(2) <= mcm_output(764); -- input 27,2 <= 24 * ref[29]
    input(1)(27)(3) <= mcm_output(777); -- input 27,3 <= -3 * ref[30]

    -- Eq 28 Line 1
    input(1)(28)(0) <= mcm_output(722); -- input 28,0 <= -5 * ref[28]
    input(1)(28)(1) <= mcm_output(757); -- input 28,1 <= 47 * ref[29]
    input(1)(28)(2) <= mcm_output(791); -- input 28,2 <= 24 * ref[30]
    input(1)(28)(3) <= mcm_output(804); -- input 28,3 <= -3 * ref[31]

    -- Eq 29 Line 1
    input(1)(29)(0) <= mcm_output(749); -- input 29,0 <= -5 * ref[29]
    input(1)(29)(1) <= mcm_output(784); -- input 29,1 <= 47 * ref[30]
    input(1)(29)(2) <= mcm_output(818); -- input 29,2 <= 24 * ref[31]
    input(1)(29)(3) <= mcm_output(846); -- input 29,3 <= -3 * ref[32]

    -- Eq 30 Line 1
    input(1)(30)(0) <= mcm_output(776); -- input 30,0 <= -5 * ref[30]
    input(1)(30)(1) <= mcm_output(811); -- input 30,1 <= 47 * ref[31]
    input(1)(30)(2) <= mcm_output(838); -- input 30,2 <= 24 * ref[32]
    input(1)(30)(3) <= mcm_output(862); -- input 30,3 <= -3 * ref[33]

    -- Eq 31 Line 1
    input(1)(31)(0) <= mcm_output(803); -- input 31,0 <= -5 * ref[31]
    input(1)(31)(1) <= mcm_output(830); -- input 31,1 <= 47 * ref[32]
    input(1)(31)(2) <= mcm_output(854); -- input 31,2 <= 24 * ref[33]
    input(1)(31)(3) <= mcm_output(870); -- input 31,3 <= -3 * ref[34]

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
    input(2)(5)(3) <= mcm_output(182); -- input 5,3 <= -5 * ref[8]

    -- Eq 6 Line 2
    input(2)(6)(0) <= mcm_output(129); -- input 6,0 <= -3 * ref[6]
    input(2)(6)(1) <= mcm_output(164); -- input 6,1 <= 27 * ref[7]
    input(2)(6)(2) <= mcm_output(198); -- input 6,2 <= 45 * ref[8]
    input(2)(6)(3) <= mcm_output(209); -- input 6,3 <= -5 * ref[9]

    -- Eq 7 Line 2
    input(2)(7)(0) <= mcm_output(156); -- input 7,0 <= -3 * ref[7]
    input(2)(7)(1) <= mcm_output(191); -- input 7,1 <= 27 * ref[8]
    input(2)(7)(2) <= mcm_output(225); -- input 7,2 <= 45 * ref[9]
    input(2)(7)(3) <= mcm_output(236); -- input 7,3 <= -5 * ref[10]

    -- Eq 8 Line 2
    input(2)(8)(0) <= mcm_output(183); -- input 8,0 <= -3 * ref[8]
    input(2)(8)(1) <= mcm_output(218); -- input 8,1 <= 27 * ref[9]
    input(2)(8)(2) <= mcm_output(252); -- input 8,2 <= 45 * ref[10]
    input(2)(8)(3) <= mcm_output(263); -- input 8,3 <= -5 * ref[11]

    -- Eq 9 Line 2
    input(2)(9)(0) <= mcm_output(210); -- input 9,0 <= -3 * ref[9]
    input(2)(9)(1) <= mcm_output(245); -- input 9,1 <= 27 * ref[10]
    input(2)(9)(2) <= mcm_output(279); -- input 9,2 <= 45 * ref[11]
    input(2)(9)(3) <= mcm_output(290); -- input 9,3 <= -5 * ref[12]

    -- Eq 10 Line 2
    input(2)(10)(0) <= mcm_output(237); -- input 10,0 <= -3 * ref[10]
    input(2)(10)(1) <= mcm_output(272); -- input 10,1 <= 27 * ref[11]
    input(2)(10)(2) <= mcm_output(306); -- input 10,2 <= 45 * ref[12]
    input(2)(10)(3) <= mcm_output(317); -- input 10,3 <= -5 * ref[13]

    -- Eq 11 Line 2
    input(2)(11)(0) <= mcm_output(264); -- input 11,0 <= -3 * ref[11]
    input(2)(11)(1) <= mcm_output(299); -- input 11,1 <= 27 * ref[12]
    input(2)(11)(2) <= mcm_output(333); -- input 11,2 <= 45 * ref[13]
    input(2)(11)(3) <= mcm_output(344); -- input 11,3 <= -5 * ref[14]

    -- Eq 12 Line 2
    input(2)(12)(0) <= mcm_output(291); -- input 12,0 <= -3 * ref[12]
    input(2)(12)(1) <= mcm_output(326); -- input 12,1 <= 27 * ref[13]
    input(2)(12)(2) <= mcm_output(360); -- input 12,2 <= 45 * ref[14]
    input(2)(12)(3) <= mcm_output(371); -- input 12,3 <= -5 * ref[15]

    -- Eq 13 Line 2
    input(2)(13)(0) <= mcm_output(318); -- input 13,0 <= -3 * ref[13]
    input(2)(13)(1) <= mcm_output(353); -- input 13,1 <= 27 * ref[14]
    input(2)(13)(2) <= mcm_output(387); -- input 13,2 <= 45 * ref[15]
    input(2)(13)(3) <= mcm_output(398); -- input 13,3 <= -5 * ref[16]

    -- Eq 14 Line 2
    input(2)(14)(0) <= mcm_output(345); -- input 14,0 <= -3 * ref[14]
    input(2)(14)(1) <= mcm_output(380); -- input 14,1 <= 27 * ref[15]
    input(2)(14)(2) <= mcm_output(414); -- input 14,2 <= 45 * ref[16]
    input(2)(14)(3) <= mcm_output(425); -- input 14,3 <= -5 * ref[17]

    -- Eq 15 Line 2
    input(2)(15)(0) <= mcm_output(372); -- input 15,0 <= -3 * ref[15]
    input(2)(15)(1) <= mcm_output(407); -- input 15,1 <= 27 * ref[16]
    input(2)(15)(2) <= mcm_output(441); -- input 15,2 <= 45 * ref[17]
    input(2)(15)(3) <= mcm_output(452); -- input 15,3 <= -5 * ref[18]

    -- Eq 16 Line 2
    input(2)(16)(0) <= mcm_output(399); -- input 16,0 <= -3 * ref[16]
    input(2)(16)(1) <= mcm_output(434); -- input 16,1 <= 27 * ref[17]
    input(2)(16)(2) <= mcm_output(468); -- input 16,2 <= 45 * ref[18]
    input(2)(16)(3) <= mcm_output(479); -- input 16,3 <= -5 * ref[19]

    -- Eq 17 Line 2
    input(2)(17)(0) <= mcm_output(426); -- input 17,0 <= -3 * ref[17]
    input(2)(17)(1) <= mcm_output(461); -- input 17,1 <= 27 * ref[18]
    input(2)(17)(2) <= mcm_output(495); -- input 17,2 <= 45 * ref[19]
    input(2)(17)(3) <= mcm_output(506); -- input 17,3 <= -5 * ref[20]

    -- Eq 18 Line 2
    input(2)(18)(0) <= mcm_output(453); -- input 18,0 <= -3 * ref[18]
    input(2)(18)(1) <= mcm_output(488); -- input 18,1 <= 27 * ref[19]
    input(2)(18)(2) <= mcm_output(522); -- input 18,2 <= 45 * ref[20]
    input(2)(18)(3) <= mcm_output(533); -- input 18,3 <= -5 * ref[21]

    -- Eq 19 Line 2
    input(2)(19)(0) <= mcm_output(480); -- input 19,0 <= -3 * ref[19]
    input(2)(19)(1) <= mcm_output(515); -- input 19,1 <= 27 * ref[20]
    input(2)(19)(2) <= mcm_output(549); -- input 19,2 <= 45 * ref[21]
    input(2)(19)(3) <= mcm_output(560); -- input 19,3 <= -5 * ref[22]

    -- Eq 20 Line 2
    input(2)(20)(0) <= mcm_output(507); -- input 20,0 <= -3 * ref[20]
    input(2)(20)(1) <= mcm_output(542); -- input 20,1 <= 27 * ref[21]
    input(2)(20)(2) <= mcm_output(576); -- input 20,2 <= 45 * ref[22]
    input(2)(20)(3) <= mcm_output(587); -- input 20,3 <= -5 * ref[23]

    -- Eq 21 Line 2
    input(2)(21)(0) <= mcm_output(534); -- input 21,0 <= -3 * ref[21]
    input(2)(21)(1) <= mcm_output(569); -- input 21,1 <= 27 * ref[22]
    input(2)(21)(2) <= mcm_output(603); -- input 21,2 <= 45 * ref[23]
    input(2)(21)(3) <= mcm_output(614); -- input 21,3 <= -5 * ref[24]

    -- Eq 22 Line 2
    input(2)(22)(0) <= mcm_output(561); -- input 22,0 <= -3 * ref[22]
    input(2)(22)(1) <= mcm_output(596); -- input 22,1 <= 27 * ref[23]
    input(2)(22)(2) <= mcm_output(630); -- input 22,2 <= 45 * ref[24]
    input(2)(22)(3) <= mcm_output(641); -- input 22,3 <= -5 * ref[25]

    -- Eq 23 Line 2
    input(2)(23)(0) <= mcm_output(588); -- input 23,0 <= -3 * ref[23]
    input(2)(23)(1) <= mcm_output(623); -- input 23,1 <= 27 * ref[24]
    input(2)(23)(2) <= mcm_output(657); -- input 23,2 <= 45 * ref[25]
    input(2)(23)(3) <= mcm_output(668); -- input 23,3 <= -5 * ref[26]

    -- Eq 24 Line 2
    input(2)(24)(0) <= mcm_output(615); -- input 24,0 <= -3 * ref[24]
    input(2)(24)(1) <= mcm_output(650); -- input 24,1 <= 27 * ref[25]
    input(2)(24)(2) <= mcm_output(684); -- input 24,2 <= 45 * ref[26]
    input(2)(24)(3) <= mcm_output(695); -- input 24,3 <= -5 * ref[27]

    -- Eq 25 Line 2
    input(2)(25)(0) <= mcm_output(642); -- input 25,0 <= -3 * ref[25]
    input(2)(25)(1) <= mcm_output(677); -- input 25,1 <= 27 * ref[26]
    input(2)(25)(2) <= mcm_output(711); -- input 25,2 <= 45 * ref[27]
    input(2)(25)(3) <= mcm_output(722); -- input 25,3 <= -5 * ref[28]

    -- Eq 26 Line 2
    input(2)(26)(0) <= mcm_output(669); -- input 26,0 <= -3 * ref[26]
    input(2)(26)(1) <= mcm_output(704); -- input 26,1 <= 27 * ref[27]
    input(2)(26)(2) <= mcm_output(738); -- input 26,2 <= 45 * ref[28]
    input(2)(26)(3) <= mcm_output(749); -- input 26,3 <= -5 * ref[29]

    -- Eq 27 Line 2
    input(2)(27)(0) <= mcm_output(696); -- input 27,0 <= -3 * ref[27]
    input(2)(27)(1) <= mcm_output(731); -- input 27,1 <= 27 * ref[28]
    input(2)(27)(2) <= mcm_output(765); -- input 27,2 <= 45 * ref[29]
    input(2)(27)(3) <= mcm_output(776); -- input 27,3 <= -5 * ref[30]

    -- Eq 28 Line 2
    input(2)(28)(0) <= mcm_output(723); -- input 28,0 <= -3 * ref[28]
    input(2)(28)(1) <= mcm_output(758); -- input 28,1 <= 27 * ref[29]
    input(2)(28)(2) <= mcm_output(792); -- input 28,2 <= 45 * ref[30]
    input(2)(28)(3) <= mcm_output(803); -- input 28,3 <= -5 * ref[31]

    -- Eq 29 Line 2
    input(2)(29)(0) <= mcm_output(750); -- input 29,0 <= -3 * ref[29]
    input(2)(29)(1) <= mcm_output(785); -- input 29,1 <= 27 * ref[30]
    input(2)(29)(2) <= mcm_output(819); -- input 29,2 <= 45 * ref[31]
    input(2)(29)(3) <= mcm_output(847); -- input 29,3 <= -5 * ref[32]

    -- Eq 30 Line 2
    input(2)(30)(0) <= mcm_output(777); -- input 30,0 <= -3 * ref[30]
    input(2)(30)(1) <= mcm_output(812); -- input 30,1 <= 27 * ref[31]
    input(2)(30)(2) <= mcm_output(839); -- input 30,2 <= 45 * ref[32]
    input(2)(30)(3) <= mcm_output(863); -- input 30,3 <= -5 * ref[33]

    -- Eq 31 Line 2
    input(2)(31)(0) <= mcm_output(804); -- input 31,0 <= -3 * ref[31]
    input(2)(31)(1) <= mcm_output(831); -- input 31,1 <= 27 * ref[32]
    input(2)(31)(2) <= mcm_output(855); -- input 31,2 <= 45 * ref[33]
    input(2)(31)(3) <= mcm_output(871); -- input 31,3 <= -5 * ref[34]

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
    input(3)(5)(3) <= mcm_output(181); -- input 5,3 <= -2 * ref[8]

    -- Eq 6 Line 3
    input(3)(6)(0) <= mcm_output(130); -- input 6,0 <= -1 * ref[6]
    input(3)(6)(1) <= mcm_output(159); -- input 6,1 <= 10 * ref[7]
    input(3)(6)(2) <= mcm_output(199); -- input 6,2 <= 58 * ref[8]
    input(3)(6)(3) <= mcm_output(208); -- input 6,3 <= -2 * ref[9]

    -- Eq 7 Line 3
    input(3)(7)(0) <= mcm_output(157); -- input 7,0 <= -1 * ref[7]
    input(3)(7)(1) <= mcm_output(186); -- input 7,1 <= 10 * ref[8]
    input(3)(7)(2) <= mcm_output(226); -- input 7,2 <= 58 * ref[9]
    input(3)(7)(3) <= mcm_output(235); -- input 7,3 <= -2 * ref[10]

    -- Eq 8 Line 3
    input(3)(8)(0) <= mcm_output(184); -- input 8,0 <= -1 * ref[8]
    input(3)(8)(1) <= mcm_output(213); -- input 8,1 <= 10 * ref[9]
    input(3)(8)(2) <= mcm_output(253); -- input 8,2 <= 58 * ref[10]
    input(3)(8)(3) <= mcm_output(262); -- input 8,3 <= -2 * ref[11]

    -- Eq 9 Line 3
    input(3)(9)(0) <= mcm_output(211); -- input 9,0 <= -1 * ref[9]
    input(3)(9)(1) <= mcm_output(240); -- input 9,1 <= 10 * ref[10]
    input(3)(9)(2) <= mcm_output(280); -- input 9,2 <= 58 * ref[11]
    input(3)(9)(3) <= mcm_output(289); -- input 9,3 <= -2 * ref[12]

    -- Eq 10 Line 3
    input(3)(10)(0) <= mcm_output(238); -- input 10,0 <= -1 * ref[10]
    input(3)(10)(1) <= mcm_output(267); -- input 10,1 <= 10 * ref[11]
    input(3)(10)(2) <= mcm_output(307); -- input 10,2 <= 58 * ref[12]
    input(3)(10)(3) <= mcm_output(316); -- input 10,3 <= -2 * ref[13]

    -- Eq 11 Line 3
    input(3)(11)(0) <= mcm_output(265); -- input 11,0 <= -1 * ref[11]
    input(3)(11)(1) <= mcm_output(294); -- input 11,1 <= 10 * ref[12]
    input(3)(11)(2) <= mcm_output(334); -- input 11,2 <= 58 * ref[13]
    input(3)(11)(3) <= mcm_output(343); -- input 11,3 <= -2 * ref[14]

    -- Eq 12 Line 3
    input(3)(12)(0) <= mcm_output(292); -- input 12,0 <= -1 * ref[12]
    input(3)(12)(1) <= mcm_output(321); -- input 12,1 <= 10 * ref[13]
    input(3)(12)(2) <= mcm_output(361); -- input 12,2 <= 58 * ref[14]
    input(3)(12)(3) <= mcm_output(370); -- input 12,3 <= -2 * ref[15]

    -- Eq 13 Line 3
    input(3)(13)(0) <= mcm_output(319); -- input 13,0 <= -1 * ref[13]
    input(3)(13)(1) <= mcm_output(348); -- input 13,1 <= 10 * ref[14]
    input(3)(13)(2) <= mcm_output(388); -- input 13,2 <= 58 * ref[15]
    input(3)(13)(3) <= mcm_output(397); -- input 13,3 <= -2 * ref[16]

    -- Eq 14 Line 3
    input(3)(14)(0) <= mcm_output(346); -- input 14,0 <= -1 * ref[14]
    input(3)(14)(1) <= mcm_output(375); -- input 14,1 <= 10 * ref[15]
    input(3)(14)(2) <= mcm_output(415); -- input 14,2 <= 58 * ref[16]
    input(3)(14)(3) <= mcm_output(424); -- input 14,3 <= -2 * ref[17]

    -- Eq 15 Line 3
    input(3)(15)(0) <= mcm_output(373); -- input 15,0 <= -1 * ref[15]
    input(3)(15)(1) <= mcm_output(402); -- input 15,1 <= 10 * ref[16]
    input(3)(15)(2) <= mcm_output(442); -- input 15,2 <= 58 * ref[17]
    input(3)(15)(3) <= mcm_output(451); -- input 15,3 <= -2 * ref[18]

    -- Eq 16 Line 3
    input(3)(16)(0) <= mcm_output(400); -- input 16,0 <= -1 * ref[16]
    input(3)(16)(1) <= mcm_output(429); -- input 16,1 <= 10 * ref[17]
    input(3)(16)(2) <= mcm_output(469); -- input 16,2 <= 58 * ref[18]
    input(3)(16)(3) <= mcm_output(478); -- input 16,3 <= -2 * ref[19]

    -- Eq 17 Line 3
    input(3)(17)(0) <= mcm_output(427); -- input 17,0 <= -1 * ref[17]
    input(3)(17)(1) <= mcm_output(456); -- input 17,1 <= 10 * ref[18]
    input(3)(17)(2) <= mcm_output(496); -- input 17,2 <= 58 * ref[19]
    input(3)(17)(3) <= mcm_output(505); -- input 17,3 <= -2 * ref[20]

    -- Eq 18 Line 3
    input(3)(18)(0) <= mcm_output(454); -- input 18,0 <= -1 * ref[18]
    input(3)(18)(1) <= mcm_output(483); -- input 18,1 <= 10 * ref[19]
    input(3)(18)(2) <= mcm_output(523); -- input 18,2 <= 58 * ref[20]
    input(3)(18)(3) <= mcm_output(532); -- input 18,3 <= -2 * ref[21]

    -- Eq 19 Line 3
    input(3)(19)(0) <= mcm_output(481); -- input 19,0 <= -1 * ref[19]
    input(3)(19)(1) <= mcm_output(510); -- input 19,1 <= 10 * ref[20]
    input(3)(19)(2) <= mcm_output(550); -- input 19,2 <= 58 * ref[21]
    input(3)(19)(3) <= mcm_output(559); -- input 19,3 <= -2 * ref[22]

    -- Eq 20 Line 3
    input(3)(20)(0) <= mcm_output(508); -- input 20,0 <= -1 * ref[20]
    input(3)(20)(1) <= mcm_output(537); -- input 20,1 <= 10 * ref[21]
    input(3)(20)(2) <= mcm_output(577); -- input 20,2 <= 58 * ref[22]
    input(3)(20)(3) <= mcm_output(586); -- input 20,3 <= -2 * ref[23]

    -- Eq 21 Line 3
    input(3)(21)(0) <= mcm_output(535); -- input 21,0 <= -1 * ref[21]
    input(3)(21)(1) <= mcm_output(564); -- input 21,1 <= 10 * ref[22]
    input(3)(21)(2) <= mcm_output(604); -- input 21,2 <= 58 * ref[23]
    input(3)(21)(3) <= mcm_output(613); -- input 21,3 <= -2 * ref[24]

    -- Eq 22 Line 3
    input(3)(22)(0) <= mcm_output(562); -- input 22,0 <= -1 * ref[22]
    input(3)(22)(1) <= mcm_output(591); -- input 22,1 <= 10 * ref[23]
    input(3)(22)(2) <= mcm_output(631); -- input 22,2 <= 58 * ref[24]
    input(3)(22)(3) <= mcm_output(640); -- input 22,3 <= -2 * ref[25]

    -- Eq 23 Line 3
    input(3)(23)(0) <= mcm_output(589); -- input 23,0 <= -1 * ref[23]
    input(3)(23)(1) <= mcm_output(618); -- input 23,1 <= 10 * ref[24]
    input(3)(23)(2) <= mcm_output(658); -- input 23,2 <= 58 * ref[25]
    input(3)(23)(3) <= mcm_output(667); -- input 23,3 <= -2 * ref[26]

    -- Eq 24 Line 3
    input(3)(24)(0) <= mcm_output(616); -- input 24,0 <= -1 * ref[24]
    input(3)(24)(1) <= mcm_output(645); -- input 24,1 <= 10 * ref[25]
    input(3)(24)(2) <= mcm_output(685); -- input 24,2 <= 58 * ref[26]
    input(3)(24)(3) <= mcm_output(694); -- input 24,3 <= -2 * ref[27]

    -- Eq 25 Line 3
    input(3)(25)(0) <= mcm_output(643); -- input 25,0 <= -1 * ref[25]
    input(3)(25)(1) <= mcm_output(672); -- input 25,1 <= 10 * ref[26]
    input(3)(25)(2) <= mcm_output(712); -- input 25,2 <= 58 * ref[27]
    input(3)(25)(3) <= mcm_output(721); -- input 25,3 <= -2 * ref[28]

    -- Eq 26 Line 3
    input(3)(26)(0) <= mcm_output(670); -- input 26,0 <= -1 * ref[26]
    input(3)(26)(1) <= mcm_output(699); -- input 26,1 <= 10 * ref[27]
    input(3)(26)(2) <= mcm_output(739); -- input 26,2 <= 58 * ref[28]
    input(3)(26)(3) <= mcm_output(748); -- input 26,3 <= -2 * ref[29]

    -- Eq 27 Line 3
    input(3)(27)(0) <= mcm_output(697); -- input 27,0 <= -1 * ref[27]
    input(3)(27)(1) <= mcm_output(726); -- input 27,1 <= 10 * ref[28]
    input(3)(27)(2) <= mcm_output(766); -- input 27,2 <= 58 * ref[29]
    input(3)(27)(3) <= mcm_output(775); -- input 27,3 <= -2 * ref[30]

    -- Eq 28 Line 3
    input(3)(28)(0) <= mcm_output(724); -- input 28,0 <= -1 * ref[28]
    input(3)(28)(1) <= mcm_output(753); -- input 28,1 <= 10 * ref[29]
    input(3)(28)(2) <= mcm_output(793); -- input 28,2 <= 58 * ref[30]
    input(3)(28)(3) <= mcm_output(802); -- input 28,3 <= -2 * ref[31]

    -- Eq 29 Line 3
    input(3)(29)(0) <= mcm_output(751); -- input 29,0 <= -1 * ref[29]
    input(3)(29)(1) <= mcm_output(780); -- input 29,1 <= 10 * ref[30]
    input(3)(29)(2) <= mcm_output(820); -- input 29,2 <= 58 * ref[31]
    input(3)(29)(3) <= mcm_output(848); -- input 29,3 <= -2 * ref[32]

    -- Eq 30 Line 3
    input(3)(30)(0) <= mcm_output(778); -- input 30,0 <= -1 * ref[30]
    input(3)(30)(1) <= mcm_output(807); -- input 30,1 <= 10 * ref[31]
    input(3)(30)(2) <= mcm_output(840); -- input 30,2 <= 58 * ref[32]
    input(3)(30)(3) <= mcm_output(864); -- input 30,3 <= -2 * ref[33]

    -- Eq 31 Line 3
    input(3)(31)(0) <= mcm_output(805); -- input 31,0 <= -1 * ref[31]
    input(3)(31)(1) <= mcm_output(832); -- input 31,1 <= 10 * ref[32]
    input(3)(31)(2) <= mcm_output(856); -- input 31,2 <= 58 * ref[33]
    input(3)(31)(3) <= mcm_output(872); -- input 31,3 <= -2 * ref[34]

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
    input(4)(5)(3) <= mcm_output(204); -- input 5,3 <= 1 * ref[8]

    -- Eq 6 Line 4
    input(4)(6)(0) <= mcm_output(131); -- input 6,0 <= 14 * ref[6]
    input(4)(6)(1) <= mcm_output(165); -- input 6,1 <= 30 * ref[7]
    input(4)(6)(2) <= mcm_output(200); -- input 6,2 <= 17 * ref[8]
    input(4)(6)(3) <= mcm_output(231); -- input 6,3 <= 1 * ref[9]

    -- Eq 7 Line 4
    input(4)(7)(0) <= mcm_output(158); -- input 7,0 <= 14 * ref[7]
    input(4)(7)(1) <= mcm_output(192); -- input 7,1 <= 30 * ref[8]
    input(4)(7)(2) <= mcm_output(227); -- input 7,2 <= 17 * ref[9]
    input(4)(7)(3) <= mcm_output(258); -- input 7,3 <= 1 * ref[10]

    -- Eq 8 Line 4
    input(4)(8)(0) <= mcm_output(185); -- input 8,0 <= 14 * ref[8]
    input(4)(8)(1) <= mcm_output(219); -- input 8,1 <= 30 * ref[9]
    input(4)(8)(2) <= mcm_output(254); -- input 8,2 <= 17 * ref[10]
    input(4)(8)(3) <= mcm_output(285); -- input 8,3 <= 1 * ref[11]

    -- Eq 9 Line 4
    input(4)(9)(0) <= mcm_output(212); -- input 9,0 <= 14 * ref[9]
    input(4)(9)(1) <= mcm_output(246); -- input 9,1 <= 30 * ref[10]
    input(4)(9)(2) <= mcm_output(281); -- input 9,2 <= 17 * ref[11]
    input(4)(9)(3) <= mcm_output(312); -- input 9,3 <= 1 * ref[12]

    -- Eq 10 Line 4
    input(4)(10)(0) <= mcm_output(239); -- input 10,0 <= 14 * ref[10]
    input(4)(10)(1) <= mcm_output(273); -- input 10,1 <= 30 * ref[11]
    input(4)(10)(2) <= mcm_output(308); -- input 10,2 <= 17 * ref[12]
    input(4)(10)(3) <= mcm_output(339); -- input 10,3 <= 1 * ref[13]

    -- Eq 11 Line 4
    input(4)(11)(0) <= mcm_output(266); -- input 11,0 <= 14 * ref[11]
    input(4)(11)(1) <= mcm_output(300); -- input 11,1 <= 30 * ref[12]
    input(4)(11)(2) <= mcm_output(335); -- input 11,2 <= 17 * ref[13]
    input(4)(11)(3) <= mcm_output(366); -- input 11,3 <= 1 * ref[14]

    -- Eq 12 Line 4
    input(4)(12)(0) <= mcm_output(293); -- input 12,0 <= 14 * ref[12]
    input(4)(12)(1) <= mcm_output(327); -- input 12,1 <= 30 * ref[13]
    input(4)(12)(2) <= mcm_output(362); -- input 12,2 <= 17 * ref[14]
    input(4)(12)(3) <= mcm_output(393); -- input 12,3 <= 1 * ref[15]

    -- Eq 13 Line 4
    input(4)(13)(0) <= mcm_output(320); -- input 13,0 <= 14 * ref[13]
    input(4)(13)(1) <= mcm_output(354); -- input 13,1 <= 30 * ref[14]
    input(4)(13)(2) <= mcm_output(389); -- input 13,2 <= 17 * ref[15]
    input(4)(13)(3) <= mcm_output(420); -- input 13,3 <= 1 * ref[16]

    -- Eq 14 Line 4
    input(4)(14)(0) <= mcm_output(347); -- input 14,0 <= 14 * ref[14]
    input(4)(14)(1) <= mcm_output(381); -- input 14,1 <= 30 * ref[15]
    input(4)(14)(2) <= mcm_output(416); -- input 14,2 <= 17 * ref[16]
    input(4)(14)(3) <= mcm_output(447); -- input 14,3 <= 1 * ref[17]

    -- Eq 15 Line 4
    input(4)(15)(0) <= mcm_output(374); -- input 15,0 <= 14 * ref[15]
    input(4)(15)(1) <= mcm_output(408); -- input 15,1 <= 30 * ref[16]
    input(4)(15)(2) <= mcm_output(443); -- input 15,2 <= 17 * ref[17]
    input(4)(15)(3) <= mcm_output(474); -- input 15,3 <= 1 * ref[18]

    -- Eq 16 Line 4
    input(4)(16)(0) <= mcm_output(401); -- input 16,0 <= 14 * ref[16]
    input(4)(16)(1) <= mcm_output(435); -- input 16,1 <= 30 * ref[17]
    input(4)(16)(2) <= mcm_output(470); -- input 16,2 <= 17 * ref[18]
    input(4)(16)(3) <= mcm_output(501); -- input 16,3 <= 1 * ref[19]

    -- Eq 17 Line 4
    input(4)(17)(0) <= mcm_output(428); -- input 17,0 <= 14 * ref[17]
    input(4)(17)(1) <= mcm_output(462); -- input 17,1 <= 30 * ref[18]
    input(4)(17)(2) <= mcm_output(497); -- input 17,2 <= 17 * ref[19]
    input(4)(17)(3) <= mcm_output(528); -- input 17,3 <= 1 * ref[20]

    -- Eq 18 Line 4
    input(4)(18)(0) <= mcm_output(455); -- input 18,0 <= 14 * ref[18]
    input(4)(18)(1) <= mcm_output(489); -- input 18,1 <= 30 * ref[19]
    input(4)(18)(2) <= mcm_output(524); -- input 18,2 <= 17 * ref[20]
    input(4)(18)(3) <= mcm_output(555); -- input 18,3 <= 1 * ref[21]

    -- Eq 19 Line 4
    input(4)(19)(0) <= mcm_output(482); -- input 19,0 <= 14 * ref[19]
    input(4)(19)(1) <= mcm_output(516); -- input 19,1 <= 30 * ref[20]
    input(4)(19)(2) <= mcm_output(551); -- input 19,2 <= 17 * ref[21]
    input(4)(19)(3) <= mcm_output(582); -- input 19,3 <= 1 * ref[22]

    -- Eq 20 Line 4
    input(4)(20)(0) <= mcm_output(509); -- input 20,0 <= 14 * ref[20]
    input(4)(20)(1) <= mcm_output(543); -- input 20,1 <= 30 * ref[21]
    input(4)(20)(2) <= mcm_output(578); -- input 20,2 <= 17 * ref[22]
    input(4)(20)(3) <= mcm_output(609); -- input 20,3 <= 1 * ref[23]

    -- Eq 21 Line 4
    input(4)(21)(0) <= mcm_output(536); -- input 21,0 <= 14 * ref[21]
    input(4)(21)(1) <= mcm_output(570); -- input 21,1 <= 30 * ref[22]
    input(4)(21)(2) <= mcm_output(605); -- input 21,2 <= 17 * ref[23]
    input(4)(21)(3) <= mcm_output(636); -- input 21,3 <= 1 * ref[24]

    -- Eq 22 Line 4
    input(4)(22)(0) <= mcm_output(563); -- input 22,0 <= 14 * ref[22]
    input(4)(22)(1) <= mcm_output(597); -- input 22,1 <= 30 * ref[23]
    input(4)(22)(2) <= mcm_output(632); -- input 22,2 <= 17 * ref[24]
    input(4)(22)(3) <= mcm_output(663); -- input 22,3 <= 1 * ref[25]

    -- Eq 23 Line 4
    input(4)(23)(0) <= mcm_output(590); -- input 23,0 <= 14 * ref[23]
    input(4)(23)(1) <= mcm_output(624); -- input 23,1 <= 30 * ref[24]
    input(4)(23)(2) <= mcm_output(659); -- input 23,2 <= 17 * ref[25]
    input(4)(23)(3) <= mcm_output(690); -- input 23,3 <= 1 * ref[26]

    -- Eq 24 Line 4
    input(4)(24)(0) <= mcm_output(617); -- input 24,0 <= 14 * ref[24]
    input(4)(24)(1) <= mcm_output(651); -- input 24,1 <= 30 * ref[25]
    input(4)(24)(2) <= mcm_output(686); -- input 24,2 <= 17 * ref[26]
    input(4)(24)(3) <= mcm_output(717); -- input 24,3 <= 1 * ref[27]

    -- Eq 25 Line 4
    input(4)(25)(0) <= mcm_output(644); -- input 25,0 <= 14 * ref[25]
    input(4)(25)(1) <= mcm_output(678); -- input 25,1 <= 30 * ref[26]
    input(4)(25)(2) <= mcm_output(713); -- input 25,2 <= 17 * ref[27]
    input(4)(25)(3) <= mcm_output(744); -- input 25,3 <= 1 * ref[28]

    -- Eq 26 Line 4
    input(4)(26)(0) <= mcm_output(671); -- input 26,0 <= 14 * ref[26]
    input(4)(26)(1) <= mcm_output(705); -- input 26,1 <= 30 * ref[27]
    input(4)(26)(2) <= mcm_output(740); -- input 26,2 <= 17 * ref[28]
    input(4)(26)(3) <= mcm_output(771); -- input 26,3 <= 1 * ref[29]

    -- Eq 27 Line 4
    input(4)(27)(0) <= mcm_output(698); -- input 27,0 <= 14 * ref[27]
    input(4)(27)(1) <= mcm_output(732); -- input 27,1 <= 30 * ref[28]
    input(4)(27)(2) <= mcm_output(767); -- input 27,2 <= 17 * ref[29]
    input(4)(27)(3) <= mcm_output(798); -- input 27,3 <= 1 * ref[30]

    -- Eq 28 Line 4
    input(4)(28)(0) <= mcm_output(725); -- input 28,0 <= 14 * ref[28]
    input(4)(28)(1) <= mcm_output(759); -- input 28,1 <= 30 * ref[29]
    input(4)(28)(2) <= mcm_output(794); -- input 28,2 <= 17 * ref[30]
    input(4)(28)(3) <= mcm_output(825); -- input 28,3 <= 1 * ref[31]

    -- Eq 29 Line 4
    input(4)(29)(0) <= mcm_output(752); -- input 29,0 <= 14 * ref[29]
    input(4)(29)(1) <= mcm_output(786); -- input 29,1 <= 30 * ref[30]
    input(4)(29)(2) <= mcm_output(821); -- input 29,2 <= 17 * ref[31]
    input(4)(29)(3) <= mcm_output(849); -- input 29,3 <= 1 * ref[32]

    -- Eq 30 Line 4
    input(4)(30)(0) <= mcm_output(779); -- input 30,0 <= 14 * ref[30]
    input(4)(30)(1) <= mcm_output(813); -- input 30,1 <= 30 * ref[31]
    input(4)(30)(2) <= mcm_output(841); -- input 30,2 <= 17 * ref[32]
    input(4)(30)(3) <= mcm_output(865); -- input 30,3 <= 1 * ref[33]

    -- Eq 31 Line 4
    input(4)(31)(0) <= mcm_output(806); -- input 31,0 <= 14 * ref[31]
    input(4)(31)(1) <= mcm_output(833); -- input 31,1 <= 30 * ref[32]
    input(4)(31)(2) <= mcm_output(857); -- input 31,2 <= 17 * ref[33]
    input(4)(31)(3) <= mcm_output(873); -- input 31,3 <= 1 * ref[34]

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
    input(5)(5)(3) <= mcm_output(205); -- input 5,3 <= 5 * ref[8]

    -- Eq 6 Line 5
    input(5)(6)(0) <= mcm_output(132); -- input 6,0 <= 10 * ref[6]
    input(5)(6)(1) <= mcm_output(166); -- input 6,1 <= 26 * ref[7]
    input(5)(6)(2) <= mcm_output(201); -- input 6,2 <= 21 * ref[8]
    input(5)(6)(3) <= mcm_output(232); -- input 6,3 <= 5 * ref[9]

    -- Eq 7 Line 5
    input(5)(7)(0) <= mcm_output(159); -- input 7,0 <= 10 * ref[7]
    input(5)(7)(1) <= mcm_output(193); -- input 7,1 <= 26 * ref[8]
    input(5)(7)(2) <= mcm_output(228); -- input 7,2 <= 21 * ref[9]
    input(5)(7)(3) <= mcm_output(259); -- input 7,3 <= 5 * ref[10]

    -- Eq 8 Line 5
    input(5)(8)(0) <= mcm_output(186); -- input 8,0 <= 10 * ref[8]
    input(5)(8)(1) <= mcm_output(220); -- input 8,1 <= 26 * ref[9]
    input(5)(8)(2) <= mcm_output(255); -- input 8,2 <= 21 * ref[10]
    input(5)(8)(3) <= mcm_output(286); -- input 8,3 <= 5 * ref[11]

    -- Eq 9 Line 5
    input(5)(9)(0) <= mcm_output(213); -- input 9,0 <= 10 * ref[9]
    input(5)(9)(1) <= mcm_output(247); -- input 9,1 <= 26 * ref[10]
    input(5)(9)(2) <= mcm_output(282); -- input 9,2 <= 21 * ref[11]
    input(5)(9)(3) <= mcm_output(313); -- input 9,3 <= 5 * ref[12]

    -- Eq 10 Line 5
    input(5)(10)(0) <= mcm_output(240); -- input 10,0 <= 10 * ref[10]
    input(5)(10)(1) <= mcm_output(274); -- input 10,1 <= 26 * ref[11]
    input(5)(10)(2) <= mcm_output(309); -- input 10,2 <= 21 * ref[12]
    input(5)(10)(3) <= mcm_output(340); -- input 10,3 <= 5 * ref[13]

    -- Eq 11 Line 5
    input(5)(11)(0) <= mcm_output(267); -- input 11,0 <= 10 * ref[11]
    input(5)(11)(1) <= mcm_output(301); -- input 11,1 <= 26 * ref[12]
    input(5)(11)(2) <= mcm_output(336); -- input 11,2 <= 21 * ref[13]
    input(5)(11)(3) <= mcm_output(367); -- input 11,3 <= 5 * ref[14]

    -- Eq 12 Line 5
    input(5)(12)(0) <= mcm_output(294); -- input 12,0 <= 10 * ref[12]
    input(5)(12)(1) <= mcm_output(328); -- input 12,1 <= 26 * ref[13]
    input(5)(12)(2) <= mcm_output(363); -- input 12,2 <= 21 * ref[14]
    input(5)(12)(3) <= mcm_output(394); -- input 12,3 <= 5 * ref[15]

    -- Eq 13 Line 5
    input(5)(13)(0) <= mcm_output(321); -- input 13,0 <= 10 * ref[13]
    input(5)(13)(1) <= mcm_output(355); -- input 13,1 <= 26 * ref[14]
    input(5)(13)(2) <= mcm_output(390); -- input 13,2 <= 21 * ref[15]
    input(5)(13)(3) <= mcm_output(421); -- input 13,3 <= 5 * ref[16]

    -- Eq 14 Line 5
    input(5)(14)(0) <= mcm_output(348); -- input 14,0 <= 10 * ref[14]
    input(5)(14)(1) <= mcm_output(382); -- input 14,1 <= 26 * ref[15]
    input(5)(14)(2) <= mcm_output(417); -- input 14,2 <= 21 * ref[16]
    input(5)(14)(3) <= mcm_output(448); -- input 14,3 <= 5 * ref[17]

    -- Eq 15 Line 5
    input(5)(15)(0) <= mcm_output(375); -- input 15,0 <= 10 * ref[15]
    input(5)(15)(1) <= mcm_output(409); -- input 15,1 <= 26 * ref[16]
    input(5)(15)(2) <= mcm_output(444); -- input 15,2 <= 21 * ref[17]
    input(5)(15)(3) <= mcm_output(475); -- input 15,3 <= 5 * ref[18]

    -- Eq 16 Line 5
    input(5)(16)(0) <= mcm_output(402); -- input 16,0 <= 10 * ref[16]
    input(5)(16)(1) <= mcm_output(436); -- input 16,1 <= 26 * ref[17]
    input(5)(16)(2) <= mcm_output(471); -- input 16,2 <= 21 * ref[18]
    input(5)(16)(3) <= mcm_output(502); -- input 16,3 <= 5 * ref[19]

    -- Eq 17 Line 5
    input(5)(17)(0) <= mcm_output(429); -- input 17,0 <= 10 * ref[17]
    input(5)(17)(1) <= mcm_output(463); -- input 17,1 <= 26 * ref[18]
    input(5)(17)(2) <= mcm_output(498); -- input 17,2 <= 21 * ref[19]
    input(5)(17)(3) <= mcm_output(529); -- input 17,3 <= 5 * ref[20]

    -- Eq 18 Line 5
    input(5)(18)(0) <= mcm_output(456); -- input 18,0 <= 10 * ref[18]
    input(5)(18)(1) <= mcm_output(490); -- input 18,1 <= 26 * ref[19]
    input(5)(18)(2) <= mcm_output(525); -- input 18,2 <= 21 * ref[20]
    input(5)(18)(3) <= mcm_output(556); -- input 18,3 <= 5 * ref[21]

    -- Eq 19 Line 5
    input(5)(19)(0) <= mcm_output(483); -- input 19,0 <= 10 * ref[19]
    input(5)(19)(1) <= mcm_output(517); -- input 19,1 <= 26 * ref[20]
    input(5)(19)(2) <= mcm_output(552); -- input 19,2 <= 21 * ref[21]
    input(5)(19)(3) <= mcm_output(583); -- input 19,3 <= 5 * ref[22]

    -- Eq 20 Line 5
    input(5)(20)(0) <= mcm_output(510); -- input 20,0 <= 10 * ref[20]
    input(5)(20)(1) <= mcm_output(544); -- input 20,1 <= 26 * ref[21]
    input(5)(20)(2) <= mcm_output(579); -- input 20,2 <= 21 * ref[22]
    input(5)(20)(3) <= mcm_output(610); -- input 20,3 <= 5 * ref[23]

    -- Eq 21 Line 5
    input(5)(21)(0) <= mcm_output(537); -- input 21,0 <= 10 * ref[21]
    input(5)(21)(1) <= mcm_output(571); -- input 21,1 <= 26 * ref[22]
    input(5)(21)(2) <= mcm_output(606); -- input 21,2 <= 21 * ref[23]
    input(5)(21)(3) <= mcm_output(637); -- input 21,3 <= 5 * ref[24]

    -- Eq 22 Line 5
    input(5)(22)(0) <= mcm_output(564); -- input 22,0 <= 10 * ref[22]
    input(5)(22)(1) <= mcm_output(598); -- input 22,1 <= 26 * ref[23]
    input(5)(22)(2) <= mcm_output(633); -- input 22,2 <= 21 * ref[24]
    input(5)(22)(3) <= mcm_output(664); -- input 22,3 <= 5 * ref[25]

    -- Eq 23 Line 5
    input(5)(23)(0) <= mcm_output(591); -- input 23,0 <= 10 * ref[23]
    input(5)(23)(1) <= mcm_output(625); -- input 23,1 <= 26 * ref[24]
    input(5)(23)(2) <= mcm_output(660); -- input 23,2 <= 21 * ref[25]
    input(5)(23)(3) <= mcm_output(691); -- input 23,3 <= 5 * ref[26]

    -- Eq 24 Line 5
    input(5)(24)(0) <= mcm_output(618); -- input 24,0 <= 10 * ref[24]
    input(5)(24)(1) <= mcm_output(652); -- input 24,1 <= 26 * ref[25]
    input(5)(24)(2) <= mcm_output(687); -- input 24,2 <= 21 * ref[26]
    input(5)(24)(3) <= mcm_output(718); -- input 24,3 <= 5 * ref[27]

    -- Eq 25 Line 5
    input(5)(25)(0) <= mcm_output(645); -- input 25,0 <= 10 * ref[25]
    input(5)(25)(1) <= mcm_output(679); -- input 25,1 <= 26 * ref[26]
    input(5)(25)(2) <= mcm_output(714); -- input 25,2 <= 21 * ref[27]
    input(5)(25)(3) <= mcm_output(745); -- input 25,3 <= 5 * ref[28]

    -- Eq 26 Line 5
    input(5)(26)(0) <= mcm_output(672); -- input 26,0 <= 10 * ref[26]
    input(5)(26)(1) <= mcm_output(706); -- input 26,1 <= 26 * ref[27]
    input(5)(26)(2) <= mcm_output(741); -- input 26,2 <= 21 * ref[28]
    input(5)(26)(3) <= mcm_output(772); -- input 26,3 <= 5 * ref[29]

    -- Eq 27 Line 5
    input(5)(27)(0) <= mcm_output(699); -- input 27,0 <= 10 * ref[27]
    input(5)(27)(1) <= mcm_output(733); -- input 27,1 <= 26 * ref[28]
    input(5)(27)(2) <= mcm_output(768); -- input 27,2 <= 21 * ref[29]
    input(5)(27)(3) <= mcm_output(799); -- input 27,3 <= 5 * ref[30]

    -- Eq 28 Line 5
    input(5)(28)(0) <= mcm_output(726); -- input 28,0 <= 10 * ref[28]
    input(5)(28)(1) <= mcm_output(760); -- input 28,1 <= 26 * ref[29]
    input(5)(28)(2) <= mcm_output(795); -- input 28,2 <= 21 * ref[30]
    input(5)(28)(3) <= mcm_output(826); -- input 28,3 <= 5 * ref[31]

    -- Eq 29 Line 5
    input(5)(29)(0) <= mcm_output(753); -- input 29,0 <= 10 * ref[29]
    input(5)(29)(1) <= mcm_output(787); -- input 29,1 <= 26 * ref[30]
    input(5)(29)(2) <= mcm_output(822); -- input 29,2 <= 21 * ref[31]
    input(5)(29)(3) <= mcm_output(850); -- input 29,3 <= 5 * ref[32]

    -- Eq 30 Line 5
    input(5)(30)(0) <= mcm_output(780); -- input 30,0 <= 10 * ref[30]
    input(5)(30)(1) <= mcm_output(814); -- input 30,1 <= 26 * ref[31]
    input(5)(30)(2) <= mcm_output(842); -- input 30,2 <= 21 * ref[32]
    input(5)(30)(3) <= mcm_output(866); -- input 30,3 <= 5 * ref[33]

    -- Eq 31 Line 5
    input(5)(31)(0) <= mcm_output(807); -- input 31,0 <= 10 * ref[31]
    input(5)(31)(1) <= mcm_output(834); -- input 31,1 <= 26 * ref[32]
    input(5)(31)(2) <= mcm_output(858); -- input 31,2 <= 21 * ref[33]
    input(5)(31)(3) <= mcm_output(874); -- input 31,3 <= 5 * ref[34]

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
    input(6)(5)(3) <= mcm_output(206); -- input 5,3 <= 9 * ref[8]

    -- Eq 6 Line 6
    input(6)(6)(0) <= mcm_output(133); -- input 6,0 <= 6 * ref[6]
    input(6)(6)(1) <= mcm_output(167); -- input 6,1 <= 22 * ref[7]
    input(6)(6)(2) <= mcm_output(202); -- input 6,2 <= 25 * ref[8]
    input(6)(6)(3) <= mcm_output(233); -- input 6,3 <= 9 * ref[9]

    -- Eq 7 Line 6
    input(6)(7)(0) <= mcm_output(160); -- input 7,0 <= 6 * ref[7]
    input(6)(7)(1) <= mcm_output(194); -- input 7,1 <= 22 * ref[8]
    input(6)(7)(2) <= mcm_output(229); -- input 7,2 <= 25 * ref[9]
    input(6)(7)(3) <= mcm_output(260); -- input 7,3 <= 9 * ref[10]

    -- Eq 8 Line 6
    input(6)(8)(0) <= mcm_output(187); -- input 8,0 <= 6 * ref[8]
    input(6)(8)(1) <= mcm_output(221); -- input 8,1 <= 22 * ref[9]
    input(6)(8)(2) <= mcm_output(256); -- input 8,2 <= 25 * ref[10]
    input(6)(8)(3) <= mcm_output(287); -- input 8,3 <= 9 * ref[11]

    -- Eq 9 Line 6
    input(6)(9)(0) <= mcm_output(214); -- input 9,0 <= 6 * ref[9]
    input(6)(9)(1) <= mcm_output(248); -- input 9,1 <= 22 * ref[10]
    input(6)(9)(2) <= mcm_output(283); -- input 9,2 <= 25 * ref[11]
    input(6)(9)(3) <= mcm_output(314); -- input 9,3 <= 9 * ref[12]

    -- Eq 10 Line 6
    input(6)(10)(0) <= mcm_output(241); -- input 10,0 <= 6 * ref[10]
    input(6)(10)(1) <= mcm_output(275); -- input 10,1 <= 22 * ref[11]
    input(6)(10)(2) <= mcm_output(310); -- input 10,2 <= 25 * ref[12]
    input(6)(10)(3) <= mcm_output(341); -- input 10,3 <= 9 * ref[13]

    -- Eq 11 Line 6
    input(6)(11)(0) <= mcm_output(268); -- input 11,0 <= 6 * ref[11]
    input(6)(11)(1) <= mcm_output(302); -- input 11,1 <= 22 * ref[12]
    input(6)(11)(2) <= mcm_output(337); -- input 11,2 <= 25 * ref[13]
    input(6)(11)(3) <= mcm_output(368); -- input 11,3 <= 9 * ref[14]

    -- Eq 12 Line 6
    input(6)(12)(0) <= mcm_output(295); -- input 12,0 <= 6 * ref[12]
    input(6)(12)(1) <= mcm_output(329); -- input 12,1 <= 22 * ref[13]
    input(6)(12)(2) <= mcm_output(364); -- input 12,2 <= 25 * ref[14]
    input(6)(12)(3) <= mcm_output(395); -- input 12,3 <= 9 * ref[15]

    -- Eq 13 Line 6
    input(6)(13)(0) <= mcm_output(322); -- input 13,0 <= 6 * ref[13]
    input(6)(13)(1) <= mcm_output(356); -- input 13,1 <= 22 * ref[14]
    input(6)(13)(2) <= mcm_output(391); -- input 13,2 <= 25 * ref[15]
    input(6)(13)(3) <= mcm_output(422); -- input 13,3 <= 9 * ref[16]

    -- Eq 14 Line 6
    input(6)(14)(0) <= mcm_output(349); -- input 14,0 <= 6 * ref[14]
    input(6)(14)(1) <= mcm_output(383); -- input 14,1 <= 22 * ref[15]
    input(6)(14)(2) <= mcm_output(418); -- input 14,2 <= 25 * ref[16]
    input(6)(14)(3) <= mcm_output(449); -- input 14,3 <= 9 * ref[17]

    -- Eq 15 Line 6
    input(6)(15)(0) <= mcm_output(376); -- input 15,0 <= 6 * ref[15]
    input(6)(15)(1) <= mcm_output(410); -- input 15,1 <= 22 * ref[16]
    input(6)(15)(2) <= mcm_output(445); -- input 15,2 <= 25 * ref[17]
    input(6)(15)(3) <= mcm_output(476); -- input 15,3 <= 9 * ref[18]

    -- Eq 16 Line 6
    input(6)(16)(0) <= mcm_output(403); -- input 16,0 <= 6 * ref[16]
    input(6)(16)(1) <= mcm_output(437); -- input 16,1 <= 22 * ref[17]
    input(6)(16)(2) <= mcm_output(472); -- input 16,2 <= 25 * ref[18]
    input(6)(16)(3) <= mcm_output(503); -- input 16,3 <= 9 * ref[19]

    -- Eq 17 Line 6
    input(6)(17)(0) <= mcm_output(430); -- input 17,0 <= 6 * ref[17]
    input(6)(17)(1) <= mcm_output(464); -- input 17,1 <= 22 * ref[18]
    input(6)(17)(2) <= mcm_output(499); -- input 17,2 <= 25 * ref[19]
    input(6)(17)(3) <= mcm_output(530); -- input 17,3 <= 9 * ref[20]

    -- Eq 18 Line 6
    input(6)(18)(0) <= mcm_output(457); -- input 18,0 <= 6 * ref[18]
    input(6)(18)(1) <= mcm_output(491); -- input 18,1 <= 22 * ref[19]
    input(6)(18)(2) <= mcm_output(526); -- input 18,2 <= 25 * ref[20]
    input(6)(18)(3) <= mcm_output(557); -- input 18,3 <= 9 * ref[21]

    -- Eq 19 Line 6
    input(6)(19)(0) <= mcm_output(484); -- input 19,0 <= 6 * ref[19]
    input(6)(19)(1) <= mcm_output(518); -- input 19,1 <= 22 * ref[20]
    input(6)(19)(2) <= mcm_output(553); -- input 19,2 <= 25 * ref[21]
    input(6)(19)(3) <= mcm_output(584); -- input 19,3 <= 9 * ref[22]

    -- Eq 20 Line 6
    input(6)(20)(0) <= mcm_output(511); -- input 20,0 <= 6 * ref[20]
    input(6)(20)(1) <= mcm_output(545); -- input 20,1 <= 22 * ref[21]
    input(6)(20)(2) <= mcm_output(580); -- input 20,2 <= 25 * ref[22]
    input(6)(20)(3) <= mcm_output(611); -- input 20,3 <= 9 * ref[23]

    -- Eq 21 Line 6
    input(6)(21)(0) <= mcm_output(538); -- input 21,0 <= 6 * ref[21]
    input(6)(21)(1) <= mcm_output(572); -- input 21,1 <= 22 * ref[22]
    input(6)(21)(2) <= mcm_output(607); -- input 21,2 <= 25 * ref[23]
    input(6)(21)(3) <= mcm_output(638); -- input 21,3 <= 9 * ref[24]

    -- Eq 22 Line 6
    input(6)(22)(0) <= mcm_output(565); -- input 22,0 <= 6 * ref[22]
    input(6)(22)(1) <= mcm_output(599); -- input 22,1 <= 22 * ref[23]
    input(6)(22)(2) <= mcm_output(634); -- input 22,2 <= 25 * ref[24]
    input(6)(22)(3) <= mcm_output(665); -- input 22,3 <= 9 * ref[25]

    -- Eq 23 Line 6
    input(6)(23)(0) <= mcm_output(592); -- input 23,0 <= 6 * ref[23]
    input(6)(23)(1) <= mcm_output(626); -- input 23,1 <= 22 * ref[24]
    input(6)(23)(2) <= mcm_output(661); -- input 23,2 <= 25 * ref[25]
    input(6)(23)(3) <= mcm_output(692); -- input 23,3 <= 9 * ref[26]

    -- Eq 24 Line 6
    input(6)(24)(0) <= mcm_output(619); -- input 24,0 <= 6 * ref[24]
    input(6)(24)(1) <= mcm_output(653); -- input 24,1 <= 22 * ref[25]
    input(6)(24)(2) <= mcm_output(688); -- input 24,2 <= 25 * ref[26]
    input(6)(24)(3) <= mcm_output(719); -- input 24,3 <= 9 * ref[27]

    -- Eq 25 Line 6
    input(6)(25)(0) <= mcm_output(646); -- input 25,0 <= 6 * ref[25]
    input(6)(25)(1) <= mcm_output(680); -- input 25,1 <= 22 * ref[26]
    input(6)(25)(2) <= mcm_output(715); -- input 25,2 <= 25 * ref[27]
    input(6)(25)(3) <= mcm_output(746); -- input 25,3 <= 9 * ref[28]

    -- Eq 26 Line 6
    input(6)(26)(0) <= mcm_output(673); -- input 26,0 <= 6 * ref[26]
    input(6)(26)(1) <= mcm_output(707); -- input 26,1 <= 22 * ref[27]
    input(6)(26)(2) <= mcm_output(742); -- input 26,2 <= 25 * ref[28]
    input(6)(26)(3) <= mcm_output(773); -- input 26,3 <= 9 * ref[29]

    -- Eq 27 Line 6
    input(6)(27)(0) <= mcm_output(700); -- input 27,0 <= 6 * ref[27]
    input(6)(27)(1) <= mcm_output(734); -- input 27,1 <= 22 * ref[28]
    input(6)(27)(2) <= mcm_output(769); -- input 27,2 <= 25 * ref[29]
    input(6)(27)(3) <= mcm_output(800); -- input 27,3 <= 9 * ref[30]

    -- Eq 28 Line 6
    input(6)(28)(0) <= mcm_output(727); -- input 28,0 <= 6 * ref[28]
    input(6)(28)(1) <= mcm_output(761); -- input 28,1 <= 22 * ref[29]
    input(6)(28)(2) <= mcm_output(796); -- input 28,2 <= 25 * ref[30]
    input(6)(28)(3) <= mcm_output(827); -- input 28,3 <= 9 * ref[31]

    -- Eq 29 Line 6
    input(6)(29)(0) <= mcm_output(754); -- input 29,0 <= 6 * ref[29]
    input(6)(29)(1) <= mcm_output(788); -- input 29,1 <= 22 * ref[30]
    input(6)(29)(2) <= mcm_output(823); -- input 29,2 <= 25 * ref[31]
    input(6)(29)(3) <= mcm_output(851); -- input 29,3 <= 9 * ref[32]

    -- Eq 30 Line 6
    input(6)(30)(0) <= mcm_output(781); -- input 30,0 <= 6 * ref[30]
    input(6)(30)(1) <= mcm_output(815); -- input 30,1 <= 22 * ref[31]
    input(6)(30)(2) <= mcm_output(843); -- input 30,2 <= 25 * ref[32]
    input(6)(30)(3) <= mcm_output(867); -- input 30,3 <= 9 * ref[33]

    -- Eq 31 Line 6
    input(6)(31)(0) <= mcm_output(808); -- input 31,0 <= 6 * ref[31]
    input(6)(31)(1) <= mcm_output(835); -- input 31,1 <= 22 * ref[32]
    input(6)(31)(2) <= mcm_output(859); -- input 31,2 <= 25 * ref[33]
    input(6)(31)(3) <= mcm_output(875); -- input 31,3 <= 9 * ref[34]

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
    input(7)(5)(3) <= mcm_output(207); -- input 5,3 <= 13 * ref[8]

    -- Eq 6 Line 7
    input(7)(6)(0) <= mcm_output(134); -- input 6,0 <= 2 * ref[6]
    input(7)(6)(1) <= mcm_output(168); -- input 6,1 <= 18 * ref[7]
    input(7)(6)(2) <= mcm_output(203); -- input 6,2 <= 29 * ref[8]
    input(7)(6)(3) <= mcm_output(234); -- input 6,3 <= 13 * ref[9]

    -- Eq 7 Line 7
    input(7)(7)(0) <= mcm_output(161); -- input 7,0 <= 2 * ref[7]
    input(7)(7)(1) <= mcm_output(195); -- input 7,1 <= 18 * ref[8]
    input(7)(7)(2) <= mcm_output(230); -- input 7,2 <= 29 * ref[9]
    input(7)(7)(3) <= mcm_output(261); -- input 7,3 <= 13 * ref[10]

    -- Eq 8 Line 7
    input(7)(8)(0) <= mcm_output(188); -- input 8,0 <= 2 * ref[8]
    input(7)(8)(1) <= mcm_output(222); -- input 8,1 <= 18 * ref[9]
    input(7)(8)(2) <= mcm_output(257); -- input 8,2 <= 29 * ref[10]
    input(7)(8)(3) <= mcm_output(288); -- input 8,3 <= 13 * ref[11]

    -- Eq 9 Line 7
    input(7)(9)(0) <= mcm_output(215); -- input 9,0 <= 2 * ref[9]
    input(7)(9)(1) <= mcm_output(249); -- input 9,1 <= 18 * ref[10]
    input(7)(9)(2) <= mcm_output(284); -- input 9,2 <= 29 * ref[11]
    input(7)(9)(3) <= mcm_output(315); -- input 9,3 <= 13 * ref[12]

    -- Eq 10 Line 7
    input(7)(10)(0) <= mcm_output(242); -- input 10,0 <= 2 * ref[10]
    input(7)(10)(1) <= mcm_output(276); -- input 10,1 <= 18 * ref[11]
    input(7)(10)(2) <= mcm_output(311); -- input 10,2 <= 29 * ref[12]
    input(7)(10)(3) <= mcm_output(342); -- input 10,3 <= 13 * ref[13]

    -- Eq 11 Line 7
    input(7)(11)(0) <= mcm_output(269); -- input 11,0 <= 2 * ref[11]
    input(7)(11)(1) <= mcm_output(303); -- input 11,1 <= 18 * ref[12]
    input(7)(11)(2) <= mcm_output(338); -- input 11,2 <= 29 * ref[13]
    input(7)(11)(3) <= mcm_output(369); -- input 11,3 <= 13 * ref[14]

    -- Eq 12 Line 7
    input(7)(12)(0) <= mcm_output(296); -- input 12,0 <= 2 * ref[12]
    input(7)(12)(1) <= mcm_output(330); -- input 12,1 <= 18 * ref[13]
    input(7)(12)(2) <= mcm_output(365); -- input 12,2 <= 29 * ref[14]
    input(7)(12)(3) <= mcm_output(396); -- input 12,3 <= 13 * ref[15]

    -- Eq 13 Line 7
    input(7)(13)(0) <= mcm_output(323); -- input 13,0 <= 2 * ref[13]
    input(7)(13)(1) <= mcm_output(357); -- input 13,1 <= 18 * ref[14]
    input(7)(13)(2) <= mcm_output(392); -- input 13,2 <= 29 * ref[15]
    input(7)(13)(3) <= mcm_output(423); -- input 13,3 <= 13 * ref[16]

    -- Eq 14 Line 7
    input(7)(14)(0) <= mcm_output(350); -- input 14,0 <= 2 * ref[14]
    input(7)(14)(1) <= mcm_output(384); -- input 14,1 <= 18 * ref[15]
    input(7)(14)(2) <= mcm_output(419); -- input 14,2 <= 29 * ref[16]
    input(7)(14)(3) <= mcm_output(450); -- input 14,3 <= 13 * ref[17]

    -- Eq 15 Line 7
    input(7)(15)(0) <= mcm_output(377); -- input 15,0 <= 2 * ref[15]
    input(7)(15)(1) <= mcm_output(411); -- input 15,1 <= 18 * ref[16]
    input(7)(15)(2) <= mcm_output(446); -- input 15,2 <= 29 * ref[17]
    input(7)(15)(3) <= mcm_output(477); -- input 15,3 <= 13 * ref[18]

    -- Eq 16 Line 7
    input(7)(16)(0) <= mcm_output(404); -- input 16,0 <= 2 * ref[16]
    input(7)(16)(1) <= mcm_output(438); -- input 16,1 <= 18 * ref[17]
    input(7)(16)(2) <= mcm_output(473); -- input 16,2 <= 29 * ref[18]
    input(7)(16)(3) <= mcm_output(504); -- input 16,3 <= 13 * ref[19]

    -- Eq 17 Line 7
    input(7)(17)(0) <= mcm_output(431); -- input 17,0 <= 2 * ref[17]
    input(7)(17)(1) <= mcm_output(465); -- input 17,1 <= 18 * ref[18]
    input(7)(17)(2) <= mcm_output(500); -- input 17,2 <= 29 * ref[19]
    input(7)(17)(3) <= mcm_output(531); -- input 17,3 <= 13 * ref[20]

    -- Eq 18 Line 7
    input(7)(18)(0) <= mcm_output(458); -- input 18,0 <= 2 * ref[18]
    input(7)(18)(1) <= mcm_output(492); -- input 18,1 <= 18 * ref[19]
    input(7)(18)(2) <= mcm_output(527); -- input 18,2 <= 29 * ref[20]
    input(7)(18)(3) <= mcm_output(558); -- input 18,3 <= 13 * ref[21]

    -- Eq 19 Line 7
    input(7)(19)(0) <= mcm_output(485); -- input 19,0 <= 2 * ref[19]
    input(7)(19)(1) <= mcm_output(519); -- input 19,1 <= 18 * ref[20]
    input(7)(19)(2) <= mcm_output(554); -- input 19,2 <= 29 * ref[21]
    input(7)(19)(3) <= mcm_output(585); -- input 19,3 <= 13 * ref[22]

    -- Eq 20 Line 7
    input(7)(20)(0) <= mcm_output(512); -- input 20,0 <= 2 * ref[20]
    input(7)(20)(1) <= mcm_output(546); -- input 20,1 <= 18 * ref[21]
    input(7)(20)(2) <= mcm_output(581); -- input 20,2 <= 29 * ref[22]
    input(7)(20)(3) <= mcm_output(612); -- input 20,3 <= 13 * ref[23]

    -- Eq 21 Line 7
    input(7)(21)(0) <= mcm_output(539); -- input 21,0 <= 2 * ref[21]
    input(7)(21)(1) <= mcm_output(573); -- input 21,1 <= 18 * ref[22]
    input(7)(21)(2) <= mcm_output(608); -- input 21,2 <= 29 * ref[23]
    input(7)(21)(3) <= mcm_output(639); -- input 21,3 <= 13 * ref[24]

    -- Eq 22 Line 7
    input(7)(22)(0) <= mcm_output(566); -- input 22,0 <= 2 * ref[22]
    input(7)(22)(1) <= mcm_output(600); -- input 22,1 <= 18 * ref[23]
    input(7)(22)(2) <= mcm_output(635); -- input 22,2 <= 29 * ref[24]
    input(7)(22)(3) <= mcm_output(666); -- input 22,3 <= 13 * ref[25]

    -- Eq 23 Line 7
    input(7)(23)(0) <= mcm_output(593); -- input 23,0 <= 2 * ref[23]
    input(7)(23)(1) <= mcm_output(627); -- input 23,1 <= 18 * ref[24]
    input(7)(23)(2) <= mcm_output(662); -- input 23,2 <= 29 * ref[25]
    input(7)(23)(3) <= mcm_output(693); -- input 23,3 <= 13 * ref[26]

    -- Eq 24 Line 7
    input(7)(24)(0) <= mcm_output(620); -- input 24,0 <= 2 * ref[24]
    input(7)(24)(1) <= mcm_output(654); -- input 24,1 <= 18 * ref[25]
    input(7)(24)(2) <= mcm_output(689); -- input 24,2 <= 29 * ref[26]
    input(7)(24)(3) <= mcm_output(720); -- input 24,3 <= 13 * ref[27]

    -- Eq 25 Line 7
    input(7)(25)(0) <= mcm_output(647); -- input 25,0 <= 2 * ref[25]
    input(7)(25)(1) <= mcm_output(681); -- input 25,1 <= 18 * ref[26]
    input(7)(25)(2) <= mcm_output(716); -- input 25,2 <= 29 * ref[27]
    input(7)(25)(3) <= mcm_output(747); -- input 25,3 <= 13 * ref[28]

    -- Eq 26 Line 7
    input(7)(26)(0) <= mcm_output(674); -- input 26,0 <= 2 * ref[26]
    input(7)(26)(1) <= mcm_output(708); -- input 26,1 <= 18 * ref[27]
    input(7)(26)(2) <= mcm_output(743); -- input 26,2 <= 29 * ref[28]
    input(7)(26)(3) <= mcm_output(774); -- input 26,3 <= 13 * ref[29]

    -- Eq 27 Line 7
    input(7)(27)(0) <= mcm_output(701); -- input 27,0 <= 2 * ref[27]
    input(7)(27)(1) <= mcm_output(735); -- input 27,1 <= 18 * ref[28]
    input(7)(27)(2) <= mcm_output(770); -- input 27,2 <= 29 * ref[29]
    input(7)(27)(3) <= mcm_output(801); -- input 27,3 <= 13 * ref[30]

    -- Eq 28 Line 7
    input(7)(28)(0) <= mcm_output(728); -- input 28,0 <= 2 * ref[28]
    input(7)(28)(1) <= mcm_output(762); -- input 28,1 <= 18 * ref[29]
    input(7)(28)(2) <= mcm_output(797); -- input 28,2 <= 29 * ref[30]
    input(7)(28)(3) <= mcm_output(828); -- input 28,3 <= 13 * ref[31]

    -- Eq 29 Line 7
    input(7)(29)(0) <= mcm_output(755); -- input 29,0 <= 2 * ref[29]
    input(7)(29)(1) <= mcm_output(789); -- input 29,1 <= 18 * ref[30]
    input(7)(29)(2) <= mcm_output(824); -- input 29,2 <= 29 * ref[31]
    input(7)(29)(3) <= mcm_output(852); -- input 29,3 <= 13 * ref[32]

    -- Eq 30 Line 7
    input(7)(30)(0) <= mcm_output(782); -- input 30,0 <= 2 * ref[30]
    input(7)(30)(1) <= mcm_output(816); -- input 30,1 <= 18 * ref[31]
    input(7)(30)(2) <= mcm_output(844); -- input 30,2 <= 29 * ref[32]
    input(7)(30)(3) <= mcm_output(868); -- input 30,3 <= 13 * ref[33]

    -- Eq 31 Line 7
    input(7)(31)(0) <= mcm_output(809); -- input 31,0 <= 2 * ref[31]
    input(7)(31)(1) <= mcm_output(836); -- input 31,1 <= 18 * ref[32]
    input(7)(31)(2) <= mcm_output(860); -- input 31,2 <= 29 * ref[33]
    input(7)(31)(3) <= mcm_output(876); -- input 31,3 <= 13 * ref[34]

	
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