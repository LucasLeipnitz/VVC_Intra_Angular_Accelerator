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
		ref : IN sample_bus (0 to 66 );
		pred: OUT sample_bus (0 to 63 )
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


type t_mcm_output is array (0 to 1740) of std_logic_vector( 15 downto 0);
type t_row is array (0 to 3) of std_logic_vector( 15 downto 0);
type t_eq_input is array (0 to 63) of t_row;
signal 	mcm_output : t_mcm_output;
signal 	eq_input : t_eq_input;


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
    m32 : MCM_3
    PORT MAP ( X => ref(32), Y1 => mcm_output(829), Y2 => mcm_output(830), Y3 => mcm_output(831), Y4 => mcm_output(832), Y5 => mcm_output(833), Y6 => mcm_output(834), Y7 => mcm_output(835), Y8 => mcm_output(836), Y9 => mcm_output(837), Y10 => mcm_output(838), Y11 => mcm_output(839), Y12 => mcm_output
(840), Y13 => mcm_output(841), Y14 => mcm_output(842), Y15 => mcm_output(843), Y16 => mcm_output(844), Y17 => mcm_output(845), Y18 => mcm_output(846), Y19 => mcm_output(847), Y20 => mcm_output(848), Y21 => mcm_output(849), Y22 => mcm_output(850), Y23 => mcm_output(851), Y24 => mcm_output(852), Y25 => mcm_output(853), Y26 => mcm_output(854), Y27 => mcm_output(855) );
    m33 : MCM_3
    PORT MAP ( X => ref(33), Y1 => mcm_output(856), Y2 => mcm_output(857), Y3 => mcm_output(858), Y4 => mcm_output(859), Y5 => mcm_output(860), Y6 => mcm_output(861), Y7 => mcm_output(862), Y8 => mcm_output(863), Y9 => mcm_output(864), Y10 => mcm_output(865), Y11 => mcm_output(866), Y12 => mcm_output
(867), Y13 => mcm_output(868), Y14 => mcm_output(869), Y15 => mcm_output(870), Y16 => mcm_output(871), Y17 => mcm_output(872), Y18 => mcm_output(873), Y19 => mcm_output(874), Y20 => mcm_output(875), Y21 => mcm_output(876), Y22 => mcm_output(877), Y23 => mcm_output(878), Y24 => mcm_output(879), Y25 => mcm_output(880), Y26 => mcm_output(881), Y27 => mcm_output(882) );
    m34 : MCM_3
    PORT MAP ( X => ref(34), Y1 => mcm_output(883), Y2 => mcm_output(884), Y3 => mcm_output(885), Y4 => mcm_output(886), Y5 => mcm_output(887), Y6 => mcm_output(888), Y7 => mcm_output(889), Y8 => mcm_output(890), Y9 => mcm_output(891), Y10 => mcm_output(892), Y11 => mcm_output(893), Y12 => mcm_output
(894), Y13 => mcm_output(895), Y14 => mcm_output(896), Y15 => mcm_output(897), Y16 => mcm_output(898), Y17 => mcm_output(899), Y18 => mcm_output(900), Y19 => mcm_output(901), Y20 => mcm_output(902), Y21 => mcm_output(903), Y22 => mcm_output(904), Y23 => mcm_output(905), Y24 => mcm_output(906), Y25 => mcm_output(907), Y26 => mcm_output(908), Y27 => mcm_output(909) );
    m35 : MCM_3
    PORT MAP ( X => ref(35), Y1 => mcm_output(910), Y2 => mcm_output(911), Y3 => mcm_output(912), Y4 => mcm_output(913), Y5 => mcm_output(914), Y6 => mcm_output(915), Y7 => mcm_output(916), Y8 => mcm_output(917), Y9 => mcm_output(918), Y10 => mcm_output(919), Y11 => mcm_output(920), Y12 => mcm_output
(921), Y13 => mcm_output(922), Y14 => mcm_output(923), Y15 => mcm_output(924), Y16 => mcm_output(925), Y17 => mcm_output(926), Y18 => mcm_output(927), Y19 => mcm_output(928), Y20 => mcm_output(929), Y21 => mcm_output(930), Y22 => mcm_output(931), Y23 => mcm_output(932), Y24 => mcm_output(933), Y25 => mcm_output(934), Y26 => mcm_output(935), Y27 => mcm_output(936) );
    m36 : MCM_3
    PORT MAP ( X => ref(36), Y1 => mcm_output(937), Y2 => mcm_output(938), Y3 => mcm_output(939), Y4 => mcm_output(940), Y5 => mcm_output(941), Y6 => mcm_output(942), Y7 => mcm_output(943), Y8 => mcm_output(944), Y9 => mcm_output(945), Y10 => mcm_output(946), Y11 => mcm_output(947), Y12 => mcm_output
(948), Y13 => mcm_output(949), Y14 => mcm_output(950), Y15 => mcm_output(951), Y16 => mcm_output(952), Y17 => mcm_output(953), Y18 => mcm_output(954), Y19 => mcm_output(955), Y20 => mcm_output(956), Y21 => mcm_output(957), Y22 => mcm_output(958), Y23 => mcm_output(959), Y24 => mcm_output(960), Y25 => mcm_output(961), Y26 => mcm_output(962), Y27 => mcm_output(963) );
    m37 : MCM_3
    PORT MAP ( X => ref(37), Y1 => mcm_output(964), Y2 => mcm_output(965), Y3 => mcm_output(966), Y4 => mcm_output(967), Y5 => mcm_output(968), Y6 => mcm_output(969), Y7 => mcm_output(970), Y8 => mcm_output(971), Y9 => mcm_output(972), Y10 => mcm_output(973), Y11 => mcm_output(974), Y12 => mcm_output
(975), Y13 => mcm_output(976), Y14 => mcm_output(977), Y15 => mcm_output(978), Y16 => mcm_output(979), Y17 => mcm_output(980), Y18 => mcm_output(981), Y19 => mcm_output(982), Y20 => mcm_output(983), Y21 => mcm_output(984), Y22 => mcm_output(985), Y23 => mcm_output(986), Y24 => mcm_output(987), Y25 => mcm_output(988), Y26 => mcm_output(989), Y27 => mcm_output(990) );
    m38 : MCM_3
    PORT MAP ( X => ref(38), Y1 => mcm_output(991), Y2 => mcm_output(992), Y3 => mcm_output(993), Y4 => mcm_output(994), Y5 => mcm_output(995), Y6 => mcm_output(996), Y7 => mcm_output(997), Y8 => mcm_output(998), Y9 => mcm_output(999), Y10 => mcm_output(1000), Y11 => mcm_output(1001), Y12 => mcm_output(1002), Y13 => mcm_output(1003), Y14 => mcm_output(1004), Y15 => mcm_output(1005), Y16 => mcm_output(1006), Y17 => mcm_output(1007), Y18 => mcm_output(1008), Y19 => mcm_output(1009), Y20 => mcm_output(1010), Y21 => mcm_output(1011), Y22 => mcm_output(1012), Y23 => mcm_output(1013), Y24 => mcm_output(1014), Y25 => mcm_output(1015), Y26 => mcm_output(1016), Y27 => mcm_output(1017) );
    m39 : MCM_3
    PORT MAP ( X => ref(39), Y1 => mcm_output(1018), Y2 => mcm_output(1019), Y3 => mcm_output(1020), Y4 => mcm_output(1021), Y5 => mcm_output(1022), Y6 => mcm_output(1023), Y7 => mcm_output(1024), Y8 => mcm_output(1025), Y9 => mcm_output(1026), Y10 => mcm_output(1027), Y11 => mcm_output(1028), Y12 =>
mcm_output(1029), Y13 => mcm_output(1030), Y14 => mcm_output(1031), Y15 => mcm_output(1032), Y16 => mcm_output(1033), Y17 => mcm_output(1034), Y18 => mcm_output(1035), Y19 => mcm_output(1036), Y20 => mcm_output(1037), Y21 => mcm_output(1038), Y22 => mcm_output(1039), Y23 => mcm_output(1040), Y24 => mcm_output(1041), Y25 => mcm_output(1042), Y26 => mcm_output(1043), Y27 => mcm_output(1044) );
    m40 : MCM_3
    PORT MAP ( X => ref(40), Y1 => mcm_output(1045), Y2 => mcm_output(1046), Y3 => mcm_output(1047), Y4 => mcm_output(1048), Y5 => mcm_output(1049), Y6 => mcm_output(1050), Y7 => mcm_output(1051), Y8 => mcm_output(1052), Y9 => mcm_output(1053), Y10 => mcm_output(1054), Y11 => mcm_output(1055), Y12 =>
mcm_output(1056), Y13 => mcm_output(1057), Y14 => mcm_output(1058), Y15 => mcm_output(1059), Y16 => mcm_output(1060), Y17 => mcm_output(1061), Y18 => mcm_output(1062), Y19 => mcm_output(1063), Y20 => mcm_output(1064), Y21 => mcm_output(1065), Y22 => mcm_output(1066), Y23 => mcm_output(1067), Y24 => mcm_output(1068), Y25 => mcm_output(1069), Y26 => mcm_output(1070), Y27 => mcm_output(1071) );
    m41 : MCM_3
    PORT MAP ( X => ref(41), Y1 => mcm_output(1072), Y2 => mcm_output(1073), Y3 => mcm_output(1074), Y4 => mcm_output(1075), Y5 => mcm_output(1076), Y6 => mcm_output(1077), Y7 => mcm_output(1078), Y8 => mcm_output(1079), Y9 => mcm_output(1080), Y10 => mcm_output(1081), Y11 => mcm_output(1082), Y12 =>
mcm_output(1083), Y13 => mcm_output(1084), Y14 => mcm_output(1085), Y15 => mcm_output(1086), Y16 => mcm_output(1087), Y17 => mcm_output(1088), Y18 => mcm_output(1089), Y19 => mcm_output(1090), Y20 => mcm_output(1091), Y21 => mcm_output(1092), Y22 => mcm_output(1093), Y23 => mcm_output(1094), Y24 => mcm_output(1095), Y25 => mcm_output(1096), Y26 => mcm_output(1097), Y27 => mcm_output(1098) );
    m42 : MCM_3
    PORT MAP ( X => ref(42), Y1 => mcm_output(1099), Y2 => mcm_output(1100), Y3 => mcm_output(1101), Y4 => mcm_output(1102), Y5 => mcm_output(1103), Y6 => mcm_output(1104), Y7 => mcm_output(1105), Y8 => mcm_output(1106), Y9 => mcm_output(1107), Y10 => mcm_output(1108), Y11 => mcm_output(1109), Y12 =>
mcm_output(1110), Y13 => mcm_output(1111), Y14 => mcm_output(1112), Y15 => mcm_output(1113), Y16 => mcm_output(1114), Y17 => mcm_output(1115), Y18 => mcm_output(1116), Y19 => mcm_output(1117), Y20 => mcm_output(1118), Y21 => mcm_output(1119), Y22 => mcm_output(1120), Y23 => mcm_output(1121), Y24 => mcm_output(1122), Y25 => mcm_output(1123), Y26 => mcm_output(1124), Y27 => mcm_output(1125) );
    m43 : MCM_3
    PORT MAP ( X => ref(43), Y1 => mcm_output(1126), Y2 => mcm_output(1127), Y3 => mcm_output(1128), Y4 => mcm_output(1129), Y5 => mcm_output(1130), Y6 => mcm_output(1131), Y7 => mcm_output(1132), Y8 => mcm_output(1133), Y9 => mcm_output(1134), Y10 => mcm_output(1135), Y11 => mcm_output(1136), Y12 =>
mcm_output(1137), Y13 => mcm_output(1138), Y14 => mcm_output(1139), Y15 => mcm_output(1140), Y16 => mcm_output(1141), Y17 => mcm_output(1142), Y18 => mcm_output(1143), Y19 => mcm_output(1144), Y20 => mcm_output(1145), Y21 => mcm_output(1146), Y22 => mcm_output(1147), Y23 => mcm_output(1148), Y24 => mcm_output(1149), Y25 => mcm_output(1150), Y26 => mcm_output(1151), Y27 => mcm_output(1152) );
    m44 : MCM_3
    PORT MAP ( X => ref(44), Y1 => mcm_output(1153), Y2 => mcm_output(1154), Y3 => mcm_output(1155), Y4 => mcm_output(1156), Y5 => mcm_output(1157), Y6 => mcm_output(1158), Y7 => mcm_output(1159), Y8 => mcm_output(1160), Y9 => mcm_output(1161), Y10 => mcm_output(1162), Y11 => mcm_output(1163), Y12 =>
mcm_output(1164), Y13 => mcm_output(1165), Y14 => mcm_output(1166), Y15 => mcm_output(1167), Y16 => mcm_output(1168), Y17 => mcm_output(1169), Y18 => mcm_output(1170), Y19 => mcm_output(1171), Y20 => mcm_output(1172), Y21 => mcm_output(1173), Y22 => mcm_output(1174), Y23 => mcm_output(1175), Y24 => mcm_output(1176), Y25 => mcm_output(1177), Y26 => mcm_output(1178), Y27 => mcm_output(1179) );
    m45 : MCM_3
    PORT MAP ( X => ref(45), Y1 => mcm_output(1180), Y2 => mcm_output(1181), Y3 => mcm_output(1182), Y4 => mcm_output(1183), Y5 => mcm_output(1184), Y6 => mcm_output(1185), Y7 => mcm_output(1186), Y8 => mcm_output(1187), Y9 => mcm_output(1188), Y10 => mcm_output(1189), Y11 => mcm_output(1190), Y12 =>
mcm_output(1191), Y13 => mcm_output(1192), Y14 => mcm_output(1193), Y15 => mcm_output(1194), Y16 => mcm_output(1195), Y17 => mcm_output(1196), Y18 => mcm_output(1197), Y19 => mcm_output(1198), Y20 => mcm_output(1199), Y21 => mcm_output(1200), Y22 => mcm_output(1201), Y23 => mcm_output(1202), Y24 => mcm_output(1203), Y25 => mcm_output(1204), Y26 => mcm_output(1205), Y27 => mcm_output(1206) );
    m46 : MCM_3
    PORT MAP ( X => ref(46), Y1 => mcm_output(1207), Y2 => mcm_output(1208), Y3 => mcm_output(1209), Y4 => mcm_output(1210), Y5 => mcm_output(1211), Y6 => mcm_output(1212), Y7 => mcm_output(1213), Y8 => mcm_output(1214), Y9 => mcm_output(1215), Y10 => mcm_output(1216), Y11 => mcm_output(1217), Y12 =>
mcm_output(1218), Y13 => mcm_output(1219), Y14 => mcm_output(1220), Y15 => mcm_output(1221), Y16 => mcm_output(1222), Y17 => mcm_output(1223), Y18 => mcm_output(1224), Y19 => mcm_output(1225), Y20 => mcm_output(1226), Y21 => mcm_output(1227), Y22 => mcm_output(1228), Y23 => mcm_output(1229), Y24 => mcm_output(1230), Y25 => mcm_output(1231), Y26 => mcm_output(1232), Y27 => mcm_output(1233) );
    m47 : MCM_3
    PORT MAP ( X => ref(47), Y1 => mcm_output(1234), Y2 => mcm_output(1235), Y3 => mcm_output(1236), Y4 => mcm_output(1237), Y5 => mcm_output(1238), Y6 => mcm_output(1239), Y7 => mcm_output(1240), Y8 => mcm_output(1241), Y9 => mcm_output(1242), Y10 => mcm_output(1243), Y11 => mcm_output(1244), Y12 =>
mcm_output(1245), Y13 => mcm_output(1246), Y14 => mcm_output(1247), Y15 => mcm_output(1248), Y16 => mcm_output(1249), Y17 => mcm_output(1250), Y18 => mcm_output(1251), Y19 => mcm_output(1252), Y20 => mcm_output(1253), Y21 => mcm_output(1254), Y22 => mcm_output(1255), Y23 => mcm_output(1256), Y24 => mcm_output(1257), Y25 => mcm_output(1258), Y26 => mcm_output(1259), Y27 => mcm_output(1260) );
    m48 : MCM_3
    PORT MAP ( X => ref(48), Y1 => mcm_output(1261), Y2 => mcm_output(1262), Y3 => mcm_output(1263), Y4 => mcm_output(1264), Y5 => mcm_output(1265), Y6 => mcm_output(1266), Y7 => mcm_output(1267), Y8 => mcm_output(1268), Y9 => mcm_output(1269), Y10 => mcm_output(1270), Y11 => mcm_output(1271), Y12 =>
mcm_output(1272), Y13 => mcm_output(1273), Y14 => mcm_output(1274), Y15 => mcm_output(1275), Y16 => mcm_output(1276), Y17 => mcm_output(1277), Y18 => mcm_output(1278), Y19 => mcm_output(1279), Y20 => mcm_output(1280), Y21 => mcm_output(1281), Y22 => mcm_output(1282), Y23 => mcm_output(1283), Y24 => mcm_output(1284), Y25 => mcm_output(1285), Y26 => mcm_output(1286), Y27 => mcm_output(1287) );
    m49 : MCM_3
    PORT MAP ( X => ref(49), Y1 => mcm_output(1288), Y2 => mcm_output(1289), Y3 => mcm_output(1290), Y4 => mcm_output(1291), Y5 => mcm_output(1292), Y6 => mcm_output(1293), Y7 => mcm_output(1294), Y8 => mcm_output(1295), Y9 => mcm_output(1296), Y10 => mcm_output(1297), Y11 => mcm_output(1298), Y12 =>
mcm_output(1299), Y13 => mcm_output(1300), Y14 => mcm_output(1301), Y15 => mcm_output(1302), Y16 => mcm_output(1303), Y17 => mcm_output(1304), Y18 => mcm_output(1305), Y19 => mcm_output(1306), Y20 => mcm_output(1307), Y21 => mcm_output(1308), Y22 => mcm_output(1309), Y23 => mcm_output(1310), Y24 => mcm_output(1311), Y25 => mcm_output(1312), Y26 => mcm_output(1313), Y27 => mcm_output(1314) );
    m50 : MCM_3
    PORT MAP ( X => ref(50), Y1 => mcm_output(1315), Y2 => mcm_output(1316), Y3 => mcm_output(1317), Y4 => mcm_output(1318), Y5 => mcm_output(1319), Y6 => mcm_output(1320), Y7 => mcm_output(1321), Y8 => mcm_output(1322), Y9 => mcm_output(1323), Y10 => mcm_output(1324), Y11 => mcm_output(1325), Y12 =>
mcm_output(1326), Y13 => mcm_output(1327), Y14 => mcm_output(1328), Y15 => mcm_output(1329), Y16 => mcm_output(1330), Y17 => mcm_output(1331), Y18 => mcm_output(1332), Y19 => mcm_output(1333), Y20 => mcm_output(1334), Y21 => mcm_output(1335), Y22 => mcm_output(1336), Y23 => mcm_output(1337), Y24 => mcm_output(1338), Y25 => mcm_output(1339), Y26 => mcm_output(1340), Y27 => mcm_output(1341) );
    m51 : MCM_3
    PORT MAP ( X => ref(51), Y1 => mcm_output(1342), Y2 => mcm_output(1343), Y3 => mcm_output(1344), Y4 => mcm_output(1345), Y5 => mcm_output(1346), Y6 => mcm_output(1347), Y7 => mcm_output(1348), Y8 => mcm_output(1349), Y9 => mcm_output(1350), Y10 => mcm_output(1351), Y11 => mcm_output(1352), Y12 =>
mcm_output(1353), Y13 => mcm_output(1354), Y14 => mcm_output(1355), Y15 => mcm_output(1356), Y16 => mcm_output(1357), Y17 => mcm_output(1358), Y18 => mcm_output(1359), Y19 => mcm_output(1360), Y20 => mcm_output(1361), Y21 => mcm_output(1362), Y22 => mcm_output(1363), Y23 => mcm_output(1364), Y24 => mcm_output(1365), Y25 => mcm_output(1366), Y26 => mcm_output(1367), Y27 => mcm_output(1368) );
    m52 : MCM_3
    PORT MAP ( X => ref(52), Y1 => mcm_output(1369), Y2 => mcm_output(1370), Y3 => mcm_output(1371), Y4 => mcm_output(1372), Y5 => mcm_output(1373), Y6 => mcm_output(1374), Y7 => mcm_output(1375), Y8 => mcm_output(1376), Y9 => mcm_output(1377), Y10 => mcm_output(1378), Y11 => mcm_output(1379), Y12 =>
mcm_output(1380), Y13 => mcm_output(1381), Y14 => mcm_output(1382), Y15 => mcm_output(1383), Y16 => mcm_output(1384), Y17 => mcm_output(1385), Y18 => mcm_output(1386), Y19 => mcm_output(1387), Y20 => mcm_output(1388), Y21 => mcm_output(1389), Y22 => mcm_output(1390), Y23 => mcm_output(1391), Y24 => mcm_output(1392), Y25 => mcm_output(1393), Y26 => mcm_output(1394), Y27 => mcm_output(1395) );
    m53 : MCM_3
    PORT MAP ( X => ref(53), Y1 => mcm_output(1396), Y2 => mcm_output(1397), Y3 => mcm_output(1398), Y4 => mcm_output(1399), Y5 => mcm_output(1400), Y6 => mcm_output(1401), Y7 => mcm_output(1402), Y8 => mcm_output(1403), Y9 => mcm_output(1404), Y10 => mcm_output(1405), Y11 => mcm_output(1406), Y12 =>
mcm_output(1407), Y13 => mcm_output(1408), Y14 => mcm_output(1409), Y15 => mcm_output(1410), Y16 => mcm_output(1411), Y17 => mcm_output(1412), Y18 => mcm_output(1413), Y19 => mcm_output(1414), Y20 => mcm_output(1415), Y21 => mcm_output(1416), Y22 => mcm_output(1417), Y23 => mcm_output(1418), Y24 => mcm_output(1419), Y25 => mcm_output(1420), Y26 => mcm_output(1421), Y27 => mcm_output(1422) );
    m54 : MCM_3
    PORT MAP ( X => ref(54), Y1 => mcm_output(1423), Y2 => mcm_output(1424), Y3 => mcm_output(1425), Y4 => mcm_output(1426), Y5 => mcm_output(1427), Y6 => mcm_output(1428), Y7 => mcm_output(1429), Y8 => mcm_output(1430), Y9 => mcm_output(1431), Y10 => mcm_output(1432), Y11 => mcm_output(1433), Y12 =>
mcm_output(1434), Y13 => mcm_output(1435), Y14 => mcm_output(1436), Y15 => mcm_output(1437), Y16 => mcm_output(1438), Y17 => mcm_output(1439), Y18 => mcm_output(1440), Y19 => mcm_output(1441), Y20 => mcm_output(1442), Y21 => mcm_output(1443), Y22 => mcm_output(1444), Y23 => mcm_output(1445), Y24 => mcm_output(1446), Y25 => mcm_output(1447), Y26 => mcm_output(1448), Y27 => mcm_output(1449) );
    m55 : MCM_3
    PORT MAP ( X => ref(55), Y1 => mcm_output(1450), Y2 => mcm_output(1451), Y3 => mcm_output(1452), Y4 => mcm_output(1453), Y5 => mcm_output(1454), Y6 => mcm_output(1455), Y7 => mcm_output(1456), Y8 => mcm_output(1457), Y9 => mcm_output(1458), Y10 => mcm_output(1459), Y11 => mcm_output(1460), Y12 =>
mcm_output(1461), Y13 => mcm_output(1462), Y14 => mcm_output(1463), Y15 => mcm_output(1464), Y16 => mcm_output(1465), Y17 => mcm_output(1466), Y18 => mcm_output(1467), Y19 => mcm_output(1468), Y20 => mcm_output(1469), Y21 => mcm_output(1470), Y22 => mcm_output(1471), Y23 => mcm_output(1472), Y24 => mcm_output(1473), Y25 => mcm_output(1474), Y26 => mcm_output(1475), Y27 => mcm_output(1476) );
    m56 : MCM_3
    PORT MAP ( X => ref(56), Y1 => mcm_output(1477), Y2 => mcm_output(1478), Y3 => mcm_output(1479), Y4 => mcm_output(1480), Y5 => mcm_output(1481), Y6 => mcm_output(1482), Y7 => mcm_output(1483), Y8 => mcm_output(1484), Y9 => mcm_output(1485), Y10 => mcm_output(1486), Y11 => mcm_output(1487), Y12 =>
mcm_output(1488), Y13 => mcm_output(1489), Y14 => mcm_output(1490), Y15 => mcm_output(1491), Y16 => mcm_output(1492), Y17 => mcm_output(1493), Y18 => mcm_output(1494), Y19 => mcm_output(1495), Y20 => mcm_output(1496), Y21 => mcm_output(1497), Y22 => mcm_output(1498), Y23 => mcm_output(1499), Y24 => mcm_output(1500), Y25 => mcm_output(1501), Y26 => mcm_output(1502), Y27 => mcm_output(1503) );
    m57 : MCM_3
    PORT MAP ( X => ref(57), Y1 => mcm_output(1504), Y2 => mcm_output(1505), Y3 => mcm_output(1506), Y4 => mcm_output(1507), Y5 => mcm_output(1508), Y6 => mcm_output(1509), Y7 => mcm_output(1510), Y8 => mcm_output(1511), Y9 => mcm_output(1512), Y10 => mcm_output(1513), Y11 => mcm_output(1514), Y12 =>
mcm_output(1515), Y13 => mcm_output(1516), Y14 => mcm_output(1517), Y15 => mcm_output(1518), Y16 => mcm_output(1519), Y17 => mcm_output(1520), Y18 => mcm_output(1521), Y19 => mcm_output(1522), Y20 => mcm_output(1523), Y21 => mcm_output(1524), Y22 => mcm_output(1525), Y23 => mcm_output(1526), Y24 => mcm_output(1527), Y25 => mcm_output(1528), Y26 => mcm_output(1529), Y27 => mcm_output(1530) );
    m58 : MCM_3
    PORT MAP ( X => ref(58), Y1 => mcm_output(1531), Y2 => mcm_output(1532), Y3 => mcm_output(1533), Y4 => mcm_output(1534), Y5 => mcm_output(1535), Y6 => mcm_output(1536), Y7 => mcm_output(1537), Y8 => mcm_output(1538), Y9 => mcm_output(1539), Y10 => mcm_output(1540), Y11 => mcm_output(1541), Y12 =>
mcm_output(1542), Y13 => mcm_output(1543), Y14 => mcm_output(1544), Y15 => mcm_output(1545), Y16 => mcm_output(1546), Y17 => mcm_output(1547), Y18 => mcm_output(1548), Y19 => mcm_output(1549), Y20 => mcm_output(1550), Y21 => mcm_output(1551), Y22 => mcm_output(1552), Y23 => mcm_output(1553), Y24 => mcm_output(1554), Y25 => mcm_output(1555), Y26 => mcm_output(1556), Y27 => mcm_output(1557) );
    m59 : MCM_3
    PORT MAP ( X => ref(59), Y1 => mcm_output(1558), Y2 => mcm_output(1559), Y3 => mcm_output(1560), Y4 => mcm_output(1561), Y5 => mcm_output(1562), Y6 => mcm_output(1563), Y7 => mcm_output(1564), Y8 => mcm_output(1565), Y9 => mcm_output(1566), Y10 => mcm_output(1567), Y11 => mcm_output(1568), Y12 =>
mcm_output(1569), Y13 => mcm_output(1570), Y14 => mcm_output(1571), Y15 => mcm_output(1572), Y16 => mcm_output(1573), Y17 => mcm_output(1574), Y18 => mcm_output(1575), Y19 => mcm_output(1576), Y20 => mcm_output(1577), Y21 => mcm_output(1578), Y22 => mcm_output(1579), Y23 => mcm_output(1580), Y24 => mcm_output(1581), Y25 => mcm_output(1582), Y26 => mcm_output(1583), Y27 => mcm_output(1584) );
    m60 : MCM_3
    PORT MAP ( X => ref(60), Y1 => mcm_output(1585), Y2 => mcm_output(1586), Y3 => mcm_output(1587), Y4 => mcm_output(1588), Y5 => mcm_output(1589), Y6 => mcm_output(1590), Y7 => mcm_output(1591), Y8 => mcm_output(1592), Y9 => mcm_output(1593), Y10 => mcm_output(1594), Y11 => mcm_output(1595), Y12 =>
mcm_output(1596), Y13 => mcm_output(1597), Y14 => mcm_output(1598), Y15 => mcm_output(1599), Y16 => mcm_output(1600), Y17 => mcm_output(1601), Y18 => mcm_output(1602), Y19 => mcm_output(1603), Y20 => mcm_output(1604), Y21 => mcm_output(1605), Y22 => mcm_output(1606), Y23 => mcm_output(1607), Y24 => mcm_output(1608), Y25 => mcm_output(1609), Y26 => mcm_output(1610), Y27 => mcm_output(1611) );
    m61 : MCM_3
    PORT MAP ( X => ref(61), Y1 => mcm_output(1612), Y2 => mcm_output(1613), Y3 => mcm_output(1614), Y4 => mcm_output(1615), Y5 => mcm_output(1616), Y6 => mcm_output(1617), Y7 => mcm_output(1618), Y8 => mcm_output(1619), Y9 => mcm_output(1620), Y10 => mcm_output(1621), Y11 => mcm_output(1622), Y12 =>
mcm_output(1623), Y13 => mcm_output(1624), Y14 => mcm_output(1625), Y15 => mcm_output(1626), Y16 => mcm_output(1627), Y17 => mcm_output(1628), Y18 => mcm_output(1629), Y19 => mcm_output(1630), Y20 => mcm_output(1631), Y21 => mcm_output(1632), Y22 => mcm_output(1633), Y23 => mcm_output(1634), Y24 => mcm_output(1635), Y25 => mcm_output(1636), Y26 => mcm_output(1637), Y27 => mcm_output(1638) );
    m62 : MCM_3
    PORT MAP ( X => ref(62), Y1 => mcm_output(1639), Y2 => mcm_output(1640), Y3 => mcm_output(1641), Y4 => mcm_output(1642), Y5 => mcm_output(1643), Y6 => mcm_output(1644), Y7 => mcm_output(1645), Y8 => mcm_output(1646), Y9 => mcm_output(1647), Y10 => mcm_output(1648), Y11 => mcm_output(1649), Y12 =>
mcm_output(1650), Y13 => mcm_output(1651), Y14 => mcm_output(1652), Y15 => mcm_output(1653), Y16 => mcm_output(1654), Y17 => mcm_output(1655), Y18 => mcm_output(1656), Y19 => mcm_output(1657), Y20 => mcm_output(1658), Y21 => mcm_output(1659), Y22 => mcm_output(1660), Y23 => mcm_output(1661), Y24 => mcm_output(1662), Y25 => mcm_output(1663), Y26 => mcm_output(1664), Y27 => mcm_output(1665) );
    m63 : MCM_3
    PORT MAP ( X => ref(63), Y1 => mcm_output(1666), Y2 => mcm_output(1667), Y3 => mcm_output(1668), Y4 => mcm_output(1669), Y5 => mcm_output(1670), Y6 => mcm_output(1671), Y7 => mcm_output(1672), Y8 => mcm_output(1673), Y9 => mcm_output(1674), Y10 => mcm_output(1675), Y11 => mcm_output(1676), Y12 =>
mcm_output(1677), Y13 => mcm_output(1678), Y14 => mcm_output(1679), Y15 => mcm_output(1680), Y16 => mcm_output(1681), Y17 => mcm_output(1682), Y18 => mcm_output(1683), Y19 => mcm_output(1684), Y20 => mcm_output(1685), Y21 => mcm_output(1686), Y22 => mcm_output(1687), Y23 => mcm_output(1688), Y24 => mcm_output(1689), Y25 => mcm_output(1690), Y26 => mcm_output(1691), Y27 => mcm_output(1692) );
    m64 : MCM_4
    PORT MAP ( X => ref(64), Y1 => mcm_output(1693), Y2 => mcm_output(1694), Y3 => mcm_output(1695), Y4 => mcm_output(1696), Y5 => mcm_output(1697), Y6 => mcm_output(1698), Y7 => mcm_output(1699), Y8 => mcm_output(1700), Y9 => mcm_output(1701), Y10 => mcm_output(1702), Y11 => mcm_output(1703), Y12 =>
mcm_output(1704), Y13 => mcm_output(1705), Y14 => mcm_output(1706), Y15 => mcm_output(1707), Y16 => mcm_output(1708), Y17 => mcm_output(1709), Y18 => mcm_output(1710), Y19 => mcm_output(1711), Y20 => mcm_output(1712), Y21 => mcm_output(1713), Y22 => mcm_output(1714), Y23 => mcm_output(1715), Y24 => mcm_output(1716) );
    m65 : MCM_5
    PORT MAP ( X => ref(65), Y1 => mcm_output(1717), Y2 => mcm_output(1718), Y3 => mcm_output(1719), Y4 => mcm_output(1720), Y5 => mcm_output(1721), Y6 => mcm_output(1722), Y7 => mcm_output(1723), Y8 => mcm_output(1724), Y9 => mcm_output(1725), Y10 => mcm_output(1726), Y11 => mcm_output(1727), Y12 => mcm_output(1728), Y13 => mcm_output(1729), Y14 => mcm_output(1730), Y15 => mcm_output(1731), Y16 => mcm_output(1732) );
    m66 : MCM_6
    PORT MAP ( X => ref(66), Y1 => mcm_output(1733), Y2 => mcm_output(1734), Y3 => mcm_output(1735), Y4 => mcm_output(1736), Y5 => mcm_output(1737), Y6 => mcm_output(1738), Y7 => mcm_output(1739), Y8 => mcm_output(1740) );
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
    eq32: equation_block
    PORT MAP ( input_0 => eq_input(32)(0), input_1 => eq_input(32)(1), input_2 => eq_input(32)(2), input_3 => eq_input(32)(3), output => pred(32) );
    eq33: equation_block
    PORT MAP ( input_0 => eq_input(33)(0), input_1 => eq_input(33)(1), input_2 => eq_input(33)(2), input_3 => eq_input(33)(3), output => pred(33) );
    eq34: equation_block
    PORT MAP ( input_0 => eq_input(34)(0), input_1 => eq_input(34)(1), input_2 => eq_input(34)(2), input_3 => eq_input(34)(3), output => pred(34) );
    eq35: equation_block
    PORT MAP ( input_0 => eq_input(35)(0), input_1 => eq_input(35)(1), input_2 => eq_input(35)(2), input_3 => eq_input(35)(3), output => pred(35) );
    eq36: equation_block
    PORT MAP ( input_0 => eq_input(36)(0), input_1 => eq_input(36)(1), input_2 => eq_input(36)(2), input_3 => eq_input(36)(3), output => pred(36) );
    eq37: equation_block
    PORT MAP ( input_0 => eq_input(37)(0), input_1 => eq_input(37)(1), input_2 => eq_input(37)(2), input_3 => eq_input(37)(3), output => pred(37) );
    eq38: equation_block
    PORT MAP ( input_0 => eq_input(38)(0), input_1 => eq_input(38)(1), input_2 => eq_input(38)(2), input_3 => eq_input(38)(3), output => pred(38) );
    eq39: equation_block
    PORT MAP ( input_0 => eq_input(39)(0), input_1 => eq_input(39)(1), input_2 => eq_input(39)(2), input_3 => eq_input(39)(3), output => pred(39) );
    eq40: equation_block
    PORT MAP ( input_0 => eq_input(40)(0), input_1 => eq_input(40)(1), input_2 => eq_input(40)(2), input_3 => eq_input(40)(3), output => pred(40) );
    eq41: equation_block
    PORT MAP ( input_0 => eq_input(41)(0), input_1 => eq_input(41)(1), input_2 => eq_input(41)(2), input_3 => eq_input(41)(3), output => pred(41) );
    eq42: equation_block
    PORT MAP ( input_0 => eq_input(42)(0), input_1 => eq_input(42)(1), input_2 => eq_input(42)(2), input_3 => eq_input(42)(3), output => pred(42) );
    eq43: equation_block
    PORT MAP ( input_0 => eq_input(43)(0), input_1 => eq_input(43)(1), input_2 => eq_input(43)(2), input_3 => eq_input(43)(3), output => pred(43) );
    eq44: equation_block
    PORT MAP ( input_0 => eq_input(44)(0), input_1 => eq_input(44)(1), input_2 => eq_input(44)(2), input_3 => eq_input(44)(3), output => pred(44) );
    eq45: equation_block
    PORT MAP ( input_0 => eq_input(45)(0), input_1 => eq_input(45)(1), input_2 => eq_input(45)(2), input_3 => eq_input(45)(3), output => pred(45) );
    eq46: equation_block
    PORT MAP ( input_0 => eq_input(46)(0), input_1 => eq_input(46)(1), input_2 => eq_input(46)(2), input_3 => eq_input(46)(3), output => pred(46) );
    eq47: equation_block
    PORT MAP ( input_0 => eq_input(47)(0), input_1 => eq_input(47)(1), input_2 => eq_input(47)(2), input_3 => eq_input(47)(3), output => pred(47) );
    eq48: equation_block
    PORT MAP ( input_0 => eq_input(48)(0), input_1 => eq_input(48)(1), input_2 => eq_input(48)(2), input_3 => eq_input(48)(3), output => pred(48) );
    eq49: equation_block
    PORT MAP ( input_0 => eq_input(49)(0), input_1 => eq_input(49)(1), input_2 => eq_input(49)(2), input_3 => eq_input(49)(3), output => pred(49) );
    eq50: equation_block
    PORT MAP ( input_0 => eq_input(50)(0), input_1 => eq_input(50)(1), input_2 => eq_input(50)(2), input_3 => eq_input(50)(3), output => pred(50) );
    eq51: equation_block
    PORT MAP ( input_0 => eq_input(51)(0), input_1 => eq_input(51)(1), input_2 => eq_input(51)(2), input_3 => eq_input(51)(3), output => pred(51) );
    eq52: equation_block
    PORT MAP ( input_0 => eq_input(52)(0), input_1 => eq_input(52)(1), input_2 => eq_input(52)(2), input_3 => eq_input(52)(3), output => pred(52) );
    eq53: equation_block
    PORT MAP ( input_0 => eq_input(53)(0), input_1 => eq_input(53)(1), input_2 => eq_input(53)(2), input_3 => eq_input(53)(3), output => pred(53) );
    eq54: equation_block
    PORT MAP ( input_0 => eq_input(54)(0), input_1 => eq_input(54)(1), input_2 => eq_input(54)(2), input_3 => eq_input(54)(3), output => pred(54) );
    eq55: equation_block
    PORT MAP ( input_0 => eq_input(55)(0), input_1 => eq_input(55)(1), input_2 => eq_input(55)(2), input_3 => eq_input(55)(3), output => pred(55) );
    eq56: equation_block
    PORT MAP ( input_0 => eq_input(56)(0), input_1 => eq_input(56)(1), input_2 => eq_input(56)(2), input_3 => eq_input(56)(3), output => pred(56) );
    eq57: equation_block
    PORT MAP ( input_0 => eq_input(57)(0), input_1 => eq_input(57)(1), input_2 => eq_input(57)(2), input_3 => eq_input(57)(3), output => pred(57) );
    eq58: equation_block
    PORT MAP ( input_0 => eq_input(58)(0), input_1 => eq_input(58)(1), input_2 => eq_input(58)(2), input_3 => eq_input(58)(3), output => pred(58) );
    eq59: equation_block
    PORT MAP ( input_0 => eq_input(59)(0), input_1 => eq_input(59)(1), input_2 => eq_input(59)(2), input_3 => eq_input(59)(3), output => pred(59) );
    eq60: equation_block
    PORT MAP ( input_0 => eq_input(60)(0), input_1 => eq_input(60)(1), input_2 => eq_input(60)(2), input_3 => eq_input(60)(3), output => pred(60) );
    eq61: equation_block
    PORT MAP ( input_0 => eq_input(61)(0), input_1 => eq_input(61)(1), input_2 => eq_input(61)(2), input_3 => eq_input(61)(3), output => pred(61) );
    eq62: equation_block
    PORT MAP ( input_0 => eq_input(62)(0), input_1 => eq_input(62)(1), input_2 => eq_input(62)(2), input_3 => eq_input(62)(3), output => pred(62) );
    eq63: equation_block
    PORT MAP ( input_0 => eq_input(63)(0), input_1 => eq_input(63)(1), input_2 => eq_input(63)(2), input_3 => eq_input(63)(3), output => pred(63) );
	

	
	process (clk, rst)
	  begin
		if rst = '1' then
			for i in 0 to 63 loop 
				for j in 0 to 3 loop
					eq_input(i)(j) <= "0000000000000000";
				end loop;
			end loop;
		elsif clk'event and clk = '1' then
			case control is
		        when "000"=>
		                -- Eq 0
		                eq_input(0)(0) <= mcm_output(0); -- input 0,0 <= -2 * ref[0]
		                eq_input(0)(1) <= mcm_output(16); -- input 0,0 <= 59 * ref[1]
		                eq_input(0)(2) <= mcm_output(38); -- input 0,0 <= 8 * ref[2]
		                eq_input(0)(3) <= mcm_output(49); -- input 0,0 <= -1 * ref[3]
		
		                -- Eq 1
		                eq_input(1)(0) <= mcm_output(8); -- input 1,0 <= -2 * ref[1]
		                eq_input(1)(1) <= mcm_output(31); -- input 1,0 <= 59 * ref[2]
		                eq_input(1)(2) <= mcm_output(61); -- input 1,0 <= 8 * ref[3]
		                eq_input(1)(3) <= mcm_output(76); -- input 1,0 <= -1 * ref[4]
		
		                -- Eq 2
		                eq_input(2)(0) <= mcm_output(23); -- input 2,0 <= -2 * ref[2]
		                eq_input(2)(1) <= mcm_output(54); -- input 2,0 <= 59 * ref[3]
		                eq_input(2)(2) <= mcm_output(88); -- input 2,0 <= 8 * ref[4]
		                eq_input(2)(3) <= mcm_output(103); -- input 2,0 <= -1 * ref[5]
		
		                -- Eq 3
		                eq_input(3)(0) <= mcm_output(46); -- input 3,0 <= -2 * ref[3]
		                eq_input(3)(1) <= mcm_output(81); -- input 3,0 <= 59 * ref[4]
		                eq_input(3)(2) <= mcm_output(115); -- input 3,0 <= 8 * ref[5]
		                eq_input(3)(3) <= mcm_output(130); -- input 3,0 <= -1 * ref[6]
		
		                -- Eq 4
		                eq_input(4)(0) <= mcm_output(73); -- input 4,0 <= -2 * ref[4]
		                eq_input(4)(1) <= mcm_output(108); -- input 4,0 <= 59 * ref[5]
		                eq_input(4)(2) <= mcm_output(142); -- input 4,0 <= 8 * ref[6]
		                eq_input(4)(3) <= mcm_output(157); -- input 4,0 <= -1 * ref[7]
		
		                -- Eq 5
		                eq_input(5)(0) <= mcm_output(100); -- input 5,0 <= -2 * ref[5]
		                eq_input(5)(1) <= mcm_output(135); -- input 5,0 <= 59 * ref[6]
		                eq_input(5)(2) <= mcm_output(169); -- input 5,0 <= 8 * ref[7]
		                eq_input(5)(3) <= mcm_output(184); -- input 5,0 <= -1 * ref[8]
		
		                -- Eq 6
		                eq_input(6)(0) <= mcm_output(127); -- input 6,0 <= -2 * ref[6]
		                eq_input(6)(1) <= mcm_output(162); -- input 6,0 <= 59 * ref[7]
		                eq_input(6)(2) <= mcm_output(196); -- input 6,0 <= 8 * ref[8]
		                eq_input(6)(3) <= mcm_output(211); -- input 6,0 <= -1 * ref[9]
		
		                -- Eq 7
		                eq_input(7)(0) <= mcm_output(154); -- input 7,0 <= -2 * ref[7]
		                eq_input(7)(1) <= mcm_output(189); -- input 7,0 <= 59 * ref[8]
		                eq_input(7)(2) <= mcm_output(223); -- input 7,0 <= 8 * ref[9]
		                eq_input(7)(3) <= mcm_output(238); -- input 7,0 <= -1 * ref[10]
		
		                -- Eq 8
		                eq_input(8)(0) <= mcm_output(181); -- input 8,0 <= -2 * ref[8]
		                eq_input(8)(1) <= mcm_output(216); -- input 8,0 <= 59 * ref[9]
		                eq_input(8)(2) <= mcm_output(250); -- input 8,0 <= 8 * ref[10]
		                eq_input(8)(3) <= mcm_output(265); -- input 8,0 <= -1 * ref[11]
		
		                -- Eq 9
		                eq_input(9)(0) <= mcm_output(208); -- input 9,0 <= -2 * ref[9]
		                eq_input(9)(1) <= mcm_output(243); -- input 9,0 <= 59 * ref[10]
		                eq_input(9)(2) <= mcm_output(277); -- input 9,0 <= 8 * ref[11]
		                eq_input(9)(3) <= mcm_output(292); -- input 9,0 <= -1 * ref[12]
		
		                -- Eq 10
		                eq_input(10)(0) <= mcm_output(235); -- input 10,0 <= -2 * ref[10]
		                eq_input(10)(1) <= mcm_output(270); -- input 10,0 <= 59 * ref[11]
		                eq_input(10)(2) <= mcm_output(304); -- input 10,0 <= 8 * ref[12]
		                eq_input(10)(3) <= mcm_output(319); -- input 10,0 <= -1 * ref[13]
		
		                -- Eq 11
		                eq_input(11)(0) <= mcm_output(262); -- input 11,0 <= -2 * ref[11]
		                eq_input(11)(1) <= mcm_output(297); -- input 11,0 <= 59 * ref[12]
		                eq_input(11)(2) <= mcm_output(331); -- input 11,0 <= 8 * ref[13]
		                eq_input(11)(3) <= mcm_output(346); -- input 11,0 <= -1 * ref[14]
		
		                -- Eq 12
		                eq_input(12)(0) <= mcm_output(289); -- input 12,0 <= -2 * ref[12]
		                eq_input(12)(1) <= mcm_output(324); -- input 12,0 <= 59 * ref[13]
		                eq_input(12)(2) <= mcm_output(358); -- input 12,0 <= 8 * ref[14]
		                eq_input(12)(3) <= mcm_output(373); -- input 12,0 <= -1 * ref[15]
		
		                -- Eq 13
		                eq_input(13)(0) <= mcm_output(316); -- input 13,0 <= -2 * ref[13]
		                eq_input(13)(1) <= mcm_output(351); -- input 13,0 <= 59 * ref[14]
		                eq_input(13)(2) <= mcm_output(385); -- input 13,0 <= 8 * ref[15]
		                eq_input(13)(3) <= mcm_output(400); -- input 13,0 <= -1 * ref[16]
		
		                -- Eq 14
		                eq_input(14)(0) <= mcm_output(343); -- input 14,0 <= -2 * ref[14]
		                eq_input(14)(1) <= mcm_output(378); -- input 14,0 <= 59 * ref[15]
		                eq_input(14)(2) <= mcm_output(412); -- input 14,0 <= 8 * ref[16]
		                eq_input(14)(3) <= mcm_output(427); -- input 14,0 <= -1 * ref[17]
		
		                -- Eq 15
		                eq_input(15)(0) <= mcm_output(370); -- input 15,0 <= -2 * ref[15]
		                eq_input(15)(1) <= mcm_output(405); -- input 15,0 <= 59 * ref[16]
		                eq_input(15)(2) <= mcm_output(439); -- input 15,0 <= 8 * ref[17]
		                eq_input(15)(3) <= mcm_output(454); -- input 15,0 <= -1 * ref[18]
		
		                -- Eq 16
		                eq_input(16)(0) <= mcm_output(397); -- input 16,0 <= -2 * ref[16]
		                eq_input(16)(1) <= mcm_output(432); -- input 16,0 <= 59 * ref[17]
		                eq_input(16)(2) <= mcm_output(466); -- input 16,0 <= 8 * ref[18]
		                eq_input(16)(3) <= mcm_output(481); -- input 16,0 <= -1 * ref[19]
		
		                -- Eq 17
		                eq_input(17)(0) <= mcm_output(424); -- input 17,0 <= -2 * ref[17]
		                eq_input(17)(1) <= mcm_output(459); -- input 17,0 <= 59 * ref[18]
		                eq_input(17)(2) <= mcm_output(493); -- input 17,0 <= 8 * ref[19]
		                eq_input(17)(3) <= mcm_output(508); -- input 17,0 <= -1 * ref[20]
		
		                -- Eq 18
		                eq_input(18)(0) <= mcm_output(451); -- input 18,0 <= -2 * ref[18]
		                eq_input(18)(1) <= mcm_output(486); -- input 18,0 <= 59 * ref[19]
		                eq_input(18)(2) <= mcm_output(520); -- input 18,0 <= 8 * ref[20]
		                eq_input(18)(3) <= mcm_output(535); -- input 18,0 <= -1 * ref[21]
		
		                -- Eq 19
		                eq_input(19)(0) <= mcm_output(478); -- input 19,0 <= -2 * ref[19]
		                eq_input(19)(1) <= mcm_output(513); -- input 19,0 <= 59 * ref[20]
		                eq_input(19)(2) <= mcm_output(547); -- input 19,0 <= 8 * ref[21]
		                eq_input(19)(3) <= mcm_output(562); -- input 19,0 <= -1 * ref[22]
		
		                -- Eq 20
		                eq_input(20)(0) <= mcm_output(505); -- input 20,0 <= -2 * ref[20]
		                eq_input(20)(1) <= mcm_output(540); -- input 20,0 <= 59 * ref[21]
		                eq_input(20)(2) <= mcm_output(574); -- input 20,0 <= 8 * ref[22]
		                eq_input(20)(3) <= mcm_output(589); -- input 20,0 <= -1 * ref[23]
		
		                -- Eq 21
		                eq_input(21)(0) <= mcm_output(532); -- input 21,0 <= -2 * ref[21]
		                eq_input(21)(1) <= mcm_output(567); -- input 21,0 <= 59 * ref[22]
		                eq_input(21)(2) <= mcm_output(601); -- input 21,0 <= 8 * ref[23]
		                eq_input(21)(3) <= mcm_output(616); -- input 21,0 <= -1 * ref[24]
		
		                -- Eq 22
		                eq_input(22)(0) <= mcm_output(559); -- input 22,0 <= -2 * ref[22]
		                eq_input(22)(1) <= mcm_output(594); -- input 22,0 <= 59 * ref[23]
		                eq_input(22)(2) <= mcm_output(628); -- input 22,0 <= 8 * ref[24]
		                eq_input(22)(3) <= mcm_output(643); -- input 22,0 <= -1 * ref[25]
		
		                -- Eq 23
		                eq_input(23)(0) <= mcm_output(586); -- input 23,0 <= -2 * ref[23]
		                eq_input(23)(1) <= mcm_output(621); -- input 23,0 <= 59 * ref[24]
		                eq_input(23)(2) <= mcm_output(655); -- input 23,0 <= 8 * ref[25]
		                eq_input(23)(3) <= mcm_output(670); -- input 23,0 <= -1 * ref[26]
		
		                -- Eq 24
		                eq_input(24)(0) <= mcm_output(613); -- input 24,0 <= -2 * ref[24]
		                eq_input(24)(1) <= mcm_output(648); -- input 24,0 <= 59 * ref[25]
		                eq_input(24)(2) <= mcm_output(682); -- input 24,0 <= 8 * ref[26]
		                eq_input(24)(3) <= mcm_output(697); -- input 24,0 <= -1 * ref[27]
		
		                -- Eq 25
		                eq_input(25)(0) <= mcm_output(640); -- input 25,0 <= -2 * ref[25]
		                eq_input(25)(1) <= mcm_output(675); -- input 25,0 <= 59 * ref[26]
		                eq_input(25)(2) <= mcm_output(709); -- input 25,0 <= 8 * ref[27]
		                eq_input(25)(3) <= mcm_output(724); -- input 25,0 <= -1 * ref[28]
		
		                -- Eq 26
		                eq_input(26)(0) <= mcm_output(667); -- input 26,0 <= -2 * ref[26]
		                eq_input(26)(1) <= mcm_output(702); -- input 26,0 <= 59 * ref[27]
		                eq_input(26)(2) <= mcm_output(736); -- input 26,0 <= 8 * ref[28]
		                eq_input(26)(3) <= mcm_output(751); -- input 26,0 <= -1 * ref[29]
		
		                -- Eq 27
		                eq_input(27)(0) <= mcm_output(694); -- input 27,0 <= -2 * ref[27]
		                eq_input(27)(1) <= mcm_output(729); -- input 27,0 <= 59 * ref[28]
		                eq_input(27)(2) <= mcm_output(763); -- input 27,0 <= 8 * ref[29]
		                eq_input(27)(3) <= mcm_output(778); -- input 27,0 <= -1 * ref[30]
		
		                -- Eq 28
		                eq_input(28)(0) <= mcm_output(721); -- input 28,0 <= -2 * ref[28]
		                eq_input(28)(1) <= mcm_output(756); -- input 28,0 <= 59 * ref[29]
		                eq_input(28)(2) <= mcm_output(790); -- input 28,0 <= 8 * ref[30]
		                eq_input(28)(3) <= mcm_output(805); -- input 28,0 <= -1 * ref[31]
		
		                -- Eq 29
		                eq_input(29)(0) <= mcm_output(748); -- input 29,0 <= -2 * ref[29]
		                eq_input(29)(1) <= mcm_output(783); -- input 29,0 <= 59 * ref[30]
		                eq_input(29)(2) <= mcm_output(817); -- input 29,0 <= 8 * ref[31]
		                eq_input(29)(3) <= mcm_output(832); -- input 29,0 <= -1 * ref[32]
		
		                -- Eq 30
		                eq_input(30)(0) <= mcm_output(775); -- input 30,0 <= -2 * ref[30]
		                eq_input(30)(1) <= mcm_output(810); -- input 30,0 <= 59 * ref[31]
		                eq_input(30)(2) <= mcm_output(844); -- input 30,0 <= 8 * ref[32]
		                eq_input(30)(3) <= mcm_output(859); -- input 30,0 <= -1 * ref[33]
		
		                -- Eq 31
		                eq_input(31)(0) <= mcm_output(802); -- input 31,0 <= -2 * ref[31]
		                eq_input(31)(1) <= mcm_output(837); -- input 31,0 <= 59 * ref[32]
		                eq_input(31)(2) <= mcm_output(871); -- input 31,0 <= 8 * ref[33]
		                eq_input(31)(3) <= mcm_output(886); -- input 31,0 <= -1 * ref[34]
		
		                -- Eq 32
		                eq_input(32)(0) <= mcm_output(829); -- input 32,0 <= -2 * ref[32]
		                eq_input(32)(1) <= mcm_output(864); -- input 32,0 <= 59 * ref[33]
		                eq_input(32)(2) <= mcm_output(898); -- input 32,0 <= 8 * ref[34]
		                eq_input(32)(3) <= mcm_output(913); -- input 32,0 <= -1 * ref[35]
		
		                -- Eq 33
		                eq_input(33)(0) <= mcm_output(856); -- input 33,0 <= -2 * ref[33]
		                eq_input(33)(1) <= mcm_output(891); -- input 33,0 <= 59 * ref[34]
		                eq_input(33)(2) <= mcm_output(925); -- input 33,0 <= 8 * ref[35]
		                eq_input(33)(3) <= mcm_output(940); -- input 33,0 <= -1 * ref[36]
		
		                -- Eq 34
		                eq_input(34)(0) <= mcm_output(883); -- input 34,0 <= -2 * ref[34]
		                eq_input(34)(1) <= mcm_output(918); -- input 34,0 <= 59 * ref[35]
		                eq_input(34)(2) <= mcm_output(952); -- input 34,0 <= 8 * ref[36]
		                eq_input(34)(3) <= mcm_output(967); -- input 34,0 <= -1 * ref[37]
		
		                -- Eq 35
		                eq_input(35)(0) <= mcm_output(910); -- input 35,0 <= -2 * ref[35]
		                eq_input(35)(1) <= mcm_output(945); -- input 35,0 <= 59 * ref[36]
		                eq_input(35)(2) <= mcm_output(979); -- input 35,0 <= 8 * ref[37]
		                eq_input(35)(3) <= mcm_output(994); -- input 35,0 <= -1 * ref[38]
		
		                -- Eq 36
		                eq_input(36)(0) <= mcm_output(937); -- input 36,0 <= -2 * ref[36]
		                eq_input(36)(1) <= mcm_output(972); -- input 36,0 <= 59 * ref[37]
		                eq_input(36)(2) <= mcm_output(1006); -- input 36,0 <= 8 * ref[38]
		                eq_input(36)(3) <= mcm_output(1021); -- input 36,0 <= -1 * ref[39]
		
		                -- Eq 37
		                eq_input(37)(0) <= mcm_output(964); -- input 37,0 <= -2 * ref[37]
		                eq_input(37)(1) <= mcm_output(999); -- input 37,0 <= 59 * ref[38]
		                eq_input(37)(2) <= mcm_output(1033); -- input 37,0 <= 8 * ref[39]
		                eq_input(37)(3) <= mcm_output(1048); -- input 37,0 <= -1 * ref[40]
		
		                -- Eq 38
		                eq_input(38)(0) <= mcm_output(991); -- input 38,0 <= -2 * ref[38]
		                eq_input(38)(1) <= mcm_output(1026); -- input 38,0 <= 59 * ref[39]
		                eq_input(38)(2) <= mcm_output(1060); -- input 38,0 <= 8 * ref[40]
		                eq_input(38)(3) <= mcm_output(1075); -- input 38,0 <= -1 * ref[41]
		
		                -- Eq 39
		                eq_input(39)(0) <= mcm_output(1018); -- input 39,0 <= -2 * ref[39]
		                eq_input(39)(1) <= mcm_output(1053); -- input 39,0 <= 59 * ref[40]
		                eq_input(39)(2) <= mcm_output(1087); -- input 39,0 <= 8 * ref[41]
		                eq_input(39)(3) <= mcm_output(1102); -- input 39,0 <= -1 * ref[42]
		
		                -- Eq 40
		                eq_input(40)(0) <= mcm_output(1045); -- input 40,0 <= -2 * ref[40]
		                eq_input(40)(1) <= mcm_output(1080); -- input 40,0 <= 59 * ref[41]
		                eq_input(40)(2) <= mcm_output(1114); -- input 40,0 <= 8 * ref[42]
		                eq_input(40)(3) <= mcm_output(1129); -- input 40,0 <= -1 * ref[43]
		
		                -- Eq 41
		                eq_input(41)(0) <= mcm_output(1072); -- input 41,0 <= -2 * ref[41]
		                eq_input(41)(1) <= mcm_output(1107); -- input 41,0 <= 59 * ref[42]
		                eq_input(41)(2) <= mcm_output(1141); -- input 41,0 <= 8 * ref[43]
		                eq_input(41)(3) <= mcm_output(1156); -- input 41,0 <= -1 * ref[44]
		
		                -- Eq 42
		                eq_input(42)(0) <= mcm_output(1099); -- input 42,0 <= -2 * ref[42]
		                eq_input(42)(1) <= mcm_output(1134); -- input 42,0 <= 59 * ref[43]
		                eq_input(42)(2) <= mcm_output(1168); -- input 42,0 <= 8 * ref[44]
		                eq_input(42)(3) <= mcm_output(1183); -- input 42,0 <= -1 * ref[45]
		
		                -- Eq 43
		                eq_input(43)(0) <= mcm_output(1126); -- input 43,0 <= -2 * ref[43]
		                eq_input(43)(1) <= mcm_output(1161); -- input 43,0 <= 59 * ref[44]
		                eq_input(43)(2) <= mcm_output(1195); -- input 43,0 <= 8 * ref[45]
		                eq_input(43)(3) <= mcm_output(1210); -- input 43,0 <= -1 * ref[46]
		
		                -- Eq 44
		                eq_input(44)(0) <= mcm_output(1153); -- input 44,0 <= -2 * ref[44]
		                eq_input(44)(1) <= mcm_output(1188); -- input 44,0 <= 59 * ref[45]
		                eq_input(44)(2) <= mcm_output(1222); -- input 44,0 <= 8 * ref[46]
		                eq_input(44)(3) <= mcm_output(1237); -- input 44,0 <= -1 * ref[47]
		
		                -- Eq 45
		                eq_input(45)(0) <= mcm_output(1180); -- input 45,0 <= -2 * ref[45]
		                eq_input(45)(1) <= mcm_output(1215); -- input 45,0 <= 59 * ref[46]
		                eq_input(45)(2) <= mcm_output(1249); -- input 45,0 <= 8 * ref[47]
		                eq_input(45)(3) <= mcm_output(1264); -- input 45,0 <= -1 * ref[48]
		
		                -- Eq 46
		                eq_input(46)(0) <= mcm_output(1207); -- input 46,0 <= -2 * ref[46]
		                eq_input(46)(1) <= mcm_output(1242); -- input 46,0 <= 59 * ref[47]
		                eq_input(46)(2) <= mcm_output(1276); -- input 46,0 <= 8 * ref[48]
		                eq_input(46)(3) <= mcm_output(1291); -- input 46,0 <= -1 * ref[49]
		
		                -- Eq 47
		                eq_input(47)(0) <= mcm_output(1234); -- input 47,0 <= -2 * ref[47]
		                eq_input(47)(1) <= mcm_output(1269); -- input 47,0 <= 59 * ref[48]
		                eq_input(47)(2) <= mcm_output(1303); -- input 47,0 <= 8 * ref[49]
		                eq_input(47)(3) <= mcm_output(1318); -- input 47,0 <= -1 * ref[50]
		
		                -- Eq 48
		                eq_input(48)(0) <= mcm_output(1261); -- input 48,0 <= -2 * ref[48]
		                eq_input(48)(1) <= mcm_output(1296); -- input 48,0 <= 59 * ref[49]
		                eq_input(48)(2) <= mcm_output(1330); -- input 48,0 <= 8 * ref[50]
		                eq_input(48)(3) <= mcm_output(1345); -- input 48,0 <= -1 * ref[51]
		
		                -- Eq 49
		                eq_input(49)(0) <= mcm_output(1288); -- input 49,0 <= -2 * ref[49]
		                eq_input(49)(1) <= mcm_output(1323); -- input 49,0 <= 59 * ref[50]
		                eq_input(49)(2) <= mcm_output(1357); -- input 49,0 <= 8 * ref[51]
		                eq_input(49)(3) <= mcm_output(1372); -- input 49,0 <= -1 * ref[52]
		
		                -- Eq 50
		                eq_input(50)(0) <= mcm_output(1315); -- input 50,0 <= -2 * ref[50]
		                eq_input(50)(1) <= mcm_output(1350); -- input 50,0 <= 59 * ref[51]
		                eq_input(50)(2) <= mcm_output(1384); -- input 50,0 <= 8 * ref[52]
		                eq_input(50)(3) <= mcm_output(1399); -- input 50,0 <= -1 * ref[53]
		
		                -- Eq 51
		                eq_input(51)(0) <= mcm_output(1342); -- input 51,0 <= -2 * ref[51]
		                eq_input(51)(1) <= mcm_output(1377); -- input 51,0 <= 59 * ref[52]
		                eq_input(51)(2) <= mcm_output(1411); -- input 51,0 <= 8 * ref[53]
		                eq_input(51)(3) <= mcm_output(1426); -- input 51,0 <= -1 * ref[54]
		
		                -- Eq 52
		                eq_input(52)(0) <= mcm_output(1369); -- input 52,0 <= -2 * ref[52]
		                eq_input(52)(1) <= mcm_output(1404); -- input 52,0 <= 59 * ref[53]
		                eq_input(52)(2) <= mcm_output(1438); -- input 52,0 <= 8 * ref[54]
		                eq_input(52)(3) <= mcm_output(1453); -- input 52,0 <= -1 * ref[55]
		
		                -- Eq 53
		                eq_input(53)(0) <= mcm_output(1396); -- input 53,0 <= -2 * ref[53]
		                eq_input(53)(1) <= mcm_output(1431); -- input 53,0 <= 59 * ref[54]
		                eq_input(53)(2) <= mcm_output(1465); -- input 53,0 <= 8 * ref[55]
		                eq_input(53)(3) <= mcm_output(1480); -- input 53,0 <= -1 * ref[56]
		
		                -- Eq 54
		                eq_input(54)(0) <= mcm_output(1423); -- input 54,0 <= -2 * ref[54]
		                eq_input(54)(1) <= mcm_output(1458); -- input 54,0 <= 59 * ref[55]
		                eq_input(54)(2) <= mcm_output(1492); -- input 54,0 <= 8 * ref[56]
		                eq_input(54)(3) <= mcm_output(1507); -- input 54,0 <= -1 * ref[57]
		
		                -- Eq 55
		                eq_input(55)(0) <= mcm_output(1450); -- input 55,0 <= -2 * ref[55]
		                eq_input(55)(1) <= mcm_output(1485); -- input 55,0 <= 59 * ref[56]
		                eq_input(55)(2) <= mcm_output(1519); -- input 55,0 <= 8 * ref[57]
		                eq_input(55)(3) <= mcm_output(1534); -- input 55,0 <= -1 * ref[58]
		
		                -- Eq 56
		                eq_input(56)(0) <= mcm_output(1477); -- input 56,0 <= -2 * ref[56]
		                eq_input(56)(1) <= mcm_output(1512); -- input 56,0 <= 59 * ref[57]
		                eq_input(56)(2) <= mcm_output(1546); -- input 56,0 <= 8 * ref[58]
		                eq_input(56)(3) <= mcm_output(1561); -- input 56,0 <= -1 * ref[59]
		
		                -- Eq 57
		                eq_input(57)(0) <= mcm_output(1504); -- input 57,0 <= -2 * ref[57]
		                eq_input(57)(1) <= mcm_output(1539); -- input 57,0 <= 59 * ref[58]
		                eq_input(57)(2) <= mcm_output(1573); -- input 57,0 <= 8 * ref[59]
		                eq_input(57)(3) <= mcm_output(1588); -- input 57,0 <= -1 * ref[60]
		
		                -- Eq 58
		                eq_input(58)(0) <= mcm_output(1531); -- input 58,0 <= -2 * ref[58]
		                eq_input(58)(1) <= mcm_output(1566); -- input 58,0 <= 59 * ref[59]
		                eq_input(58)(2) <= mcm_output(1600); -- input 58,0 <= 8 * ref[60]
		                eq_input(58)(3) <= mcm_output(1615); -- input 58,0 <= -1 * ref[61]
		
		                -- Eq 59
		                eq_input(59)(0) <= mcm_output(1558); -- input 59,0 <= -2 * ref[59]
		                eq_input(59)(1) <= mcm_output(1593); -- input 59,0 <= 59 * ref[60]
		                eq_input(59)(2) <= mcm_output(1627); -- input 59,0 <= 8 * ref[61]
		                eq_input(59)(3) <= mcm_output(1642); -- input 59,0 <= -1 * ref[62]
		
		                -- Eq 60
		                eq_input(60)(0) <= mcm_output(1585); -- input 60,0 <= -2 * ref[60]
		                eq_input(60)(1) <= mcm_output(1620); -- input 60,0 <= 59 * ref[61]
		                eq_input(60)(2) <= mcm_output(1654); -- input 60,0 <= 8 * ref[62]
		                eq_input(60)(3) <= mcm_output(1669); -- input 60,0 <= -1 * ref[63]
		
		                -- Eq 61
		                eq_input(61)(0) <= mcm_output(1612); -- input 61,0 <= -2 * ref[61]
		                eq_input(61)(1) <= mcm_output(1647); -- input 61,1 <= 59 * ref[62]
		                eq_input(61)(2) <= mcm_output(1681); -- input 61,2 <= 8 * ref[63]
		                eq_input(61)(3) <= mcm_output(1709); -- input 61,3 <= -1 * ref[64]
		
		                -- Eq 62
		                eq_input(62)(0) <= mcm_output(1639); -- input 62,0 <= -2 * ref[62]
		                eq_input(62)(1) <= mcm_output(1674); -- input 62,1 <= 59 * ref[63]
		                eq_input(62)(2) <= mcm_output(1701); -- input 62,2 <= 8 * ref[64]
		                eq_input(62)(3) <= mcm_output(1725); -- input 62,3 <= -1 * ref[65]
		
		                -- Eq 63
		                eq_input(63)(0) <= mcm_output(1666); -- input 63,0 <= -2 * ref[63]
		                eq_input(63)(1) <= mcm_output(1693); -- input 63,1 <= 59 * ref[64]
		                eq_input(63)(2) <= mcm_output(1717); -- input 63,2 <= 8 * ref[65]
		                eq_input(63)(3) <= mcm_output(1733); -- input 63,3 <= -1 * ref[66]
		
		        when "001"=>
		                -- Eq 0
		                eq_input(0)(0) <= mcm_output(1); -- input 0,0 <= -5 * ref[0]
		                eq_input(0)(1) <= mcm_output(17); -- input 0,0 <= 47 * ref[1]
		                eq_input(0)(2) <= mcm_output(39); -- input 0,0 <= 24 * ref[2]
		                eq_input(0)(3) <= mcm_output(48); -- input 0,0 <= -3 * ref[3]
		
		                -- Eq 1
		                eq_input(1)(0) <= mcm_output(9); -- input 1,0 <= -5 * ref[1]
		                eq_input(1)(1) <= mcm_output(32); -- input 1,0 <= 47 * ref[2]
		                eq_input(1)(2) <= mcm_output(62); -- input 1,0 <= 24 * ref[3]
		                eq_input(1)(3) <= mcm_output(75); -- input 1,0 <= -3 * ref[4]
		
		                -- Eq 2
		                eq_input(2)(0) <= mcm_output(24); -- input 2,0 <= -5 * ref[2]
		                eq_input(2)(1) <= mcm_output(55); -- input 2,0 <= 47 * ref[3]
		                eq_input(2)(2) <= mcm_output(89); -- input 2,0 <= 24 * ref[4]
		                eq_input(2)(3) <= mcm_output(102); -- input 2,0 <= -3 * ref[5]
		
		                -- Eq 3
		                eq_input(3)(0) <= mcm_output(47); -- input 3,0 <= -5 * ref[3]
		                eq_input(3)(1) <= mcm_output(82); -- input 3,0 <= 47 * ref[4]
		                eq_input(3)(2) <= mcm_output(116); -- input 3,0 <= 24 * ref[5]
		                eq_input(3)(3) <= mcm_output(129); -- input 3,0 <= -3 * ref[6]
		
		                -- Eq 4
		                eq_input(4)(0) <= mcm_output(74); -- input 4,0 <= -5 * ref[4]
		                eq_input(4)(1) <= mcm_output(109); -- input 4,0 <= 47 * ref[5]
		                eq_input(4)(2) <= mcm_output(143); -- input 4,0 <= 24 * ref[6]
		                eq_input(4)(3) <= mcm_output(156); -- input 4,0 <= -3 * ref[7]
		
		                -- Eq 5
		                eq_input(5)(0) <= mcm_output(101); -- input 5,0 <= -5 * ref[5]
		                eq_input(5)(1) <= mcm_output(136); -- input 5,0 <= 47 * ref[6]
		                eq_input(5)(2) <= mcm_output(170); -- input 5,0 <= 24 * ref[7]
		                eq_input(5)(3) <= mcm_output(183); -- input 5,0 <= -3 * ref[8]
		
		                -- Eq 6
		                eq_input(6)(0) <= mcm_output(128); -- input 6,0 <= -5 * ref[6]
		                eq_input(6)(1) <= mcm_output(163); -- input 6,0 <= 47 * ref[7]
		                eq_input(6)(2) <= mcm_output(197); -- input 6,0 <= 24 * ref[8]
		                eq_input(6)(3) <= mcm_output(210); -- input 6,0 <= -3 * ref[9]
		
		                -- Eq 7
		                eq_input(7)(0) <= mcm_output(155); -- input 7,0 <= -5 * ref[7]
		                eq_input(7)(1) <= mcm_output(190); -- input 7,0 <= 47 * ref[8]
		                eq_input(7)(2) <= mcm_output(224); -- input 7,0 <= 24 * ref[9]
		                eq_input(7)(3) <= mcm_output(237); -- input 7,0 <= -3 * ref[10]
		
		                -- Eq 8
		                eq_input(8)(0) <= mcm_output(182); -- input 8,0 <= -5 * ref[8]
		                eq_input(8)(1) <= mcm_output(217); -- input 8,0 <= 47 * ref[9]
		                eq_input(8)(2) <= mcm_output(251); -- input 8,0 <= 24 * ref[10]
		                eq_input(8)(3) <= mcm_output(264); -- input 8,0 <= -3 * ref[11]
		
		                -- Eq 9
		                eq_input(9)(0) <= mcm_output(209); -- input 9,0 <= -5 * ref[9]
		                eq_input(9)(1) <= mcm_output(244); -- input 9,0 <= 47 * ref[10]
		                eq_input(9)(2) <= mcm_output(278); -- input 9,0 <= 24 * ref[11]
		                eq_input(9)(3) <= mcm_output(291); -- input 9,0 <= -3 * ref[12]
		
		                -- Eq 10
		                eq_input(10)(0) <= mcm_output(236); -- input 10,0 <= -5 * ref[10]
		                eq_input(10)(1) <= mcm_output(271); -- input 10,0 <= 47 * ref[11]
		                eq_input(10)(2) <= mcm_output(305); -- input 10,0 <= 24 * ref[12]
		                eq_input(10)(3) <= mcm_output(318); -- input 10,0 <= -3 * ref[13]
		
		                -- Eq 11
		                eq_input(11)(0) <= mcm_output(263); -- input 11,0 <= -5 * ref[11]
		                eq_input(11)(1) <= mcm_output(298); -- input 11,0 <= 47 * ref[12]
		                eq_input(11)(2) <= mcm_output(332); -- input 11,0 <= 24 * ref[13]
		                eq_input(11)(3) <= mcm_output(345); -- input 11,0 <= -3 * ref[14]
		
		                -- Eq 12
		                eq_input(12)(0) <= mcm_output(290); -- input 12,0 <= -5 * ref[12]
		                eq_input(12)(1) <= mcm_output(325); -- input 12,0 <= 47 * ref[13]
		                eq_input(12)(2) <= mcm_output(359); -- input 12,0 <= 24 * ref[14]
		                eq_input(12)(3) <= mcm_output(372); -- input 12,0 <= -3 * ref[15]
		
		                -- Eq 13
		                eq_input(13)(0) <= mcm_output(317); -- input 13,0 <= -5 * ref[13]
		                eq_input(13)(1) <= mcm_output(352); -- input 13,0 <= 47 * ref[14]
		                eq_input(13)(2) <= mcm_output(386); -- input 13,0 <= 24 * ref[15]
		                eq_input(13)(3) <= mcm_output(399); -- input 13,0 <= -3 * ref[16]
		
		                -- Eq 14
		                eq_input(14)(0) <= mcm_output(344); -- input 14,0 <= -5 * ref[14]
		                eq_input(14)(1) <= mcm_output(379); -- input 14,0 <= 47 * ref[15]
		                eq_input(14)(2) <= mcm_output(413); -- input 14,0 <= 24 * ref[16]
		                eq_input(14)(3) <= mcm_output(426); -- input 14,0 <= -3 * ref[17]
		
		                -- Eq 15
		                eq_input(15)(0) <= mcm_output(371); -- input 15,0 <= -5 * ref[15]
		                eq_input(15)(1) <= mcm_output(406); -- input 15,0 <= 47 * ref[16]
		                eq_input(15)(2) <= mcm_output(440); -- input 15,0 <= 24 * ref[17]
		                eq_input(15)(3) <= mcm_output(453); -- input 15,0 <= -3 * ref[18]
		
		                -- Eq 16
		                eq_input(16)(0) <= mcm_output(398); -- input 16,0 <= -5 * ref[16]
		                eq_input(16)(1) <= mcm_output(433); -- input 16,0 <= 47 * ref[17]
		                eq_input(16)(2) <= mcm_output(467); -- input 16,0 <= 24 * ref[18]
		                eq_input(16)(3) <= mcm_output(480); -- input 16,0 <= -3 * ref[19]
		
		                -- Eq 17
		                eq_input(17)(0) <= mcm_output(425); -- input 17,0 <= -5 * ref[17]
		                eq_input(17)(1) <= mcm_output(460); -- input 17,0 <= 47 * ref[18]
		                eq_input(17)(2) <= mcm_output(494); -- input 17,0 <= 24 * ref[19]
		                eq_input(17)(3) <= mcm_output(507); -- input 17,0 <= -3 * ref[20]
		
		                -- Eq 18
		                eq_input(18)(0) <= mcm_output(452); -- input 18,0 <= -5 * ref[18]
		                eq_input(18)(1) <= mcm_output(487); -- input 18,0 <= 47 * ref[19]
		                eq_input(18)(2) <= mcm_output(521); -- input 18,0 <= 24 * ref[20]
		                eq_input(18)(3) <= mcm_output(534); -- input 18,0 <= -3 * ref[21]
		
		                -- Eq 19
		                eq_input(19)(0) <= mcm_output(479); -- input 19,0 <= -5 * ref[19]
		                eq_input(19)(1) <= mcm_output(514); -- input 19,0 <= 47 * ref[20]
		                eq_input(19)(2) <= mcm_output(548); -- input 19,0 <= 24 * ref[21]
		                eq_input(19)(3) <= mcm_output(561); -- input 19,0 <= -3 * ref[22]
		
		                -- Eq 20
		                eq_input(20)(0) <= mcm_output(506); -- input 20,0 <= -5 * ref[20]
		                eq_input(20)(1) <= mcm_output(541); -- input 20,0 <= 47 * ref[21]
		                eq_input(20)(2) <= mcm_output(575); -- input 20,0 <= 24 * ref[22]
		                eq_input(20)(3) <= mcm_output(588); -- input 20,0 <= -3 * ref[23]
		
		                -- Eq 21
		                eq_input(21)(0) <= mcm_output(533); -- input 21,0 <= -5 * ref[21]
		                eq_input(21)(1) <= mcm_output(568); -- input 21,0 <= 47 * ref[22]
		                eq_input(21)(2) <= mcm_output(602); -- input 21,0 <= 24 * ref[23]
		                eq_input(21)(3) <= mcm_output(615); -- input 21,0 <= -3 * ref[24]
		
		                -- Eq 22
		                eq_input(22)(0) <= mcm_output(560); -- input 22,0 <= -5 * ref[22]
		                eq_input(22)(1) <= mcm_output(595); -- input 22,0 <= 47 * ref[23]
		                eq_input(22)(2) <= mcm_output(629); -- input 22,0 <= 24 * ref[24]
		                eq_input(22)(3) <= mcm_output(642); -- input 22,0 <= -3 * ref[25]
		
		                -- Eq 23
		                eq_input(23)(0) <= mcm_output(587); -- input 23,0 <= -5 * ref[23]
		                eq_input(23)(1) <= mcm_output(622); -- input 23,0 <= 47 * ref[24]
		                eq_input(23)(2) <= mcm_output(656); -- input 23,0 <= 24 * ref[25]
		                eq_input(23)(3) <= mcm_output(669); -- input 23,0 <= -3 * ref[26]
		
		                -- Eq 24
		                eq_input(24)(0) <= mcm_output(614); -- input 24,0 <= -5 * ref[24]
		                eq_input(24)(1) <= mcm_output(649); -- input 24,0 <= 47 * ref[25]
		                eq_input(24)(2) <= mcm_output(683); -- input 24,0 <= 24 * ref[26]
		                eq_input(24)(3) <= mcm_output(696); -- input 24,0 <= -3 * ref[27]
		
		                -- Eq 25
		                eq_input(25)(0) <= mcm_output(641); -- input 25,0 <= -5 * ref[25]
		                eq_input(25)(1) <= mcm_output(676); -- input 25,0 <= 47 * ref[26]
		                eq_input(25)(2) <= mcm_output(710); -- input 25,0 <= 24 * ref[27]
		                eq_input(25)(3) <= mcm_output(723); -- input 25,0 <= -3 * ref[28]
		
		                -- Eq 26
		                eq_input(26)(0) <= mcm_output(668); -- input 26,0 <= -5 * ref[26]
		                eq_input(26)(1) <= mcm_output(703); -- input 26,0 <= 47 * ref[27]
		                eq_input(26)(2) <= mcm_output(737); -- input 26,0 <= 24 * ref[28]
		                eq_input(26)(3) <= mcm_output(750); -- input 26,0 <= -3 * ref[29]
		
		                -- Eq 27
		                eq_input(27)(0) <= mcm_output(695); -- input 27,0 <= -5 * ref[27]
		                eq_input(27)(1) <= mcm_output(730); -- input 27,0 <= 47 * ref[28]
		                eq_input(27)(2) <= mcm_output(764); -- input 27,0 <= 24 * ref[29]
		                eq_input(27)(3) <= mcm_output(777); -- input 27,0 <= -3 * ref[30]
		
		                -- Eq 28
		                eq_input(28)(0) <= mcm_output(722); -- input 28,0 <= -5 * ref[28]
		                eq_input(28)(1) <= mcm_output(757); -- input 28,0 <= 47 * ref[29]
		                eq_input(28)(2) <= mcm_output(791); -- input 28,0 <= 24 * ref[30]
		                eq_input(28)(3) <= mcm_output(804); -- input 28,0 <= -3 * ref[31]
		
		                -- Eq 29
		                eq_input(29)(0) <= mcm_output(749); -- input 29,0 <= -5 * ref[29]
		                eq_input(29)(1) <= mcm_output(784); -- input 29,0 <= 47 * ref[30]
		                eq_input(29)(2) <= mcm_output(818); -- input 29,0 <= 24 * ref[31]
		                eq_input(29)(3) <= mcm_output(831); -- input 29,0 <= -3 * ref[32]
		
		                -- Eq 30
		                eq_input(30)(0) <= mcm_output(776); -- input 30,0 <= -5 * ref[30]
		                eq_input(30)(1) <= mcm_output(811); -- input 30,0 <= 47 * ref[31]
		                eq_input(30)(2) <= mcm_output(845); -- input 30,0 <= 24 * ref[32]
		                eq_input(30)(3) <= mcm_output(858); -- input 30,0 <= -3 * ref[33]
		
		                -- Eq 31
		                eq_input(31)(0) <= mcm_output(803); -- input 31,0 <= -5 * ref[31]
		                eq_input(31)(1) <= mcm_output(838); -- input 31,0 <= 47 * ref[32]
		                eq_input(31)(2) <= mcm_output(872); -- input 31,0 <= 24 * ref[33]
		                eq_input(31)(3) <= mcm_output(885); -- input 31,0 <= -3 * ref[34]
		
		                -- Eq 32
		                eq_input(32)(0) <= mcm_output(830); -- input 32,0 <= -5 * ref[32]
		                eq_input(32)(1) <= mcm_output(865); -- input 32,0 <= 47 * ref[33]
		                eq_input(32)(2) <= mcm_output(899); -- input 32,0 <= 24 * ref[34]
		                eq_input(32)(3) <= mcm_output(912); -- input 32,0 <= -3 * ref[35]
		
		                -- Eq 33
		                eq_input(33)(0) <= mcm_output(857); -- input 33,0 <= -5 * ref[33]
		                eq_input(33)(1) <= mcm_output(892); -- input 33,0 <= 47 * ref[34]
		                eq_input(33)(2) <= mcm_output(926); -- input 33,0 <= 24 * ref[35]
		                eq_input(33)(3) <= mcm_output(939); -- input 33,0 <= -3 * ref[36]
		
		                -- Eq 34
		                eq_input(34)(0) <= mcm_output(884); -- input 34,0 <= -5 * ref[34]
		                eq_input(34)(1) <= mcm_output(919); -- input 34,0 <= 47 * ref[35]
		                eq_input(34)(2) <= mcm_output(953); -- input 34,0 <= 24 * ref[36]
		                eq_input(34)(3) <= mcm_output(966); -- input 34,0 <= -3 * ref[37]
		
		                -- Eq 35
		                eq_input(35)(0) <= mcm_output(911); -- input 35,0 <= -5 * ref[35]
		                eq_input(35)(1) <= mcm_output(946); -- input 35,0 <= 47 * ref[36]
		                eq_input(35)(2) <= mcm_output(980); -- input 35,0 <= 24 * ref[37]
		                eq_input(35)(3) <= mcm_output(993); -- input 35,0 <= -3 * ref[38]
		
		                -- Eq 36
		                eq_input(36)(0) <= mcm_output(938); -- input 36,0 <= -5 * ref[36]
		                eq_input(36)(1) <= mcm_output(973); -- input 36,0 <= 47 * ref[37]
		                eq_input(36)(2) <= mcm_output(1007); -- input 36,0 <= 24 * ref[38]
		                eq_input(36)(3) <= mcm_output(1020); -- input 36,0 <= -3 * ref[39]
		
		                -- Eq 37
		                eq_input(37)(0) <= mcm_output(965); -- input 37,0 <= -5 * ref[37]
		                eq_input(37)(1) <= mcm_output(1000); -- input 37,0 <= 47 * ref[38]
		                eq_input(37)(2) <= mcm_output(1034); -- input 37,0 <= 24 * ref[39]
		                eq_input(37)(3) <= mcm_output(1047); -- input 37,0 <= -3 * ref[40]
		
		                -- Eq 38
		                eq_input(38)(0) <= mcm_output(992); -- input 38,0 <= -5 * ref[38]
		                eq_input(38)(1) <= mcm_output(1027); -- input 38,0 <= 47 * ref[39]
		                eq_input(38)(2) <= mcm_output(1061); -- input 38,0 <= 24 * ref[40]
		                eq_input(38)(3) <= mcm_output(1074); -- input 38,0 <= -3 * ref[41]
		
		                -- Eq 39
		                eq_input(39)(0) <= mcm_output(1019); -- input 39,0 <= -5 * ref[39]
		                eq_input(39)(1) <= mcm_output(1054); -- input 39,0 <= 47 * ref[40]
		                eq_input(39)(2) <= mcm_output(1088); -- input 39,0 <= 24 * ref[41]
		                eq_input(39)(3) <= mcm_output(1101); -- input 39,0 <= -3 * ref[42]
		
		                -- Eq 40
		                eq_input(40)(0) <= mcm_output(1046); -- input 40,0 <= -5 * ref[40]
		                eq_input(40)(1) <= mcm_output(1081); -- input 40,0 <= 47 * ref[41]
		                eq_input(40)(2) <= mcm_output(1115); -- input 40,0 <= 24 * ref[42]
		                eq_input(40)(3) <= mcm_output(1128); -- input 40,0 <= -3 * ref[43]
		
		                -- Eq 41
		                eq_input(41)(0) <= mcm_output(1073); -- input 41,0 <= -5 * ref[41]
		                eq_input(41)(1) <= mcm_output(1108); -- input 41,0 <= 47 * ref[42]
		                eq_input(41)(2) <= mcm_output(1142); -- input 41,0 <= 24 * ref[43]
		                eq_input(41)(3) <= mcm_output(1155); -- input 41,0 <= -3 * ref[44]
		
		                -- Eq 42
		                eq_input(42)(0) <= mcm_output(1100); -- input 42,0 <= -5 * ref[42]
		                eq_input(42)(1) <= mcm_output(1135); -- input 42,0 <= 47 * ref[43]
		                eq_input(42)(2) <= mcm_output(1169); -- input 42,0 <= 24 * ref[44]
		                eq_input(42)(3) <= mcm_output(1182); -- input 42,0 <= -3 * ref[45]
		
		                -- Eq 43
		                eq_input(43)(0) <= mcm_output(1127); -- input 43,0 <= -5 * ref[43]
		                eq_input(43)(1) <= mcm_output(1162); -- input 43,0 <= 47 * ref[44]
		                eq_input(43)(2) <= mcm_output(1196); -- input 43,0 <= 24 * ref[45]
		                eq_input(43)(3) <= mcm_output(1209); -- input 43,0 <= -3 * ref[46]
		
		                -- Eq 44
		                eq_input(44)(0) <= mcm_output(1154); -- input 44,0 <= -5 * ref[44]
		                eq_input(44)(1) <= mcm_output(1189); -- input 44,0 <= 47 * ref[45]
		                eq_input(44)(2) <= mcm_output(1223); -- input 44,0 <= 24 * ref[46]
		                eq_input(44)(3) <= mcm_output(1236); -- input 44,0 <= -3 * ref[47]
		
		                -- Eq 45
		                eq_input(45)(0) <= mcm_output(1181); -- input 45,0 <= -5 * ref[45]
		                eq_input(45)(1) <= mcm_output(1216); -- input 45,0 <= 47 * ref[46]
		                eq_input(45)(2) <= mcm_output(1250); -- input 45,0 <= 24 * ref[47]
		                eq_input(45)(3) <= mcm_output(1263); -- input 45,0 <= -3 * ref[48]
		
		                -- Eq 46
		                eq_input(46)(0) <= mcm_output(1208); -- input 46,0 <= -5 * ref[46]
		                eq_input(46)(1) <= mcm_output(1243); -- input 46,0 <= 47 * ref[47]
		                eq_input(46)(2) <= mcm_output(1277); -- input 46,0 <= 24 * ref[48]
		                eq_input(46)(3) <= mcm_output(1290); -- input 46,0 <= -3 * ref[49]
		
		                -- Eq 47
		                eq_input(47)(0) <= mcm_output(1235); -- input 47,0 <= -5 * ref[47]
		                eq_input(47)(1) <= mcm_output(1270); -- input 47,0 <= 47 * ref[48]
		                eq_input(47)(2) <= mcm_output(1304); -- input 47,0 <= 24 * ref[49]
		                eq_input(47)(3) <= mcm_output(1317); -- input 47,0 <= -3 * ref[50]
		
		                -- Eq 48
		                eq_input(48)(0) <= mcm_output(1262); -- input 48,0 <= -5 * ref[48]
		                eq_input(48)(1) <= mcm_output(1297); -- input 48,0 <= 47 * ref[49]
		                eq_input(48)(2) <= mcm_output(1331); -- input 48,0 <= 24 * ref[50]
		                eq_input(48)(3) <= mcm_output(1344); -- input 48,0 <= -3 * ref[51]
		
		                -- Eq 49
		                eq_input(49)(0) <= mcm_output(1289); -- input 49,0 <= -5 * ref[49]
		                eq_input(49)(1) <= mcm_output(1324); -- input 49,0 <= 47 * ref[50]
		                eq_input(49)(2) <= mcm_output(1358); -- input 49,0 <= 24 * ref[51]
		                eq_input(49)(3) <= mcm_output(1371); -- input 49,0 <= -3 * ref[52]
		
		                -- Eq 50
		                eq_input(50)(0) <= mcm_output(1316); -- input 50,0 <= -5 * ref[50]
		                eq_input(50)(1) <= mcm_output(1351); -- input 50,0 <= 47 * ref[51]
		                eq_input(50)(2) <= mcm_output(1385); -- input 50,0 <= 24 * ref[52]
		                eq_input(50)(3) <= mcm_output(1398); -- input 50,0 <= -3 * ref[53]
		
		                -- Eq 51
		                eq_input(51)(0) <= mcm_output(1343); -- input 51,0 <= -5 * ref[51]
		                eq_input(51)(1) <= mcm_output(1378); -- input 51,0 <= 47 * ref[52]
		                eq_input(51)(2) <= mcm_output(1412); -- input 51,0 <= 24 * ref[53]
		                eq_input(51)(3) <= mcm_output(1425); -- input 51,0 <= -3 * ref[54]
		
		                -- Eq 52
		                eq_input(52)(0) <= mcm_output(1370); -- input 52,0 <= -5 * ref[52]
		                eq_input(52)(1) <= mcm_output(1405); -- input 52,0 <= 47 * ref[53]
		                eq_input(52)(2) <= mcm_output(1439); -- input 52,0 <= 24 * ref[54]
		                eq_input(52)(3) <= mcm_output(1452); -- input 52,0 <= -3 * ref[55]
		
		                -- Eq 53
		                eq_input(53)(0) <= mcm_output(1397); -- input 53,0 <= -5 * ref[53]
		                eq_input(53)(1) <= mcm_output(1432); -- input 53,0 <= 47 * ref[54]
		                eq_input(53)(2) <= mcm_output(1466); -- input 53,0 <= 24 * ref[55]
		                eq_input(53)(3) <= mcm_output(1479); -- input 53,0 <= -3 * ref[56]
		
		                -- Eq 54
		                eq_input(54)(0) <= mcm_output(1424); -- input 54,0 <= -5 * ref[54]
		                eq_input(54)(1) <= mcm_output(1459); -- input 54,0 <= 47 * ref[55]
		                eq_input(54)(2) <= mcm_output(1493); -- input 54,0 <= 24 * ref[56]
		                eq_input(54)(3) <= mcm_output(1506); -- input 54,0 <= -3 * ref[57]
		
		                -- Eq 55
		                eq_input(55)(0) <= mcm_output(1451); -- input 55,0 <= -5 * ref[55]
		                eq_input(55)(1) <= mcm_output(1486); -- input 55,0 <= 47 * ref[56]
		                eq_input(55)(2) <= mcm_output(1520); -- input 55,0 <= 24 * ref[57]
		                eq_input(55)(3) <= mcm_output(1533); -- input 55,0 <= -3 * ref[58]
		
		                -- Eq 56
		                eq_input(56)(0) <= mcm_output(1478); -- input 56,0 <= -5 * ref[56]
		                eq_input(56)(1) <= mcm_output(1513); -- input 56,0 <= 47 * ref[57]
		                eq_input(56)(2) <= mcm_output(1547); -- input 56,0 <= 24 * ref[58]
		                eq_input(56)(3) <= mcm_output(1560); -- input 56,0 <= -3 * ref[59]
		
		                -- Eq 57
		                eq_input(57)(0) <= mcm_output(1505); -- input 57,0 <= -5 * ref[57]
		                eq_input(57)(1) <= mcm_output(1540); -- input 57,0 <= 47 * ref[58]
		                eq_input(57)(2) <= mcm_output(1574); -- input 57,0 <= 24 * ref[59]
		                eq_input(57)(3) <= mcm_output(1587); -- input 57,0 <= -3 * ref[60]
		
		                -- Eq 58
		                eq_input(58)(0) <= mcm_output(1532); -- input 58,0 <= -5 * ref[58]
		                eq_input(58)(1) <= mcm_output(1567); -- input 58,0 <= 47 * ref[59]
		                eq_input(58)(2) <= mcm_output(1601); -- input 58,0 <= 24 * ref[60]
		                eq_input(58)(3) <= mcm_output(1614); -- input 58,0 <= -3 * ref[61]
		
		                -- Eq 59
		                eq_input(59)(0) <= mcm_output(1559); -- input 59,0 <= -5 * ref[59]
		                eq_input(59)(1) <= mcm_output(1594); -- input 59,0 <= 47 * ref[60]
		                eq_input(59)(2) <= mcm_output(1628); -- input 59,0 <= 24 * ref[61]
		                eq_input(59)(3) <= mcm_output(1641); -- input 59,0 <= -3 * ref[62]
		
		                -- Eq 60
		                eq_input(60)(0) <= mcm_output(1586); -- input 60,0 <= -5 * ref[60]
		                eq_input(60)(1) <= mcm_output(1621); -- input 60,0 <= 47 * ref[61]
		                eq_input(60)(2) <= mcm_output(1655); -- input 60,0 <= 24 * ref[62]
		                eq_input(60)(3) <= mcm_output(1668); -- input 60,0 <= -3 * ref[63]
		
		                -- Eq 61
		                eq_input(61)(0) <= mcm_output(1613); -- input 61,0 <= -5 * ref[61]
		                eq_input(61)(1) <= mcm_output(1648); -- input 61,1 <= 47 * ref[62]
		                eq_input(61)(2) <= mcm_output(1682); -- input 61,2 <= 24 * ref[63]
		                eq_input(61)(3) <= mcm_output(1710); -- input 61,3 <= -3 * ref[64]
		
		                -- Eq 62
		                eq_input(62)(0) <= mcm_output(1640); -- input 62,0 <= -5 * ref[62]
		                eq_input(62)(1) <= mcm_output(1675); -- input 62,1 <= 47 * ref[63]
		                eq_input(62)(2) <= mcm_output(1702); -- input 62,2 <= 24 * ref[64]
		                eq_input(62)(3) <= mcm_output(1726); -- input 62,3 <= -3 * ref[65]
		
		                -- Eq 63
		                eq_input(63)(0) <= mcm_output(1667); -- input 63,0 <= -5 * ref[63]
		                eq_input(63)(1) <= mcm_output(1694); -- input 63,1 <= 47 * ref[64]
		                eq_input(63)(2) <= mcm_output(1718); -- input 63,2 <= 24 * ref[65]
		                eq_input(63)(3) <= mcm_output(1734); -- input 63,3 <= -3 * ref[66]
		
		        when "010"=>
		                -- Eq 0
		                eq_input(0)(0) <= mcm_output(2); -- input 0,0 <= -3 * ref[0]
		                eq_input(0)(1) <= mcm_output(18); -- input 0,0 <= 27 * ref[1]
		                eq_input(0)(2) <= mcm_output(40); -- input 0,0 <= 45 * ref[2]
		                eq_input(0)(3) <= mcm_output(47); -- input 0,0 <= -5 * ref[3]
		
		                -- Eq 1
		                eq_input(1)(0) <= mcm_output(10); -- input 1,0 <= -3 * ref[1]
		                eq_input(1)(1) <= mcm_output(33); -- input 1,0 <= 27 * ref[2]
		                eq_input(1)(2) <= mcm_output(63); -- input 1,0 <= 45 * ref[3]
		                eq_input(1)(3) <= mcm_output(74); -- input 1,0 <= -5 * ref[4]
		
		                -- Eq 2
		                eq_input(2)(0) <= mcm_output(25); -- input 2,0 <= -3 * ref[2]
		                eq_input(2)(1) <= mcm_output(56); -- input 2,0 <= 27 * ref[3]
		                eq_input(2)(2) <= mcm_output(90); -- input 2,0 <= 45 * ref[4]
		                eq_input(2)(3) <= mcm_output(101); -- input 2,0 <= -5 * ref[5]
		
		                -- Eq 3
		                eq_input(3)(0) <= mcm_output(48); -- input 3,0 <= -3 * ref[3]
		                eq_input(3)(1) <= mcm_output(83); -- input 3,0 <= 27 * ref[4]
		                eq_input(3)(2) <= mcm_output(117); -- input 3,0 <= 45 * ref[5]
		                eq_input(3)(3) <= mcm_output(128); -- input 3,0 <= -5 * ref[6]
		
		                -- Eq 4
		                eq_input(4)(0) <= mcm_output(75); -- input 4,0 <= -3 * ref[4]
		                eq_input(4)(1) <= mcm_output(110); -- input 4,0 <= 27 * ref[5]
		                eq_input(4)(2) <= mcm_output(144); -- input 4,0 <= 45 * ref[6]
		                eq_input(4)(3) <= mcm_output(155); -- input 4,0 <= -5 * ref[7]
		
		                -- Eq 5
		                eq_input(5)(0) <= mcm_output(102); -- input 5,0 <= -3 * ref[5]
		                eq_input(5)(1) <= mcm_output(137); -- input 5,0 <= 27 * ref[6]
		                eq_input(5)(2) <= mcm_output(171); -- input 5,0 <= 45 * ref[7]
		                eq_input(5)(3) <= mcm_output(182); -- input 5,0 <= -5 * ref[8]
		
		                -- Eq 6
		                eq_input(6)(0) <= mcm_output(129); -- input 6,0 <= -3 * ref[6]
		                eq_input(6)(1) <= mcm_output(164); -- input 6,0 <= 27 * ref[7]
		                eq_input(6)(2) <= mcm_output(198); -- input 6,0 <= 45 * ref[8]
		                eq_input(6)(3) <= mcm_output(209); -- input 6,0 <= -5 * ref[9]
		
		                -- Eq 7
		                eq_input(7)(0) <= mcm_output(156); -- input 7,0 <= -3 * ref[7]
		                eq_input(7)(1) <= mcm_output(191); -- input 7,0 <= 27 * ref[8]
		                eq_input(7)(2) <= mcm_output(225); -- input 7,0 <= 45 * ref[9]
		                eq_input(7)(3) <= mcm_output(236); -- input 7,0 <= -5 * ref[10]
		
		                -- Eq 8
		                eq_input(8)(0) <= mcm_output(183); -- input 8,0 <= -3 * ref[8]
		                eq_input(8)(1) <= mcm_output(218); -- input 8,0 <= 27 * ref[9]
		                eq_input(8)(2) <= mcm_output(252); -- input 8,0 <= 45 * ref[10]
		                eq_input(8)(3) <= mcm_output(263); -- input 8,0 <= -5 * ref[11]
		
		                -- Eq 9
		                eq_input(9)(0) <= mcm_output(210); -- input 9,0 <= -3 * ref[9]
		                eq_input(9)(1) <= mcm_output(245); -- input 9,0 <= 27 * ref[10]
		                eq_input(9)(2) <= mcm_output(279); -- input 9,0 <= 45 * ref[11]
		                eq_input(9)(3) <= mcm_output(290); -- input 9,0 <= -5 * ref[12]
		
		                -- Eq 10
		                eq_input(10)(0) <= mcm_output(237); -- input 10,0 <= -3 * ref[10]
		                eq_input(10)(1) <= mcm_output(272); -- input 10,0 <= 27 * ref[11]
		                eq_input(10)(2) <= mcm_output(306); -- input 10,0 <= 45 * ref[12]
		                eq_input(10)(3) <= mcm_output(317); -- input 10,0 <= -5 * ref[13]
		
		                -- Eq 11
		                eq_input(11)(0) <= mcm_output(264); -- input 11,0 <= -3 * ref[11]
		                eq_input(11)(1) <= mcm_output(299); -- input 11,0 <= 27 * ref[12]
		                eq_input(11)(2) <= mcm_output(333); -- input 11,0 <= 45 * ref[13]
		                eq_input(11)(3) <= mcm_output(344); -- input 11,0 <= -5 * ref[14]
		
		                -- Eq 12
		                eq_input(12)(0) <= mcm_output(291); -- input 12,0 <= -3 * ref[12]
		                eq_input(12)(1) <= mcm_output(326); -- input 12,0 <= 27 * ref[13]
		                eq_input(12)(2) <= mcm_output(360); -- input 12,0 <= 45 * ref[14]
		                eq_input(12)(3) <= mcm_output(371); -- input 12,0 <= -5 * ref[15]
		
		                -- Eq 13
		                eq_input(13)(0) <= mcm_output(318); -- input 13,0 <= -3 * ref[13]
		                eq_input(13)(1) <= mcm_output(353); -- input 13,0 <= 27 * ref[14]
		                eq_input(13)(2) <= mcm_output(387); -- input 13,0 <= 45 * ref[15]
		                eq_input(13)(3) <= mcm_output(398); -- input 13,0 <= -5 * ref[16]
		
		                -- Eq 14
		                eq_input(14)(0) <= mcm_output(345); -- input 14,0 <= -3 * ref[14]
		                eq_input(14)(1) <= mcm_output(380); -- input 14,0 <= 27 * ref[15]
		                eq_input(14)(2) <= mcm_output(414); -- input 14,0 <= 45 * ref[16]
		                eq_input(14)(3) <= mcm_output(425); -- input 14,0 <= -5 * ref[17]
		
		                -- Eq 15
		                eq_input(15)(0) <= mcm_output(372); -- input 15,0 <= -3 * ref[15]
		                eq_input(15)(1) <= mcm_output(407); -- input 15,0 <= 27 * ref[16]
		                eq_input(15)(2) <= mcm_output(441); -- input 15,0 <= 45 * ref[17]
		                eq_input(15)(3) <= mcm_output(452); -- input 15,0 <= -5 * ref[18]
		
		                -- Eq 16
		                eq_input(16)(0) <= mcm_output(399); -- input 16,0 <= -3 * ref[16]
		                eq_input(16)(1) <= mcm_output(434); -- input 16,0 <= 27 * ref[17]
		                eq_input(16)(2) <= mcm_output(468); -- input 16,0 <= 45 * ref[18]
		                eq_input(16)(3) <= mcm_output(479); -- input 16,0 <= -5 * ref[19]
		
		                -- Eq 17
		                eq_input(17)(0) <= mcm_output(426); -- input 17,0 <= -3 * ref[17]
		                eq_input(17)(1) <= mcm_output(461); -- input 17,0 <= 27 * ref[18]
		                eq_input(17)(2) <= mcm_output(495); -- input 17,0 <= 45 * ref[19]
		                eq_input(17)(3) <= mcm_output(506); -- input 17,0 <= -5 * ref[20]
		
		                -- Eq 18
		                eq_input(18)(0) <= mcm_output(453); -- input 18,0 <= -3 * ref[18]
		                eq_input(18)(1) <= mcm_output(488); -- input 18,0 <= 27 * ref[19]
		                eq_input(18)(2) <= mcm_output(522); -- input 18,0 <= 45 * ref[20]
		                eq_input(18)(3) <= mcm_output(533); -- input 18,0 <= -5 * ref[21]
		
		                -- Eq 19
		                eq_input(19)(0) <= mcm_output(480); -- input 19,0 <= -3 * ref[19]
		                eq_input(19)(1) <= mcm_output(515); -- input 19,0 <= 27 * ref[20]
		                eq_input(19)(2) <= mcm_output(549); -- input 19,0 <= 45 * ref[21]
		                eq_input(19)(3) <= mcm_output(560); -- input 19,0 <= -5 * ref[22]
		
		                -- Eq 20
		                eq_input(20)(0) <= mcm_output(507); -- input 20,0 <= -3 * ref[20]
		                eq_input(20)(1) <= mcm_output(542); -- input 20,0 <= 27 * ref[21]
		                eq_input(20)(2) <= mcm_output(576); -- input 20,0 <= 45 * ref[22]
		                eq_input(20)(3) <= mcm_output(587); -- input 20,0 <= -5 * ref[23]
		
		                -- Eq 21
		                eq_input(21)(0) <= mcm_output(534); -- input 21,0 <= -3 * ref[21]
		                eq_input(21)(1) <= mcm_output(569); -- input 21,0 <= 27 * ref[22]
		                eq_input(21)(2) <= mcm_output(603); -- input 21,0 <= 45 * ref[23]
		                eq_input(21)(3) <= mcm_output(614); -- input 21,0 <= -5 * ref[24]
		
		                -- Eq 22
		                eq_input(22)(0) <= mcm_output(561); -- input 22,0 <= -3 * ref[22]
		                eq_input(22)(1) <= mcm_output(596); -- input 22,0 <= 27 * ref[23]
		                eq_input(22)(2) <= mcm_output(630); -- input 22,0 <= 45 * ref[24]
		                eq_input(22)(3) <= mcm_output(641); -- input 22,0 <= -5 * ref[25]
		
		                -- Eq 23
		                eq_input(23)(0) <= mcm_output(588); -- input 23,0 <= -3 * ref[23]
		                eq_input(23)(1) <= mcm_output(623); -- input 23,0 <= 27 * ref[24]
		                eq_input(23)(2) <= mcm_output(657); -- input 23,0 <= 45 * ref[25]
		                eq_input(23)(3) <= mcm_output(668); -- input 23,0 <= -5 * ref[26]
		
		                -- Eq 24
		                eq_input(24)(0) <= mcm_output(615); -- input 24,0 <= -3 * ref[24]
		                eq_input(24)(1) <= mcm_output(650); -- input 24,0 <= 27 * ref[25]
		                eq_input(24)(2) <= mcm_output(684); -- input 24,0 <= 45 * ref[26]
		                eq_input(24)(3) <= mcm_output(695); -- input 24,0 <= -5 * ref[27]
		
		                -- Eq 25
		                eq_input(25)(0) <= mcm_output(642); -- input 25,0 <= -3 * ref[25]
		                eq_input(25)(1) <= mcm_output(677); -- input 25,0 <= 27 * ref[26]
		                eq_input(25)(2) <= mcm_output(711); -- input 25,0 <= 45 * ref[27]
		                eq_input(25)(3) <= mcm_output(722); -- input 25,0 <= -5 * ref[28]
		
		                -- Eq 26
		                eq_input(26)(0) <= mcm_output(669); -- input 26,0 <= -3 * ref[26]
		                eq_input(26)(1) <= mcm_output(704); -- input 26,0 <= 27 * ref[27]
		                eq_input(26)(2) <= mcm_output(738); -- input 26,0 <= 45 * ref[28]
		                eq_input(26)(3) <= mcm_output(749); -- input 26,0 <= -5 * ref[29]
		
		                -- Eq 27
		                eq_input(27)(0) <= mcm_output(696); -- input 27,0 <= -3 * ref[27]
		                eq_input(27)(1) <= mcm_output(731); -- input 27,0 <= 27 * ref[28]
		                eq_input(27)(2) <= mcm_output(765); -- input 27,0 <= 45 * ref[29]
		                eq_input(27)(3) <= mcm_output(776); -- input 27,0 <= -5 * ref[30]
		
		                -- Eq 28
		                eq_input(28)(0) <= mcm_output(723); -- input 28,0 <= -3 * ref[28]
		                eq_input(28)(1) <= mcm_output(758); -- input 28,0 <= 27 * ref[29]
		                eq_input(28)(2) <= mcm_output(792); -- input 28,0 <= 45 * ref[30]
		                eq_input(28)(3) <= mcm_output(803); -- input 28,0 <= -5 * ref[31]
		
		                -- Eq 29
		                eq_input(29)(0) <= mcm_output(750); -- input 29,0 <= -3 * ref[29]
		                eq_input(29)(1) <= mcm_output(785); -- input 29,0 <= 27 * ref[30]
		                eq_input(29)(2) <= mcm_output(819); -- input 29,0 <= 45 * ref[31]
		                eq_input(29)(3) <= mcm_output(830); -- input 29,0 <= -5 * ref[32]
		
		                -- Eq 30
		                eq_input(30)(0) <= mcm_output(777); -- input 30,0 <= -3 * ref[30]
		                eq_input(30)(1) <= mcm_output(812); -- input 30,0 <= 27 * ref[31]
		                eq_input(30)(2) <= mcm_output(846); -- input 30,0 <= 45 * ref[32]
		                eq_input(30)(3) <= mcm_output(857); -- input 30,0 <= -5 * ref[33]
		
		                -- Eq 31
		                eq_input(31)(0) <= mcm_output(804); -- input 31,0 <= -3 * ref[31]
		                eq_input(31)(1) <= mcm_output(839); -- input 31,0 <= 27 * ref[32]
		                eq_input(31)(2) <= mcm_output(873); -- input 31,0 <= 45 * ref[33]
		                eq_input(31)(3) <= mcm_output(884); -- input 31,0 <= -5 * ref[34]
		
		                -- Eq 32
		                eq_input(32)(0) <= mcm_output(831); -- input 32,0 <= -3 * ref[32]
		                eq_input(32)(1) <= mcm_output(866); -- input 32,0 <= 27 * ref[33]
		                eq_input(32)(2) <= mcm_output(900); -- input 32,0 <= 45 * ref[34]
		                eq_input(32)(3) <= mcm_output(911); -- input 32,0 <= -5 * ref[35]
		
		                -- Eq 33
		                eq_input(33)(0) <= mcm_output(858); -- input 33,0 <= -3 * ref[33]
		                eq_input(33)(1) <= mcm_output(893); -- input 33,0 <= 27 * ref[34]
		                eq_input(33)(2) <= mcm_output(927); -- input 33,0 <= 45 * ref[35]
		                eq_input(33)(3) <= mcm_output(938); -- input 33,0 <= -5 * ref[36]
		
		                -- Eq 34
		                eq_input(34)(0) <= mcm_output(885); -- input 34,0 <= -3 * ref[34]
		                eq_input(34)(1) <= mcm_output(920); -- input 34,0 <= 27 * ref[35]
		                eq_input(34)(2) <= mcm_output(954); -- input 34,0 <= 45 * ref[36]
		                eq_input(34)(3) <= mcm_output(965); -- input 34,0 <= -5 * ref[37]
		
		                -- Eq 35
		                eq_input(35)(0) <= mcm_output(912); -- input 35,0 <= -3 * ref[35]
		                eq_input(35)(1) <= mcm_output(947); -- input 35,0 <= 27 * ref[36]
		                eq_input(35)(2) <= mcm_output(981); -- input 35,0 <= 45 * ref[37]
		                eq_input(35)(3) <= mcm_output(992); -- input 35,0 <= -5 * ref[38]
		
		                -- Eq 36
		                eq_input(36)(0) <= mcm_output(939); -- input 36,0 <= -3 * ref[36]
		                eq_input(36)(1) <= mcm_output(974); -- input 36,0 <= 27 * ref[37]
		                eq_input(36)(2) <= mcm_output(1008); -- input 36,0 <= 45 * ref[38]
		                eq_input(36)(3) <= mcm_output(1019); -- input 36,0 <= -5 * ref[39]
		
		                -- Eq 37
		                eq_input(37)(0) <= mcm_output(966); -- input 37,0 <= -3 * ref[37]
		                eq_input(37)(1) <= mcm_output(1001); -- input 37,0 <= 27 * ref[38]
		                eq_input(37)(2) <= mcm_output(1035); -- input 37,0 <= 45 * ref[39]
		                eq_input(37)(3) <= mcm_output(1046); -- input 37,0 <= -5 * ref[40]
		
		                -- Eq 38
		                eq_input(38)(0) <= mcm_output(993); -- input 38,0 <= -3 * ref[38]
		                eq_input(38)(1) <= mcm_output(1028); -- input 38,0 <= 27 * ref[39]
		                eq_input(38)(2) <= mcm_output(1062); -- input 38,0 <= 45 * ref[40]
		                eq_input(38)(3) <= mcm_output(1073); -- input 38,0 <= -5 * ref[41]
		
		                -- Eq 39
		                eq_input(39)(0) <= mcm_output(1020); -- input 39,0 <= -3 * ref[39]
		                eq_input(39)(1) <= mcm_output(1055); -- input 39,0 <= 27 * ref[40]
		                eq_input(39)(2) <= mcm_output(1089); -- input 39,0 <= 45 * ref[41]
		                eq_input(39)(3) <= mcm_output(1100); -- input 39,0 <= -5 * ref[42]
		
		                -- Eq 40
		                eq_input(40)(0) <= mcm_output(1047); -- input 40,0 <= -3 * ref[40]
		                eq_input(40)(1) <= mcm_output(1082); -- input 40,0 <= 27 * ref[41]
		                eq_input(40)(2) <= mcm_output(1116); -- input 40,0 <= 45 * ref[42]
		                eq_input(40)(3) <= mcm_output(1127); -- input 40,0 <= -5 * ref[43]
		
		                -- Eq 41
		                eq_input(41)(0) <= mcm_output(1074); -- input 41,0 <= -3 * ref[41]
		                eq_input(41)(1) <= mcm_output(1109); -- input 41,0 <= 27 * ref[42]
		                eq_input(41)(2) <= mcm_output(1143); -- input 41,0 <= 45 * ref[43]
		                eq_input(41)(3) <= mcm_output(1154); -- input 41,0 <= -5 * ref[44]
		
		                -- Eq 42
		                eq_input(42)(0) <= mcm_output(1101); -- input 42,0 <= -3 * ref[42]
		                eq_input(42)(1) <= mcm_output(1136); -- input 42,0 <= 27 * ref[43]
		                eq_input(42)(2) <= mcm_output(1170); -- input 42,0 <= 45 * ref[44]
		                eq_input(42)(3) <= mcm_output(1181); -- input 42,0 <= -5 * ref[45]
		
		                -- Eq 43
		                eq_input(43)(0) <= mcm_output(1128); -- input 43,0 <= -3 * ref[43]
		                eq_input(43)(1) <= mcm_output(1163); -- input 43,0 <= 27 * ref[44]
		                eq_input(43)(2) <= mcm_output(1197); -- input 43,0 <= 45 * ref[45]
		                eq_input(43)(3) <= mcm_output(1208); -- input 43,0 <= -5 * ref[46]
		
		                -- Eq 44
		                eq_input(44)(0) <= mcm_output(1155); -- input 44,0 <= -3 * ref[44]
		                eq_input(44)(1) <= mcm_output(1190); -- input 44,0 <= 27 * ref[45]
		                eq_input(44)(2) <= mcm_output(1224); -- input 44,0 <= 45 * ref[46]
		                eq_input(44)(3) <= mcm_output(1235); -- input 44,0 <= -5 * ref[47]
		
		                -- Eq 45
		                eq_input(45)(0) <= mcm_output(1182); -- input 45,0 <= -3 * ref[45]
		                eq_input(45)(1) <= mcm_output(1217); -- input 45,0 <= 27 * ref[46]
		                eq_input(45)(2) <= mcm_output(1251); -- input 45,0 <= 45 * ref[47]
		                eq_input(45)(3) <= mcm_output(1262); -- input 45,0 <= -5 * ref[48]
		
		                -- Eq 46
		                eq_input(46)(0) <= mcm_output(1209); -- input 46,0 <= -3 * ref[46]
		                eq_input(46)(1) <= mcm_output(1244); -- input 46,0 <= 27 * ref[47]
		                eq_input(46)(2) <= mcm_output(1278); -- input 46,0 <= 45 * ref[48]
		                eq_input(46)(3) <= mcm_output(1289); -- input 46,0 <= -5 * ref[49]
		
		                -- Eq 47
		                eq_input(47)(0) <= mcm_output(1236); -- input 47,0 <= -3 * ref[47]
		                eq_input(47)(1) <= mcm_output(1271); -- input 47,0 <= 27 * ref[48]
		                eq_input(47)(2) <= mcm_output(1305); -- input 47,0 <= 45 * ref[49]
		                eq_input(47)(3) <= mcm_output(1316); -- input 47,0 <= -5 * ref[50]
		
		                -- Eq 48
		                eq_input(48)(0) <= mcm_output(1263); -- input 48,0 <= -3 * ref[48]
		                eq_input(48)(1) <= mcm_output(1298); -- input 48,0 <= 27 * ref[49]
		                eq_input(48)(2) <= mcm_output(1332); -- input 48,0 <= 45 * ref[50]
		                eq_input(48)(3) <= mcm_output(1343); -- input 48,0 <= -5 * ref[51]
		
		                -- Eq 49
		                eq_input(49)(0) <= mcm_output(1290); -- input 49,0 <= -3 * ref[49]
		                eq_input(49)(1) <= mcm_output(1325); -- input 49,0 <= 27 * ref[50]
		                eq_input(49)(2) <= mcm_output(1359); -- input 49,0 <= 45 * ref[51]
		                eq_input(49)(3) <= mcm_output(1370); -- input 49,0 <= -5 * ref[52]
		
		                -- Eq 50
		                eq_input(50)(0) <= mcm_output(1317); -- input 50,0 <= -3 * ref[50]
		                eq_input(50)(1) <= mcm_output(1352); -- input 50,0 <= 27 * ref[51]
		                eq_input(50)(2) <= mcm_output(1386); -- input 50,0 <= 45 * ref[52]
		                eq_input(50)(3) <= mcm_output(1397); -- input 50,0 <= -5 * ref[53]
		
		                -- Eq 51
		                eq_input(51)(0) <= mcm_output(1344); -- input 51,0 <= -3 * ref[51]
		                eq_input(51)(1) <= mcm_output(1379); -- input 51,0 <= 27 * ref[52]
		                eq_input(51)(2) <= mcm_output(1413); -- input 51,0 <= 45 * ref[53]
		                eq_input(51)(3) <= mcm_output(1424); -- input 51,0 <= -5 * ref[54]
		
		                -- Eq 52
		                eq_input(52)(0) <= mcm_output(1371); -- input 52,0 <= -3 * ref[52]
		                eq_input(52)(1) <= mcm_output(1406); -- input 52,0 <= 27 * ref[53]
		                eq_input(52)(2) <= mcm_output(1440); -- input 52,0 <= 45 * ref[54]
		                eq_input(52)(3) <= mcm_output(1451); -- input 52,0 <= -5 * ref[55]
		
		                -- Eq 53
		                eq_input(53)(0) <= mcm_output(1398); -- input 53,0 <= -3 * ref[53]
		                eq_input(53)(1) <= mcm_output(1433); -- input 53,0 <= 27 * ref[54]
		                eq_input(53)(2) <= mcm_output(1467); -- input 53,0 <= 45 * ref[55]
		                eq_input(53)(3) <= mcm_output(1478); -- input 53,0 <= -5 * ref[56]
		
		                -- Eq 54
		                eq_input(54)(0) <= mcm_output(1425); -- input 54,0 <= -3 * ref[54]
		                eq_input(54)(1) <= mcm_output(1460); -- input 54,0 <= 27 * ref[55]
		                eq_input(54)(2) <= mcm_output(1494); -- input 54,0 <= 45 * ref[56]
		                eq_input(54)(3) <= mcm_output(1505); -- input 54,0 <= -5 * ref[57]
		
		                -- Eq 55
		                eq_input(55)(0) <= mcm_output(1452); -- input 55,0 <= -3 * ref[55]
		                eq_input(55)(1) <= mcm_output(1487); -- input 55,0 <= 27 * ref[56]
		                eq_input(55)(2) <= mcm_output(1521); -- input 55,0 <= 45 * ref[57]
		                eq_input(55)(3) <= mcm_output(1532); -- input 55,0 <= -5 * ref[58]
		
		                -- Eq 56
		                eq_input(56)(0) <= mcm_output(1479); -- input 56,0 <= -3 * ref[56]
		                eq_input(56)(1) <= mcm_output(1514); -- input 56,0 <= 27 * ref[57]
		                eq_input(56)(2) <= mcm_output(1548); -- input 56,0 <= 45 * ref[58]
		                eq_input(56)(3) <= mcm_output(1559); -- input 56,0 <= -5 * ref[59]
		
		                -- Eq 57
		                eq_input(57)(0) <= mcm_output(1506); -- input 57,0 <= -3 * ref[57]
		                eq_input(57)(1) <= mcm_output(1541); -- input 57,0 <= 27 * ref[58]
		                eq_input(57)(2) <= mcm_output(1575); -- input 57,0 <= 45 * ref[59]
		                eq_input(57)(3) <= mcm_output(1586); -- input 57,0 <= -5 * ref[60]
		
		                -- Eq 58
		                eq_input(58)(0) <= mcm_output(1533); -- input 58,0 <= -3 * ref[58]
		                eq_input(58)(1) <= mcm_output(1568); -- input 58,0 <= 27 * ref[59]
		                eq_input(58)(2) <= mcm_output(1602); -- input 58,0 <= 45 * ref[60]
		                eq_input(58)(3) <= mcm_output(1613); -- input 58,0 <= -5 * ref[61]
		
		                -- Eq 59
		                eq_input(59)(0) <= mcm_output(1560); -- input 59,0 <= -3 * ref[59]
		                eq_input(59)(1) <= mcm_output(1595); -- input 59,0 <= 27 * ref[60]
		                eq_input(59)(2) <= mcm_output(1629); -- input 59,0 <= 45 * ref[61]
		                eq_input(59)(3) <= mcm_output(1640); -- input 59,0 <= -5 * ref[62]
		
		                -- Eq 60
		                eq_input(60)(0) <= mcm_output(1587); -- input 60,0 <= -3 * ref[60]
		                eq_input(60)(1) <= mcm_output(1622); -- input 60,0 <= 27 * ref[61]
		                eq_input(60)(2) <= mcm_output(1656); -- input 60,0 <= 45 * ref[62]
		                eq_input(60)(3) <= mcm_output(1667); -- input 60,0 <= -5 * ref[63]
		
		                -- Eq 61
		                eq_input(61)(0) <= mcm_output(1614); -- input 61,0 <= -3 * ref[61]
		                eq_input(61)(1) <= mcm_output(1649); -- input 61,1 <= 27 * ref[62]
		                eq_input(61)(2) <= mcm_output(1683); -- input 61,2 <= 45 * ref[63]
		                eq_input(61)(3) <= mcm_output(1711); -- input 61,3 <= -5 * ref[64]
		
		                -- Eq 62
		                eq_input(62)(0) <= mcm_output(1641); -- input 62,0 <= -3 * ref[62]
		                eq_input(62)(1) <= mcm_output(1676); -- input 62,1 <= 27 * ref[63]
		                eq_input(62)(2) <= mcm_output(1703); -- input 62,2 <= 45 * ref[64]
		                eq_input(62)(3) <= mcm_output(1727); -- input 62,3 <= -5 * ref[65]
		
		                -- Eq 63
		                eq_input(63)(0) <= mcm_output(1668); -- input 63,0 <= -3 * ref[63]
		                eq_input(63)(1) <= mcm_output(1695); -- input 63,1 <= 27 * ref[64]
		                eq_input(63)(2) <= mcm_output(1719); -- input 63,2 <= 45 * ref[65]
		                eq_input(63)(3) <= mcm_output(1735); -- input 63,3 <= -5 * ref[66]
		
		        when "011"=>
		                -- Eq 0
		                eq_input(0)(0) <= mcm_output(3); -- input 0,0 <= -1 * ref[0]
		                eq_input(0)(1) <= mcm_output(13); -- input 0,0 <= 10 * ref[1]
		                eq_input(0)(2) <= mcm_output(41); -- input 0,0 <= 58 * ref[2]
		                eq_input(0)(3) <= mcm_output(46); -- input 0,0 <= -2 * ref[3]
		
		                -- Eq 1
		                eq_input(1)(0) <= mcm_output(11); -- input 1,0 <= -1 * ref[1]
		                eq_input(1)(1) <= mcm_output(28); -- input 1,0 <= 10 * ref[2]
		                eq_input(1)(2) <= mcm_output(64); -- input 1,0 <= 58 * ref[3]
		                eq_input(1)(3) <= mcm_output(73); -- input 1,0 <= -2 * ref[4]
		
		                -- Eq 2
		                eq_input(2)(0) <= mcm_output(26); -- input 2,0 <= -1 * ref[2]
		                eq_input(2)(1) <= mcm_output(51); -- input 2,0 <= 10 * ref[3]
		                eq_input(2)(2) <= mcm_output(91); -- input 2,0 <= 58 * ref[4]
		                eq_input(2)(3) <= mcm_output(100); -- input 2,0 <= -2 * ref[5]
		
		                -- Eq 3
		                eq_input(3)(0) <= mcm_output(49); -- input 3,0 <= -1 * ref[3]
		                eq_input(3)(1) <= mcm_output(78); -- input 3,0 <= 10 * ref[4]
		                eq_input(3)(2) <= mcm_output(118); -- input 3,0 <= 58 * ref[5]
		                eq_input(3)(3) <= mcm_output(127); -- input 3,0 <= -2 * ref[6]
		
		                -- Eq 4
		                eq_input(4)(0) <= mcm_output(76); -- input 4,0 <= -1 * ref[4]
		                eq_input(4)(1) <= mcm_output(105); -- input 4,0 <= 10 * ref[5]
		                eq_input(4)(2) <= mcm_output(145); -- input 4,0 <= 58 * ref[6]
		                eq_input(4)(3) <= mcm_output(154); -- input 4,0 <= -2 * ref[7]
		
		                -- Eq 5
		                eq_input(5)(0) <= mcm_output(103); -- input 5,0 <= -1 * ref[5]
		                eq_input(5)(1) <= mcm_output(132); -- input 5,0 <= 10 * ref[6]
		                eq_input(5)(2) <= mcm_output(172); -- input 5,0 <= 58 * ref[7]
		                eq_input(5)(3) <= mcm_output(181); -- input 5,0 <= -2 * ref[8]
		
		                -- Eq 6
		                eq_input(6)(0) <= mcm_output(130); -- input 6,0 <= -1 * ref[6]
		                eq_input(6)(1) <= mcm_output(159); -- input 6,0 <= 10 * ref[7]
		                eq_input(6)(2) <= mcm_output(199); -- input 6,0 <= 58 * ref[8]
		                eq_input(6)(3) <= mcm_output(208); -- input 6,0 <= -2 * ref[9]
		
		                -- Eq 7
		                eq_input(7)(0) <= mcm_output(157); -- input 7,0 <= -1 * ref[7]
		                eq_input(7)(1) <= mcm_output(186); -- input 7,0 <= 10 * ref[8]
		                eq_input(7)(2) <= mcm_output(226); -- input 7,0 <= 58 * ref[9]
		                eq_input(7)(3) <= mcm_output(235); -- input 7,0 <= -2 * ref[10]
		
		                -- Eq 8
		                eq_input(8)(0) <= mcm_output(184); -- input 8,0 <= -1 * ref[8]
		                eq_input(8)(1) <= mcm_output(213); -- input 8,0 <= 10 * ref[9]
		                eq_input(8)(2) <= mcm_output(253); -- input 8,0 <= 58 * ref[10]
		                eq_input(8)(3) <= mcm_output(262); -- input 8,0 <= -2 * ref[11]
		
		                -- Eq 9
		                eq_input(9)(0) <= mcm_output(211); -- input 9,0 <= -1 * ref[9]
		                eq_input(9)(1) <= mcm_output(240); -- input 9,0 <= 10 * ref[10]
		                eq_input(9)(2) <= mcm_output(280); -- input 9,0 <= 58 * ref[11]
		                eq_input(9)(3) <= mcm_output(289); -- input 9,0 <= -2 * ref[12]
		
		                -- Eq 10
		                eq_input(10)(0) <= mcm_output(238); -- input 10,0 <= -1 * ref[10]
		                eq_input(10)(1) <= mcm_output(267); -- input 10,0 <= 10 * ref[11]
		                eq_input(10)(2) <= mcm_output(307); -- input 10,0 <= 58 * ref[12]
		                eq_input(10)(3) <= mcm_output(316); -- input 10,0 <= -2 * ref[13]
		
		                -- Eq 11
		                eq_input(11)(0) <= mcm_output(265); -- input 11,0 <= -1 * ref[11]
		                eq_input(11)(1) <= mcm_output(294); -- input 11,0 <= 10 * ref[12]
		                eq_input(11)(2) <= mcm_output(334); -- input 11,0 <= 58 * ref[13]
		                eq_input(11)(3) <= mcm_output(343); -- input 11,0 <= -2 * ref[14]
		
		                -- Eq 12
		                eq_input(12)(0) <= mcm_output(292); -- input 12,0 <= -1 * ref[12]
		                eq_input(12)(1) <= mcm_output(321); -- input 12,0 <= 10 * ref[13]
		                eq_input(12)(2) <= mcm_output(361); -- input 12,0 <= 58 * ref[14]
		                eq_input(12)(3) <= mcm_output(370); -- input 12,0 <= -2 * ref[15]
		
		                -- Eq 13
		                eq_input(13)(0) <= mcm_output(319); -- input 13,0 <= -1 * ref[13]
		                eq_input(13)(1) <= mcm_output(348); -- input 13,0 <= 10 * ref[14]
		                eq_input(13)(2) <= mcm_output(388); -- input 13,0 <= 58 * ref[15]
		                eq_input(13)(3) <= mcm_output(397); -- input 13,0 <= -2 * ref[16]
		
		                -- Eq 14
		                eq_input(14)(0) <= mcm_output(346); -- input 14,0 <= -1 * ref[14]
		                eq_input(14)(1) <= mcm_output(375); -- input 14,0 <= 10 * ref[15]
		                eq_input(14)(2) <= mcm_output(415); -- input 14,0 <= 58 * ref[16]
		                eq_input(14)(3) <= mcm_output(424); -- input 14,0 <= -2 * ref[17]
		
		                -- Eq 15
		                eq_input(15)(0) <= mcm_output(373); -- input 15,0 <= -1 * ref[15]
		                eq_input(15)(1) <= mcm_output(402); -- input 15,0 <= 10 * ref[16]
		                eq_input(15)(2) <= mcm_output(442); -- input 15,0 <= 58 * ref[17]
		                eq_input(15)(3) <= mcm_output(451); -- input 15,0 <= -2 * ref[18]
		
		                -- Eq 16
		                eq_input(16)(0) <= mcm_output(400); -- input 16,0 <= -1 * ref[16]
		                eq_input(16)(1) <= mcm_output(429); -- input 16,0 <= 10 * ref[17]
		                eq_input(16)(2) <= mcm_output(469); -- input 16,0 <= 58 * ref[18]
		                eq_input(16)(3) <= mcm_output(478); -- input 16,0 <= -2 * ref[19]
		
		                -- Eq 17
		                eq_input(17)(0) <= mcm_output(427); -- input 17,0 <= -1 * ref[17]
		                eq_input(17)(1) <= mcm_output(456); -- input 17,0 <= 10 * ref[18]
		                eq_input(17)(2) <= mcm_output(496); -- input 17,0 <= 58 * ref[19]
		                eq_input(17)(3) <= mcm_output(505); -- input 17,0 <= -2 * ref[20]
		
		                -- Eq 18
		                eq_input(18)(0) <= mcm_output(454); -- input 18,0 <= -1 * ref[18]
		                eq_input(18)(1) <= mcm_output(483); -- input 18,0 <= 10 * ref[19]
		                eq_input(18)(2) <= mcm_output(523); -- input 18,0 <= 58 * ref[20]
		                eq_input(18)(3) <= mcm_output(532); -- input 18,0 <= -2 * ref[21]
		
		                -- Eq 19
		                eq_input(19)(0) <= mcm_output(481); -- input 19,0 <= -1 * ref[19]
		                eq_input(19)(1) <= mcm_output(510); -- input 19,0 <= 10 * ref[20]
		                eq_input(19)(2) <= mcm_output(550); -- input 19,0 <= 58 * ref[21]
		                eq_input(19)(3) <= mcm_output(559); -- input 19,0 <= -2 * ref[22]
		
		                -- Eq 20
		                eq_input(20)(0) <= mcm_output(508); -- input 20,0 <= -1 * ref[20]
		                eq_input(20)(1) <= mcm_output(537); -- input 20,0 <= 10 * ref[21]
		                eq_input(20)(2) <= mcm_output(577); -- input 20,0 <= 58 * ref[22]
		                eq_input(20)(3) <= mcm_output(586); -- input 20,0 <= -2 * ref[23]
		
		                -- Eq 21
		                eq_input(21)(0) <= mcm_output(535); -- input 21,0 <= -1 * ref[21]
		                eq_input(21)(1) <= mcm_output(564); -- input 21,0 <= 10 * ref[22]
		                eq_input(21)(2) <= mcm_output(604); -- input 21,0 <= 58 * ref[23]
		                eq_input(21)(3) <= mcm_output(613); -- input 21,0 <= -2 * ref[24]
		
		                -- Eq 22
		                eq_input(22)(0) <= mcm_output(562); -- input 22,0 <= -1 * ref[22]
		                eq_input(22)(1) <= mcm_output(591); -- input 22,0 <= 10 * ref[23]
		                eq_input(22)(2) <= mcm_output(631); -- input 22,0 <= 58 * ref[24]
		                eq_input(22)(3) <= mcm_output(640); -- input 22,0 <= -2 * ref[25]
		
		                -- Eq 23
		                eq_input(23)(0) <= mcm_output(589); -- input 23,0 <= -1 * ref[23]
		                eq_input(23)(1) <= mcm_output(618); -- input 23,0 <= 10 * ref[24]
		                eq_input(23)(2) <= mcm_output(658); -- input 23,0 <= 58 * ref[25]
		                eq_input(23)(3) <= mcm_output(667); -- input 23,0 <= -2 * ref[26]
		
		                -- Eq 24
		                eq_input(24)(0) <= mcm_output(616); -- input 24,0 <= -1 * ref[24]
		                eq_input(24)(1) <= mcm_output(645); -- input 24,0 <= 10 * ref[25]
		                eq_input(24)(2) <= mcm_output(685); -- input 24,0 <= 58 * ref[26]
		                eq_input(24)(3) <= mcm_output(694); -- input 24,0 <= -2 * ref[27]
		
		                -- Eq 25
		                eq_input(25)(0) <= mcm_output(643); -- input 25,0 <= -1 * ref[25]
		                eq_input(25)(1) <= mcm_output(672); -- input 25,0 <= 10 * ref[26]
		                eq_input(25)(2) <= mcm_output(712); -- input 25,0 <= 58 * ref[27]
		                eq_input(25)(3) <= mcm_output(721); -- input 25,0 <= -2 * ref[28]
		
		                -- Eq 26
		                eq_input(26)(0) <= mcm_output(670); -- input 26,0 <= -1 * ref[26]
		                eq_input(26)(1) <= mcm_output(699); -- input 26,0 <= 10 * ref[27]
		                eq_input(26)(2) <= mcm_output(739); -- input 26,0 <= 58 * ref[28]
		                eq_input(26)(3) <= mcm_output(748); -- input 26,0 <= -2 * ref[29]
		
		                -- Eq 27
		                eq_input(27)(0) <= mcm_output(697); -- input 27,0 <= -1 * ref[27]
		                eq_input(27)(1) <= mcm_output(726); -- input 27,0 <= 10 * ref[28]
		                eq_input(27)(2) <= mcm_output(766); -- input 27,0 <= 58 * ref[29]
		                eq_input(27)(3) <= mcm_output(775); -- input 27,0 <= -2 * ref[30]
		
		                -- Eq 28
		                eq_input(28)(0) <= mcm_output(724); -- input 28,0 <= -1 * ref[28]
		                eq_input(28)(1) <= mcm_output(753); -- input 28,0 <= 10 * ref[29]
		                eq_input(28)(2) <= mcm_output(793); -- input 28,0 <= 58 * ref[30]
		                eq_input(28)(3) <= mcm_output(802); -- input 28,0 <= -2 * ref[31]
		
		                -- Eq 29
		                eq_input(29)(0) <= mcm_output(751); -- input 29,0 <= -1 * ref[29]
		                eq_input(29)(1) <= mcm_output(780); -- input 29,0 <= 10 * ref[30]
		                eq_input(29)(2) <= mcm_output(820); -- input 29,0 <= 58 * ref[31]
		                eq_input(29)(3) <= mcm_output(829); -- input 29,0 <= -2 * ref[32]
		
		                -- Eq 30
		                eq_input(30)(0) <= mcm_output(778); -- input 30,0 <= -1 * ref[30]
		                eq_input(30)(1) <= mcm_output(807); -- input 30,0 <= 10 * ref[31]
		                eq_input(30)(2) <= mcm_output(847); -- input 30,0 <= 58 * ref[32]
		                eq_input(30)(3) <= mcm_output(856); -- input 30,0 <= -2 * ref[33]
		
		                -- Eq 31
		                eq_input(31)(0) <= mcm_output(805); -- input 31,0 <= -1 * ref[31]
		                eq_input(31)(1) <= mcm_output(834); -- input 31,0 <= 10 * ref[32]
		                eq_input(31)(2) <= mcm_output(874); -- input 31,0 <= 58 * ref[33]
		                eq_input(31)(3) <= mcm_output(883); -- input 31,0 <= -2 * ref[34]
		
		                -- Eq 32
		                eq_input(32)(0) <= mcm_output(832); -- input 32,0 <= -1 * ref[32]
		                eq_input(32)(1) <= mcm_output(861); -- input 32,0 <= 10 * ref[33]
		                eq_input(32)(2) <= mcm_output(901); -- input 32,0 <= 58 * ref[34]
		                eq_input(32)(3) <= mcm_output(910); -- input 32,0 <= -2 * ref[35]
		
		                -- Eq 33
		                eq_input(33)(0) <= mcm_output(859); -- input 33,0 <= -1 * ref[33]
		                eq_input(33)(1) <= mcm_output(888); -- input 33,0 <= 10 * ref[34]
		                eq_input(33)(2) <= mcm_output(928); -- input 33,0 <= 58 * ref[35]
		                eq_input(33)(3) <= mcm_output(937); -- input 33,0 <= -2 * ref[36]
		
		                -- Eq 34
		                eq_input(34)(0) <= mcm_output(886); -- input 34,0 <= -1 * ref[34]
		                eq_input(34)(1) <= mcm_output(915); -- input 34,0 <= 10 * ref[35]
		                eq_input(34)(2) <= mcm_output(955); -- input 34,0 <= 58 * ref[36]
		                eq_input(34)(3) <= mcm_output(964); -- input 34,0 <= -2 * ref[37]
		
		                -- Eq 35
		                eq_input(35)(0) <= mcm_output(913); -- input 35,0 <= -1 * ref[35]
		                eq_input(35)(1) <= mcm_output(942); -- input 35,0 <= 10 * ref[36]
		                eq_input(35)(2) <= mcm_output(982); -- input 35,0 <= 58 * ref[37]
		                eq_input(35)(3) <= mcm_output(991); -- input 35,0 <= -2 * ref[38]
		
		                -- Eq 36
		                eq_input(36)(0) <= mcm_output(940); -- input 36,0 <= -1 * ref[36]
		                eq_input(36)(1) <= mcm_output(969); -- input 36,0 <= 10 * ref[37]
		                eq_input(36)(2) <= mcm_output(1009); -- input 36,0 <= 58 * ref[38]
		                eq_input(36)(3) <= mcm_output(1018); -- input 36,0 <= -2 * ref[39]
		
		                -- Eq 37
		                eq_input(37)(0) <= mcm_output(967); -- input 37,0 <= -1 * ref[37]
		                eq_input(37)(1) <= mcm_output(996); -- input 37,0 <= 10 * ref[38]
		                eq_input(37)(2) <= mcm_output(1036); -- input 37,0 <= 58 * ref[39]
		                eq_input(37)(3) <= mcm_output(1045); -- input 37,0 <= -2 * ref[40]
		
		                -- Eq 38
		                eq_input(38)(0) <= mcm_output(994); -- input 38,0 <= -1 * ref[38]
		                eq_input(38)(1) <= mcm_output(1023); -- input 38,0 <= 10 * ref[39]
		                eq_input(38)(2) <= mcm_output(1063); -- input 38,0 <= 58 * ref[40]
		                eq_input(38)(3) <= mcm_output(1072); -- input 38,0 <= -2 * ref[41]
		
		                -- Eq 39
		                eq_input(39)(0) <= mcm_output(1021); -- input 39,0 <= -1 * ref[39]
		                eq_input(39)(1) <= mcm_output(1050); -- input 39,0 <= 10 * ref[40]
		                eq_input(39)(2) <= mcm_output(1090); -- input 39,0 <= 58 * ref[41]
		                eq_input(39)(3) <= mcm_output(1099); -- input 39,0 <= -2 * ref[42]
		
		                -- Eq 40
		                eq_input(40)(0) <= mcm_output(1048); -- input 40,0 <= -1 * ref[40]
		                eq_input(40)(1) <= mcm_output(1077); -- input 40,0 <= 10 * ref[41]
		                eq_input(40)(2) <= mcm_output(1117); -- input 40,0 <= 58 * ref[42]
		                eq_input(40)(3) <= mcm_output(1126); -- input 40,0 <= -2 * ref[43]
		
		                -- Eq 41
		                eq_input(41)(0) <= mcm_output(1075); -- input 41,0 <= -1 * ref[41]
		                eq_input(41)(1) <= mcm_output(1104); -- input 41,0 <= 10 * ref[42]
		                eq_input(41)(2) <= mcm_output(1144); -- input 41,0 <= 58 * ref[43]
		                eq_input(41)(3) <= mcm_output(1153); -- input 41,0 <= -2 * ref[44]
		
		                -- Eq 42
		                eq_input(42)(0) <= mcm_output(1102); -- input 42,0 <= -1 * ref[42]
		                eq_input(42)(1) <= mcm_output(1131); -- input 42,0 <= 10 * ref[43]
		                eq_input(42)(2) <= mcm_output(1171); -- input 42,0 <= 58 * ref[44]
		                eq_input(42)(3) <= mcm_output(1180); -- input 42,0 <= -2 * ref[45]
		
		                -- Eq 43
		                eq_input(43)(0) <= mcm_output(1129); -- input 43,0 <= -1 * ref[43]
		                eq_input(43)(1) <= mcm_output(1158); -- input 43,0 <= 10 * ref[44]
		                eq_input(43)(2) <= mcm_output(1198); -- input 43,0 <= 58 * ref[45]
		                eq_input(43)(3) <= mcm_output(1207); -- input 43,0 <= -2 * ref[46]
		
		                -- Eq 44
		                eq_input(44)(0) <= mcm_output(1156); -- input 44,0 <= -1 * ref[44]
		                eq_input(44)(1) <= mcm_output(1185); -- input 44,0 <= 10 * ref[45]
		                eq_input(44)(2) <= mcm_output(1225); -- input 44,0 <= 58 * ref[46]
		                eq_input(44)(3) <= mcm_output(1234); -- input 44,0 <= -2 * ref[47]
		
		                -- Eq 45
		                eq_input(45)(0) <= mcm_output(1183); -- input 45,0 <= -1 * ref[45]
		                eq_input(45)(1) <= mcm_output(1212); -- input 45,0 <= 10 * ref[46]
		                eq_input(45)(2) <= mcm_output(1252); -- input 45,0 <= 58 * ref[47]
		                eq_input(45)(3) <= mcm_output(1261); -- input 45,0 <= -2 * ref[48]
		
		                -- Eq 46
		                eq_input(46)(0) <= mcm_output(1210); -- input 46,0 <= -1 * ref[46]
		                eq_input(46)(1) <= mcm_output(1239); -- input 46,0 <= 10 * ref[47]
		                eq_input(46)(2) <= mcm_output(1279); -- input 46,0 <= 58 * ref[48]
		                eq_input(46)(3) <= mcm_output(1288); -- input 46,0 <= -2 * ref[49]
		
		                -- Eq 47
		                eq_input(47)(0) <= mcm_output(1237); -- input 47,0 <= -1 * ref[47]
		                eq_input(47)(1) <= mcm_output(1266); -- input 47,0 <= 10 * ref[48]
		                eq_input(47)(2) <= mcm_output(1306); -- input 47,0 <= 58 * ref[49]
		                eq_input(47)(3) <= mcm_output(1315); -- input 47,0 <= -2 * ref[50]
		
		                -- Eq 48
		                eq_input(48)(0) <= mcm_output(1264); -- input 48,0 <= -1 * ref[48]
		                eq_input(48)(1) <= mcm_output(1293); -- input 48,0 <= 10 * ref[49]
		                eq_input(48)(2) <= mcm_output(1333); -- input 48,0 <= 58 * ref[50]
		                eq_input(48)(3) <= mcm_output(1342); -- input 48,0 <= -2 * ref[51]
		
		                -- Eq 49
		                eq_input(49)(0) <= mcm_output(1291); -- input 49,0 <= -1 * ref[49]
		                eq_input(49)(1) <= mcm_output(1320); -- input 49,0 <= 10 * ref[50]
		                eq_input(49)(2) <= mcm_output(1360); -- input 49,0 <= 58 * ref[51]
		                eq_input(49)(3) <= mcm_output(1369); -- input 49,0 <= -2 * ref[52]
		
		                -- Eq 50
		                eq_input(50)(0) <= mcm_output(1318); -- input 50,0 <= -1 * ref[50]
		                eq_input(50)(1) <= mcm_output(1347); -- input 50,0 <= 10 * ref[51]
		                eq_input(50)(2) <= mcm_output(1387); -- input 50,0 <= 58 * ref[52]
		                eq_input(50)(3) <= mcm_output(1396); -- input 50,0 <= -2 * ref[53]
		
		                -- Eq 51
		                eq_input(51)(0) <= mcm_output(1345); -- input 51,0 <= -1 * ref[51]
		                eq_input(51)(1) <= mcm_output(1374); -- input 51,0 <= 10 * ref[52]
		                eq_input(51)(2) <= mcm_output(1414); -- input 51,0 <= 58 * ref[53]
		                eq_input(51)(3) <= mcm_output(1423); -- input 51,0 <= -2 * ref[54]
		
		                -- Eq 52
		                eq_input(52)(0) <= mcm_output(1372); -- input 52,0 <= -1 * ref[52]
		                eq_input(52)(1) <= mcm_output(1401); -- input 52,0 <= 10 * ref[53]
		                eq_input(52)(2) <= mcm_output(1441); -- input 52,0 <= 58 * ref[54]
		                eq_input(52)(3) <= mcm_output(1450); -- input 52,0 <= -2 * ref[55]
		
		                -- Eq 53
		                eq_input(53)(0) <= mcm_output(1399); -- input 53,0 <= -1 * ref[53]
		                eq_input(53)(1) <= mcm_output(1428); -- input 53,0 <= 10 * ref[54]
		                eq_input(53)(2) <= mcm_output(1468); -- input 53,0 <= 58 * ref[55]
		                eq_input(53)(3) <= mcm_output(1477); -- input 53,0 <= -2 * ref[56]
		
		                -- Eq 54
		                eq_input(54)(0) <= mcm_output(1426); -- input 54,0 <= -1 * ref[54]
		                eq_input(54)(1) <= mcm_output(1455); -- input 54,0 <= 10 * ref[55]
		                eq_input(54)(2) <= mcm_output(1495); -- input 54,0 <= 58 * ref[56]
		                eq_input(54)(3) <= mcm_output(1504); -- input 54,0 <= -2 * ref[57]
		
		                -- Eq 55
		                eq_input(55)(0) <= mcm_output(1453); -- input 55,0 <= -1 * ref[55]
		                eq_input(55)(1) <= mcm_output(1482); -- input 55,0 <= 10 * ref[56]
		                eq_input(55)(2) <= mcm_output(1522); -- input 55,0 <= 58 * ref[57]
		                eq_input(55)(3) <= mcm_output(1531); -- input 55,0 <= -2 * ref[58]
		
		                -- Eq 56
		                eq_input(56)(0) <= mcm_output(1480); -- input 56,0 <= -1 * ref[56]
		                eq_input(56)(1) <= mcm_output(1509); -- input 56,0 <= 10 * ref[57]
		                eq_input(56)(2) <= mcm_output(1549); -- input 56,0 <= 58 * ref[58]
		                eq_input(56)(3) <= mcm_output(1558); -- input 56,0 <= -2 * ref[59]
		
		                -- Eq 57
		                eq_input(57)(0) <= mcm_output(1507); -- input 57,0 <= -1 * ref[57]
		                eq_input(57)(1) <= mcm_output(1536); -- input 57,0 <= 10 * ref[58]
		                eq_input(57)(2) <= mcm_output(1576); -- input 57,0 <= 58 * ref[59]
		                eq_input(57)(3) <= mcm_output(1585); -- input 57,0 <= -2 * ref[60]
		
		                -- Eq 58
		                eq_input(58)(0) <= mcm_output(1534); -- input 58,0 <= -1 * ref[58]
		                eq_input(58)(1) <= mcm_output(1563); -- input 58,0 <= 10 * ref[59]
		                eq_input(58)(2) <= mcm_output(1603); -- input 58,0 <= 58 * ref[60]
		                eq_input(58)(3) <= mcm_output(1612); -- input 58,0 <= -2 * ref[61]
		
		                -- Eq 59
		                eq_input(59)(0) <= mcm_output(1561); -- input 59,0 <= -1 * ref[59]
		                eq_input(59)(1) <= mcm_output(1590); -- input 59,0 <= 10 * ref[60]
		                eq_input(59)(2) <= mcm_output(1630); -- input 59,0 <= 58 * ref[61]
		                eq_input(59)(3) <= mcm_output(1639); -- input 59,0 <= -2 * ref[62]
		
		                -- Eq 60
		                eq_input(60)(0) <= mcm_output(1588); -- input 60,0 <= -1 * ref[60]
		                eq_input(60)(1) <= mcm_output(1617); -- input 60,0 <= 10 * ref[61]
		                eq_input(60)(2) <= mcm_output(1657); -- input 60,0 <= 58 * ref[62]
		                eq_input(60)(3) <= mcm_output(1666); -- input 60,0 <= -2 * ref[63]
		
		                -- Eq 61
		                eq_input(61)(0) <= mcm_output(1615); -- input 61,0 <= -1 * ref[61]
		                eq_input(61)(1) <= mcm_output(1644); -- input 61,1 <= 10 * ref[62]
		                eq_input(61)(2) <= mcm_output(1684); -- input 61,2 <= 58 * ref[63]
		                eq_input(61)(3) <= mcm_output(1712); -- input 61,3 <= -2 * ref[64]
		
		                -- Eq 62
		                eq_input(62)(0) <= mcm_output(1642); -- input 62,0 <= -1 * ref[62]
		                eq_input(62)(1) <= mcm_output(1671); -- input 62,1 <= 10 * ref[63]
		                eq_input(62)(2) <= mcm_output(1704); -- input 62,2 <= 58 * ref[64]
		                eq_input(62)(3) <= mcm_output(1728); -- input 62,3 <= -2 * ref[65]
		
		                -- Eq 63
		                eq_input(63)(0) <= mcm_output(1669); -- input 63,0 <= -1 * ref[63]
		                eq_input(63)(1) <= mcm_output(1696); -- input 63,1 <= 10 * ref[64]
		                eq_input(63)(2) <= mcm_output(1720); -- input 63,2 <= 58 * ref[65]
		                eq_input(63)(3) <= mcm_output(1736); -- input 63,3 <= -2 * ref[66]
		
		        when "100"=>
		                -- Eq 0
		                eq_input(0)(0) <= mcm_output(4); -- input 0,0 <= 14 * ref[0]
		                eq_input(0)(1) <= mcm_output(19); -- input 0,0 <= 30 * ref[1]
		                eq_input(0)(2) <= mcm_output(42); -- input 0,0 <= 17 * ref[2]
		                eq_input(0)(3) <= mcm_output(69); -- input 0,0 <= 1 * ref[3]
		
		                -- Eq 1
		                eq_input(1)(0) <= mcm_output(12); -- input 1,0 <= 14 * ref[1]
		                eq_input(1)(1) <= mcm_output(34); -- input 1,0 <= 30 * ref[2]
		                eq_input(1)(2) <= mcm_output(65); -- input 1,0 <= 17 * ref[3]
		                eq_input(1)(3) <= mcm_output(96); -- input 1,0 <= 1 * ref[4]
		
		                -- Eq 2
		                eq_input(2)(0) <= mcm_output(27); -- input 2,0 <= 14 * ref[2]
		                eq_input(2)(1) <= mcm_output(57); -- input 2,0 <= 30 * ref[3]
		                eq_input(2)(2) <= mcm_output(92); -- input 2,0 <= 17 * ref[4]
		                eq_input(2)(3) <= mcm_output(123); -- input 2,0 <= 1 * ref[5]
		
		                -- Eq 3
		                eq_input(3)(0) <= mcm_output(50); -- input 3,0 <= 14 * ref[3]
		                eq_input(3)(1) <= mcm_output(84); -- input 3,0 <= 30 * ref[4]
		                eq_input(3)(2) <= mcm_output(119); -- input 3,0 <= 17 * ref[5]
		                eq_input(3)(3) <= mcm_output(150); -- input 3,0 <= 1 * ref[6]
		
		                -- Eq 4
		                eq_input(4)(0) <= mcm_output(77); -- input 4,0 <= 14 * ref[4]
		                eq_input(4)(1) <= mcm_output(111); -- input 4,0 <= 30 * ref[5]
		                eq_input(4)(2) <= mcm_output(146); -- input 4,0 <= 17 * ref[6]
		                eq_input(4)(3) <= mcm_output(177); -- input 4,0 <= 1 * ref[7]
		
		                -- Eq 5
		                eq_input(5)(0) <= mcm_output(104); -- input 5,0 <= 14 * ref[5]
		                eq_input(5)(1) <= mcm_output(138); -- input 5,0 <= 30 * ref[6]
		                eq_input(5)(2) <= mcm_output(173); -- input 5,0 <= 17 * ref[7]
		                eq_input(5)(3) <= mcm_output(204); -- input 5,0 <= 1 * ref[8]
		
		                -- Eq 6
		                eq_input(6)(0) <= mcm_output(131); -- input 6,0 <= 14 * ref[6]
		                eq_input(6)(1) <= mcm_output(165); -- input 6,0 <= 30 * ref[7]
		                eq_input(6)(2) <= mcm_output(200); -- input 6,0 <= 17 * ref[8]
		                eq_input(6)(3) <= mcm_output(231); -- input 6,0 <= 1 * ref[9]
		
		                -- Eq 7
		                eq_input(7)(0) <= mcm_output(158); -- input 7,0 <= 14 * ref[7]
		                eq_input(7)(1) <= mcm_output(192); -- input 7,0 <= 30 * ref[8]
		                eq_input(7)(2) <= mcm_output(227); -- input 7,0 <= 17 * ref[9]
		                eq_input(7)(3) <= mcm_output(258); -- input 7,0 <= 1 * ref[10]
		
		                -- Eq 8
		                eq_input(8)(0) <= mcm_output(185); -- input 8,0 <= 14 * ref[8]
		                eq_input(8)(1) <= mcm_output(219); -- input 8,0 <= 30 * ref[9]
		                eq_input(8)(2) <= mcm_output(254); -- input 8,0 <= 17 * ref[10]
		                eq_input(8)(3) <= mcm_output(285); -- input 8,0 <= 1 * ref[11]
		
		                -- Eq 9
		                eq_input(9)(0) <= mcm_output(212); -- input 9,0 <= 14 * ref[9]
		                eq_input(9)(1) <= mcm_output(246); -- input 9,0 <= 30 * ref[10]
		                eq_input(9)(2) <= mcm_output(281); -- input 9,0 <= 17 * ref[11]
		                eq_input(9)(3) <= mcm_output(312); -- input 9,0 <= 1 * ref[12]
		
		                -- Eq 10
		                eq_input(10)(0) <= mcm_output(239); -- input 10,0 <= 14 * ref[10]
		                eq_input(10)(1) <= mcm_output(273); -- input 10,0 <= 30 * ref[11]
		                eq_input(10)(2) <= mcm_output(308); -- input 10,0 <= 17 * ref[12]
		                eq_input(10)(3) <= mcm_output(339); -- input 10,0 <= 1 * ref[13]
		
		                -- Eq 11
		                eq_input(11)(0) <= mcm_output(266); -- input 11,0 <= 14 * ref[11]
		                eq_input(11)(1) <= mcm_output(300); -- input 11,0 <= 30 * ref[12]
		                eq_input(11)(2) <= mcm_output(335); -- input 11,0 <= 17 * ref[13]
		                eq_input(11)(3) <= mcm_output(366); -- input 11,0 <= 1 * ref[14]
		
		                -- Eq 12
		                eq_input(12)(0) <= mcm_output(293); -- input 12,0 <= 14 * ref[12]
		                eq_input(12)(1) <= mcm_output(327); -- input 12,0 <= 30 * ref[13]
		                eq_input(12)(2) <= mcm_output(362); -- input 12,0 <= 17 * ref[14]
		                eq_input(12)(3) <= mcm_output(393); -- input 12,0 <= 1 * ref[15]
		
		                -- Eq 13
		                eq_input(13)(0) <= mcm_output(320); -- input 13,0 <= 14 * ref[13]
		                eq_input(13)(1) <= mcm_output(354); -- input 13,0 <= 30 * ref[14]
		                eq_input(13)(2) <= mcm_output(389); -- input 13,0 <= 17 * ref[15]
		                eq_input(13)(3) <= mcm_output(420); -- input 13,0 <= 1 * ref[16]
		
		                -- Eq 14
		                eq_input(14)(0) <= mcm_output(347); -- input 14,0 <= 14 * ref[14]
		                eq_input(14)(1) <= mcm_output(381); -- input 14,0 <= 30 * ref[15]
		                eq_input(14)(2) <= mcm_output(416); -- input 14,0 <= 17 * ref[16]
		                eq_input(14)(3) <= mcm_output(447); -- input 14,0 <= 1 * ref[17]
		
		                -- Eq 15
		                eq_input(15)(0) <= mcm_output(374); -- input 15,0 <= 14 * ref[15]
		                eq_input(15)(1) <= mcm_output(408); -- input 15,0 <= 30 * ref[16]
		                eq_input(15)(2) <= mcm_output(443); -- input 15,0 <= 17 * ref[17]
		                eq_input(15)(3) <= mcm_output(474); -- input 15,0 <= 1 * ref[18]
		
		                -- Eq 16
		                eq_input(16)(0) <= mcm_output(401); -- input 16,0 <= 14 * ref[16]
		                eq_input(16)(1) <= mcm_output(435); -- input 16,0 <= 30 * ref[17]
		                eq_input(16)(2) <= mcm_output(470); -- input 16,0 <= 17 * ref[18]
		                eq_input(16)(3) <= mcm_output(501); -- input 16,0 <= 1 * ref[19]
		
		                -- Eq 17
		                eq_input(17)(0) <= mcm_output(428); -- input 17,0 <= 14 * ref[17]
		                eq_input(17)(1) <= mcm_output(462); -- input 17,0 <= 30 * ref[18]
		                eq_input(17)(2) <= mcm_output(497); -- input 17,0 <= 17 * ref[19]
		                eq_input(17)(3) <= mcm_output(528); -- input 17,0 <= 1 * ref[20]
		
		                -- Eq 18
		                eq_input(18)(0) <= mcm_output(455); -- input 18,0 <= 14 * ref[18]
		                eq_input(18)(1) <= mcm_output(489); -- input 18,0 <= 30 * ref[19]
		                eq_input(18)(2) <= mcm_output(524); -- input 18,0 <= 17 * ref[20]
		                eq_input(18)(3) <= mcm_output(555); -- input 18,0 <= 1 * ref[21]
		
		                -- Eq 19
		                eq_input(19)(0) <= mcm_output(482); -- input 19,0 <= 14 * ref[19]
		                eq_input(19)(1) <= mcm_output(516); -- input 19,0 <= 30 * ref[20]
		                eq_input(19)(2) <= mcm_output(551); -- input 19,0 <= 17 * ref[21]
		                eq_input(19)(3) <= mcm_output(582); -- input 19,0 <= 1 * ref[22]
		
		                -- Eq 20
		                eq_input(20)(0) <= mcm_output(509); -- input 20,0 <= 14 * ref[20]
		                eq_input(20)(1) <= mcm_output(543); -- input 20,0 <= 30 * ref[21]
		                eq_input(20)(2) <= mcm_output(578); -- input 20,0 <= 17 * ref[22]
		                eq_input(20)(3) <= mcm_output(609); -- input 20,0 <= 1 * ref[23]
		
		                -- Eq 21
		                eq_input(21)(0) <= mcm_output(536); -- input 21,0 <= 14 * ref[21]
		                eq_input(21)(1) <= mcm_output(570); -- input 21,0 <= 30 * ref[22]
		                eq_input(21)(2) <= mcm_output(605); -- input 21,0 <= 17 * ref[23]
		                eq_input(21)(3) <= mcm_output(636); -- input 21,0 <= 1 * ref[24]
		
		                -- Eq 22
		                eq_input(22)(0) <= mcm_output(563); -- input 22,0 <= 14 * ref[22]
		                eq_input(22)(1) <= mcm_output(597); -- input 22,0 <= 30 * ref[23]
		                eq_input(22)(2) <= mcm_output(632); -- input 22,0 <= 17 * ref[24]
		                eq_input(22)(3) <= mcm_output(663); -- input 22,0 <= 1 * ref[25]
		
		                -- Eq 23
		                eq_input(23)(0) <= mcm_output(590); -- input 23,0 <= 14 * ref[23]
		                eq_input(23)(1) <= mcm_output(624); -- input 23,0 <= 30 * ref[24]
		                eq_input(23)(2) <= mcm_output(659); -- input 23,0 <= 17 * ref[25]
		                eq_input(23)(3) <= mcm_output(690); -- input 23,0 <= 1 * ref[26]
		
		                -- Eq 24
		                eq_input(24)(0) <= mcm_output(617); -- input 24,0 <= 14 * ref[24]
		                eq_input(24)(1) <= mcm_output(651); -- input 24,0 <= 30 * ref[25]
		                eq_input(24)(2) <= mcm_output(686); -- input 24,0 <= 17 * ref[26]
		                eq_input(24)(3) <= mcm_output(717); -- input 24,0 <= 1 * ref[27]
		
		                -- Eq 25
		                eq_input(25)(0) <= mcm_output(644); -- input 25,0 <= 14 * ref[25]
		                eq_input(25)(1) <= mcm_output(678); -- input 25,0 <= 30 * ref[26]
		                eq_input(25)(2) <= mcm_output(713); -- input 25,0 <= 17 * ref[27]
		                eq_input(25)(3) <= mcm_output(744); -- input 25,0 <= 1 * ref[28]
		
		                -- Eq 26
		                eq_input(26)(0) <= mcm_output(671); -- input 26,0 <= 14 * ref[26]
		                eq_input(26)(1) <= mcm_output(705); -- input 26,0 <= 30 * ref[27]
		                eq_input(26)(2) <= mcm_output(740); -- input 26,0 <= 17 * ref[28]
		                eq_input(26)(3) <= mcm_output(771); -- input 26,0 <= 1 * ref[29]
		
		                -- Eq 27
		                eq_input(27)(0) <= mcm_output(698); -- input 27,0 <= 14 * ref[27]
		                eq_input(27)(1) <= mcm_output(732); -- input 27,0 <= 30 * ref[28]
		                eq_input(27)(2) <= mcm_output(767); -- input 27,0 <= 17 * ref[29]
		                eq_input(27)(3) <= mcm_output(798); -- input 27,0 <= 1 * ref[30]
		
		                -- Eq 28
		                eq_input(28)(0) <= mcm_output(725); -- input 28,0 <= 14 * ref[28]
		                eq_input(28)(1) <= mcm_output(759); -- input 28,0 <= 30 * ref[29]
		                eq_input(28)(2) <= mcm_output(794); -- input 28,0 <= 17 * ref[30]
		                eq_input(28)(3) <= mcm_output(825); -- input 28,0 <= 1 * ref[31]
		
		                -- Eq 29
		                eq_input(29)(0) <= mcm_output(752); -- input 29,0 <= 14 * ref[29]
		                eq_input(29)(1) <= mcm_output(786); -- input 29,0 <= 30 * ref[30]
		                eq_input(29)(2) <= mcm_output(821); -- input 29,0 <= 17 * ref[31]
		                eq_input(29)(3) <= mcm_output(852); -- input 29,0 <= 1 * ref[32]
		
		                -- Eq 30
		                eq_input(30)(0) <= mcm_output(779); -- input 30,0 <= 14 * ref[30]
		                eq_input(30)(1) <= mcm_output(813); -- input 30,0 <= 30 * ref[31]
		                eq_input(30)(2) <= mcm_output(848); -- input 30,0 <= 17 * ref[32]
		                eq_input(30)(3) <= mcm_output(879); -- input 30,0 <= 1 * ref[33]
		
		                -- Eq 31
		                eq_input(31)(0) <= mcm_output(806); -- input 31,0 <= 14 * ref[31]
		                eq_input(31)(1) <= mcm_output(840); -- input 31,0 <= 30 * ref[32]
		                eq_input(31)(2) <= mcm_output(875); -- input 31,0 <= 17 * ref[33]
		                eq_input(31)(3) <= mcm_output(906); -- input 31,0 <= 1 * ref[34]
		
		                -- Eq 32
		                eq_input(32)(0) <= mcm_output(833); -- input 32,0 <= 14 * ref[32]
		                eq_input(32)(1) <= mcm_output(867); -- input 32,0 <= 30 * ref[33]
		                eq_input(32)(2) <= mcm_output(902); -- input 32,0 <= 17 * ref[34]
		                eq_input(32)(3) <= mcm_output(933); -- input 32,0 <= 1 * ref[35]
		
		                -- Eq 33
		                eq_input(33)(0) <= mcm_output(860); -- input 33,0 <= 14 * ref[33]
		                eq_input(33)(1) <= mcm_output(894); -- input 33,0 <= 30 * ref[34]
		                eq_input(33)(2) <= mcm_output(929); -- input 33,0 <= 17 * ref[35]
		                eq_input(33)(3) <= mcm_output(960); -- input 33,0 <= 1 * ref[36]
		
		                -- Eq 34
		                eq_input(34)(0) <= mcm_output(887); -- input 34,0 <= 14 * ref[34]
		                eq_input(34)(1) <= mcm_output(921); -- input 34,0 <= 30 * ref[35]
		                eq_input(34)(2) <= mcm_output(956); -- input 34,0 <= 17 * ref[36]
		                eq_input(34)(3) <= mcm_output(987); -- input 34,0 <= 1 * ref[37]
		
		                -- Eq 35
		                eq_input(35)(0) <= mcm_output(914); -- input 35,0 <= 14 * ref[35]
		                eq_input(35)(1) <= mcm_output(948); -- input 35,0 <= 30 * ref[36]
		                eq_input(35)(2) <= mcm_output(983); -- input 35,0 <= 17 * ref[37]
		                eq_input(35)(3) <= mcm_output(1014); -- input 35,0 <= 1 * ref[38]
		
		                -- Eq 36
		                eq_input(36)(0) <= mcm_output(941); -- input 36,0 <= 14 * ref[36]
		                eq_input(36)(1) <= mcm_output(975); -- input 36,0 <= 30 * ref[37]
		                eq_input(36)(2) <= mcm_output(1010); -- input 36,0 <= 17 * ref[38]
		                eq_input(36)(3) <= mcm_output(1041); -- input 36,0 <= 1 * ref[39]
		
		                -- Eq 37
		                eq_input(37)(0) <= mcm_output(968); -- input 37,0 <= 14 * ref[37]
		                eq_input(37)(1) <= mcm_output(1002); -- input 37,0 <= 30 * ref[38]
		                eq_input(37)(2) <= mcm_output(1037); -- input 37,0 <= 17 * ref[39]
		                eq_input(37)(3) <= mcm_output(1068); -- input 37,0 <= 1 * ref[40]
		
		                -- Eq 38
		                eq_input(38)(0) <= mcm_output(995); -- input 38,0 <= 14 * ref[38]
		                eq_input(38)(1) <= mcm_output(1029); -- input 38,0 <= 30 * ref[39]
		                eq_input(38)(2) <= mcm_output(1064); -- input 38,0 <= 17 * ref[40]
		                eq_input(38)(3) <= mcm_output(1095); -- input 38,0 <= 1 * ref[41]
		
		                -- Eq 39
		                eq_input(39)(0) <= mcm_output(1022); -- input 39,0 <= 14 * ref[39]
		                eq_input(39)(1) <= mcm_output(1056); -- input 39,0 <= 30 * ref[40]
		                eq_input(39)(2) <= mcm_output(1091); -- input 39,0 <= 17 * ref[41]
		                eq_input(39)(3) <= mcm_output(1122); -- input 39,0 <= 1 * ref[42]
		
		                -- Eq 40
		                eq_input(40)(0) <= mcm_output(1049); -- input 40,0 <= 14 * ref[40]
		                eq_input(40)(1) <= mcm_output(1083); -- input 40,0 <= 30 * ref[41]
		                eq_input(40)(2) <= mcm_output(1118); -- input 40,0 <= 17 * ref[42]
		                eq_input(40)(3) <= mcm_output(1149); -- input 40,0 <= 1 * ref[43]
		
		                -- Eq 41
		                eq_input(41)(0) <= mcm_output(1076); -- input 41,0 <= 14 * ref[41]
		                eq_input(41)(1) <= mcm_output(1110); -- input 41,0 <= 30 * ref[42]
		                eq_input(41)(2) <= mcm_output(1145); -- input 41,0 <= 17 * ref[43]
		                eq_input(41)(3) <= mcm_output(1176); -- input 41,0 <= 1 * ref[44]
		
		                -- Eq 42
		                eq_input(42)(0) <= mcm_output(1103); -- input 42,0 <= 14 * ref[42]
		                eq_input(42)(1) <= mcm_output(1137); -- input 42,0 <= 30 * ref[43]
		                eq_input(42)(2) <= mcm_output(1172); -- input 42,0 <= 17 * ref[44]
		                eq_input(42)(3) <= mcm_output(1203); -- input 42,0 <= 1 * ref[45]
		
		                -- Eq 43
		                eq_input(43)(0) <= mcm_output(1130); -- input 43,0 <= 14 * ref[43]
		                eq_input(43)(1) <= mcm_output(1164); -- input 43,0 <= 30 * ref[44]
		                eq_input(43)(2) <= mcm_output(1199); -- input 43,0 <= 17 * ref[45]
		                eq_input(43)(3) <= mcm_output(1230); -- input 43,0 <= 1 * ref[46]
		
		                -- Eq 44
		                eq_input(44)(0) <= mcm_output(1157); -- input 44,0 <= 14 * ref[44]
		                eq_input(44)(1) <= mcm_output(1191); -- input 44,0 <= 30 * ref[45]
		                eq_input(44)(2) <= mcm_output(1226); -- input 44,0 <= 17 * ref[46]
		                eq_input(44)(3) <= mcm_output(1257); -- input 44,0 <= 1 * ref[47]
		
		                -- Eq 45
		                eq_input(45)(0) <= mcm_output(1184); -- input 45,0 <= 14 * ref[45]
		                eq_input(45)(1) <= mcm_output(1218); -- input 45,0 <= 30 * ref[46]
		                eq_input(45)(2) <= mcm_output(1253); -- input 45,0 <= 17 * ref[47]
		                eq_input(45)(3) <= mcm_output(1284); -- input 45,0 <= 1 * ref[48]
		
		                -- Eq 46
		                eq_input(46)(0) <= mcm_output(1211); -- input 46,0 <= 14 * ref[46]
		                eq_input(46)(1) <= mcm_output(1245); -- input 46,0 <= 30 * ref[47]
		                eq_input(46)(2) <= mcm_output(1280); -- input 46,0 <= 17 * ref[48]
		                eq_input(46)(3) <= mcm_output(1311); -- input 46,0 <= 1 * ref[49]
		
		                -- Eq 47
		                eq_input(47)(0) <= mcm_output(1238); -- input 47,0 <= 14 * ref[47]
		                eq_input(47)(1) <= mcm_output(1272); -- input 47,0 <= 30 * ref[48]
		                eq_input(47)(2) <= mcm_output(1307); -- input 47,0 <= 17 * ref[49]
		                eq_input(47)(3) <= mcm_output(1338); -- input 47,0 <= 1 * ref[50]
		
		                -- Eq 48
		                eq_input(48)(0) <= mcm_output(1265); -- input 48,0 <= 14 * ref[48]
		                eq_input(48)(1) <= mcm_output(1299); -- input 48,0 <= 30 * ref[49]
		                eq_input(48)(2) <= mcm_output(1334); -- input 48,0 <= 17 * ref[50]
		                eq_input(48)(3) <= mcm_output(1365); -- input 48,0 <= 1 * ref[51]
		
		                -- Eq 49
		                eq_input(49)(0) <= mcm_output(1292); -- input 49,0 <= 14 * ref[49]
		                eq_input(49)(1) <= mcm_output(1326); -- input 49,0 <= 30 * ref[50]
		                eq_input(49)(2) <= mcm_output(1361); -- input 49,0 <= 17 * ref[51]
		                eq_input(49)(3) <= mcm_output(1392); -- input 49,0 <= 1 * ref[52]
		
		                -- Eq 50
		                eq_input(50)(0) <= mcm_output(1319); -- input 50,0 <= 14 * ref[50]
		                eq_input(50)(1) <= mcm_output(1353); -- input 50,0 <= 30 * ref[51]
		                eq_input(50)(2) <= mcm_output(1388); -- input 50,0 <= 17 * ref[52]
		                eq_input(50)(3) <= mcm_output(1419); -- input 50,0 <= 1 * ref[53]
		
		                -- Eq 51
		                eq_input(51)(0) <= mcm_output(1346); -- input 51,0 <= 14 * ref[51]
		                eq_input(51)(1) <= mcm_output(1380); -- input 51,0 <= 30 * ref[52]
		                eq_input(51)(2) <= mcm_output(1415); -- input 51,0 <= 17 * ref[53]
		                eq_input(51)(3) <= mcm_output(1446); -- input 51,0 <= 1 * ref[54]
		
		                -- Eq 52
		                eq_input(52)(0) <= mcm_output(1373); -- input 52,0 <= 14 * ref[52]
		                eq_input(52)(1) <= mcm_output(1407); -- input 52,0 <= 30 * ref[53]
		                eq_input(52)(2) <= mcm_output(1442); -- input 52,0 <= 17 * ref[54]
		                eq_input(52)(3) <= mcm_output(1473); -- input 52,0 <= 1 * ref[55]
		
		                -- Eq 53
		                eq_input(53)(0) <= mcm_output(1400); -- input 53,0 <= 14 * ref[53]
		                eq_input(53)(1) <= mcm_output(1434); -- input 53,0 <= 30 * ref[54]
		                eq_input(53)(2) <= mcm_output(1469); -- input 53,0 <= 17 * ref[55]
		                eq_input(53)(3) <= mcm_output(1500); -- input 53,0 <= 1 * ref[56]
		
		                -- Eq 54
		                eq_input(54)(0) <= mcm_output(1427); -- input 54,0 <= 14 * ref[54]
		                eq_input(54)(1) <= mcm_output(1461); -- input 54,0 <= 30 * ref[55]
		                eq_input(54)(2) <= mcm_output(1496); -- input 54,0 <= 17 * ref[56]
		                eq_input(54)(3) <= mcm_output(1527); -- input 54,0 <= 1 * ref[57]
		
		                -- Eq 55
		                eq_input(55)(0) <= mcm_output(1454); -- input 55,0 <= 14 * ref[55]
		                eq_input(55)(1) <= mcm_output(1488); -- input 55,0 <= 30 * ref[56]
		                eq_input(55)(2) <= mcm_output(1523); -- input 55,0 <= 17 * ref[57]
		                eq_input(55)(3) <= mcm_output(1554); -- input 55,0 <= 1 * ref[58]
		
		                -- Eq 56
		                eq_input(56)(0) <= mcm_output(1481); -- input 56,0 <= 14 * ref[56]
		                eq_input(56)(1) <= mcm_output(1515); -- input 56,0 <= 30 * ref[57]
		                eq_input(56)(2) <= mcm_output(1550); -- input 56,0 <= 17 * ref[58]
		                eq_input(56)(3) <= mcm_output(1581); -- input 56,0 <= 1 * ref[59]
		
		                -- Eq 57
		                eq_input(57)(0) <= mcm_output(1508); -- input 57,0 <= 14 * ref[57]
		                eq_input(57)(1) <= mcm_output(1542); -- input 57,0 <= 30 * ref[58]
		                eq_input(57)(2) <= mcm_output(1577); -- input 57,0 <= 17 * ref[59]
		                eq_input(57)(3) <= mcm_output(1608); -- input 57,0 <= 1 * ref[60]
		
		                -- Eq 58
		                eq_input(58)(0) <= mcm_output(1535); -- input 58,0 <= 14 * ref[58]
		                eq_input(58)(1) <= mcm_output(1569); -- input 58,0 <= 30 * ref[59]
		                eq_input(58)(2) <= mcm_output(1604); -- input 58,0 <= 17 * ref[60]
		                eq_input(58)(3) <= mcm_output(1635); -- input 58,0 <= 1 * ref[61]
		
		                -- Eq 59
		                eq_input(59)(0) <= mcm_output(1562); -- input 59,0 <= 14 * ref[59]
		                eq_input(59)(1) <= mcm_output(1596); -- input 59,0 <= 30 * ref[60]
		                eq_input(59)(2) <= mcm_output(1631); -- input 59,0 <= 17 * ref[61]
		                eq_input(59)(3) <= mcm_output(1662); -- input 59,0 <= 1 * ref[62]
		
		                -- Eq 60
		                eq_input(60)(0) <= mcm_output(1589); -- input 60,0 <= 14 * ref[60]
		                eq_input(60)(1) <= mcm_output(1623); -- input 60,0 <= 30 * ref[61]
		                eq_input(60)(2) <= mcm_output(1658); -- input 60,0 <= 17 * ref[62]
		                eq_input(60)(3) <= mcm_output(1689); -- input 60,0 <= 1 * ref[63]
		
		                -- Eq 61
		                eq_input(61)(0) <= mcm_output(1616); -- input 61,0 <= 14 * ref[61]
		                eq_input(61)(1) <= mcm_output(1650); -- input 61,1 <= 30 * ref[62]
		                eq_input(61)(2) <= mcm_output(1685); -- input 61,2 <= 17 * ref[63]
		                eq_input(61)(3) <= mcm_output(1713); -- input 61,3 <= 1 * ref[64]
		
		                -- Eq 62
		                eq_input(62)(0) <= mcm_output(1643); -- input 62,0 <= 14 * ref[62]
		                eq_input(62)(1) <= mcm_output(1677); -- input 62,1 <= 30 * ref[63]
		                eq_input(62)(2) <= mcm_output(1705); -- input 62,2 <= 17 * ref[64]
		                eq_input(62)(3) <= mcm_output(1729); -- input 62,3 <= 1 * ref[65]
		
		                -- Eq 63
		                eq_input(63)(0) <= mcm_output(1670); -- input 63,0 <= 14 * ref[63]
		                eq_input(63)(1) <= mcm_output(1697); -- input 63,1 <= 30 * ref[64]
		                eq_input(63)(2) <= mcm_output(1721); -- input 63,2 <= 17 * ref[65]
		                eq_input(63)(3) <= mcm_output(1737); -- input 63,3 <= 1 * ref[66]
		
		        when "101"=>
		                -- Eq 0
		                eq_input(0)(0) <= mcm_output(5); -- input 0,0 <= 10 * ref[0]
		                eq_input(0)(1) <= mcm_output(20); -- input 0,0 <= 26 * ref[1]
		                eq_input(0)(2) <= mcm_output(43); -- input 0,0 <= 21 * ref[2]
		                eq_input(0)(3) <= mcm_output(70); -- input 0,0 <= 5 * ref[3]
		
		                -- Eq 1
		                eq_input(1)(0) <= mcm_output(13); -- input 1,0 <= 10 * ref[1]
		                eq_input(1)(1) <= mcm_output(35); -- input 1,0 <= 26 * ref[2]
		                eq_input(1)(2) <= mcm_output(66); -- input 1,0 <= 21 * ref[3]
		                eq_input(1)(3) <= mcm_output(97); -- input 1,0 <= 5 * ref[4]
		
		                -- Eq 2
		                eq_input(2)(0) <= mcm_output(28); -- input 2,0 <= 10 * ref[2]
		                eq_input(2)(1) <= mcm_output(58); -- input 2,0 <= 26 * ref[3]
		                eq_input(2)(2) <= mcm_output(93); -- input 2,0 <= 21 * ref[4]
		                eq_input(2)(3) <= mcm_output(124); -- input 2,0 <= 5 * ref[5]
		
		                -- Eq 3
		                eq_input(3)(0) <= mcm_output(51); -- input 3,0 <= 10 * ref[3]
		                eq_input(3)(1) <= mcm_output(85); -- input 3,0 <= 26 * ref[4]
		                eq_input(3)(2) <= mcm_output(120); -- input 3,0 <= 21 * ref[5]
		                eq_input(3)(3) <= mcm_output(151); -- input 3,0 <= 5 * ref[6]
		
		                -- Eq 4
		                eq_input(4)(0) <= mcm_output(78); -- input 4,0 <= 10 * ref[4]
		                eq_input(4)(1) <= mcm_output(112); -- input 4,0 <= 26 * ref[5]
		                eq_input(4)(2) <= mcm_output(147); -- input 4,0 <= 21 * ref[6]
		                eq_input(4)(3) <= mcm_output(178); -- input 4,0 <= 5 * ref[7]
		
		                -- Eq 5
		                eq_input(5)(0) <= mcm_output(105); -- input 5,0 <= 10 * ref[5]
		                eq_input(5)(1) <= mcm_output(139); -- input 5,0 <= 26 * ref[6]
		                eq_input(5)(2) <= mcm_output(174); -- input 5,0 <= 21 * ref[7]
		                eq_input(5)(3) <= mcm_output(205); -- input 5,0 <= 5 * ref[8]
		
		                -- Eq 6
		                eq_input(6)(0) <= mcm_output(132); -- input 6,0 <= 10 * ref[6]
		                eq_input(6)(1) <= mcm_output(166); -- input 6,0 <= 26 * ref[7]
		                eq_input(6)(2) <= mcm_output(201); -- input 6,0 <= 21 * ref[8]
		                eq_input(6)(3) <= mcm_output(232); -- input 6,0 <= 5 * ref[9]
		
		                -- Eq 7
		                eq_input(7)(0) <= mcm_output(159); -- input 7,0 <= 10 * ref[7]
		                eq_input(7)(1) <= mcm_output(193); -- input 7,0 <= 26 * ref[8]
		                eq_input(7)(2) <= mcm_output(228); -- input 7,0 <= 21 * ref[9]
		                eq_input(7)(3) <= mcm_output(259); -- input 7,0 <= 5 * ref[10]
		
		                -- Eq 8
		                eq_input(8)(0) <= mcm_output(186); -- input 8,0 <= 10 * ref[8]
		                eq_input(8)(1) <= mcm_output(220); -- input 8,0 <= 26 * ref[9]
		                eq_input(8)(2) <= mcm_output(255); -- input 8,0 <= 21 * ref[10]
		                eq_input(8)(3) <= mcm_output(286); -- input 8,0 <= 5 * ref[11]
		
		                -- Eq 9
		                eq_input(9)(0) <= mcm_output(213); -- input 9,0 <= 10 * ref[9]
		                eq_input(9)(1) <= mcm_output(247); -- input 9,0 <= 26 * ref[10]
		                eq_input(9)(2) <= mcm_output(282); -- input 9,0 <= 21 * ref[11]
		                eq_input(9)(3) <= mcm_output(313); -- input 9,0 <= 5 * ref[12]
		
		                -- Eq 10
		                eq_input(10)(0) <= mcm_output(240); -- input 10,0 <= 10 * ref[10]
		                eq_input(10)(1) <= mcm_output(274); -- input 10,0 <= 26 * ref[11]
		                eq_input(10)(2) <= mcm_output(309); -- input 10,0 <= 21 * ref[12]
		                eq_input(10)(3) <= mcm_output(340); -- input 10,0 <= 5 * ref[13]
		
		                -- Eq 11
		                eq_input(11)(0) <= mcm_output(267); -- input 11,0 <= 10 * ref[11]
		                eq_input(11)(1) <= mcm_output(301); -- input 11,0 <= 26 * ref[12]
		                eq_input(11)(2) <= mcm_output(336); -- input 11,0 <= 21 * ref[13]
		                eq_input(11)(3) <= mcm_output(367); -- input 11,0 <= 5 * ref[14]
		
		                -- Eq 12
		                eq_input(12)(0) <= mcm_output(294); -- input 12,0 <= 10 * ref[12]
		                eq_input(12)(1) <= mcm_output(328); -- input 12,0 <= 26 * ref[13]
		                eq_input(12)(2) <= mcm_output(363); -- input 12,0 <= 21 * ref[14]
		                eq_input(12)(3) <= mcm_output(394); -- input 12,0 <= 5 * ref[15]
		
		                -- Eq 13
		                eq_input(13)(0) <= mcm_output(321); -- input 13,0 <= 10 * ref[13]
		                eq_input(13)(1) <= mcm_output(355); -- input 13,0 <= 26 * ref[14]
		                eq_input(13)(2) <= mcm_output(390); -- input 13,0 <= 21 * ref[15]
		                eq_input(13)(3) <= mcm_output(421); -- input 13,0 <= 5 * ref[16]
		
		                -- Eq 14
		                eq_input(14)(0) <= mcm_output(348); -- input 14,0 <= 10 * ref[14]
		                eq_input(14)(1) <= mcm_output(382); -- input 14,0 <= 26 * ref[15]
		                eq_input(14)(2) <= mcm_output(417); -- input 14,0 <= 21 * ref[16]
		                eq_input(14)(3) <= mcm_output(448); -- input 14,0 <= 5 * ref[17]
		
		                -- Eq 15
		                eq_input(15)(0) <= mcm_output(375); -- input 15,0 <= 10 * ref[15]
		                eq_input(15)(1) <= mcm_output(409); -- input 15,0 <= 26 * ref[16]
		                eq_input(15)(2) <= mcm_output(444); -- input 15,0 <= 21 * ref[17]
		                eq_input(15)(3) <= mcm_output(475); -- input 15,0 <= 5 * ref[18]
		
		                -- Eq 16
		                eq_input(16)(0) <= mcm_output(402); -- input 16,0 <= 10 * ref[16]
		                eq_input(16)(1) <= mcm_output(436); -- input 16,0 <= 26 * ref[17]
		                eq_input(16)(2) <= mcm_output(471); -- input 16,0 <= 21 * ref[18]
		                eq_input(16)(3) <= mcm_output(502); -- input 16,0 <= 5 * ref[19]
		
		                -- Eq 17
		                eq_input(17)(0) <= mcm_output(429); -- input 17,0 <= 10 * ref[17]
		                eq_input(17)(1) <= mcm_output(463); -- input 17,0 <= 26 * ref[18]
		                eq_input(17)(2) <= mcm_output(498); -- input 17,0 <= 21 * ref[19]
		                eq_input(17)(3) <= mcm_output(529); -- input 17,0 <= 5 * ref[20]
		
		                -- Eq 18
		                eq_input(18)(0) <= mcm_output(456); -- input 18,0 <= 10 * ref[18]
		                eq_input(18)(1) <= mcm_output(490); -- input 18,0 <= 26 * ref[19]
		                eq_input(18)(2) <= mcm_output(525); -- input 18,0 <= 21 * ref[20]
		                eq_input(18)(3) <= mcm_output(556); -- input 18,0 <= 5 * ref[21]
		
		                -- Eq 19
		                eq_input(19)(0) <= mcm_output(483); -- input 19,0 <= 10 * ref[19]
		                eq_input(19)(1) <= mcm_output(517); -- input 19,0 <= 26 * ref[20]
		                eq_input(19)(2) <= mcm_output(552); -- input 19,0 <= 21 * ref[21]
		                eq_input(19)(3) <= mcm_output(583); -- input 19,0 <= 5 * ref[22]
		
		                -- Eq 20
		                eq_input(20)(0) <= mcm_output(510); -- input 20,0 <= 10 * ref[20]
		                eq_input(20)(1) <= mcm_output(544); -- input 20,0 <= 26 * ref[21]
		                eq_input(20)(2) <= mcm_output(579); -- input 20,0 <= 21 * ref[22]
		                eq_input(20)(3) <= mcm_output(610); -- input 20,0 <= 5 * ref[23]
		
		                -- Eq 21
		                eq_input(21)(0) <= mcm_output(537); -- input 21,0 <= 10 * ref[21]
		                eq_input(21)(1) <= mcm_output(571); -- input 21,0 <= 26 * ref[22]
		                eq_input(21)(2) <= mcm_output(606); -- input 21,0 <= 21 * ref[23]
		                eq_input(21)(3) <= mcm_output(637); -- input 21,0 <= 5 * ref[24]
		
		                -- Eq 22
		                eq_input(22)(0) <= mcm_output(564); -- input 22,0 <= 10 * ref[22]
		                eq_input(22)(1) <= mcm_output(598); -- input 22,0 <= 26 * ref[23]
		                eq_input(22)(2) <= mcm_output(633); -- input 22,0 <= 21 * ref[24]
		                eq_input(22)(3) <= mcm_output(664); -- input 22,0 <= 5 * ref[25]
		
		                -- Eq 23
		                eq_input(23)(0) <= mcm_output(591); -- input 23,0 <= 10 * ref[23]
		                eq_input(23)(1) <= mcm_output(625); -- input 23,0 <= 26 * ref[24]
		                eq_input(23)(2) <= mcm_output(660); -- input 23,0 <= 21 * ref[25]
		                eq_input(23)(3) <= mcm_output(691); -- input 23,0 <= 5 * ref[26]
		
		                -- Eq 24
		                eq_input(24)(0) <= mcm_output(618); -- input 24,0 <= 10 * ref[24]
		                eq_input(24)(1) <= mcm_output(652); -- input 24,0 <= 26 * ref[25]
		                eq_input(24)(2) <= mcm_output(687); -- input 24,0 <= 21 * ref[26]
		                eq_input(24)(3) <= mcm_output(718); -- input 24,0 <= 5 * ref[27]
		
		                -- Eq 25
		                eq_input(25)(0) <= mcm_output(645); -- input 25,0 <= 10 * ref[25]
		                eq_input(25)(1) <= mcm_output(679); -- input 25,0 <= 26 * ref[26]
		                eq_input(25)(2) <= mcm_output(714); -- input 25,0 <= 21 * ref[27]
		                eq_input(25)(3) <= mcm_output(745); -- input 25,0 <= 5 * ref[28]
		
		                -- Eq 26
		                eq_input(26)(0) <= mcm_output(672); -- input 26,0 <= 10 * ref[26]
		                eq_input(26)(1) <= mcm_output(706); -- input 26,0 <= 26 * ref[27]
		                eq_input(26)(2) <= mcm_output(741); -- input 26,0 <= 21 * ref[28]
		                eq_input(26)(3) <= mcm_output(772); -- input 26,0 <= 5 * ref[29]
		
		                -- Eq 27
		                eq_input(27)(0) <= mcm_output(699); -- input 27,0 <= 10 * ref[27]
		                eq_input(27)(1) <= mcm_output(733); -- input 27,0 <= 26 * ref[28]
		                eq_input(27)(2) <= mcm_output(768); -- input 27,0 <= 21 * ref[29]
		                eq_input(27)(3) <= mcm_output(799); -- input 27,0 <= 5 * ref[30]
		
		                -- Eq 28
		                eq_input(28)(0) <= mcm_output(726); -- input 28,0 <= 10 * ref[28]
		                eq_input(28)(1) <= mcm_output(760); -- input 28,0 <= 26 * ref[29]
		                eq_input(28)(2) <= mcm_output(795); -- input 28,0 <= 21 * ref[30]
		                eq_input(28)(3) <= mcm_output(826); -- input 28,0 <= 5 * ref[31]
		
		                -- Eq 29
		                eq_input(29)(0) <= mcm_output(753); -- input 29,0 <= 10 * ref[29]
		                eq_input(29)(1) <= mcm_output(787); -- input 29,0 <= 26 * ref[30]
		                eq_input(29)(2) <= mcm_output(822); -- input 29,0 <= 21 * ref[31]
		                eq_input(29)(3) <= mcm_output(853); -- input 29,0 <= 5 * ref[32]
		
		                -- Eq 30
		                eq_input(30)(0) <= mcm_output(780); -- input 30,0 <= 10 * ref[30]
		                eq_input(30)(1) <= mcm_output(814); -- input 30,0 <= 26 * ref[31]
		                eq_input(30)(2) <= mcm_output(849); -- input 30,0 <= 21 * ref[32]
		                eq_input(30)(3) <= mcm_output(880); -- input 30,0 <= 5 * ref[33]
		
		                -- Eq 31
		                eq_input(31)(0) <= mcm_output(807); -- input 31,0 <= 10 * ref[31]
		                eq_input(31)(1) <= mcm_output(841); -- input 31,0 <= 26 * ref[32]
		                eq_input(31)(2) <= mcm_output(876); -- input 31,0 <= 21 * ref[33]
		                eq_input(31)(3) <= mcm_output(907); -- input 31,0 <= 5 * ref[34]
		
		                -- Eq 32
		                eq_input(32)(0) <= mcm_output(834); -- input 32,0 <= 10 * ref[32]
		                eq_input(32)(1) <= mcm_output(868); -- input 32,0 <= 26 * ref[33]
		                eq_input(32)(2) <= mcm_output(903); -- input 32,0 <= 21 * ref[34]
		                eq_input(32)(3) <= mcm_output(934); -- input 32,0 <= 5 * ref[35]
		
		                -- Eq 33
		                eq_input(33)(0) <= mcm_output(861); -- input 33,0 <= 10 * ref[33]
		                eq_input(33)(1) <= mcm_output(895); -- input 33,0 <= 26 * ref[34]
		                eq_input(33)(2) <= mcm_output(930); -- input 33,0 <= 21 * ref[35]
		                eq_input(33)(3) <= mcm_output(961); -- input 33,0 <= 5 * ref[36]
		
		                -- Eq 34
		                eq_input(34)(0) <= mcm_output(888); -- input 34,0 <= 10 * ref[34]
		                eq_input(34)(1) <= mcm_output(922); -- input 34,0 <= 26 * ref[35]
		                eq_input(34)(2) <= mcm_output(957); -- input 34,0 <= 21 * ref[36]
		                eq_input(34)(3) <= mcm_output(988); -- input 34,0 <= 5 * ref[37]
		
		                -- Eq 35
		                eq_input(35)(0) <= mcm_output(915); -- input 35,0 <= 10 * ref[35]
		                eq_input(35)(1) <= mcm_output(949); -- input 35,0 <= 26 * ref[36]
		                eq_input(35)(2) <= mcm_output(984); -- input 35,0 <= 21 * ref[37]
		                eq_input(35)(3) <= mcm_output(1015); -- input 35,0 <= 5 * ref[38]
		
		                -- Eq 36
		                eq_input(36)(0) <= mcm_output(942); -- input 36,0 <= 10 * ref[36]
		                eq_input(36)(1) <= mcm_output(976); -- input 36,0 <= 26 * ref[37]
		                eq_input(36)(2) <= mcm_output(1011); -- input 36,0 <= 21 * ref[38]
		                eq_input(36)(3) <= mcm_output(1042); -- input 36,0 <= 5 * ref[39]
		
		                -- Eq 37
		                eq_input(37)(0) <= mcm_output(969); -- input 37,0 <= 10 * ref[37]
		                eq_input(37)(1) <= mcm_output(1003); -- input 37,0 <= 26 * ref[38]
		                eq_input(37)(2) <= mcm_output(1038); -- input 37,0 <= 21 * ref[39]
		                eq_input(37)(3) <= mcm_output(1069); -- input 37,0 <= 5 * ref[40]
		
		                -- Eq 38
		                eq_input(38)(0) <= mcm_output(996); -- input 38,0 <= 10 * ref[38]
		                eq_input(38)(1) <= mcm_output(1030); -- input 38,0 <= 26 * ref[39]
		                eq_input(38)(2) <= mcm_output(1065); -- input 38,0 <= 21 * ref[40]
		                eq_input(38)(3) <= mcm_output(1096); -- input 38,0 <= 5 * ref[41]
		
		                -- Eq 39
		                eq_input(39)(0) <= mcm_output(1023); -- input 39,0 <= 10 * ref[39]
		                eq_input(39)(1) <= mcm_output(1057); -- input 39,0 <= 26 * ref[40]
		                eq_input(39)(2) <= mcm_output(1092); -- input 39,0 <= 21 * ref[41]
		                eq_input(39)(3) <= mcm_output(1123); -- input 39,0 <= 5 * ref[42]
		
		                -- Eq 40
		                eq_input(40)(0) <= mcm_output(1050); -- input 40,0 <= 10 * ref[40]
		                eq_input(40)(1) <= mcm_output(1084); -- input 40,0 <= 26 * ref[41]
		                eq_input(40)(2) <= mcm_output(1119); -- input 40,0 <= 21 * ref[42]
		                eq_input(40)(3) <= mcm_output(1150); -- input 40,0 <= 5 * ref[43]
		
		                -- Eq 41
		                eq_input(41)(0) <= mcm_output(1077); -- input 41,0 <= 10 * ref[41]
		                eq_input(41)(1) <= mcm_output(1111); -- input 41,0 <= 26 * ref[42]
		                eq_input(41)(2) <= mcm_output(1146); -- input 41,0 <= 21 * ref[43]
		                eq_input(41)(3) <= mcm_output(1177); -- input 41,0 <= 5 * ref[44]
		
		                -- Eq 42
		                eq_input(42)(0) <= mcm_output(1104); -- input 42,0 <= 10 * ref[42]
		                eq_input(42)(1) <= mcm_output(1138); -- input 42,0 <= 26 * ref[43]
		                eq_input(42)(2) <= mcm_output(1173); -- input 42,0 <= 21 * ref[44]
		                eq_input(42)(3) <= mcm_output(1204); -- input 42,0 <= 5 * ref[45]
		
		                -- Eq 43
		                eq_input(43)(0) <= mcm_output(1131); -- input 43,0 <= 10 * ref[43]
		                eq_input(43)(1) <= mcm_output(1165); -- input 43,0 <= 26 * ref[44]
		                eq_input(43)(2) <= mcm_output(1200); -- input 43,0 <= 21 * ref[45]
		                eq_input(43)(3) <= mcm_output(1231); -- input 43,0 <= 5 * ref[46]
		
		                -- Eq 44
		                eq_input(44)(0) <= mcm_output(1158); -- input 44,0 <= 10 * ref[44]
		                eq_input(44)(1) <= mcm_output(1192); -- input 44,0 <= 26 * ref[45]
		                eq_input(44)(2) <= mcm_output(1227); -- input 44,0 <= 21 * ref[46]
		                eq_input(44)(3) <= mcm_output(1258); -- input 44,0 <= 5 * ref[47]
		
		                -- Eq 45
		                eq_input(45)(0) <= mcm_output(1185); -- input 45,0 <= 10 * ref[45]
		                eq_input(45)(1) <= mcm_output(1219); -- input 45,0 <= 26 * ref[46]
		                eq_input(45)(2) <= mcm_output(1254); -- input 45,0 <= 21 * ref[47]
		                eq_input(45)(3) <= mcm_output(1285); -- input 45,0 <= 5 * ref[48]
		
		                -- Eq 46
		                eq_input(46)(0) <= mcm_output(1212); -- input 46,0 <= 10 * ref[46]
		                eq_input(46)(1) <= mcm_output(1246); -- input 46,0 <= 26 * ref[47]
		                eq_input(46)(2) <= mcm_output(1281); -- input 46,0 <= 21 * ref[48]
		                eq_input(46)(3) <= mcm_output(1312); -- input 46,0 <= 5 * ref[49]
		
		                -- Eq 47
		                eq_input(47)(0) <= mcm_output(1239); -- input 47,0 <= 10 * ref[47]
		                eq_input(47)(1) <= mcm_output(1273); -- input 47,0 <= 26 * ref[48]
		                eq_input(47)(2) <= mcm_output(1308); -- input 47,0 <= 21 * ref[49]
		                eq_input(47)(3) <= mcm_output(1339); -- input 47,0 <= 5 * ref[50]
		
		                -- Eq 48
		                eq_input(48)(0) <= mcm_output(1266); -- input 48,0 <= 10 * ref[48]
		                eq_input(48)(1) <= mcm_output(1300); -- input 48,0 <= 26 * ref[49]
		                eq_input(48)(2) <= mcm_output(1335); -- input 48,0 <= 21 * ref[50]
		                eq_input(48)(3) <= mcm_output(1366); -- input 48,0 <= 5 * ref[51]
		
		                -- Eq 49
		                eq_input(49)(0) <= mcm_output(1293); -- input 49,0 <= 10 * ref[49]
		                eq_input(49)(1) <= mcm_output(1327); -- input 49,0 <= 26 * ref[50]
		                eq_input(49)(2) <= mcm_output(1362); -- input 49,0 <= 21 * ref[51]
		                eq_input(49)(3) <= mcm_output(1393); -- input 49,0 <= 5 * ref[52]
		
		                -- Eq 50
		                eq_input(50)(0) <= mcm_output(1320); -- input 50,0 <= 10 * ref[50]
		                eq_input(50)(1) <= mcm_output(1354); -- input 50,0 <= 26 * ref[51]
		                eq_input(50)(2) <= mcm_output(1389); -- input 50,0 <= 21 * ref[52]
		                eq_input(50)(3) <= mcm_output(1420); -- input 50,0 <= 5 * ref[53]
		
		                -- Eq 51
		                eq_input(51)(0) <= mcm_output(1347); -- input 51,0 <= 10 * ref[51]
		                eq_input(51)(1) <= mcm_output(1381); -- input 51,0 <= 26 * ref[52]
		                eq_input(51)(2) <= mcm_output(1416); -- input 51,0 <= 21 * ref[53]
		                eq_input(51)(3) <= mcm_output(1447); -- input 51,0 <= 5 * ref[54]
		
		                -- Eq 52
		                eq_input(52)(0) <= mcm_output(1374); -- input 52,0 <= 10 * ref[52]
		                eq_input(52)(1) <= mcm_output(1408); -- input 52,0 <= 26 * ref[53]
		                eq_input(52)(2) <= mcm_output(1443); -- input 52,0 <= 21 * ref[54]
		                eq_input(52)(3) <= mcm_output(1474); -- input 52,0 <= 5 * ref[55]
		
		                -- Eq 53
		                eq_input(53)(0) <= mcm_output(1401); -- input 53,0 <= 10 * ref[53]
		                eq_input(53)(1) <= mcm_output(1435); -- input 53,0 <= 26 * ref[54]
		                eq_input(53)(2) <= mcm_output(1470); -- input 53,0 <= 21 * ref[55]
		                eq_input(53)(3) <= mcm_output(1501); -- input 53,0 <= 5 * ref[56]
		
		                -- Eq 54
		                eq_input(54)(0) <= mcm_output(1428); -- input 54,0 <= 10 * ref[54]
		                eq_input(54)(1) <= mcm_output(1462); -- input 54,0 <= 26 * ref[55]
		                eq_input(54)(2) <= mcm_output(1497); -- input 54,0 <= 21 * ref[56]
		                eq_input(54)(3) <= mcm_output(1528); -- input 54,0 <= 5 * ref[57]
		
		                -- Eq 55
		                eq_input(55)(0) <= mcm_output(1455); -- input 55,0 <= 10 * ref[55]
		                eq_input(55)(1) <= mcm_output(1489); -- input 55,0 <= 26 * ref[56]
		                eq_input(55)(2) <= mcm_output(1524); -- input 55,0 <= 21 * ref[57]
		                eq_input(55)(3) <= mcm_output(1555); -- input 55,0 <= 5 * ref[58]
		
		                -- Eq 56
		                eq_input(56)(0) <= mcm_output(1482); -- input 56,0 <= 10 * ref[56]
		                eq_input(56)(1) <= mcm_output(1516); -- input 56,0 <= 26 * ref[57]
		                eq_input(56)(2) <= mcm_output(1551); -- input 56,0 <= 21 * ref[58]
		                eq_input(56)(3) <= mcm_output(1582); -- input 56,0 <= 5 * ref[59]
		
		                -- Eq 57
		                eq_input(57)(0) <= mcm_output(1509); -- input 57,0 <= 10 * ref[57]
		                eq_input(57)(1) <= mcm_output(1543); -- input 57,0 <= 26 * ref[58]
		                eq_input(57)(2) <= mcm_output(1578); -- input 57,0 <= 21 * ref[59]
		                eq_input(57)(3) <= mcm_output(1609); -- input 57,0 <= 5 * ref[60]
		
		                -- Eq 58
		                eq_input(58)(0) <= mcm_output(1536); -- input 58,0 <= 10 * ref[58]
		                eq_input(58)(1) <= mcm_output(1570); -- input 58,0 <= 26 * ref[59]
		                eq_input(58)(2) <= mcm_output(1605); -- input 58,0 <= 21 * ref[60]
		                eq_input(58)(3) <= mcm_output(1636); -- input 58,0 <= 5 * ref[61]
		
		                -- Eq 59
		                eq_input(59)(0) <= mcm_output(1563); -- input 59,0 <= 10 * ref[59]
		                eq_input(59)(1) <= mcm_output(1597); -- input 59,0 <= 26 * ref[60]
		                eq_input(59)(2) <= mcm_output(1632); -- input 59,0 <= 21 * ref[61]
		                eq_input(59)(3) <= mcm_output(1663); -- input 59,0 <= 5 * ref[62]
		
		                -- Eq 60
		                eq_input(60)(0) <= mcm_output(1590); -- input 60,0 <= 10 * ref[60]
		                eq_input(60)(1) <= mcm_output(1624); -- input 60,0 <= 26 * ref[61]
		                eq_input(60)(2) <= mcm_output(1659); -- input 60,0 <= 21 * ref[62]
		                eq_input(60)(3) <= mcm_output(1690); -- input 60,0 <= 5 * ref[63]
		
		                -- Eq 61
		                eq_input(61)(0) <= mcm_output(1617); -- input 61,0 <= 10 * ref[61]
		                eq_input(61)(1) <= mcm_output(1651); -- input 61,1 <= 26 * ref[62]
		                eq_input(61)(2) <= mcm_output(1686); -- input 61,2 <= 21 * ref[63]
		                eq_input(61)(3) <= mcm_output(1714); -- input 61,3 <= 5 * ref[64]
		
		                -- Eq 62
		                eq_input(62)(0) <= mcm_output(1644); -- input 62,0 <= 10 * ref[62]
		                eq_input(62)(1) <= mcm_output(1678); -- input 62,1 <= 26 * ref[63]
		                eq_input(62)(2) <= mcm_output(1706); -- input 62,2 <= 21 * ref[64]
		                eq_input(62)(3) <= mcm_output(1730); -- input 62,3 <= 5 * ref[65]
		
		                -- Eq 63
		                eq_input(63)(0) <= mcm_output(1671); -- input 63,0 <= 10 * ref[63]
		                eq_input(63)(1) <= mcm_output(1698); -- input 63,1 <= 26 * ref[64]
		                eq_input(63)(2) <= mcm_output(1722); -- input 63,2 <= 21 * ref[65]
		                eq_input(63)(3) <= mcm_output(1738); -- input 63,3 <= 5 * ref[66]
		
		        when "110"=>
		                -- Eq 0
		                eq_input(0)(0) <= mcm_output(6); -- input 0,0 <= 6 * ref[0]
		                eq_input(0)(1) <= mcm_output(21); -- input 0,0 <= 22 * ref[1]
		                eq_input(0)(2) <= mcm_output(44); -- input 0,0 <= 25 * ref[2]
		                eq_input(0)(3) <= mcm_output(71); -- input 0,0 <= 9 * ref[3]
		
		                -- Eq 1
		                eq_input(1)(0) <= mcm_output(14); -- input 1,0 <= 6 * ref[1]
		                eq_input(1)(1) <= mcm_output(36); -- input 1,0 <= 22 * ref[2]
		                eq_input(1)(2) <= mcm_output(67); -- input 1,0 <= 25 * ref[3]
		                eq_input(1)(3) <= mcm_output(98); -- input 1,0 <= 9 * ref[4]
		
		                -- Eq 2
		                eq_input(2)(0) <= mcm_output(29); -- input 2,0 <= 6 * ref[2]
		                eq_input(2)(1) <= mcm_output(59); -- input 2,0 <= 22 * ref[3]
		                eq_input(2)(2) <= mcm_output(94); -- input 2,0 <= 25 * ref[4]
		                eq_input(2)(3) <= mcm_output(125); -- input 2,0 <= 9 * ref[5]
		
		                -- Eq 3
		                eq_input(3)(0) <= mcm_output(52); -- input 3,0 <= 6 * ref[3]
		                eq_input(3)(1) <= mcm_output(86); -- input 3,0 <= 22 * ref[4]
		                eq_input(3)(2) <= mcm_output(121); -- input 3,0 <= 25 * ref[5]
		                eq_input(3)(3) <= mcm_output(152); -- input 3,0 <= 9 * ref[6]
		
		                -- Eq 4
		                eq_input(4)(0) <= mcm_output(79); -- input 4,0 <= 6 * ref[4]
		                eq_input(4)(1) <= mcm_output(113); -- input 4,0 <= 22 * ref[5]
		                eq_input(4)(2) <= mcm_output(148); -- input 4,0 <= 25 * ref[6]
		                eq_input(4)(3) <= mcm_output(179); -- input 4,0 <= 9 * ref[7]
		
		                -- Eq 5
		                eq_input(5)(0) <= mcm_output(106); -- input 5,0 <= 6 * ref[5]
		                eq_input(5)(1) <= mcm_output(140); -- input 5,0 <= 22 * ref[6]
		                eq_input(5)(2) <= mcm_output(175); -- input 5,0 <= 25 * ref[7]
		                eq_input(5)(3) <= mcm_output(206); -- input 5,0 <= 9 * ref[8]
		
		                -- Eq 6
		                eq_input(6)(0) <= mcm_output(133); -- input 6,0 <= 6 * ref[6]
		                eq_input(6)(1) <= mcm_output(167); -- input 6,0 <= 22 * ref[7]
		                eq_input(6)(2) <= mcm_output(202); -- input 6,0 <= 25 * ref[8]
		                eq_input(6)(3) <= mcm_output(233); -- input 6,0 <= 9 * ref[9]
		
		                -- Eq 7
		                eq_input(7)(0) <= mcm_output(160); -- input 7,0 <= 6 * ref[7]
		                eq_input(7)(1) <= mcm_output(194); -- input 7,0 <= 22 * ref[8]
		                eq_input(7)(2) <= mcm_output(229); -- input 7,0 <= 25 * ref[9]
		                eq_input(7)(3) <= mcm_output(260); -- input 7,0 <= 9 * ref[10]
		
		                -- Eq 8
		                eq_input(8)(0) <= mcm_output(187); -- input 8,0 <= 6 * ref[8]
		                eq_input(8)(1) <= mcm_output(221); -- input 8,0 <= 22 * ref[9]
		                eq_input(8)(2) <= mcm_output(256); -- input 8,0 <= 25 * ref[10]
		                eq_input(8)(3) <= mcm_output(287); -- input 8,0 <= 9 * ref[11]
		
		                -- Eq 9
		                eq_input(9)(0) <= mcm_output(214); -- input 9,0 <= 6 * ref[9]
		                eq_input(9)(1) <= mcm_output(248); -- input 9,0 <= 22 * ref[10]
		                eq_input(9)(2) <= mcm_output(283); -- input 9,0 <= 25 * ref[11]
		                eq_input(9)(3) <= mcm_output(314); -- input 9,0 <= 9 * ref[12]
		
		                -- Eq 10
		                eq_input(10)(0) <= mcm_output(241); -- input 10,0 <= 6 * ref[10]
		                eq_input(10)(1) <= mcm_output(275); -- input 10,0 <= 22 * ref[11]
		                eq_input(10)(2) <= mcm_output(310); -- input 10,0 <= 25 * ref[12]
		                eq_input(10)(3) <= mcm_output(341); -- input 10,0 <= 9 * ref[13]
		
		                -- Eq 11
		                eq_input(11)(0) <= mcm_output(268); -- input 11,0 <= 6 * ref[11]
		                eq_input(11)(1) <= mcm_output(302); -- input 11,0 <= 22 * ref[12]
		                eq_input(11)(2) <= mcm_output(337); -- input 11,0 <= 25 * ref[13]
		                eq_input(11)(3) <= mcm_output(368); -- input 11,0 <= 9 * ref[14]
		
		                -- Eq 12
		                eq_input(12)(0) <= mcm_output(295); -- input 12,0 <= 6 * ref[12]
		                eq_input(12)(1) <= mcm_output(329); -- input 12,0 <= 22 * ref[13]
		                eq_input(12)(2) <= mcm_output(364); -- input 12,0 <= 25 * ref[14]
		                eq_input(12)(3) <= mcm_output(395); -- input 12,0 <= 9 * ref[15]
		
		                -- Eq 13
		                eq_input(13)(0) <= mcm_output(322); -- input 13,0 <= 6 * ref[13]
		                eq_input(13)(1) <= mcm_output(356); -- input 13,0 <= 22 * ref[14]
		                eq_input(13)(2) <= mcm_output(391); -- input 13,0 <= 25 * ref[15]
		                eq_input(13)(3) <= mcm_output(422); -- input 13,0 <= 9 * ref[16]
		
		                -- Eq 14
		                eq_input(14)(0) <= mcm_output(349); -- input 14,0 <= 6 * ref[14]
		                eq_input(14)(1) <= mcm_output(383); -- input 14,0 <= 22 * ref[15]
		                eq_input(14)(2) <= mcm_output(418); -- input 14,0 <= 25 * ref[16]
		                eq_input(14)(3) <= mcm_output(449); -- input 14,0 <= 9 * ref[17]
		
		                -- Eq 15
		                eq_input(15)(0) <= mcm_output(376); -- input 15,0 <= 6 * ref[15]
		                eq_input(15)(1) <= mcm_output(410); -- input 15,0 <= 22 * ref[16]
		                eq_input(15)(2) <= mcm_output(445); -- input 15,0 <= 25 * ref[17]
		                eq_input(15)(3) <= mcm_output(476); -- input 15,0 <= 9 * ref[18]
		
		                -- Eq 16
		                eq_input(16)(0) <= mcm_output(403); -- input 16,0 <= 6 * ref[16]
		                eq_input(16)(1) <= mcm_output(437); -- input 16,0 <= 22 * ref[17]
		                eq_input(16)(2) <= mcm_output(472); -- input 16,0 <= 25 * ref[18]
		                eq_input(16)(3) <= mcm_output(503); -- input 16,0 <= 9 * ref[19]
		
		                -- Eq 17
		                eq_input(17)(0) <= mcm_output(430); -- input 17,0 <= 6 * ref[17]
		                eq_input(17)(1) <= mcm_output(464); -- input 17,0 <= 22 * ref[18]
		                eq_input(17)(2) <= mcm_output(499); -- input 17,0 <= 25 * ref[19]
		                eq_input(17)(3) <= mcm_output(530); -- input 17,0 <= 9 * ref[20]
		
		                -- Eq 18
		                eq_input(18)(0) <= mcm_output(457); -- input 18,0 <= 6 * ref[18]
		                eq_input(18)(1) <= mcm_output(491); -- input 18,0 <= 22 * ref[19]
		                eq_input(18)(2) <= mcm_output(526); -- input 18,0 <= 25 * ref[20]
		                eq_input(18)(3) <= mcm_output(557); -- input 18,0 <= 9 * ref[21]
		
		                -- Eq 19
		                eq_input(19)(0) <= mcm_output(484); -- input 19,0 <= 6 * ref[19]
		                eq_input(19)(1) <= mcm_output(518); -- input 19,0 <= 22 * ref[20]
		                eq_input(19)(2) <= mcm_output(553); -- input 19,0 <= 25 * ref[21]
		                eq_input(19)(3) <= mcm_output(584); -- input 19,0 <= 9 * ref[22]
		
		                -- Eq 20
		                eq_input(20)(0) <= mcm_output(511); -- input 20,0 <= 6 * ref[20]
		                eq_input(20)(1) <= mcm_output(545); -- input 20,0 <= 22 * ref[21]
		                eq_input(20)(2) <= mcm_output(580); -- input 20,0 <= 25 * ref[22]
		                eq_input(20)(3) <= mcm_output(611); -- input 20,0 <= 9 * ref[23]
		
		                -- Eq 21
		                eq_input(21)(0) <= mcm_output(538); -- input 21,0 <= 6 * ref[21]
		                eq_input(21)(1) <= mcm_output(572); -- input 21,0 <= 22 * ref[22]
		                eq_input(21)(2) <= mcm_output(607); -- input 21,0 <= 25 * ref[23]
		                eq_input(21)(3) <= mcm_output(638); -- input 21,0 <= 9 * ref[24]
		
		                -- Eq 22
		                eq_input(22)(0) <= mcm_output(565); -- input 22,0 <= 6 * ref[22]
		                eq_input(22)(1) <= mcm_output(599); -- input 22,0 <= 22 * ref[23]
		                eq_input(22)(2) <= mcm_output(634); -- input 22,0 <= 25 * ref[24]
		                eq_input(22)(3) <= mcm_output(665); -- input 22,0 <= 9 * ref[25]
		
		                -- Eq 23
		                eq_input(23)(0) <= mcm_output(592); -- input 23,0 <= 6 * ref[23]
		                eq_input(23)(1) <= mcm_output(626); -- input 23,0 <= 22 * ref[24]
		                eq_input(23)(2) <= mcm_output(661); -- input 23,0 <= 25 * ref[25]
		                eq_input(23)(3) <= mcm_output(692); -- input 23,0 <= 9 * ref[26]
		
		                -- Eq 24
		                eq_input(24)(0) <= mcm_output(619); -- input 24,0 <= 6 * ref[24]
		                eq_input(24)(1) <= mcm_output(653); -- input 24,0 <= 22 * ref[25]
		                eq_input(24)(2) <= mcm_output(688); -- input 24,0 <= 25 * ref[26]
		                eq_input(24)(3) <= mcm_output(719); -- input 24,0 <= 9 * ref[27]
		
		                -- Eq 25
		                eq_input(25)(0) <= mcm_output(646); -- input 25,0 <= 6 * ref[25]
		                eq_input(25)(1) <= mcm_output(680); -- input 25,0 <= 22 * ref[26]
		                eq_input(25)(2) <= mcm_output(715); -- input 25,0 <= 25 * ref[27]
		                eq_input(25)(3) <= mcm_output(746); -- input 25,0 <= 9 * ref[28]
		
		                -- Eq 26
		                eq_input(26)(0) <= mcm_output(673); -- input 26,0 <= 6 * ref[26]
		                eq_input(26)(1) <= mcm_output(707); -- input 26,0 <= 22 * ref[27]
		                eq_input(26)(2) <= mcm_output(742); -- input 26,0 <= 25 * ref[28]
		                eq_input(26)(3) <= mcm_output(773); -- input 26,0 <= 9 * ref[29]
		
		                -- Eq 27
		                eq_input(27)(0) <= mcm_output(700); -- input 27,0 <= 6 * ref[27]
		                eq_input(27)(1) <= mcm_output(734); -- input 27,0 <= 22 * ref[28]
		                eq_input(27)(2) <= mcm_output(769); -- input 27,0 <= 25 * ref[29]
		                eq_input(27)(3) <= mcm_output(800); -- input 27,0 <= 9 * ref[30]
		
		                -- Eq 28
		                eq_input(28)(0) <= mcm_output(727); -- input 28,0 <= 6 * ref[28]
		                eq_input(28)(1) <= mcm_output(761); -- input 28,0 <= 22 * ref[29]
		                eq_input(28)(2) <= mcm_output(796); -- input 28,0 <= 25 * ref[30]
		                eq_input(28)(3) <= mcm_output(827); -- input 28,0 <= 9 * ref[31]
		
		                -- Eq 29
		                eq_input(29)(0) <= mcm_output(754); -- input 29,0 <= 6 * ref[29]
		                eq_input(29)(1) <= mcm_output(788); -- input 29,0 <= 22 * ref[30]
		                eq_input(29)(2) <= mcm_output(823); -- input 29,0 <= 25 * ref[31]
		                eq_input(29)(3) <= mcm_output(854); -- input 29,0 <= 9 * ref[32]
		
		                -- Eq 30
		                eq_input(30)(0) <= mcm_output(781); -- input 30,0 <= 6 * ref[30]
		                eq_input(30)(1) <= mcm_output(815); -- input 30,0 <= 22 * ref[31]
		                eq_input(30)(2) <= mcm_output(850); -- input 30,0 <= 25 * ref[32]
		                eq_input(30)(3) <= mcm_output(881); -- input 30,0 <= 9 * ref[33]
		
		                -- Eq 31
		                eq_input(31)(0) <= mcm_output(808); -- input 31,0 <= 6 * ref[31]
		                eq_input(31)(1) <= mcm_output(842); -- input 31,0 <= 22 * ref[32]
		                eq_input(31)(2) <= mcm_output(877); -- input 31,0 <= 25 * ref[33]
		                eq_input(31)(3) <= mcm_output(908); -- input 31,0 <= 9 * ref[34]
		
		                -- Eq 32
		                eq_input(32)(0) <= mcm_output(835); -- input 32,0 <= 6 * ref[32]
		                eq_input(32)(1) <= mcm_output(869); -- input 32,0 <= 22 * ref[33]
		                eq_input(32)(2) <= mcm_output(904); -- input 32,0 <= 25 * ref[34]
		                eq_input(32)(3) <= mcm_output(935); -- input 32,0 <= 9 * ref[35]
		
		                -- Eq 33
		                eq_input(33)(0) <= mcm_output(862); -- input 33,0 <= 6 * ref[33]
		                eq_input(33)(1) <= mcm_output(896); -- input 33,0 <= 22 * ref[34]
		                eq_input(33)(2) <= mcm_output(931); -- input 33,0 <= 25 * ref[35]
		                eq_input(33)(3) <= mcm_output(962); -- input 33,0 <= 9 * ref[36]
		
		                -- Eq 34
		                eq_input(34)(0) <= mcm_output(889); -- input 34,0 <= 6 * ref[34]
		                eq_input(34)(1) <= mcm_output(923); -- input 34,0 <= 22 * ref[35]
		                eq_input(34)(2) <= mcm_output(958); -- input 34,0 <= 25 * ref[36]
		                eq_input(34)(3) <= mcm_output(989); -- input 34,0 <= 9 * ref[37]
		
		                -- Eq 35
		                eq_input(35)(0) <= mcm_output(916); -- input 35,0 <= 6 * ref[35]
		                eq_input(35)(1) <= mcm_output(950); -- input 35,0 <= 22 * ref[36]
		                eq_input(35)(2) <= mcm_output(985); -- input 35,0 <= 25 * ref[37]
		                eq_input(35)(3) <= mcm_output(1016); -- input 35,0 <= 9 * ref[38]
		
		                -- Eq 36
		                eq_input(36)(0) <= mcm_output(943); -- input 36,0 <= 6 * ref[36]
		                eq_input(36)(1) <= mcm_output(977); -- input 36,0 <= 22 * ref[37]
		                eq_input(36)(2) <= mcm_output(1012); -- input 36,0 <= 25 * ref[38]
		                eq_input(36)(3) <= mcm_output(1043); -- input 36,0 <= 9 * ref[39]
		
		                -- Eq 37
		                eq_input(37)(0) <= mcm_output(970); -- input 37,0 <= 6 * ref[37]
		                eq_input(37)(1) <= mcm_output(1004); -- input 37,0 <= 22 * ref[38]
		                eq_input(37)(2) <= mcm_output(1039); -- input 37,0 <= 25 * ref[39]
		                eq_input(37)(3) <= mcm_output(1070); -- input 37,0 <= 9 * ref[40]
		
		                -- Eq 38
		                eq_input(38)(0) <= mcm_output(997); -- input 38,0 <= 6 * ref[38]
		                eq_input(38)(1) <= mcm_output(1031); -- input 38,0 <= 22 * ref[39]
		                eq_input(38)(2) <= mcm_output(1066); -- input 38,0 <= 25 * ref[40]
		                eq_input(38)(3) <= mcm_output(1097); -- input 38,0 <= 9 * ref[41]
		
		                -- Eq 39
		                eq_input(39)(0) <= mcm_output(1024); -- input 39,0 <= 6 * ref[39]
		                eq_input(39)(1) <= mcm_output(1058); -- input 39,0 <= 22 * ref[40]
		                eq_input(39)(2) <= mcm_output(1093); -- input 39,0 <= 25 * ref[41]
		                eq_input(39)(3) <= mcm_output(1124); -- input 39,0 <= 9 * ref[42]
		
		                -- Eq 40
		                eq_input(40)(0) <= mcm_output(1051); -- input 40,0 <= 6 * ref[40]
		                eq_input(40)(1) <= mcm_output(1085); -- input 40,0 <= 22 * ref[41]
		                eq_input(40)(2) <= mcm_output(1120); -- input 40,0 <= 25 * ref[42]
		                eq_input(40)(3) <= mcm_output(1151); -- input 40,0 <= 9 * ref[43]
		
		                -- Eq 41
		                eq_input(41)(0) <= mcm_output(1078); -- input 41,0 <= 6 * ref[41]
		                eq_input(41)(1) <= mcm_output(1112); -- input 41,0 <= 22 * ref[42]
		                eq_input(41)(2) <= mcm_output(1147); -- input 41,0 <= 25 * ref[43]
		                eq_input(41)(3) <= mcm_output(1178); -- input 41,0 <= 9 * ref[44]
		
		                -- Eq 42
		                eq_input(42)(0) <= mcm_output(1105); -- input 42,0 <= 6 * ref[42]
		                eq_input(42)(1) <= mcm_output(1139); -- input 42,0 <= 22 * ref[43]
		                eq_input(42)(2) <= mcm_output(1174); -- input 42,0 <= 25 * ref[44]
		                eq_input(42)(3) <= mcm_output(1205); -- input 42,0 <= 9 * ref[45]
		
		                -- Eq 43
		                eq_input(43)(0) <= mcm_output(1132); -- input 43,0 <= 6 * ref[43]
		                eq_input(43)(1) <= mcm_output(1166); -- input 43,0 <= 22 * ref[44]
		                eq_input(43)(2) <= mcm_output(1201); -- input 43,0 <= 25 * ref[45]
		                eq_input(43)(3) <= mcm_output(1232); -- input 43,0 <= 9 * ref[46]
		
		                -- Eq 44
		                eq_input(44)(0) <= mcm_output(1159); -- input 44,0 <= 6 * ref[44]
		                eq_input(44)(1) <= mcm_output(1193); -- input 44,0 <= 22 * ref[45]
		                eq_input(44)(2) <= mcm_output(1228); -- input 44,0 <= 25 * ref[46]
		                eq_input(44)(3) <= mcm_output(1259); -- input 44,0 <= 9 * ref[47]
		
		                -- Eq 45
		                eq_input(45)(0) <= mcm_output(1186); -- input 45,0 <= 6 * ref[45]
		                eq_input(45)(1) <= mcm_output(1220); -- input 45,0 <= 22 * ref[46]
		                eq_input(45)(2) <= mcm_output(1255); -- input 45,0 <= 25 * ref[47]
		                eq_input(45)(3) <= mcm_output(1286); -- input 45,0 <= 9 * ref[48]
		
		                -- Eq 46
		                eq_input(46)(0) <= mcm_output(1213); -- input 46,0 <= 6 * ref[46]
		                eq_input(46)(1) <= mcm_output(1247); -- input 46,0 <= 22 * ref[47]
		                eq_input(46)(2) <= mcm_output(1282); -- input 46,0 <= 25 * ref[48]
		                eq_input(46)(3) <= mcm_output(1313); -- input 46,0 <= 9 * ref[49]
		
		                -- Eq 47
		                eq_input(47)(0) <= mcm_output(1240); -- input 47,0 <= 6 * ref[47]
		                eq_input(47)(1) <= mcm_output(1274); -- input 47,0 <= 22 * ref[48]
		                eq_input(47)(2) <= mcm_output(1309); -- input 47,0 <= 25 * ref[49]
		                eq_input(47)(3) <= mcm_output(1340); -- input 47,0 <= 9 * ref[50]
		
		                -- Eq 48
		                eq_input(48)(0) <= mcm_output(1267); -- input 48,0 <= 6 * ref[48]
		                eq_input(48)(1) <= mcm_output(1301); -- input 48,0 <= 22 * ref[49]
		                eq_input(48)(2) <= mcm_output(1336); -- input 48,0 <= 25 * ref[50]
		                eq_input(48)(3) <= mcm_output(1367); -- input 48,0 <= 9 * ref[51]
		
		                -- Eq 49
		                eq_input(49)(0) <= mcm_output(1294); -- input 49,0 <= 6 * ref[49]
		                eq_input(49)(1) <= mcm_output(1328); -- input 49,0 <= 22 * ref[50]
		                eq_input(49)(2) <= mcm_output(1363); -- input 49,0 <= 25 * ref[51]
		                eq_input(49)(3) <= mcm_output(1394); -- input 49,0 <= 9 * ref[52]
		
		                -- Eq 50
		                eq_input(50)(0) <= mcm_output(1321); -- input 50,0 <= 6 * ref[50]
		                eq_input(50)(1) <= mcm_output(1355); -- input 50,0 <= 22 * ref[51]
		                eq_input(50)(2) <= mcm_output(1390); -- input 50,0 <= 25 * ref[52]
		                eq_input(50)(3) <= mcm_output(1421); -- input 50,0 <= 9 * ref[53]
		
		                -- Eq 51
		                eq_input(51)(0) <= mcm_output(1348); -- input 51,0 <= 6 * ref[51]
		                eq_input(51)(1) <= mcm_output(1382); -- input 51,0 <= 22 * ref[52]
		                eq_input(51)(2) <= mcm_output(1417); -- input 51,0 <= 25 * ref[53]
		                eq_input(51)(3) <= mcm_output(1448); -- input 51,0 <= 9 * ref[54]
		
		                -- Eq 52
		                eq_input(52)(0) <= mcm_output(1375); -- input 52,0 <= 6 * ref[52]
		                eq_input(52)(1) <= mcm_output(1409); -- input 52,0 <= 22 * ref[53]
		                eq_input(52)(2) <= mcm_output(1444); -- input 52,0 <= 25 * ref[54]
		                eq_input(52)(3) <= mcm_output(1475); -- input 52,0 <= 9 * ref[55]
		
		                -- Eq 53
		                eq_input(53)(0) <= mcm_output(1402); -- input 53,0 <= 6 * ref[53]
		                eq_input(53)(1) <= mcm_output(1436); -- input 53,0 <= 22 * ref[54]
		                eq_input(53)(2) <= mcm_output(1471); -- input 53,0 <= 25 * ref[55]
		                eq_input(53)(3) <= mcm_output(1502); -- input 53,0 <= 9 * ref[56]
		
		                -- Eq 54
		                eq_input(54)(0) <= mcm_output(1429); -- input 54,0 <= 6 * ref[54]
		                eq_input(54)(1) <= mcm_output(1463); -- input 54,0 <= 22 * ref[55]
		                eq_input(54)(2) <= mcm_output(1498); -- input 54,0 <= 25 * ref[56]
		                eq_input(54)(3) <= mcm_output(1529); -- input 54,0 <= 9 * ref[57]
		
		                -- Eq 55
		                eq_input(55)(0) <= mcm_output(1456); -- input 55,0 <= 6 * ref[55]
		                eq_input(55)(1) <= mcm_output(1490); -- input 55,0 <= 22 * ref[56]
		                eq_input(55)(2) <= mcm_output(1525); -- input 55,0 <= 25 * ref[57]
		                eq_input(55)(3) <= mcm_output(1556); -- input 55,0 <= 9 * ref[58]
		
		                -- Eq 56
		                eq_input(56)(0) <= mcm_output(1483); -- input 56,0 <= 6 * ref[56]
		                eq_input(56)(1) <= mcm_output(1517); -- input 56,0 <= 22 * ref[57]
		                eq_input(56)(2) <= mcm_output(1552); -- input 56,0 <= 25 * ref[58]
		                eq_input(56)(3) <= mcm_output(1583); -- input 56,0 <= 9 * ref[59]
		
		                -- Eq 57
		                eq_input(57)(0) <= mcm_output(1510); -- input 57,0 <= 6 * ref[57]
		                eq_input(57)(1) <= mcm_output(1544); -- input 57,0 <= 22 * ref[58]
		                eq_input(57)(2) <= mcm_output(1579); -- input 57,0 <= 25 * ref[59]
		                eq_input(57)(3) <= mcm_output(1610); -- input 57,0 <= 9 * ref[60]
		
		                -- Eq 58
		                eq_input(58)(0) <= mcm_output(1537); -- input 58,0 <= 6 * ref[58]
		                eq_input(58)(1) <= mcm_output(1571); -- input 58,0 <= 22 * ref[59]
		                eq_input(58)(2) <= mcm_output(1606); -- input 58,0 <= 25 * ref[60]
		                eq_input(58)(3) <= mcm_output(1637); -- input 58,0 <= 9 * ref[61]
		
		                -- Eq 59
		                eq_input(59)(0) <= mcm_output(1564); -- input 59,0 <= 6 * ref[59]
		                eq_input(59)(1) <= mcm_output(1598); -- input 59,0 <= 22 * ref[60]
		                eq_input(59)(2) <= mcm_output(1633); -- input 59,0 <= 25 * ref[61]
		                eq_input(59)(3) <= mcm_output(1664); -- input 59,0 <= 9 * ref[62]
		
		                -- Eq 60
		                eq_input(60)(0) <= mcm_output(1591); -- input 60,0 <= 6 * ref[60]
		                eq_input(60)(1) <= mcm_output(1625); -- input 60,0 <= 22 * ref[61]
		                eq_input(60)(2) <= mcm_output(1660); -- input 60,0 <= 25 * ref[62]
		                eq_input(60)(3) <= mcm_output(1691); -- input 60,0 <= 9 * ref[63]
		
		                -- Eq 61
		                eq_input(61)(0) <= mcm_output(1618); -- input 61,0 <= 6 * ref[61]
		                eq_input(61)(1) <= mcm_output(1652); -- input 61,1 <= 22 * ref[62]
		                eq_input(61)(2) <= mcm_output(1687); -- input 61,2 <= 25 * ref[63]
		                eq_input(61)(3) <= mcm_output(1715); -- input 61,3 <= 9 * ref[64]
		
		                -- Eq 62
		                eq_input(62)(0) <= mcm_output(1645); -- input 62,0 <= 6 * ref[62]
		                eq_input(62)(1) <= mcm_output(1679); -- input 62,1 <= 22 * ref[63]
		                eq_input(62)(2) <= mcm_output(1707); -- input 62,2 <= 25 * ref[64]
		                eq_input(62)(3) <= mcm_output(1731); -- input 62,3 <= 9 * ref[65]
		
		                -- Eq 63
		                eq_input(63)(0) <= mcm_output(1672); -- input 63,0 <= 6 * ref[63]
		                eq_input(63)(1) <= mcm_output(1699); -- input 63,1 <= 22 * ref[64]
		                eq_input(63)(2) <= mcm_output(1723); -- input 63,2 <= 25 * ref[65]
		                eq_input(63)(3) <= mcm_output(1739); -- input 63,3 <= 9 * ref[66]
		
		        when "111"=>
		                -- Eq 0
		                eq_input(0)(0) <= mcm_output(7); -- input 0,0 <= 2 * ref[0]
		                eq_input(0)(1) <= mcm_output(22); -- input 0,0 <= 18 * ref[1]
		                eq_input(0)(2) <= mcm_output(45); -- input 0,0 <= 29 * ref[2]
		                eq_input(0)(3) <= mcm_output(72); -- input 0,0 <= 13 * ref[3]
		
		                -- Eq 1
		                eq_input(1)(0) <= mcm_output(15); -- input 1,0 <= 2 * ref[1]
		                eq_input(1)(1) <= mcm_output(37); -- input 1,0 <= 18 * ref[2]
		                eq_input(1)(2) <= mcm_output(68); -- input 1,0 <= 29 * ref[3]
		                eq_input(1)(3) <= mcm_output(99); -- input 1,0 <= 13 * ref[4]
		
		                -- Eq 2
		                eq_input(2)(0) <= mcm_output(30); -- input 2,0 <= 2 * ref[2]
		                eq_input(2)(1) <= mcm_output(60); -- input 2,0 <= 18 * ref[3]
		                eq_input(2)(2) <= mcm_output(95); -- input 2,0 <= 29 * ref[4]
		                eq_input(2)(3) <= mcm_output(126); -- input 2,0 <= 13 * ref[5]
		
		                -- Eq 3
		                eq_input(3)(0) <= mcm_output(53); -- input 3,0 <= 2 * ref[3]
		                eq_input(3)(1) <= mcm_output(87); -- input 3,0 <= 18 * ref[4]
		                eq_input(3)(2) <= mcm_output(122); -- input 3,0 <= 29 * ref[5]
		                eq_input(3)(3) <= mcm_output(153); -- input 3,0 <= 13 * ref[6]
		
		                -- Eq 4
		                eq_input(4)(0) <= mcm_output(80); -- input 4,0 <= 2 * ref[4]
		                eq_input(4)(1) <= mcm_output(114); -- input 4,0 <= 18 * ref[5]
		                eq_input(4)(2) <= mcm_output(149); -- input 4,0 <= 29 * ref[6]
		                eq_input(4)(3) <= mcm_output(180); -- input 4,0 <= 13 * ref[7]
		
		                -- Eq 5
		                eq_input(5)(0) <= mcm_output(107); -- input 5,0 <= 2 * ref[5]
		                eq_input(5)(1) <= mcm_output(141); -- input 5,0 <= 18 * ref[6]
		                eq_input(5)(2) <= mcm_output(176); -- input 5,0 <= 29 * ref[7]
		                eq_input(5)(3) <= mcm_output(207); -- input 5,0 <= 13 * ref[8]
		
		                -- Eq 6
		                eq_input(6)(0) <= mcm_output(134); -- input 6,0 <= 2 * ref[6]
		                eq_input(6)(1) <= mcm_output(168); -- input 6,0 <= 18 * ref[7]
		                eq_input(6)(2) <= mcm_output(203); -- input 6,0 <= 29 * ref[8]
		                eq_input(6)(3) <= mcm_output(234); -- input 6,0 <= 13 * ref[9]
		
		                -- Eq 7
		                eq_input(7)(0) <= mcm_output(161); -- input 7,0 <= 2 * ref[7]
		                eq_input(7)(1) <= mcm_output(195); -- input 7,0 <= 18 * ref[8]
		                eq_input(7)(2) <= mcm_output(230); -- input 7,0 <= 29 * ref[9]
		                eq_input(7)(3) <= mcm_output(261); -- input 7,0 <= 13 * ref[10]
		
		                -- Eq 8
		                eq_input(8)(0) <= mcm_output(188); -- input 8,0 <= 2 * ref[8]
		                eq_input(8)(1) <= mcm_output(222); -- input 8,0 <= 18 * ref[9]
		                eq_input(8)(2) <= mcm_output(257); -- input 8,0 <= 29 * ref[10]
		                eq_input(8)(3) <= mcm_output(288); -- input 8,0 <= 13 * ref[11]
		
		                -- Eq 9
		                eq_input(9)(0) <= mcm_output(215); -- input 9,0 <= 2 * ref[9]
		                eq_input(9)(1) <= mcm_output(249); -- input 9,0 <= 18 * ref[10]
		                eq_input(9)(2) <= mcm_output(284); -- input 9,0 <= 29 * ref[11]
		                eq_input(9)(3) <= mcm_output(315); -- input 9,0 <= 13 * ref[12]
		
		                -- Eq 10
		                eq_input(10)(0) <= mcm_output(242); -- input 10,0 <= 2 * ref[10]
		                eq_input(10)(1) <= mcm_output(276); -- input 10,0 <= 18 * ref[11]
		                eq_input(10)(2) <= mcm_output(311); -- input 10,0 <= 29 * ref[12]
		                eq_input(10)(3) <= mcm_output(342); -- input 10,0 <= 13 * ref[13]
		
		                -- Eq 11
		                eq_input(11)(0) <= mcm_output(269); -- input 11,0 <= 2 * ref[11]
		                eq_input(11)(1) <= mcm_output(303); -- input 11,0 <= 18 * ref[12]
		                eq_input(11)(2) <= mcm_output(338); -- input 11,0 <= 29 * ref[13]
		                eq_input(11)(3) <= mcm_output(369); -- input 11,0 <= 13 * ref[14]
		
		                -- Eq 12
		                eq_input(12)(0) <= mcm_output(296); -- input 12,0 <= 2 * ref[12]
		                eq_input(12)(1) <= mcm_output(330); -- input 12,0 <= 18 * ref[13]
		                eq_input(12)(2) <= mcm_output(365); -- input 12,0 <= 29 * ref[14]
		                eq_input(12)(3) <= mcm_output(396); -- input 12,0 <= 13 * ref[15]
		
		                -- Eq 13
		                eq_input(13)(0) <= mcm_output(323); -- input 13,0 <= 2 * ref[13]
		                eq_input(13)(1) <= mcm_output(357); -- input 13,0 <= 18 * ref[14]
		                eq_input(13)(2) <= mcm_output(392); -- input 13,0 <= 29 * ref[15]
		                eq_input(13)(3) <= mcm_output(423); -- input 13,0 <= 13 * ref[16]
		
		                -- Eq 14
		                eq_input(14)(0) <= mcm_output(350); -- input 14,0 <= 2 * ref[14]
		                eq_input(14)(1) <= mcm_output(384); -- input 14,0 <= 18 * ref[15]
		                eq_input(14)(2) <= mcm_output(419); -- input 14,0 <= 29 * ref[16]
		                eq_input(14)(3) <= mcm_output(450); -- input 14,0 <= 13 * ref[17]
		
		                -- Eq 15
		                eq_input(15)(0) <= mcm_output(377); -- input 15,0 <= 2 * ref[15]
		                eq_input(15)(1) <= mcm_output(411); -- input 15,0 <= 18 * ref[16]
		                eq_input(15)(2) <= mcm_output(446); -- input 15,0 <= 29 * ref[17]
		                eq_input(15)(3) <= mcm_output(477); -- input 15,0 <= 13 * ref[18]
		
		                -- Eq 16
		                eq_input(16)(0) <= mcm_output(404); -- input 16,0 <= 2 * ref[16]
		                eq_input(16)(1) <= mcm_output(438); -- input 16,0 <= 18 * ref[17]
		                eq_input(16)(2) <= mcm_output(473); -- input 16,0 <= 29 * ref[18]
		                eq_input(16)(3) <= mcm_output(504); -- input 16,0 <= 13 * ref[19]
		
		                -- Eq 17
		                eq_input(17)(0) <= mcm_output(431); -- input 17,0 <= 2 * ref[17]
		                eq_input(17)(1) <= mcm_output(465); -- input 17,0 <= 18 * ref[18]
		                eq_input(17)(2) <= mcm_output(500); -- input 17,0 <= 29 * ref[19]
		                eq_input(17)(3) <= mcm_output(531); -- input 17,0 <= 13 * ref[20]
		
		                -- Eq 18
		                eq_input(18)(0) <= mcm_output(458); -- input 18,0 <= 2 * ref[18]
		                eq_input(18)(1) <= mcm_output(492); -- input 18,0 <= 18 * ref[19]
		                eq_input(18)(2) <= mcm_output(527); -- input 18,0 <= 29 * ref[20]
		                eq_input(18)(3) <= mcm_output(558); -- input 18,0 <= 13 * ref[21]
		
		                -- Eq 19
		                eq_input(19)(0) <= mcm_output(485); -- input 19,0 <= 2 * ref[19]
		                eq_input(19)(1) <= mcm_output(519); -- input 19,0 <= 18 * ref[20]
		                eq_input(19)(2) <= mcm_output(554); -- input 19,0 <= 29 * ref[21]
		                eq_input(19)(3) <= mcm_output(585); -- input 19,0 <= 13 * ref[22]
		
		                -- Eq 20
		                eq_input(20)(0) <= mcm_output(512); -- input 20,0 <= 2 * ref[20]
		                eq_input(20)(1) <= mcm_output(546); -- input 20,0 <= 18 * ref[21]
		                eq_input(20)(2) <= mcm_output(581); -- input 20,0 <= 29 * ref[22]
		                eq_input(20)(3) <= mcm_output(612); -- input 20,0 <= 13 * ref[23]
		
		                -- Eq 21
		                eq_input(21)(0) <= mcm_output(539); -- input 21,0 <= 2 * ref[21]
		                eq_input(21)(1) <= mcm_output(573); -- input 21,0 <= 18 * ref[22]
		                eq_input(21)(2) <= mcm_output(608); -- input 21,0 <= 29 * ref[23]
		                eq_input(21)(3) <= mcm_output(639); -- input 21,0 <= 13 * ref[24]
		
		                -- Eq 22
		                eq_input(22)(0) <= mcm_output(566); -- input 22,0 <= 2 * ref[22]
		                eq_input(22)(1) <= mcm_output(600); -- input 22,0 <= 18 * ref[23]
		                eq_input(22)(2) <= mcm_output(635); -- input 22,0 <= 29 * ref[24]
		                eq_input(22)(3) <= mcm_output(666); -- input 22,0 <= 13 * ref[25]
		
		                -- Eq 23
		                eq_input(23)(0) <= mcm_output(593); -- input 23,0 <= 2 * ref[23]
		                eq_input(23)(1) <= mcm_output(627); -- input 23,0 <= 18 * ref[24]
		                eq_input(23)(2) <= mcm_output(662); -- input 23,0 <= 29 * ref[25]
		                eq_input(23)(3) <= mcm_output(693); -- input 23,0 <= 13 * ref[26]
		
		                -- Eq 24
		                eq_input(24)(0) <= mcm_output(620); -- input 24,0 <= 2 * ref[24]
		                eq_input(24)(1) <= mcm_output(654); -- input 24,0 <= 18 * ref[25]
		                eq_input(24)(2) <= mcm_output(689); -- input 24,0 <= 29 * ref[26]
		                eq_input(24)(3) <= mcm_output(720); -- input 24,0 <= 13 * ref[27]
		
		                -- Eq 25
		                eq_input(25)(0) <= mcm_output(647); -- input 25,0 <= 2 * ref[25]
		                eq_input(25)(1) <= mcm_output(681); -- input 25,0 <= 18 * ref[26]
		                eq_input(25)(2) <= mcm_output(716); -- input 25,0 <= 29 * ref[27]
		                eq_input(25)(3) <= mcm_output(747); -- input 25,0 <= 13 * ref[28]
		
		                -- Eq 26
		                eq_input(26)(0) <= mcm_output(674); -- input 26,0 <= 2 * ref[26]
		                eq_input(26)(1) <= mcm_output(708); -- input 26,0 <= 18 * ref[27]
		                eq_input(26)(2) <= mcm_output(743); -- input 26,0 <= 29 * ref[28]
		                eq_input(26)(3) <= mcm_output(774); -- input 26,0 <= 13 * ref[29]
		
		                -- Eq 27
		                eq_input(27)(0) <= mcm_output(701); -- input 27,0 <= 2 * ref[27]
		                eq_input(27)(1) <= mcm_output(735); -- input 27,0 <= 18 * ref[28]
		                eq_input(27)(2) <= mcm_output(770); -- input 27,0 <= 29 * ref[29]
		                eq_input(27)(3) <= mcm_output(801); -- input 27,0 <= 13 * ref[30]
		
		                -- Eq 28
		                eq_input(28)(0) <= mcm_output(728); -- input 28,0 <= 2 * ref[28]
		                eq_input(28)(1) <= mcm_output(762); -- input 28,0 <= 18 * ref[29]
		                eq_input(28)(2) <= mcm_output(797); -- input 28,0 <= 29 * ref[30]
		                eq_input(28)(3) <= mcm_output(828); -- input 28,0 <= 13 * ref[31]
		
		                -- Eq 29
		                eq_input(29)(0) <= mcm_output(755); -- input 29,0 <= 2 * ref[29]
		                eq_input(29)(1) <= mcm_output(789); -- input 29,0 <= 18 * ref[30]
		                eq_input(29)(2) <= mcm_output(824); -- input 29,0 <= 29 * ref[31]
		                eq_input(29)(3) <= mcm_output(855); -- input 29,0 <= 13 * ref[32]
		
		                -- Eq 30
		                eq_input(30)(0) <= mcm_output(782); -- input 30,0 <= 2 * ref[30]
		                eq_input(30)(1) <= mcm_output(816); -- input 30,0 <= 18 * ref[31]
		                eq_input(30)(2) <= mcm_output(851); -- input 30,0 <= 29 * ref[32]
		                eq_input(30)(3) <= mcm_output(882); -- input 30,0 <= 13 * ref[33]
		
		                -- Eq 31
		                eq_input(31)(0) <= mcm_output(809); -- input 31,0 <= 2 * ref[31]
		                eq_input(31)(1) <= mcm_output(843); -- input 31,0 <= 18 * ref[32]
		                eq_input(31)(2) <= mcm_output(878); -- input 31,0 <= 29 * ref[33]
		                eq_input(31)(3) <= mcm_output(909); -- input 31,0 <= 13 * ref[34]
		
		                -- Eq 32
		                eq_input(32)(0) <= mcm_output(836); -- input 32,0 <= 2 * ref[32]
		                eq_input(32)(1) <= mcm_output(870); -- input 32,0 <= 18 * ref[33]
		                eq_input(32)(2) <= mcm_output(905); -- input 32,0 <= 29 * ref[34]
		                eq_input(32)(3) <= mcm_output(936); -- input 32,0 <= 13 * ref[35]
		
		                -- Eq 33
		                eq_input(33)(0) <= mcm_output(863); -- input 33,0 <= 2 * ref[33]
		                eq_input(33)(1) <= mcm_output(897); -- input 33,0 <= 18 * ref[34]
		                eq_input(33)(2) <= mcm_output(932); -- input 33,0 <= 29 * ref[35]
		                eq_input(33)(3) <= mcm_output(963); -- input 33,0 <= 13 * ref[36]
		
		                -- Eq 34
		                eq_input(34)(0) <= mcm_output(890); -- input 34,0 <= 2 * ref[34]
		                eq_input(34)(1) <= mcm_output(924); -- input 34,0 <= 18 * ref[35]
		                eq_input(34)(2) <= mcm_output(959); -- input 34,0 <= 29 * ref[36]
		                eq_input(34)(3) <= mcm_output(990); -- input 34,0 <= 13 * ref[37]
		
		                -- Eq 35
		                eq_input(35)(0) <= mcm_output(917); -- input 35,0 <= 2 * ref[35]
		                eq_input(35)(1) <= mcm_output(951); -- input 35,0 <= 18 * ref[36]
		                eq_input(35)(2) <= mcm_output(986); -- input 35,0 <= 29 * ref[37]
		                eq_input(35)(3) <= mcm_output(1017); -- input 35,0 <= 13 * ref[38]
		
		                -- Eq 36
		                eq_input(36)(0) <= mcm_output(944); -- input 36,0 <= 2 * ref[36]
		                eq_input(36)(1) <= mcm_output(978); -- input 36,0 <= 18 * ref[37]
		                eq_input(36)(2) <= mcm_output(1013); -- input 36,0 <= 29 * ref[38]
		                eq_input(36)(3) <= mcm_output(1044); -- input 36,0 <= 13 * ref[39]
		
		                -- Eq 37
		                eq_input(37)(0) <= mcm_output(971); -- input 37,0 <= 2 * ref[37]
		                eq_input(37)(1) <= mcm_output(1005); -- input 37,0 <= 18 * ref[38]
		                eq_input(37)(2) <= mcm_output(1040); -- input 37,0 <= 29 * ref[39]
		                eq_input(37)(3) <= mcm_output(1071); -- input 37,0 <= 13 * ref[40]
		
		                -- Eq 38
		                eq_input(38)(0) <= mcm_output(998); -- input 38,0 <= 2 * ref[38]
		                eq_input(38)(1) <= mcm_output(1032); -- input 38,0 <= 18 * ref[39]
		                eq_input(38)(2) <= mcm_output(1067); -- input 38,0 <= 29 * ref[40]
		                eq_input(38)(3) <= mcm_output(1098); -- input 38,0 <= 13 * ref[41]
		
		                -- Eq 39
		                eq_input(39)(0) <= mcm_output(1025); -- input 39,0 <= 2 * ref[39]
		                eq_input(39)(1) <= mcm_output(1059); -- input 39,0 <= 18 * ref[40]
		                eq_input(39)(2) <= mcm_output(1094); -- input 39,0 <= 29 * ref[41]
		                eq_input(39)(3) <= mcm_output(1125); -- input 39,0 <= 13 * ref[42]
		
		                -- Eq 40
		                eq_input(40)(0) <= mcm_output(1052); -- input 40,0 <= 2 * ref[40]
		                eq_input(40)(1) <= mcm_output(1086); -- input 40,0 <= 18 * ref[41]
		                eq_input(40)(2) <= mcm_output(1121); -- input 40,0 <= 29 * ref[42]
		                eq_input(40)(3) <= mcm_output(1152); -- input 40,0 <= 13 * ref[43]
		
		                -- Eq 41
		                eq_input(41)(0) <= mcm_output(1079); -- input 41,0 <= 2 * ref[41]
		                eq_input(41)(1) <= mcm_output(1113); -- input 41,0 <= 18 * ref[42]
		                eq_input(41)(2) <= mcm_output(1148); -- input 41,0 <= 29 * ref[43]
		                eq_input(41)(3) <= mcm_output(1179); -- input 41,0 <= 13 * ref[44]
		
		                -- Eq 42
		                eq_input(42)(0) <= mcm_output(1106); -- input 42,0 <= 2 * ref[42]
		                eq_input(42)(1) <= mcm_output(1140); -- input 42,0 <= 18 * ref[43]
		                eq_input(42)(2) <= mcm_output(1175); -- input 42,0 <= 29 * ref[44]
		                eq_input(42)(3) <= mcm_output(1206); -- input 42,0 <= 13 * ref[45]
		
		                -- Eq 43
		                eq_input(43)(0) <= mcm_output(1133); -- input 43,0 <= 2 * ref[43]
		                eq_input(43)(1) <= mcm_output(1167); -- input 43,0 <= 18 * ref[44]
		                eq_input(43)(2) <= mcm_output(1202); -- input 43,0 <= 29 * ref[45]
		                eq_input(43)(3) <= mcm_output(1233); -- input 43,0 <= 13 * ref[46]
		
		                -- Eq 44
		                eq_input(44)(0) <= mcm_output(1160); -- input 44,0 <= 2 * ref[44]
		                eq_input(44)(1) <= mcm_output(1194); -- input 44,0 <= 18 * ref[45]
		                eq_input(44)(2) <= mcm_output(1229); -- input 44,0 <= 29 * ref[46]
		                eq_input(44)(3) <= mcm_output(1260); -- input 44,0 <= 13 * ref[47]
		
		                -- Eq 45
		                eq_input(45)(0) <= mcm_output(1187); -- input 45,0 <= 2 * ref[45]
		                eq_input(45)(1) <= mcm_output(1221); -- input 45,0 <= 18 * ref[46]
		                eq_input(45)(2) <= mcm_output(1256); -- input 45,0 <= 29 * ref[47]
		                eq_input(45)(3) <= mcm_output(1287); -- input 45,0 <= 13 * ref[48]
		
		                -- Eq 46
		                eq_input(46)(0) <= mcm_output(1214); -- input 46,0 <= 2 * ref[46]
		                eq_input(46)(1) <= mcm_output(1248); -- input 46,0 <= 18 * ref[47]
		                eq_input(46)(2) <= mcm_output(1283); -- input 46,0 <= 29 * ref[48]
		                eq_input(46)(3) <= mcm_output(1314); -- input 46,0 <= 13 * ref[49]
		
		                -- Eq 47
		                eq_input(47)(0) <= mcm_output(1241); -- input 47,0 <= 2 * ref[47]
		                eq_input(47)(1) <= mcm_output(1275); -- input 47,0 <= 18 * ref[48]
		                eq_input(47)(2) <= mcm_output(1310); -- input 47,0 <= 29 * ref[49]
		                eq_input(47)(3) <= mcm_output(1341); -- input 47,0 <= 13 * ref[50]
		
		                -- Eq 48
		                eq_input(48)(0) <= mcm_output(1268); -- input 48,0 <= 2 * ref[48]
		                eq_input(48)(1) <= mcm_output(1302); -- input 48,0 <= 18 * ref[49]
		                eq_input(48)(2) <= mcm_output(1337); -- input 48,0 <= 29 * ref[50]
		                eq_input(48)(3) <= mcm_output(1368); -- input 48,0 <= 13 * ref[51]
		
		                -- Eq 49
		                eq_input(49)(0) <= mcm_output(1295); -- input 49,0 <= 2 * ref[49]
		                eq_input(49)(1) <= mcm_output(1329); -- input 49,0 <= 18 * ref[50]
		                eq_input(49)(2) <= mcm_output(1364); -- input 49,0 <= 29 * ref[51]
		                eq_input(49)(3) <= mcm_output(1395); -- input 49,0 <= 13 * ref[52]
		
		                -- Eq 50
		                eq_input(50)(0) <= mcm_output(1322); -- input 50,0 <= 2 * ref[50]
		                eq_input(50)(1) <= mcm_output(1356); -- input 50,0 <= 18 * ref[51]
		                eq_input(50)(2) <= mcm_output(1391); -- input 50,0 <= 29 * ref[52]
		                eq_input(50)(3) <= mcm_output(1422); -- input 50,0 <= 13 * ref[53]
		
		                -- Eq 51
		                eq_input(51)(0) <= mcm_output(1349); -- input 51,0 <= 2 * ref[51]
		                eq_input(51)(1) <= mcm_output(1383); -- input 51,0 <= 18 * ref[52]
		                eq_input(51)(2) <= mcm_output(1418); -- input 51,0 <= 29 * ref[53]
		                eq_input(51)(3) <= mcm_output(1449); -- input 51,0 <= 13 * ref[54]
		
		                -- Eq 52
		                eq_input(52)(0) <= mcm_output(1376); -- input 52,0 <= 2 * ref[52]
		                eq_input(52)(1) <= mcm_output(1410); -- input 52,0 <= 18 * ref[53]
		                eq_input(52)(2) <= mcm_output(1445); -- input 52,0 <= 29 * ref[54]
		                eq_input(52)(3) <= mcm_output(1476); -- input 52,0 <= 13 * ref[55]
		
		                -- Eq 53
		                eq_input(53)(0) <= mcm_output(1403); -- input 53,0 <= 2 * ref[53]
		                eq_input(53)(1) <= mcm_output(1437); -- input 53,0 <= 18 * ref[54]
		                eq_input(53)(2) <= mcm_output(1472); -- input 53,0 <= 29 * ref[55]
		                eq_input(53)(3) <= mcm_output(1503); -- input 53,0 <= 13 * ref[56]
		
		                -- Eq 54
		                eq_input(54)(0) <= mcm_output(1430); -- input 54,0 <= 2 * ref[54]
		                eq_input(54)(1) <= mcm_output(1464); -- input 54,0 <= 18 * ref[55]
		                eq_input(54)(2) <= mcm_output(1499); -- input 54,0 <= 29 * ref[56]
		                eq_input(54)(3) <= mcm_output(1530); -- input 54,0 <= 13 * ref[57]
		
		                -- Eq 55
		                eq_input(55)(0) <= mcm_output(1457); -- input 55,0 <= 2 * ref[55]
		                eq_input(55)(1) <= mcm_output(1491); -- input 55,0 <= 18 * ref[56]
		                eq_input(55)(2) <= mcm_output(1526); -- input 55,0 <= 29 * ref[57]
		                eq_input(55)(3) <= mcm_output(1557); -- input 55,0 <= 13 * ref[58]
		
		                -- Eq 56
		                eq_input(56)(0) <= mcm_output(1484); -- input 56,0 <= 2 * ref[56]
		                eq_input(56)(1) <= mcm_output(1518); -- input 56,0 <= 18 * ref[57]
		                eq_input(56)(2) <= mcm_output(1553); -- input 56,0 <= 29 * ref[58]
		                eq_input(56)(3) <= mcm_output(1584); -- input 56,0 <= 13 * ref[59]
		
		                -- Eq 57
		                eq_input(57)(0) <= mcm_output(1511); -- input 57,0 <= 2 * ref[57]
		                eq_input(57)(1) <= mcm_output(1545); -- input 57,0 <= 18 * ref[58]
		                eq_input(57)(2) <= mcm_output(1580); -- input 57,0 <= 29 * ref[59]
		                eq_input(57)(3) <= mcm_output(1611); -- input 57,0 <= 13 * ref[60]
		
		                -- Eq 58
		                eq_input(58)(0) <= mcm_output(1538); -- input 58,0 <= 2 * ref[58]
		                eq_input(58)(1) <= mcm_output(1572); -- input 58,0 <= 18 * ref[59]
		                eq_input(58)(2) <= mcm_output(1607); -- input 58,0 <= 29 * ref[60]
		                eq_input(58)(3) <= mcm_output(1638); -- input 58,0 <= 13 * ref[61]
		
		                -- Eq 59
		                eq_input(59)(0) <= mcm_output(1565); -- input 59,0 <= 2 * ref[59]
		                eq_input(59)(1) <= mcm_output(1599); -- input 59,0 <= 18 * ref[60]
		                eq_input(59)(2) <= mcm_output(1634); -- input 59,0 <= 29 * ref[61]
		                eq_input(59)(3) <= mcm_output(1665); -- input 59,0 <= 13 * ref[62]
		
		                -- Eq 60
		                eq_input(60)(0) <= mcm_output(1592); -- input 60,0 <= 2 * ref[60]
		                eq_input(60)(1) <= mcm_output(1626); -- input 60,0 <= 18 * ref[61]
		                eq_input(60)(2) <= mcm_output(1661); -- input 60,0 <= 29 * ref[62]
		                eq_input(60)(3) <= mcm_output(1692); -- input 60,0 <= 13 * ref[63]
		
		                -- Eq 61
		                eq_input(61)(0) <= mcm_output(1619); -- input 61,0 <= 2 * ref[61]
		                eq_input(61)(1) <= mcm_output(1653); -- input 61,1 <= 18 * ref[62]
		                eq_input(61)(2) <= mcm_output(1688); -- input 61,2 <= 29 * ref[63]
		                eq_input(61)(3) <= mcm_output(1716); -- input 61,3 <= 13 * ref[64]
		
		                -- Eq 62
		                eq_input(62)(0) <= mcm_output(1646); -- input 62,0 <= 2 * ref[62]
		                eq_input(62)(1) <= mcm_output(1680); -- input 62,1 <= 18 * ref[63]
		                eq_input(62)(2) <= mcm_output(1708); -- input 62,2 <= 29 * ref[64]
		                eq_input(62)(3) <= mcm_output(1732); -- input 62,3 <= 13 * ref[65]
		
		                -- Eq 63
		                eq_input(63)(0) <= mcm_output(1673); -- input 63,0 <= 2 * ref[63]
		                eq_input(63)(1) <= mcm_output(1700); -- input 63,1 <= 18 * ref[64]
		                eq_input(63)(2) <= mcm_output(1724); -- input 63,2 <= 29 * ref[65]
		                eq_input(63)(3) <= mcm_output(1740); -- input 63,3 <= 13 * ref[66]
		        when others => -- default case for not using latch
		                for i in 0 to 63 loop 
							for j in 0 to 3 loop
								eq_input(i)(j) <= "0000000000000000";
							end loop;
						end loop;
				end case;
		end if;
	end process;
END comportamental;