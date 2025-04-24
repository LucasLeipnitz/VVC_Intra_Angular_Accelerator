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
		ref : IN sample_bus (0 to 66 );
		pred: OUT sample_bus (0 to 63 )
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


type t_mcm_output is array (0 to 901) of std_logic_vector( 15 downto 0);
type t_row is array (0 to 3) of std_logic_vector( 15 downto 0);
type t_eq_input is array (0 to 63) of t_row;
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
    m16 : MCM_3
    PORT MAP ( X => ref(16), Y1 => mcm_output(206), Y2 => mcm_output(207), Y3 => mcm_output(208), Y4 => mcm_output(209), Y5 => mcm_output(210), Y6 => mcm_output(211), Y7 => mcm_output(212), Y8 => mcm_output(213), Y9 => mcm_output(214), Y10 => mcm_output(215), Y11 => mcm_output(216), Y12 => mcm_output(217), Y13 => mcm_output(218), Y14 => mcm_output(219) );
    m17 : MCM_3
    PORT MAP ( X => ref(17), Y1 => mcm_output(220), Y2 => mcm_output(221), Y3 => mcm_output(222), Y4 => mcm_output(223), Y5 => mcm_output(224), Y6 => mcm_output(225), Y7 => mcm_output(226), Y8 => mcm_output(227), Y9 => mcm_output(228), Y10 => mcm_output(229), Y11 => mcm_output(230), Y12 => mcm_output(231), Y13 => mcm_output(232), Y14 => mcm_output(233) );
    m18 : MCM_3
    PORT MAP ( X => ref(18), Y1 => mcm_output(234), Y2 => mcm_output(235), Y3 => mcm_output(236), Y4 => mcm_output(237), Y5 => mcm_output(238), Y6 => mcm_output(239), Y7 => mcm_output(240), Y8 => mcm_output(241), Y9 => mcm_output(242), Y10 => mcm_output(243), Y11 => mcm_output(244), Y12 => mcm_output(245), Y13 => mcm_output(246), Y14 => mcm_output(247) );
    m19 : MCM_3
    PORT MAP ( X => ref(19), Y1 => mcm_output(248), Y2 => mcm_output(249), Y3 => mcm_output(250), Y4 => mcm_output(251), Y5 => mcm_output(252), Y6 => mcm_output(253), Y7 => mcm_output(254), Y8 => mcm_output(255), Y9 => mcm_output(256), Y10 => mcm_output(257), Y11 => mcm_output(258), Y12 => mcm_output(259), Y13 => mcm_output(260), Y14 => mcm_output(261) );
    m20 : MCM_3
    PORT MAP ( X => ref(20), Y1 => mcm_output(262), Y2 => mcm_output(263), Y3 => mcm_output(264), Y4 => mcm_output(265), Y5 => mcm_output(266), Y6 => mcm_output(267), Y7 => mcm_output(268), Y8 => mcm_output(269), Y9 => mcm_output(270), Y10 => mcm_output(271), Y11 => mcm_output(272), Y12 => mcm_output(273), Y13 => mcm_output(274), Y14 => mcm_output(275) );
    m21 : MCM_3
    PORT MAP ( X => ref(21), Y1 => mcm_output(276), Y2 => mcm_output(277), Y3 => mcm_output(278), Y4 => mcm_output(279), Y5 => mcm_output(280), Y6 => mcm_output(281), Y7 => mcm_output(282), Y8 => mcm_output(283), Y9 => mcm_output(284), Y10 => mcm_output(285), Y11 => mcm_output(286), Y12 => mcm_output(287), Y13 => mcm_output(288), Y14 => mcm_output(289) );
    m22 : MCM_3
    PORT MAP ( X => ref(22), Y1 => mcm_output(290), Y2 => mcm_output(291), Y3 => mcm_output(292), Y4 => mcm_output(293), Y5 => mcm_output(294), Y6 => mcm_output(295), Y7 => mcm_output(296), Y8 => mcm_output(297), Y9 => mcm_output(298), Y10 => mcm_output(299), Y11 => mcm_output(300), Y12 => mcm_output(301), Y13 => mcm_output(302), Y14 => mcm_output(303) );
    m23 : MCM_3
    PORT MAP ( X => ref(23), Y1 => mcm_output(304), Y2 => mcm_output(305), Y3 => mcm_output(306), Y4 => mcm_output(307), Y5 => mcm_output(308), Y6 => mcm_output(309), Y7 => mcm_output(310), Y8 => mcm_output(311), Y9 => mcm_output(312), Y10 => mcm_output(313), Y11 => mcm_output(314), Y12 => mcm_output(315), Y13 => mcm_output(316), Y14 => mcm_output(317) );
    m24 : MCM_3
    PORT MAP ( X => ref(24), Y1 => mcm_output(318), Y2 => mcm_output(319), Y3 => mcm_output(320), Y4 => mcm_output(321), Y5 => mcm_output(322), Y6 => mcm_output(323), Y7 => mcm_output(324), Y8 => mcm_output(325), Y9 => mcm_output(326), Y10 => mcm_output(327), Y11 => mcm_output(328), Y12 => mcm_output(329), Y13 => mcm_output(330), Y14 => mcm_output(331) );
    m25 : MCM_3
    PORT MAP ( X => ref(25), Y1 => mcm_output(332), Y2 => mcm_output(333), Y3 => mcm_output(334), Y4 => mcm_output(335), Y5 => mcm_output(336), Y6 => mcm_output(337), Y7 => mcm_output(338), Y8 => mcm_output(339), Y9 => mcm_output(340), Y10 => mcm_output(341), Y11 => mcm_output(342), Y12 => mcm_output(343), Y13 => mcm_output(344), Y14 => mcm_output(345) );
    m26 : MCM_3
    PORT MAP ( X => ref(26), Y1 => mcm_output(346), Y2 => mcm_output(347), Y3 => mcm_output(348), Y4 => mcm_output(349), Y5 => mcm_output(350), Y6 => mcm_output(351), Y7 => mcm_output(352), Y8 => mcm_output(353), Y9 => mcm_output(354), Y10 => mcm_output(355), Y11 => mcm_output(356), Y12 => mcm_output(357), Y13 => mcm_output(358), Y14 => mcm_output(359) );
    m27 : MCM_3
    PORT MAP ( X => ref(27), Y1 => mcm_output(360), Y2 => mcm_output(361), Y3 => mcm_output(362), Y4 => mcm_output(363), Y5 => mcm_output(364), Y6 => mcm_output(365), Y7 => mcm_output(366), Y8 => mcm_output(367), Y9 => mcm_output(368), Y10 => mcm_output(369), Y11 => mcm_output(370), Y12 => mcm_output(371), Y13 => mcm_output(372), Y14 => mcm_output(373) );
    m28 : MCM_3
    PORT MAP ( X => ref(28), Y1 => mcm_output(374), Y2 => mcm_output(375), Y3 => mcm_output(376), Y4 => mcm_output(377), Y5 => mcm_output(378), Y6 => mcm_output(379), Y7 => mcm_output(380), Y8 => mcm_output(381), Y9 => mcm_output(382), Y10 => mcm_output(383), Y11 => mcm_output(384), Y12 => mcm_output(385), Y13 => mcm_output(386), Y14 => mcm_output(387) );
    m29 : MCM_3
    PORT MAP ( X => ref(29), Y1 => mcm_output(388), Y2 => mcm_output(389), Y3 => mcm_output(390), Y4 => mcm_output(391), Y5 => mcm_output(392), Y6 => mcm_output(393), Y7 => mcm_output(394), Y8 => mcm_output(395), Y9 => mcm_output(396), Y10 => mcm_output(397), Y11 => mcm_output(398), Y12 => mcm_output(399), Y13 => mcm_output(400), Y14 => mcm_output(401) );
    m30 : MCM_3
    PORT MAP ( X => ref(30), Y1 => mcm_output(402), Y2 => mcm_output(403), Y3 => mcm_output(404), Y4 => mcm_output(405), Y5 => mcm_output(406), Y6 => mcm_output(407), Y7 => mcm_output(408), Y8 => mcm_output(409), Y9 => mcm_output(410), Y10 => mcm_output(411), Y11 => mcm_output(412), Y12 => mcm_output(413), Y13 => mcm_output(414), Y14 => mcm_output(415) );
    m31 : MCM_3
    PORT MAP ( X => ref(31), Y1 => mcm_output(416), Y2 => mcm_output(417), Y3 => mcm_output(418), Y4 => mcm_output(419), Y5 => mcm_output(420), Y6 => mcm_output(421), Y7 => mcm_output(422), Y8 => mcm_output(423), Y9 => mcm_output(424), Y10 => mcm_output(425), Y11 => mcm_output(426), Y12 => mcm_output(427), Y13 => mcm_output(428), Y14 => mcm_output(429) );
    m32 : MCM_3
    PORT MAP ( X => ref(32), Y1 => mcm_output(430), Y2 => mcm_output(431), Y3 => mcm_output(432), Y4 => mcm_output(433), Y5 => mcm_output(434), Y6 => mcm_output(435), Y7 => mcm_output(436), Y8 => mcm_output(437), Y9 => mcm_output(438), Y10 => mcm_output(439), Y11 => mcm_output(440), Y12 => mcm_output(441), Y13 => mcm_output(442), Y14 => mcm_output(443) );
    m33 : MCM_3
    PORT MAP ( X => ref(33), Y1 => mcm_output(444), Y2 => mcm_output(445), Y3 => mcm_output(446), Y4 => mcm_output(447), Y5 => mcm_output(448), Y6 => mcm_output(449), Y7 => mcm_output(450), Y8 => mcm_output(451), Y9 => mcm_output(452), Y10 => mcm_output(453), Y11 => mcm_output(454), Y12 => mcm_output(455), Y13 => mcm_output(456), Y14 => mcm_output(457) );
    m34 : MCM_3
    PORT MAP ( X => ref(34), Y1 => mcm_output(458), Y2 => mcm_output(459), Y3 => mcm_output(460), Y4 => mcm_output(461), Y5 => mcm_output(462), Y6 => mcm_output(463), Y7 => mcm_output(464), Y8 => mcm_output(465), Y9 => mcm_output(466), Y10 => mcm_output(467), Y11 => mcm_output(468), Y12 => mcm_output(469), Y13 => mcm_output(470), Y14 => mcm_output(471) );
    m35 : MCM_3
    PORT MAP ( X => ref(35), Y1 => mcm_output(472), Y2 => mcm_output(473), Y3 => mcm_output(474), Y4 => mcm_output(475), Y5 => mcm_output(476), Y6 => mcm_output(477), Y7 => mcm_output(478), Y8 => mcm_output(479), Y9 => mcm_output(480), Y10 => mcm_output(481), Y11 => mcm_output(482), Y12 => mcm_output(483), Y13 => mcm_output(484), Y14 => mcm_output(485) );
    m36 : MCM_3
    PORT MAP ( X => ref(36), Y1 => mcm_output(486), Y2 => mcm_output(487), Y3 => mcm_output(488), Y4 => mcm_output(489), Y5 => mcm_output(490), Y6 => mcm_output(491), Y7 => mcm_output(492), Y8 => mcm_output(493), Y9 => mcm_output(494), Y10 => mcm_output(495), Y11 => mcm_output(496), Y12 => mcm_output(497), Y13 => mcm_output(498), Y14 => mcm_output(499) );
    m37 : MCM_3
    PORT MAP ( X => ref(37), Y1 => mcm_output(500), Y2 => mcm_output(501), Y3 => mcm_output(502), Y4 => mcm_output(503), Y5 => mcm_output(504), Y6 => mcm_output(505), Y7 => mcm_output(506), Y8 => mcm_output(507), Y9 => mcm_output(508), Y10 => mcm_output(509), Y11 => mcm_output(510), Y12 => mcm_output(511), Y13 => mcm_output(512), Y14 => mcm_output(513) );
    m38 : MCM_3
    PORT MAP ( X => ref(38), Y1 => mcm_output(514), Y2 => mcm_output(515), Y3 => mcm_output(516), Y4 => mcm_output(517), Y5 => mcm_output(518), Y6 => mcm_output(519), Y7 => mcm_output(520), Y8 => mcm_output(521), Y9 => mcm_output(522), Y10 => mcm_output(523), Y11 => mcm_output(524), Y12 => mcm_output(525), Y13 => mcm_output(526), Y14 => mcm_output(527) );
    m39 : MCM_3
    PORT MAP ( X => ref(39), Y1 => mcm_output(528), Y2 => mcm_output(529), Y3 => mcm_output(530), Y4 => mcm_output(531), Y5 => mcm_output(532), Y6 => mcm_output(533), Y7 => mcm_output(534), Y8 => mcm_output(535), Y9 => mcm_output(536), Y10 => mcm_output(537), Y11 => mcm_output(538), Y12 => mcm_output(539), Y13 => mcm_output(540), Y14 => mcm_output(541) );
    m40 : MCM_3
    PORT MAP ( X => ref(40), Y1 => mcm_output(542), Y2 => mcm_output(543), Y3 => mcm_output(544), Y4 => mcm_output(545), Y5 => mcm_output(546), Y6 => mcm_output(547), Y7 => mcm_output(548), Y8 => mcm_output(549), Y9 => mcm_output(550), Y10 => mcm_output(551), Y11 => mcm_output(552), Y12 => mcm_output(553), Y13 => mcm_output(554), Y14 => mcm_output(555) );
    m41 : MCM_3
    PORT MAP ( X => ref(41), Y1 => mcm_output(556), Y2 => mcm_output(557), Y3 => mcm_output(558), Y4 => mcm_output(559), Y5 => mcm_output(560), Y6 => mcm_output(561), Y7 => mcm_output(562), Y8 => mcm_output(563), Y9 => mcm_output(564), Y10 => mcm_output(565), Y11 => mcm_output(566), Y12 => mcm_output(567), Y13 => mcm_output(568), Y14 => mcm_output(569) );
    m42 : MCM_3
    PORT MAP ( X => ref(42), Y1 => mcm_output(570), Y2 => mcm_output(571), Y3 => mcm_output(572), Y4 => mcm_output(573), Y5 => mcm_output(574), Y6 => mcm_output(575), Y7 => mcm_output(576), Y8 => mcm_output(577), Y9 => mcm_output(578), Y10 => mcm_output(579), Y11 => mcm_output(580), Y12 => mcm_output(581), Y13 => mcm_output(582), Y14 => mcm_output(583) );
    m43 : MCM_3
    PORT MAP ( X => ref(43), Y1 => mcm_output(584), Y2 => mcm_output(585), Y3 => mcm_output(586), Y4 => mcm_output(587), Y5 => mcm_output(588), Y6 => mcm_output(589), Y7 => mcm_output(590), Y8 => mcm_output(591), Y9 => mcm_output(592), Y10 => mcm_output(593), Y11 => mcm_output(594), Y12 => mcm_output(595), Y13 => mcm_output(596), Y14 => mcm_output(597) );
    m44 : MCM_3
    PORT MAP ( X => ref(44), Y1 => mcm_output(598), Y2 => mcm_output(599), Y3 => mcm_output(600), Y4 => mcm_output(601), Y5 => mcm_output(602), Y6 => mcm_output(603), Y7 => mcm_output(604), Y8 => mcm_output(605), Y9 => mcm_output(606), Y10 => mcm_output(607), Y11 => mcm_output(608), Y12 => mcm_output(609), Y13 => mcm_output(610), Y14 => mcm_output(611) );
    m45 : MCM_3
    PORT MAP ( X => ref(45), Y1 => mcm_output(612), Y2 => mcm_output(613), Y3 => mcm_output(614), Y4 => mcm_output(615), Y5 => mcm_output(616), Y6 => mcm_output(617), Y7 => mcm_output(618), Y8 => mcm_output(619), Y9 => mcm_output(620), Y10 => mcm_output(621), Y11 => mcm_output(622), Y12 => mcm_output(623), Y13 => mcm_output(624), Y14 => mcm_output(625) );
    m46 : MCM_3
    PORT MAP ( X => ref(46), Y1 => mcm_output(626), Y2 => mcm_output(627), Y3 => mcm_output(628), Y4 => mcm_output(629), Y5 => mcm_output(630), Y6 => mcm_output(631), Y7 => mcm_output(632), Y8 => mcm_output(633), Y9 => mcm_output(634), Y10 => mcm_output(635), Y11 => mcm_output(636), Y12 => mcm_output(637), Y13 => mcm_output(638), Y14 => mcm_output(639) );
    m47 : MCM_3
    PORT MAP ( X => ref(47), Y1 => mcm_output(640), Y2 => mcm_output(641), Y3 => mcm_output(642), Y4 => mcm_output(643), Y5 => mcm_output(644), Y6 => mcm_output(645), Y7 => mcm_output(646), Y8 => mcm_output(647), Y9 => mcm_output(648), Y10 => mcm_output(649), Y11 => mcm_output(650), Y12 => mcm_output(651), Y13 => mcm_output(652), Y14 => mcm_output(653) );
    m48 : MCM_3
    PORT MAP ( X => ref(48), Y1 => mcm_output(654), Y2 => mcm_output(655), Y3 => mcm_output(656), Y4 => mcm_output(657), Y5 => mcm_output(658), Y6 => mcm_output(659), Y7 => mcm_output(660), Y8 => mcm_output(661), Y9 => mcm_output(662), Y10 => mcm_output(663), Y11 => mcm_output(664), Y12 => mcm_output(665), Y13 => mcm_output(666), Y14 => mcm_output(667) );
    m49 : MCM_3
    PORT MAP ( X => ref(49), Y1 => mcm_output(668), Y2 => mcm_output(669), Y3 => mcm_output(670), Y4 => mcm_output(671), Y5 => mcm_output(672), Y6 => mcm_output(673), Y7 => mcm_output(674), Y8 => mcm_output(675), Y9 => mcm_output(676), Y10 => mcm_output(677), Y11 => mcm_output(678), Y12 => mcm_output(679), Y13 => mcm_output(680), Y14 => mcm_output(681) );
    m50 : MCM_3
    PORT MAP ( X => ref(50), Y1 => mcm_output(682), Y2 => mcm_output(683), Y3 => mcm_output(684), Y4 => mcm_output(685), Y5 => mcm_output(686), Y6 => mcm_output(687), Y7 => mcm_output(688), Y8 => mcm_output(689), Y9 => mcm_output(690), Y10 => mcm_output(691), Y11 => mcm_output(692), Y12 => mcm_output(693), Y13 => mcm_output(694), Y14 => mcm_output(695) );
    m51 : MCM_3
    PORT MAP ( X => ref(51), Y1 => mcm_output(696), Y2 => mcm_output(697), Y3 => mcm_output(698), Y4 => mcm_output(699), Y5 => mcm_output(700), Y6 => mcm_output(701), Y7 => mcm_output(702), Y8 => mcm_output(703), Y9 => mcm_output(704), Y10 => mcm_output(705), Y11 => mcm_output(706), Y12 => mcm_output(707), Y13 => mcm_output(708), Y14 => mcm_output(709) );
    m52 : MCM_3
    PORT MAP ( X => ref(52), Y1 => mcm_output(710), Y2 => mcm_output(711), Y3 => mcm_output(712), Y4 => mcm_output(713), Y5 => mcm_output(714), Y6 => mcm_output(715), Y7 => mcm_output(716), Y8 => mcm_output(717), Y9 => mcm_output(718), Y10 => mcm_output(719), Y11 => mcm_output(720), Y12 => mcm_output(721), Y13 => mcm_output(722), Y14 => mcm_output(723) );
    m53 : MCM_3
    PORT MAP ( X => ref(53), Y1 => mcm_output(724), Y2 => mcm_output(725), Y3 => mcm_output(726), Y4 => mcm_output(727), Y5 => mcm_output(728), Y6 => mcm_output(729), Y7 => mcm_output(730), Y8 => mcm_output(731), Y9 => mcm_output(732), Y10 => mcm_output(733), Y11 => mcm_output(734), Y12 => mcm_output(735), Y13 => mcm_output(736), Y14 => mcm_output(737) );
    m54 : MCM_3
    PORT MAP ( X => ref(54), Y1 => mcm_output(738), Y2 => mcm_output(739), Y3 => mcm_output(740), Y4 => mcm_output(741), Y5 => mcm_output(742), Y6 => mcm_output(743), Y7 => mcm_output(744), Y8 => mcm_output(745), Y9 => mcm_output(746), Y10 => mcm_output(747), Y11 => mcm_output(748), Y12 => mcm_output(749), Y13 => mcm_output(750), Y14 => mcm_output(751) );
    m55 : MCM_3
    PORT MAP ( X => ref(55), Y1 => mcm_output(752), Y2 => mcm_output(753), Y3 => mcm_output(754), Y4 => mcm_output(755), Y5 => mcm_output(756), Y6 => mcm_output(757), Y7 => mcm_output(758), Y8 => mcm_output(759), Y9 => mcm_output(760), Y10 => mcm_output(761), Y11 => mcm_output(762), Y12 => mcm_output(763), Y13 => mcm_output(764), Y14 => mcm_output(765) );
    m56 : MCM_3
    PORT MAP ( X => ref(56), Y1 => mcm_output(766), Y2 => mcm_output(767), Y3 => mcm_output(768), Y4 => mcm_output(769), Y5 => mcm_output(770), Y6 => mcm_output(771), Y7 => mcm_output(772), Y8 => mcm_output(773), Y9 => mcm_output(774), Y10 => mcm_output(775), Y11 => mcm_output(776), Y12 => mcm_output(777), Y13 => mcm_output(778), Y14 => mcm_output(779) );
    m57 : MCM_3
    PORT MAP ( X => ref(57), Y1 => mcm_output(780), Y2 => mcm_output(781), Y3 => mcm_output(782), Y4 => mcm_output(783), Y5 => mcm_output(784), Y6 => mcm_output(785), Y7 => mcm_output(786), Y8 => mcm_output(787), Y9 => mcm_output(788), Y10 => mcm_output(789), Y11 => mcm_output(790), Y12 => mcm_output(791), Y13 => mcm_output(792), Y14 => mcm_output(793) );
    m58 : MCM_3
    PORT MAP ( X => ref(58), Y1 => mcm_output(794), Y2 => mcm_output(795), Y3 => mcm_output(796), Y4 => mcm_output(797), Y5 => mcm_output(798), Y6 => mcm_output(799), Y7 => mcm_output(800), Y8 => mcm_output(801), Y9 => mcm_output(802), Y10 => mcm_output(803), Y11 => mcm_output(804), Y12 => mcm_output(805), Y13 => mcm_output(806), Y14 => mcm_output(807) );
    m59 : MCM_3
    PORT MAP ( X => ref(59), Y1 => mcm_output(808), Y2 => mcm_output(809), Y3 => mcm_output(810), Y4 => mcm_output(811), Y5 => mcm_output(812), Y6 => mcm_output(813), Y7 => mcm_output(814), Y8 => mcm_output(815), Y9 => mcm_output(816), Y10 => mcm_output(817), Y11 => mcm_output(818), Y12 => mcm_output(819), Y13 => mcm_output(820), Y14 => mcm_output(821) );
    m60 : MCM_3
    PORT MAP ( X => ref(60), Y1 => mcm_output(822), Y2 => mcm_output(823), Y3 => mcm_output(824), Y4 => mcm_output(825), Y5 => mcm_output(826), Y6 => mcm_output(827), Y7 => mcm_output(828), Y8 => mcm_output(829), Y9 => mcm_output(830), Y10 => mcm_output(831), Y11 => mcm_output(832), Y12 => mcm_output(833), Y13 => mcm_output(834), Y14 => mcm_output(835) );
    m61 : MCM_3
    PORT MAP ( X => ref(61), Y1 => mcm_output(836), Y2 => mcm_output(837), Y3 => mcm_output(838), Y4 => mcm_output(839), Y5 => mcm_output(840), Y6 => mcm_output(841), Y7 => mcm_output(842), Y8 => mcm_output(843), Y9 => mcm_output(844), Y10 => mcm_output(845), Y11 => mcm_output(846), Y12 => mcm_output(847), Y13 => mcm_output(848), Y14 => mcm_output(849) );
    m62 : MCM_3
    PORT MAP ( X => ref(62), Y1 => mcm_output(850), Y2 => mcm_output(851), Y3 => mcm_output(852), Y4 => mcm_output(853), Y5 => mcm_output(854), Y6 => mcm_output(855), Y7 => mcm_output(856), Y8 => mcm_output(857), Y9 => mcm_output(858), Y10 => mcm_output(859), Y11 => mcm_output(860), Y12 => mcm_output(861), Y13 => mcm_output(862), Y14 => mcm_output(863) );
    m63 : MCM_3
    PORT MAP ( X => ref(63), Y1 => mcm_output(864), Y2 => mcm_output(865), Y3 => mcm_output(866), Y4 => mcm_output(867), Y5 => mcm_output(868), Y6 => mcm_output(869), Y7 => mcm_output(870), Y8 => mcm_output(871), Y9 => mcm_output(872), Y10 => mcm_output(873), Y11 => mcm_output(874), Y12 => mcm_output(875), Y13 => mcm_output(876), Y14 => mcm_output(877) );
    m64 : MCM_4
    PORT MAP ( X => ref(64), Y1 => mcm_output(878), Y2 => mcm_output(879), Y3 => mcm_output(880), Y4 => mcm_output(881), Y5 => mcm_output(882), Y6 => mcm_output(883), Y7 => mcm_output(884), Y8 => mcm_output(885), Y9 => mcm_output(886), Y10 => mcm_output(887), Y11 => mcm_output(888), Y12 => mcm_output(889) );
    m65 : MCM_5
    PORT MAP ( X => ref(65), Y1 => mcm_output(890), Y2 => mcm_output(891), Y3 => mcm_output(892), Y4 => mcm_output(893), Y5 => mcm_output(894), Y6 => mcm_output(895), Y7 => mcm_output(896), Y8 => mcm_output(897) );
    m66 : MCM_6
    PORT MAP ( X => ref(66), Y1 => mcm_output(898), Y2 => mcm_output(899), Y3 => mcm_output(900), Y4 => mcm_output(901) );
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
    input(0)(13)(3) <= mcm_output(207); -- input 13,3 <= -2 * ref[16]

    -- Eq 14 Line 0
    input(0)(14)(0) <= mcm_output(178); -- input 14,0 <= -3 * ref[14]
    input(0)(14)(1) <= mcm_output(196); -- input 14,1 <= 53 * ref[15]
    input(0)(14)(2) <= mcm_output(214); -- input 14,2 <= 16 * ref[16]
    input(0)(14)(3) <= mcm_output(221); -- input 14,3 <= -2 * ref[17]

    -- Eq 15 Line 0
    input(0)(15)(0) <= mcm_output(192); -- input 15,0 <= -3 * ref[15]
    input(0)(15)(1) <= mcm_output(210); -- input 15,1 <= 53 * ref[16]
    input(0)(15)(2) <= mcm_output(228); -- input 15,2 <= 16 * ref[17]
    input(0)(15)(3) <= mcm_output(235); -- input 15,3 <= -2 * ref[18]

    -- Eq 16 Line 0
    input(0)(16)(0) <= mcm_output(206); -- input 16,0 <= -3 * ref[16]
    input(0)(16)(1) <= mcm_output(224); -- input 16,1 <= 53 * ref[17]
    input(0)(16)(2) <= mcm_output(242); -- input 16,2 <= 16 * ref[18]
    input(0)(16)(3) <= mcm_output(249); -- input 16,3 <= -2 * ref[19]

    -- Eq 17 Line 0
    input(0)(17)(0) <= mcm_output(220); -- input 17,0 <= -3 * ref[17]
    input(0)(17)(1) <= mcm_output(238); -- input 17,1 <= 53 * ref[18]
    input(0)(17)(2) <= mcm_output(256); -- input 17,2 <= 16 * ref[19]
    input(0)(17)(3) <= mcm_output(263); -- input 17,3 <= -2 * ref[20]

    -- Eq 18 Line 0
    input(0)(18)(0) <= mcm_output(234); -- input 18,0 <= -3 * ref[18]
    input(0)(18)(1) <= mcm_output(252); -- input 18,1 <= 53 * ref[19]
    input(0)(18)(2) <= mcm_output(270); -- input 18,2 <= 16 * ref[20]
    input(0)(18)(3) <= mcm_output(277); -- input 18,3 <= -2 * ref[21]

    -- Eq 19 Line 0
    input(0)(19)(0) <= mcm_output(248); -- input 19,0 <= -3 * ref[19]
    input(0)(19)(1) <= mcm_output(266); -- input 19,1 <= 53 * ref[20]
    input(0)(19)(2) <= mcm_output(284); -- input 19,2 <= 16 * ref[21]
    input(0)(19)(3) <= mcm_output(291); -- input 19,3 <= -2 * ref[22]

    -- Eq 20 Line 0
    input(0)(20)(0) <= mcm_output(262); -- input 20,0 <= -3 * ref[20]
    input(0)(20)(1) <= mcm_output(280); -- input 20,1 <= 53 * ref[21]
    input(0)(20)(2) <= mcm_output(298); -- input 20,2 <= 16 * ref[22]
    input(0)(20)(3) <= mcm_output(305); -- input 20,3 <= -2 * ref[23]

    -- Eq 21 Line 0
    input(0)(21)(0) <= mcm_output(276); -- input 21,0 <= -3 * ref[21]
    input(0)(21)(1) <= mcm_output(294); -- input 21,1 <= 53 * ref[22]
    input(0)(21)(2) <= mcm_output(312); -- input 21,2 <= 16 * ref[23]
    input(0)(21)(3) <= mcm_output(319); -- input 21,3 <= -2 * ref[24]

    -- Eq 22 Line 0
    input(0)(22)(0) <= mcm_output(290); -- input 22,0 <= -3 * ref[22]
    input(0)(22)(1) <= mcm_output(308); -- input 22,1 <= 53 * ref[23]
    input(0)(22)(2) <= mcm_output(326); -- input 22,2 <= 16 * ref[24]
    input(0)(22)(3) <= mcm_output(333); -- input 22,3 <= -2 * ref[25]

    -- Eq 23 Line 0
    input(0)(23)(0) <= mcm_output(304); -- input 23,0 <= -3 * ref[23]
    input(0)(23)(1) <= mcm_output(322); -- input 23,1 <= 53 * ref[24]
    input(0)(23)(2) <= mcm_output(340); -- input 23,2 <= 16 * ref[25]
    input(0)(23)(3) <= mcm_output(347); -- input 23,3 <= -2 * ref[26]

    -- Eq 24 Line 0
    input(0)(24)(0) <= mcm_output(318); -- input 24,0 <= -3 * ref[24]
    input(0)(24)(1) <= mcm_output(336); -- input 24,1 <= 53 * ref[25]
    input(0)(24)(2) <= mcm_output(354); -- input 24,2 <= 16 * ref[26]
    input(0)(24)(3) <= mcm_output(361); -- input 24,3 <= -2 * ref[27]

    -- Eq 25 Line 0
    input(0)(25)(0) <= mcm_output(332); -- input 25,0 <= -3 * ref[25]
    input(0)(25)(1) <= mcm_output(350); -- input 25,1 <= 53 * ref[26]
    input(0)(25)(2) <= mcm_output(368); -- input 25,2 <= 16 * ref[27]
    input(0)(25)(3) <= mcm_output(375); -- input 25,3 <= -2 * ref[28]

    -- Eq 26 Line 0
    input(0)(26)(0) <= mcm_output(346); -- input 26,0 <= -3 * ref[26]
    input(0)(26)(1) <= mcm_output(364); -- input 26,1 <= 53 * ref[27]
    input(0)(26)(2) <= mcm_output(382); -- input 26,2 <= 16 * ref[28]
    input(0)(26)(3) <= mcm_output(389); -- input 26,3 <= -2 * ref[29]

    -- Eq 27 Line 0
    input(0)(27)(0) <= mcm_output(360); -- input 27,0 <= -3 * ref[27]
    input(0)(27)(1) <= mcm_output(378); -- input 27,1 <= 53 * ref[28]
    input(0)(27)(2) <= mcm_output(396); -- input 27,2 <= 16 * ref[29]
    input(0)(27)(3) <= mcm_output(403); -- input 27,3 <= -2 * ref[30]

    -- Eq 28 Line 0
    input(0)(28)(0) <= mcm_output(374); -- input 28,0 <= -3 * ref[28]
    input(0)(28)(1) <= mcm_output(392); -- input 28,1 <= 53 * ref[29]
    input(0)(28)(2) <= mcm_output(410); -- input 28,2 <= 16 * ref[30]
    input(0)(28)(3) <= mcm_output(417); -- input 28,3 <= -2 * ref[31]

    -- Eq 29 Line 0
    input(0)(29)(0) <= mcm_output(388); -- input 29,0 <= -3 * ref[29]
    input(0)(29)(1) <= mcm_output(406); -- input 29,1 <= 53 * ref[30]
    input(0)(29)(2) <= mcm_output(424); -- input 29,2 <= 16 * ref[31]
    input(0)(29)(3) <= mcm_output(431); -- input 29,3 <= -2 * ref[32]

    -- Eq 30 Line 0
    input(0)(30)(0) <= mcm_output(402); -- input 30,0 <= -3 * ref[30]
    input(0)(30)(1) <= mcm_output(420); -- input 30,1 <= 53 * ref[31]
    input(0)(30)(2) <= mcm_output(438); -- input 30,2 <= 16 * ref[32]
    input(0)(30)(3) <= mcm_output(445); -- input 30,3 <= -2 * ref[33]

    -- Eq 31 Line 0
    input(0)(31)(0) <= mcm_output(416); -- input 31,0 <= -3 * ref[31]
    input(0)(31)(1) <= mcm_output(434); -- input 31,1 <= 53 * ref[32]
    input(0)(31)(2) <= mcm_output(452); -- input 31,2 <= 16 * ref[33]
    input(0)(31)(3) <= mcm_output(459); -- input 31,3 <= -2 * ref[34]

    -- Eq 32 Line 0
    input(0)(32)(0) <= mcm_output(430); -- input 32,0 <= -3 * ref[32]
    input(0)(32)(1) <= mcm_output(448); -- input 32,1 <= 53 * ref[33]
    input(0)(32)(2) <= mcm_output(466); -- input 32,2 <= 16 * ref[34]
    input(0)(32)(3) <= mcm_output(473); -- input 32,3 <= -2 * ref[35]

    -- Eq 33 Line 0
    input(0)(33)(0) <= mcm_output(444); -- input 33,0 <= -3 * ref[33]
    input(0)(33)(1) <= mcm_output(462); -- input 33,1 <= 53 * ref[34]
    input(0)(33)(2) <= mcm_output(480); -- input 33,2 <= 16 * ref[35]
    input(0)(33)(3) <= mcm_output(487); -- input 33,3 <= -2 * ref[36]

    -- Eq 34 Line 0
    input(0)(34)(0) <= mcm_output(458); -- input 34,0 <= -3 * ref[34]
    input(0)(34)(1) <= mcm_output(476); -- input 34,1 <= 53 * ref[35]
    input(0)(34)(2) <= mcm_output(494); -- input 34,2 <= 16 * ref[36]
    input(0)(34)(3) <= mcm_output(501); -- input 34,3 <= -2 * ref[37]

    -- Eq 35 Line 0
    input(0)(35)(0) <= mcm_output(472); -- input 35,0 <= -3 * ref[35]
    input(0)(35)(1) <= mcm_output(490); -- input 35,1 <= 53 * ref[36]
    input(0)(35)(2) <= mcm_output(508); -- input 35,2 <= 16 * ref[37]
    input(0)(35)(3) <= mcm_output(515); -- input 35,3 <= -2 * ref[38]

    -- Eq 36 Line 0
    input(0)(36)(0) <= mcm_output(486); -- input 36,0 <= -3 * ref[36]
    input(0)(36)(1) <= mcm_output(504); -- input 36,1 <= 53 * ref[37]
    input(0)(36)(2) <= mcm_output(522); -- input 36,2 <= 16 * ref[38]
    input(0)(36)(3) <= mcm_output(529); -- input 36,3 <= -2 * ref[39]

    -- Eq 37 Line 0
    input(0)(37)(0) <= mcm_output(500); -- input 37,0 <= -3 * ref[37]
    input(0)(37)(1) <= mcm_output(518); -- input 37,1 <= 53 * ref[38]
    input(0)(37)(2) <= mcm_output(536); -- input 37,2 <= 16 * ref[39]
    input(0)(37)(3) <= mcm_output(543); -- input 37,3 <= -2 * ref[40]

    -- Eq 38 Line 0
    input(0)(38)(0) <= mcm_output(514); -- input 38,0 <= -3 * ref[38]
    input(0)(38)(1) <= mcm_output(532); -- input 38,1 <= 53 * ref[39]
    input(0)(38)(2) <= mcm_output(550); -- input 38,2 <= 16 * ref[40]
    input(0)(38)(3) <= mcm_output(557); -- input 38,3 <= -2 * ref[41]

    -- Eq 39 Line 0
    input(0)(39)(0) <= mcm_output(528); -- input 39,0 <= -3 * ref[39]
    input(0)(39)(1) <= mcm_output(546); -- input 39,1 <= 53 * ref[40]
    input(0)(39)(2) <= mcm_output(564); -- input 39,2 <= 16 * ref[41]
    input(0)(39)(3) <= mcm_output(571); -- input 39,3 <= -2 * ref[42]

    -- Eq 40 Line 0
    input(0)(40)(0) <= mcm_output(542); -- input 40,0 <= -3 * ref[40]
    input(0)(40)(1) <= mcm_output(560); -- input 40,1 <= 53 * ref[41]
    input(0)(40)(2) <= mcm_output(578); -- input 40,2 <= 16 * ref[42]
    input(0)(40)(3) <= mcm_output(585); -- input 40,3 <= -2 * ref[43]

    -- Eq 41 Line 0
    input(0)(41)(0) <= mcm_output(556); -- input 41,0 <= -3 * ref[41]
    input(0)(41)(1) <= mcm_output(574); -- input 41,1 <= 53 * ref[42]
    input(0)(41)(2) <= mcm_output(592); -- input 41,2 <= 16 * ref[43]
    input(0)(41)(3) <= mcm_output(599); -- input 41,3 <= -2 * ref[44]

    -- Eq 42 Line 0
    input(0)(42)(0) <= mcm_output(570); -- input 42,0 <= -3 * ref[42]
    input(0)(42)(1) <= mcm_output(588); -- input 42,1 <= 53 * ref[43]
    input(0)(42)(2) <= mcm_output(606); -- input 42,2 <= 16 * ref[44]
    input(0)(42)(3) <= mcm_output(613); -- input 42,3 <= -2 * ref[45]

    -- Eq 43 Line 0
    input(0)(43)(0) <= mcm_output(584); -- input 43,0 <= -3 * ref[43]
    input(0)(43)(1) <= mcm_output(602); -- input 43,1 <= 53 * ref[44]
    input(0)(43)(2) <= mcm_output(620); -- input 43,2 <= 16 * ref[45]
    input(0)(43)(3) <= mcm_output(627); -- input 43,3 <= -2 * ref[46]

    -- Eq 44 Line 0
    input(0)(44)(0) <= mcm_output(598); -- input 44,0 <= -3 * ref[44]
    input(0)(44)(1) <= mcm_output(616); -- input 44,1 <= 53 * ref[45]
    input(0)(44)(2) <= mcm_output(634); -- input 44,2 <= 16 * ref[46]
    input(0)(44)(3) <= mcm_output(641); -- input 44,3 <= -2 * ref[47]

    -- Eq 45 Line 0
    input(0)(45)(0) <= mcm_output(612); -- input 45,0 <= -3 * ref[45]
    input(0)(45)(1) <= mcm_output(630); -- input 45,1 <= 53 * ref[46]
    input(0)(45)(2) <= mcm_output(648); -- input 45,2 <= 16 * ref[47]
    input(0)(45)(3) <= mcm_output(655); -- input 45,3 <= -2 * ref[48]

    -- Eq 46 Line 0
    input(0)(46)(0) <= mcm_output(626); -- input 46,0 <= -3 * ref[46]
    input(0)(46)(1) <= mcm_output(644); -- input 46,1 <= 53 * ref[47]
    input(0)(46)(2) <= mcm_output(662); -- input 46,2 <= 16 * ref[48]
    input(0)(46)(3) <= mcm_output(669); -- input 46,3 <= -2 * ref[49]

    -- Eq 47 Line 0
    input(0)(47)(0) <= mcm_output(640); -- input 47,0 <= -3 * ref[47]
    input(0)(47)(1) <= mcm_output(658); -- input 47,1 <= 53 * ref[48]
    input(0)(47)(2) <= mcm_output(676); -- input 47,2 <= 16 * ref[49]
    input(0)(47)(3) <= mcm_output(683); -- input 47,3 <= -2 * ref[50]

    -- Eq 48 Line 0
    input(0)(48)(0) <= mcm_output(654); -- input 48,0 <= -3 * ref[48]
    input(0)(48)(1) <= mcm_output(672); -- input 48,1 <= 53 * ref[49]
    input(0)(48)(2) <= mcm_output(690); -- input 48,2 <= 16 * ref[50]
    input(0)(48)(3) <= mcm_output(697); -- input 48,3 <= -2 * ref[51]

    -- Eq 49 Line 0
    input(0)(49)(0) <= mcm_output(668); -- input 49,0 <= -3 * ref[49]
    input(0)(49)(1) <= mcm_output(686); -- input 49,1 <= 53 * ref[50]
    input(0)(49)(2) <= mcm_output(704); -- input 49,2 <= 16 * ref[51]
    input(0)(49)(3) <= mcm_output(711); -- input 49,3 <= -2 * ref[52]

    -- Eq 50 Line 0
    input(0)(50)(0) <= mcm_output(682); -- input 50,0 <= -3 * ref[50]
    input(0)(50)(1) <= mcm_output(700); -- input 50,1 <= 53 * ref[51]
    input(0)(50)(2) <= mcm_output(718); -- input 50,2 <= 16 * ref[52]
    input(0)(50)(3) <= mcm_output(725); -- input 50,3 <= -2 * ref[53]

    -- Eq 51 Line 0
    input(0)(51)(0) <= mcm_output(696); -- input 51,0 <= -3 * ref[51]
    input(0)(51)(1) <= mcm_output(714); -- input 51,1 <= 53 * ref[52]
    input(0)(51)(2) <= mcm_output(732); -- input 51,2 <= 16 * ref[53]
    input(0)(51)(3) <= mcm_output(739); -- input 51,3 <= -2 * ref[54]

    -- Eq 52 Line 0
    input(0)(52)(0) <= mcm_output(710); -- input 52,0 <= -3 * ref[52]
    input(0)(52)(1) <= mcm_output(728); -- input 52,1 <= 53 * ref[53]
    input(0)(52)(2) <= mcm_output(746); -- input 52,2 <= 16 * ref[54]
    input(0)(52)(3) <= mcm_output(753); -- input 52,3 <= -2 * ref[55]

    -- Eq 53 Line 0
    input(0)(53)(0) <= mcm_output(724); -- input 53,0 <= -3 * ref[53]
    input(0)(53)(1) <= mcm_output(742); -- input 53,1 <= 53 * ref[54]
    input(0)(53)(2) <= mcm_output(760); -- input 53,2 <= 16 * ref[55]
    input(0)(53)(3) <= mcm_output(767); -- input 53,3 <= -2 * ref[56]

    -- Eq 54 Line 0
    input(0)(54)(0) <= mcm_output(738); -- input 54,0 <= -3 * ref[54]
    input(0)(54)(1) <= mcm_output(756); -- input 54,1 <= 53 * ref[55]
    input(0)(54)(2) <= mcm_output(774); -- input 54,2 <= 16 * ref[56]
    input(0)(54)(3) <= mcm_output(781); -- input 54,3 <= -2 * ref[57]

    -- Eq 55 Line 0
    input(0)(55)(0) <= mcm_output(752); -- input 55,0 <= -3 * ref[55]
    input(0)(55)(1) <= mcm_output(770); -- input 55,1 <= 53 * ref[56]
    input(0)(55)(2) <= mcm_output(788); -- input 55,2 <= 16 * ref[57]
    input(0)(55)(3) <= mcm_output(795); -- input 55,3 <= -2 * ref[58]

    -- Eq 56 Line 0
    input(0)(56)(0) <= mcm_output(766); -- input 56,0 <= -3 * ref[56]
    input(0)(56)(1) <= mcm_output(784); -- input 56,1 <= 53 * ref[57]
    input(0)(56)(2) <= mcm_output(802); -- input 56,2 <= 16 * ref[58]
    input(0)(56)(3) <= mcm_output(809); -- input 56,3 <= -2 * ref[59]

    -- Eq 57 Line 0
    input(0)(57)(0) <= mcm_output(780); -- input 57,0 <= -3 * ref[57]
    input(0)(57)(1) <= mcm_output(798); -- input 57,1 <= 53 * ref[58]
    input(0)(57)(2) <= mcm_output(816); -- input 57,2 <= 16 * ref[59]
    input(0)(57)(3) <= mcm_output(823); -- input 57,3 <= -2 * ref[60]

    -- Eq 58 Line 0
    input(0)(58)(0) <= mcm_output(794); -- input 58,0 <= -3 * ref[58]
    input(0)(58)(1) <= mcm_output(812); -- input 58,1 <= 53 * ref[59]
    input(0)(58)(2) <= mcm_output(830); -- input 58,2 <= 16 * ref[60]
    input(0)(58)(3) <= mcm_output(837); -- input 58,3 <= -2 * ref[61]

    -- Eq 59 Line 0
    input(0)(59)(0) <= mcm_output(808); -- input 59,0 <= -3 * ref[59]
    input(0)(59)(1) <= mcm_output(826); -- input 59,1 <= 53 * ref[60]
    input(0)(59)(2) <= mcm_output(844); -- input 59,2 <= 16 * ref[61]
    input(0)(59)(3) <= mcm_output(851); -- input 59,3 <= -2 * ref[62]

    -- Eq 60 Line 0
    input(0)(60)(0) <= mcm_output(822); -- input 60,0 <= -3 * ref[60]
    input(0)(60)(1) <= mcm_output(840); -- input 60,1 <= 53 * ref[61]
    input(0)(60)(2) <= mcm_output(858); -- input 60,2 <= 16 * ref[62]
    input(0)(60)(3) <= mcm_output(865); -- input 60,3 <= -2 * ref[63]

    -- Eq 61 Line 0
    input(0)(61)(0) <= mcm_output(836); -- input 61,0 <= -3 * ref[61]
    input(0)(61)(1) <= mcm_output(854); -- input 61,1 <= 53 * ref[62]
    input(0)(61)(2) <= mcm_output(872); -- input 61,2 <= 16 * ref[63]
    input(0)(61)(3) <= mcm_output(886); -- input 61,3 <= -2 * ref[64]

    -- Eq 62 Line 0
    input(0)(62)(0) <= mcm_output(850); -- input 62,0 <= -3 * ref[62]
    input(0)(62)(1) <= mcm_output(868); -- input 62,1 <= 53 * ref[63]
    input(0)(62)(2) <= mcm_output(882); -- input 62,2 <= 16 * ref[64]
    input(0)(62)(3) <= mcm_output(894); -- input 62,3 <= -2 * ref[65]

    -- Eq 63 Line 0
    input(0)(63)(0) <= mcm_output(864); -- input 63,0 <= -3 * ref[63]
    input(0)(63)(1) <= mcm_output(878); -- input 63,1 <= 53 * ref[64]
    input(0)(63)(2) <= mcm_output(890); -- input 63,2 <= 16 * ref[65]
    input(0)(63)(3) <= mcm_output(898); -- input 63,3 <= -2 * ref[66]

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
    input(1)(13)(3) <= mcm_output(206); -- input 13,3 <= -3 * ref[16]

    -- Eq 14 Line 1
    input(1)(14)(0) <= mcm_output(179); -- input 14,0 <= -2 * ref[14]
    input(1)(14)(1) <= mcm_output(197); -- input 14,1 <= 18 * ref[15]
    input(1)(14)(2) <= mcm_output(215); -- input 14,2 <= 51 * ref[16]
    input(1)(14)(3) <= mcm_output(220); -- input 14,3 <= -3 * ref[17]

    -- Eq 15 Line 1
    input(1)(15)(0) <= mcm_output(193); -- input 15,0 <= -2 * ref[15]
    input(1)(15)(1) <= mcm_output(211); -- input 15,1 <= 18 * ref[16]
    input(1)(15)(2) <= mcm_output(229); -- input 15,2 <= 51 * ref[17]
    input(1)(15)(3) <= mcm_output(234); -- input 15,3 <= -3 * ref[18]

    -- Eq 16 Line 1
    input(1)(16)(0) <= mcm_output(207); -- input 16,0 <= -2 * ref[16]
    input(1)(16)(1) <= mcm_output(225); -- input 16,1 <= 18 * ref[17]
    input(1)(16)(2) <= mcm_output(243); -- input 16,2 <= 51 * ref[18]
    input(1)(16)(3) <= mcm_output(248); -- input 16,3 <= -3 * ref[19]

    -- Eq 17 Line 1
    input(1)(17)(0) <= mcm_output(221); -- input 17,0 <= -2 * ref[17]
    input(1)(17)(1) <= mcm_output(239); -- input 17,1 <= 18 * ref[18]
    input(1)(17)(2) <= mcm_output(257); -- input 17,2 <= 51 * ref[19]
    input(1)(17)(3) <= mcm_output(262); -- input 17,3 <= -3 * ref[20]

    -- Eq 18 Line 1
    input(1)(18)(0) <= mcm_output(235); -- input 18,0 <= -2 * ref[18]
    input(1)(18)(1) <= mcm_output(253); -- input 18,1 <= 18 * ref[19]
    input(1)(18)(2) <= mcm_output(271); -- input 18,2 <= 51 * ref[20]
    input(1)(18)(3) <= mcm_output(276); -- input 18,3 <= -3 * ref[21]

    -- Eq 19 Line 1
    input(1)(19)(0) <= mcm_output(249); -- input 19,0 <= -2 * ref[19]
    input(1)(19)(1) <= mcm_output(267); -- input 19,1 <= 18 * ref[20]
    input(1)(19)(2) <= mcm_output(285); -- input 19,2 <= 51 * ref[21]
    input(1)(19)(3) <= mcm_output(290); -- input 19,3 <= -3 * ref[22]

    -- Eq 20 Line 1
    input(1)(20)(0) <= mcm_output(263); -- input 20,0 <= -2 * ref[20]
    input(1)(20)(1) <= mcm_output(281); -- input 20,1 <= 18 * ref[21]
    input(1)(20)(2) <= mcm_output(299); -- input 20,2 <= 51 * ref[22]
    input(1)(20)(3) <= mcm_output(304); -- input 20,3 <= -3 * ref[23]

    -- Eq 21 Line 1
    input(1)(21)(0) <= mcm_output(277); -- input 21,0 <= -2 * ref[21]
    input(1)(21)(1) <= mcm_output(295); -- input 21,1 <= 18 * ref[22]
    input(1)(21)(2) <= mcm_output(313); -- input 21,2 <= 51 * ref[23]
    input(1)(21)(3) <= mcm_output(318); -- input 21,3 <= -3 * ref[24]

    -- Eq 22 Line 1
    input(1)(22)(0) <= mcm_output(291); -- input 22,0 <= -2 * ref[22]
    input(1)(22)(1) <= mcm_output(309); -- input 22,1 <= 18 * ref[23]
    input(1)(22)(2) <= mcm_output(327); -- input 22,2 <= 51 * ref[24]
    input(1)(22)(3) <= mcm_output(332); -- input 22,3 <= -3 * ref[25]

    -- Eq 23 Line 1
    input(1)(23)(0) <= mcm_output(305); -- input 23,0 <= -2 * ref[23]
    input(1)(23)(1) <= mcm_output(323); -- input 23,1 <= 18 * ref[24]
    input(1)(23)(2) <= mcm_output(341); -- input 23,2 <= 51 * ref[25]
    input(1)(23)(3) <= mcm_output(346); -- input 23,3 <= -3 * ref[26]

    -- Eq 24 Line 1
    input(1)(24)(0) <= mcm_output(319); -- input 24,0 <= -2 * ref[24]
    input(1)(24)(1) <= mcm_output(337); -- input 24,1 <= 18 * ref[25]
    input(1)(24)(2) <= mcm_output(355); -- input 24,2 <= 51 * ref[26]
    input(1)(24)(3) <= mcm_output(360); -- input 24,3 <= -3 * ref[27]

    -- Eq 25 Line 1
    input(1)(25)(0) <= mcm_output(333); -- input 25,0 <= -2 * ref[25]
    input(1)(25)(1) <= mcm_output(351); -- input 25,1 <= 18 * ref[26]
    input(1)(25)(2) <= mcm_output(369); -- input 25,2 <= 51 * ref[27]
    input(1)(25)(3) <= mcm_output(374); -- input 25,3 <= -3 * ref[28]

    -- Eq 26 Line 1
    input(1)(26)(0) <= mcm_output(347); -- input 26,0 <= -2 * ref[26]
    input(1)(26)(1) <= mcm_output(365); -- input 26,1 <= 18 * ref[27]
    input(1)(26)(2) <= mcm_output(383); -- input 26,2 <= 51 * ref[28]
    input(1)(26)(3) <= mcm_output(388); -- input 26,3 <= -3 * ref[29]

    -- Eq 27 Line 1
    input(1)(27)(0) <= mcm_output(361); -- input 27,0 <= -2 * ref[27]
    input(1)(27)(1) <= mcm_output(379); -- input 27,1 <= 18 * ref[28]
    input(1)(27)(2) <= mcm_output(397); -- input 27,2 <= 51 * ref[29]
    input(1)(27)(3) <= mcm_output(402); -- input 27,3 <= -3 * ref[30]

    -- Eq 28 Line 1
    input(1)(28)(0) <= mcm_output(375); -- input 28,0 <= -2 * ref[28]
    input(1)(28)(1) <= mcm_output(393); -- input 28,1 <= 18 * ref[29]
    input(1)(28)(2) <= mcm_output(411); -- input 28,2 <= 51 * ref[30]
    input(1)(28)(3) <= mcm_output(416); -- input 28,3 <= -3 * ref[31]

    -- Eq 29 Line 1
    input(1)(29)(0) <= mcm_output(389); -- input 29,0 <= -2 * ref[29]
    input(1)(29)(1) <= mcm_output(407); -- input 29,1 <= 18 * ref[30]
    input(1)(29)(2) <= mcm_output(425); -- input 29,2 <= 51 * ref[31]
    input(1)(29)(3) <= mcm_output(430); -- input 29,3 <= -3 * ref[32]

    -- Eq 30 Line 1
    input(1)(30)(0) <= mcm_output(403); -- input 30,0 <= -2 * ref[30]
    input(1)(30)(1) <= mcm_output(421); -- input 30,1 <= 18 * ref[31]
    input(1)(30)(2) <= mcm_output(439); -- input 30,2 <= 51 * ref[32]
    input(1)(30)(3) <= mcm_output(444); -- input 30,3 <= -3 * ref[33]

    -- Eq 31 Line 1
    input(1)(31)(0) <= mcm_output(417); -- input 31,0 <= -2 * ref[31]
    input(1)(31)(1) <= mcm_output(435); -- input 31,1 <= 18 * ref[32]
    input(1)(31)(2) <= mcm_output(453); -- input 31,2 <= 51 * ref[33]
    input(1)(31)(3) <= mcm_output(458); -- input 31,3 <= -3 * ref[34]

    -- Eq 32 Line 1
    input(1)(32)(0) <= mcm_output(431); -- input 32,0 <= -2 * ref[32]
    input(1)(32)(1) <= mcm_output(449); -- input 32,1 <= 18 * ref[33]
    input(1)(32)(2) <= mcm_output(467); -- input 32,2 <= 51 * ref[34]
    input(1)(32)(3) <= mcm_output(472); -- input 32,3 <= -3 * ref[35]

    -- Eq 33 Line 1
    input(1)(33)(0) <= mcm_output(445); -- input 33,0 <= -2 * ref[33]
    input(1)(33)(1) <= mcm_output(463); -- input 33,1 <= 18 * ref[34]
    input(1)(33)(2) <= mcm_output(481); -- input 33,2 <= 51 * ref[35]
    input(1)(33)(3) <= mcm_output(486); -- input 33,3 <= -3 * ref[36]

    -- Eq 34 Line 1
    input(1)(34)(0) <= mcm_output(459); -- input 34,0 <= -2 * ref[34]
    input(1)(34)(1) <= mcm_output(477); -- input 34,1 <= 18 * ref[35]
    input(1)(34)(2) <= mcm_output(495); -- input 34,2 <= 51 * ref[36]
    input(1)(34)(3) <= mcm_output(500); -- input 34,3 <= -3 * ref[37]

    -- Eq 35 Line 1
    input(1)(35)(0) <= mcm_output(473); -- input 35,0 <= -2 * ref[35]
    input(1)(35)(1) <= mcm_output(491); -- input 35,1 <= 18 * ref[36]
    input(1)(35)(2) <= mcm_output(509); -- input 35,2 <= 51 * ref[37]
    input(1)(35)(3) <= mcm_output(514); -- input 35,3 <= -3 * ref[38]

    -- Eq 36 Line 1
    input(1)(36)(0) <= mcm_output(487); -- input 36,0 <= -2 * ref[36]
    input(1)(36)(1) <= mcm_output(505); -- input 36,1 <= 18 * ref[37]
    input(1)(36)(2) <= mcm_output(523); -- input 36,2 <= 51 * ref[38]
    input(1)(36)(3) <= mcm_output(528); -- input 36,3 <= -3 * ref[39]

    -- Eq 37 Line 1
    input(1)(37)(0) <= mcm_output(501); -- input 37,0 <= -2 * ref[37]
    input(1)(37)(1) <= mcm_output(519); -- input 37,1 <= 18 * ref[38]
    input(1)(37)(2) <= mcm_output(537); -- input 37,2 <= 51 * ref[39]
    input(1)(37)(3) <= mcm_output(542); -- input 37,3 <= -3 * ref[40]

    -- Eq 38 Line 1
    input(1)(38)(0) <= mcm_output(515); -- input 38,0 <= -2 * ref[38]
    input(1)(38)(1) <= mcm_output(533); -- input 38,1 <= 18 * ref[39]
    input(1)(38)(2) <= mcm_output(551); -- input 38,2 <= 51 * ref[40]
    input(1)(38)(3) <= mcm_output(556); -- input 38,3 <= -3 * ref[41]

    -- Eq 39 Line 1
    input(1)(39)(0) <= mcm_output(529); -- input 39,0 <= -2 * ref[39]
    input(1)(39)(1) <= mcm_output(547); -- input 39,1 <= 18 * ref[40]
    input(1)(39)(2) <= mcm_output(565); -- input 39,2 <= 51 * ref[41]
    input(1)(39)(3) <= mcm_output(570); -- input 39,3 <= -3 * ref[42]

    -- Eq 40 Line 1
    input(1)(40)(0) <= mcm_output(543); -- input 40,0 <= -2 * ref[40]
    input(1)(40)(1) <= mcm_output(561); -- input 40,1 <= 18 * ref[41]
    input(1)(40)(2) <= mcm_output(579); -- input 40,2 <= 51 * ref[42]
    input(1)(40)(3) <= mcm_output(584); -- input 40,3 <= -3 * ref[43]

    -- Eq 41 Line 1
    input(1)(41)(0) <= mcm_output(557); -- input 41,0 <= -2 * ref[41]
    input(1)(41)(1) <= mcm_output(575); -- input 41,1 <= 18 * ref[42]
    input(1)(41)(2) <= mcm_output(593); -- input 41,2 <= 51 * ref[43]
    input(1)(41)(3) <= mcm_output(598); -- input 41,3 <= -3 * ref[44]

    -- Eq 42 Line 1
    input(1)(42)(0) <= mcm_output(571); -- input 42,0 <= -2 * ref[42]
    input(1)(42)(1) <= mcm_output(589); -- input 42,1 <= 18 * ref[43]
    input(1)(42)(2) <= mcm_output(607); -- input 42,2 <= 51 * ref[44]
    input(1)(42)(3) <= mcm_output(612); -- input 42,3 <= -3 * ref[45]

    -- Eq 43 Line 1
    input(1)(43)(0) <= mcm_output(585); -- input 43,0 <= -2 * ref[43]
    input(1)(43)(1) <= mcm_output(603); -- input 43,1 <= 18 * ref[44]
    input(1)(43)(2) <= mcm_output(621); -- input 43,2 <= 51 * ref[45]
    input(1)(43)(3) <= mcm_output(626); -- input 43,3 <= -3 * ref[46]

    -- Eq 44 Line 1
    input(1)(44)(0) <= mcm_output(599); -- input 44,0 <= -2 * ref[44]
    input(1)(44)(1) <= mcm_output(617); -- input 44,1 <= 18 * ref[45]
    input(1)(44)(2) <= mcm_output(635); -- input 44,2 <= 51 * ref[46]
    input(1)(44)(3) <= mcm_output(640); -- input 44,3 <= -3 * ref[47]

    -- Eq 45 Line 1
    input(1)(45)(0) <= mcm_output(613); -- input 45,0 <= -2 * ref[45]
    input(1)(45)(1) <= mcm_output(631); -- input 45,1 <= 18 * ref[46]
    input(1)(45)(2) <= mcm_output(649); -- input 45,2 <= 51 * ref[47]
    input(1)(45)(3) <= mcm_output(654); -- input 45,3 <= -3 * ref[48]

    -- Eq 46 Line 1
    input(1)(46)(0) <= mcm_output(627); -- input 46,0 <= -2 * ref[46]
    input(1)(46)(1) <= mcm_output(645); -- input 46,1 <= 18 * ref[47]
    input(1)(46)(2) <= mcm_output(663); -- input 46,2 <= 51 * ref[48]
    input(1)(46)(3) <= mcm_output(668); -- input 46,3 <= -3 * ref[49]

    -- Eq 47 Line 1
    input(1)(47)(0) <= mcm_output(641); -- input 47,0 <= -2 * ref[47]
    input(1)(47)(1) <= mcm_output(659); -- input 47,1 <= 18 * ref[48]
    input(1)(47)(2) <= mcm_output(677); -- input 47,2 <= 51 * ref[49]
    input(1)(47)(3) <= mcm_output(682); -- input 47,3 <= -3 * ref[50]

    -- Eq 48 Line 1
    input(1)(48)(0) <= mcm_output(655); -- input 48,0 <= -2 * ref[48]
    input(1)(48)(1) <= mcm_output(673); -- input 48,1 <= 18 * ref[49]
    input(1)(48)(2) <= mcm_output(691); -- input 48,2 <= 51 * ref[50]
    input(1)(48)(3) <= mcm_output(696); -- input 48,3 <= -3 * ref[51]

    -- Eq 49 Line 1
    input(1)(49)(0) <= mcm_output(669); -- input 49,0 <= -2 * ref[49]
    input(1)(49)(1) <= mcm_output(687); -- input 49,1 <= 18 * ref[50]
    input(1)(49)(2) <= mcm_output(705); -- input 49,2 <= 51 * ref[51]
    input(1)(49)(3) <= mcm_output(710); -- input 49,3 <= -3 * ref[52]

    -- Eq 50 Line 1
    input(1)(50)(0) <= mcm_output(683); -- input 50,0 <= -2 * ref[50]
    input(1)(50)(1) <= mcm_output(701); -- input 50,1 <= 18 * ref[51]
    input(1)(50)(2) <= mcm_output(719); -- input 50,2 <= 51 * ref[52]
    input(1)(50)(3) <= mcm_output(724); -- input 50,3 <= -3 * ref[53]

    -- Eq 51 Line 1
    input(1)(51)(0) <= mcm_output(697); -- input 51,0 <= -2 * ref[51]
    input(1)(51)(1) <= mcm_output(715); -- input 51,1 <= 18 * ref[52]
    input(1)(51)(2) <= mcm_output(733); -- input 51,2 <= 51 * ref[53]
    input(1)(51)(3) <= mcm_output(738); -- input 51,3 <= -3 * ref[54]

    -- Eq 52 Line 1
    input(1)(52)(0) <= mcm_output(711); -- input 52,0 <= -2 * ref[52]
    input(1)(52)(1) <= mcm_output(729); -- input 52,1 <= 18 * ref[53]
    input(1)(52)(2) <= mcm_output(747); -- input 52,2 <= 51 * ref[54]
    input(1)(52)(3) <= mcm_output(752); -- input 52,3 <= -3 * ref[55]

    -- Eq 53 Line 1
    input(1)(53)(0) <= mcm_output(725); -- input 53,0 <= -2 * ref[53]
    input(1)(53)(1) <= mcm_output(743); -- input 53,1 <= 18 * ref[54]
    input(1)(53)(2) <= mcm_output(761); -- input 53,2 <= 51 * ref[55]
    input(1)(53)(3) <= mcm_output(766); -- input 53,3 <= -3 * ref[56]

    -- Eq 54 Line 1
    input(1)(54)(0) <= mcm_output(739); -- input 54,0 <= -2 * ref[54]
    input(1)(54)(1) <= mcm_output(757); -- input 54,1 <= 18 * ref[55]
    input(1)(54)(2) <= mcm_output(775); -- input 54,2 <= 51 * ref[56]
    input(1)(54)(3) <= mcm_output(780); -- input 54,3 <= -3 * ref[57]

    -- Eq 55 Line 1
    input(1)(55)(0) <= mcm_output(753); -- input 55,0 <= -2 * ref[55]
    input(1)(55)(1) <= mcm_output(771); -- input 55,1 <= 18 * ref[56]
    input(1)(55)(2) <= mcm_output(789); -- input 55,2 <= 51 * ref[57]
    input(1)(55)(3) <= mcm_output(794); -- input 55,3 <= -3 * ref[58]

    -- Eq 56 Line 1
    input(1)(56)(0) <= mcm_output(767); -- input 56,0 <= -2 * ref[56]
    input(1)(56)(1) <= mcm_output(785); -- input 56,1 <= 18 * ref[57]
    input(1)(56)(2) <= mcm_output(803); -- input 56,2 <= 51 * ref[58]
    input(1)(56)(3) <= mcm_output(808); -- input 56,3 <= -3 * ref[59]

    -- Eq 57 Line 1
    input(1)(57)(0) <= mcm_output(781); -- input 57,0 <= -2 * ref[57]
    input(1)(57)(1) <= mcm_output(799); -- input 57,1 <= 18 * ref[58]
    input(1)(57)(2) <= mcm_output(817); -- input 57,2 <= 51 * ref[59]
    input(1)(57)(3) <= mcm_output(822); -- input 57,3 <= -3 * ref[60]

    -- Eq 58 Line 1
    input(1)(58)(0) <= mcm_output(795); -- input 58,0 <= -2 * ref[58]
    input(1)(58)(1) <= mcm_output(813); -- input 58,1 <= 18 * ref[59]
    input(1)(58)(2) <= mcm_output(831); -- input 58,2 <= 51 * ref[60]
    input(1)(58)(3) <= mcm_output(836); -- input 58,3 <= -3 * ref[61]

    -- Eq 59 Line 1
    input(1)(59)(0) <= mcm_output(809); -- input 59,0 <= -2 * ref[59]
    input(1)(59)(1) <= mcm_output(827); -- input 59,1 <= 18 * ref[60]
    input(1)(59)(2) <= mcm_output(845); -- input 59,2 <= 51 * ref[61]
    input(1)(59)(3) <= mcm_output(850); -- input 59,3 <= -3 * ref[62]

    -- Eq 60 Line 1
    input(1)(60)(0) <= mcm_output(823); -- input 60,0 <= -2 * ref[60]
    input(1)(60)(1) <= mcm_output(841); -- input 60,1 <= 18 * ref[61]
    input(1)(60)(2) <= mcm_output(859); -- input 60,2 <= 51 * ref[62]
    input(1)(60)(3) <= mcm_output(864); -- input 60,3 <= -3 * ref[63]

    -- Eq 61 Line 1
    input(1)(61)(0) <= mcm_output(837); -- input 61,0 <= -2 * ref[61]
    input(1)(61)(1) <= mcm_output(855); -- input 61,1 <= 18 * ref[62]
    input(1)(61)(2) <= mcm_output(873); -- input 61,2 <= 51 * ref[63]
    input(1)(61)(3) <= mcm_output(887); -- input 61,3 <= -3 * ref[64]

    -- Eq 62 Line 1
    input(1)(62)(0) <= mcm_output(851); -- input 62,0 <= -2 * ref[62]
    input(1)(62)(1) <= mcm_output(869); -- input 62,1 <= 18 * ref[63]
    input(1)(62)(2) <= mcm_output(883); -- input 62,2 <= 51 * ref[64]
    input(1)(62)(3) <= mcm_output(895); -- input 62,3 <= -3 * ref[65]

    -- Eq 63 Line 1
    input(1)(63)(0) <= mcm_output(865); -- input 63,0 <= -2 * ref[63]
    input(1)(63)(1) <= mcm_output(879); -- input 63,1 <= 18 * ref[64]
    input(1)(63)(2) <= mcm_output(891); -- input 63,2 <= 51 * ref[65]
    input(1)(63)(3) <= mcm_output(899); -- input 63,3 <= -3 * ref[66]

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
    input(2)(13)(3) <= mcm_output(218); -- input 13,3 <= 3 * ref[16]

    -- Eq 14 Line 2
    input(2)(14)(0) <= mcm_output(180); -- input 14,0 <= 12 * ref[14]
    input(2)(14)(1) <= mcm_output(198); -- input 14,1 <= 28 * ref[15]
    input(2)(14)(2) <= mcm_output(216); -- input 14,2 <= 19 * ref[16]
    input(2)(14)(3) <= mcm_output(232); -- input 14,3 <= 3 * ref[17]

    -- Eq 15 Line 2
    input(2)(15)(0) <= mcm_output(194); -- input 15,0 <= 12 * ref[15]
    input(2)(15)(1) <= mcm_output(212); -- input 15,1 <= 28 * ref[16]
    input(2)(15)(2) <= mcm_output(230); -- input 15,2 <= 19 * ref[17]
    input(2)(15)(3) <= mcm_output(246); -- input 15,3 <= 3 * ref[18]

    -- Eq 16 Line 2
    input(2)(16)(0) <= mcm_output(208); -- input 16,0 <= 12 * ref[16]
    input(2)(16)(1) <= mcm_output(226); -- input 16,1 <= 28 * ref[17]
    input(2)(16)(2) <= mcm_output(244); -- input 16,2 <= 19 * ref[18]
    input(2)(16)(3) <= mcm_output(260); -- input 16,3 <= 3 * ref[19]

    -- Eq 17 Line 2
    input(2)(17)(0) <= mcm_output(222); -- input 17,0 <= 12 * ref[17]
    input(2)(17)(1) <= mcm_output(240); -- input 17,1 <= 28 * ref[18]
    input(2)(17)(2) <= mcm_output(258); -- input 17,2 <= 19 * ref[19]
    input(2)(17)(3) <= mcm_output(274); -- input 17,3 <= 3 * ref[20]

    -- Eq 18 Line 2
    input(2)(18)(0) <= mcm_output(236); -- input 18,0 <= 12 * ref[18]
    input(2)(18)(1) <= mcm_output(254); -- input 18,1 <= 28 * ref[19]
    input(2)(18)(2) <= mcm_output(272); -- input 18,2 <= 19 * ref[20]
    input(2)(18)(3) <= mcm_output(288); -- input 18,3 <= 3 * ref[21]

    -- Eq 19 Line 2
    input(2)(19)(0) <= mcm_output(250); -- input 19,0 <= 12 * ref[19]
    input(2)(19)(1) <= mcm_output(268); -- input 19,1 <= 28 * ref[20]
    input(2)(19)(2) <= mcm_output(286); -- input 19,2 <= 19 * ref[21]
    input(2)(19)(3) <= mcm_output(302); -- input 19,3 <= 3 * ref[22]

    -- Eq 20 Line 2
    input(2)(20)(0) <= mcm_output(264); -- input 20,0 <= 12 * ref[20]
    input(2)(20)(1) <= mcm_output(282); -- input 20,1 <= 28 * ref[21]
    input(2)(20)(2) <= mcm_output(300); -- input 20,2 <= 19 * ref[22]
    input(2)(20)(3) <= mcm_output(316); -- input 20,3 <= 3 * ref[23]

    -- Eq 21 Line 2
    input(2)(21)(0) <= mcm_output(278); -- input 21,0 <= 12 * ref[21]
    input(2)(21)(1) <= mcm_output(296); -- input 21,1 <= 28 * ref[22]
    input(2)(21)(2) <= mcm_output(314); -- input 21,2 <= 19 * ref[23]
    input(2)(21)(3) <= mcm_output(330); -- input 21,3 <= 3 * ref[24]

    -- Eq 22 Line 2
    input(2)(22)(0) <= mcm_output(292); -- input 22,0 <= 12 * ref[22]
    input(2)(22)(1) <= mcm_output(310); -- input 22,1 <= 28 * ref[23]
    input(2)(22)(2) <= mcm_output(328); -- input 22,2 <= 19 * ref[24]
    input(2)(22)(3) <= mcm_output(344); -- input 22,3 <= 3 * ref[25]

    -- Eq 23 Line 2
    input(2)(23)(0) <= mcm_output(306); -- input 23,0 <= 12 * ref[23]
    input(2)(23)(1) <= mcm_output(324); -- input 23,1 <= 28 * ref[24]
    input(2)(23)(2) <= mcm_output(342); -- input 23,2 <= 19 * ref[25]
    input(2)(23)(3) <= mcm_output(358); -- input 23,3 <= 3 * ref[26]

    -- Eq 24 Line 2
    input(2)(24)(0) <= mcm_output(320); -- input 24,0 <= 12 * ref[24]
    input(2)(24)(1) <= mcm_output(338); -- input 24,1 <= 28 * ref[25]
    input(2)(24)(2) <= mcm_output(356); -- input 24,2 <= 19 * ref[26]
    input(2)(24)(3) <= mcm_output(372); -- input 24,3 <= 3 * ref[27]

    -- Eq 25 Line 2
    input(2)(25)(0) <= mcm_output(334); -- input 25,0 <= 12 * ref[25]
    input(2)(25)(1) <= mcm_output(352); -- input 25,1 <= 28 * ref[26]
    input(2)(25)(2) <= mcm_output(370); -- input 25,2 <= 19 * ref[27]
    input(2)(25)(3) <= mcm_output(386); -- input 25,3 <= 3 * ref[28]

    -- Eq 26 Line 2
    input(2)(26)(0) <= mcm_output(348); -- input 26,0 <= 12 * ref[26]
    input(2)(26)(1) <= mcm_output(366); -- input 26,1 <= 28 * ref[27]
    input(2)(26)(2) <= mcm_output(384); -- input 26,2 <= 19 * ref[28]
    input(2)(26)(3) <= mcm_output(400); -- input 26,3 <= 3 * ref[29]

    -- Eq 27 Line 2
    input(2)(27)(0) <= mcm_output(362); -- input 27,0 <= 12 * ref[27]
    input(2)(27)(1) <= mcm_output(380); -- input 27,1 <= 28 * ref[28]
    input(2)(27)(2) <= mcm_output(398); -- input 27,2 <= 19 * ref[29]
    input(2)(27)(3) <= mcm_output(414); -- input 27,3 <= 3 * ref[30]

    -- Eq 28 Line 2
    input(2)(28)(0) <= mcm_output(376); -- input 28,0 <= 12 * ref[28]
    input(2)(28)(1) <= mcm_output(394); -- input 28,1 <= 28 * ref[29]
    input(2)(28)(2) <= mcm_output(412); -- input 28,2 <= 19 * ref[30]
    input(2)(28)(3) <= mcm_output(428); -- input 28,3 <= 3 * ref[31]

    -- Eq 29 Line 2
    input(2)(29)(0) <= mcm_output(390); -- input 29,0 <= 12 * ref[29]
    input(2)(29)(1) <= mcm_output(408); -- input 29,1 <= 28 * ref[30]
    input(2)(29)(2) <= mcm_output(426); -- input 29,2 <= 19 * ref[31]
    input(2)(29)(3) <= mcm_output(442); -- input 29,3 <= 3 * ref[32]

    -- Eq 30 Line 2
    input(2)(30)(0) <= mcm_output(404); -- input 30,0 <= 12 * ref[30]
    input(2)(30)(1) <= mcm_output(422); -- input 30,1 <= 28 * ref[31]
    input(2)(30)(2) <= mcm_output(440); -- input 30,2 <= 19 * ref[32]
    input(2)(30)(3) <= mcm_output(456); -- input 30,3 <= 3 * ref[33]

    -- Eq 31 Line 2
    input(2)(31)(0) <= mcm_output(418); -- input 31,0 <= 12 * ref[31]
    input(2)(31)(1) <= mcm_output(436); -- input 31,1 <= 28 * ref[32]
    input(2)(31)(2) <= mcm_output(454); -- input 31,2 <= 19 * ref[33]
    input(2)(31)(3) <= mcm_output(470); -- input 31,3 <= 3 * ref[34]

    -- Eq 32 Line 2
    input(2)(32)(0) <= mcm_output(432); -- input 32,0 <= 12 * ref[32]
    input(2)(32)(1) <= mcm_output(450); -- input 32,1 <= 28 * ref[33]
    input(2)(32)(2) <= mcm_output(468); -- input 32,2 <= 19 * ref[34]
    input(2)(32)(3) <= mcm_output(484); -- input 32,3 <= 3 * ref[35]

    -- Eq 33 Line 2
    input(2)(33)(0) <= mcm_output(446); -- input 33,0 <= 12 * ref[33]
    input(2)(33)(1) <= mcm_output(464); -- input 33,1 <= 28 * ref[34]
    input(2)(33)(2) <= mcm_output(482); -- input 33,2 <= 19 * ref[35]
    input(2)(33)(3) <= mcm_output(498); -- input 33,3 <= 3 * ref[36]

    -- Eq 34 Line 2
    input(2)(34)(0) <= mcm_output(460); -- input 34,0 <= 12 * ref[34]
    input(2)(34)(1) <= mcm_output(478); -- input 34,1 <= 28 * ref[35]
    input(2)(34)(2) <= mcm_output(496); -- input 34,2 <= 19 * ref[36]
    input(2)(34)(3) <= mcm_output(512); -- input 34,3 <= 3 * ref[37]

    -- Eq 35 Line 2
    input(2)(35)(0) <= mcm_output(474); -- input 35,0 <= 12 * ref[35]
    input(2)(35)(1) <= mcm_output(492); -- input 35,1 <= 28 * ref[36]
    input(2)(35)(2) <= mcm_output(510); -- input 35,2 <= 19 * ref[37]
    input(2)(35)(3) <= mcm_output(526); -- input 35,3 <= 3 * ref[38]

    -- Eq 36 Line 2
    input(2)(36)(0) <= mcm_output(488); -- input 36,0 <= 12 * ref[36]
    input(2)(36)(1) <= mcm_output(506); -- input 36,1 <= 28 * ref[37]
    input(2)(36)(2) <= mcm_output(524); -- input 36,2 <= 19 * ref[38]
    input(2)(36)(3) <= mcm_output(540); -- input 36,3 <= 3 * ref[39]

    -- Eq 37 Line 2
    input(2)(37)(0) <= mcm_output(502); -- input 37,0 <= 12 * ref[37]
    input(2)(37)(1) <= mcm_output(520); -- input 37,1 <= 28 * ref[38]
    input(2)(37)(2) <= mcm_output(538); -- input 37,2 <= 19 * ref[39]
    input(2)(37)(3) <= mcm_output(554); -- input 37,3 <= 3 * ref[40]

    -- Eq 38 Line 2
    input(2)(38)(0) <= mcm_output(516); -- input 38,0 <= 12 * ref[38]
    input(2)(38)(1) <= mcm_output(534); -- input 38,1 <= 28 * ref[39]
    input(2)(38)(2) <= mcm_output(552); -- input 38,2 <= 19 * ref[40]
    input(2)(38)(3) <= mcm_output(568); -- input 38,3 <= 3 * ref[41]

    -- Eq 39 Line 2
    input(2)(39)(0) <= mcm_output(530); -- input 39,0 <= 12 * ref[39]
    input(2)(39)(1) <= mcm_output(548); -- input 39,1 <= 28 * ref[40]
    input(2)(39)(2) <= mcm_output(566); -- input 39,2 <= 19 * ref[41]
    input(2)(39)(3) <= mcm_output(582); -- input 39,3 <= 3 * ref[42]

    -- Eq 40 Line 2
    input(2)(40)(0) <= mcm_output(544); -- input 40,0 <= 12 * ref[40]
    input(2)(40)(1) <= mcm_output(562); -- input 40,1 <= 28 * ref[41]
    input(2)(40)(2) <= mcm_output(580); -- input 40,2 <= 19 * ref[42]
    input(2)(40)(3) <= mcm_output(596); -- input 40,3 <= 3 * ref[43]

    -- Eq 41 Line 2
    input(2)(41)(0) <= mcm_output(558); -- input 41,0 <= 12 * ref[41]
    input(2)(41)(1) <= mcm_output(576); -- input 41,1 <= 28 * ref[42]
    input(2)(41)(2) <= mcm_output(594); -- input 41,2 <= 19 * ref[43]
    input(2)(41)(3) <= mcm_output(610); -- input 41,3 <= 3 * ref[44]

    -- Eq 42 Line 2
    input(2)(42)(0) <= mcm_output(572); -- input 42,0 <= 12 * ref[42]
    input(2)(42)(1) <= mcm_output(590); -- input 42,1 <= 28 * ref[43]
    input(2)(42)(2) <= mcm_output(608); -- input 42,2 <= 19 * ref[44]
    input(2)(42)(3) <= mcm_output(624); -- input 42,3 <= 3 * ref[45]

    -- Eq 43 Line 2
    input(2)(43)(0) <= mcm_output(586); -- input 43,0 <= 12 * ref[43]
    input(2)(43)(1) <= mcm_output(604); -- input 43,1 <= 28 * ref[44]
    input(2)(43)(2) <= mcm_output(622); -- input 43,2 <= 19 * ref[45]
    input(2)(43)(3) <= mcm_output(638); -- input 43,3 <= 3 * ref[46]

    -- Eq 44 Line 2
    input(2)(44)(0) <= mcm_output(600); -- input 44,0 <= 12 * ref[44]
    input(2)(44)(1) <= mcm_output(618); -- input 44,1 <= 28 * ref[45]
    input(2)(44)(2) <= mcm_output(636); -- input 44,2 <= 19 * ref[46]
    input(2)(44)(3) <= mcm_output(652); -- input 44,3 <= 3 * ref[47]

    -- Eq 45 Line 2
    input(2)(45)(0) <= mcm_output(614); -- input 45,0 <= 12 * ref[45]
    input(2)(45)(1) <= mcm_output(632); -- input 45,1 <= 28 * ref[46]
    input(2)(45)(2) <= mcm_output(650); -- input 45,2 <= 19 * ref[47]
    input(2)(45)(3) <= mcm_output(666); -- input 45,3 <= 3 * ref[48]

    -- Eq 46 Line 2
    input(2)(46)(0) <= mcm_output(628); -- input 46,0 <= 12 * ref[46]
    input(2)(46)(1) <= mcm_output(646); -- input 46,1 <= 28 * ref[47]
    input(2)(46)(2) <= mcm_output(664); -- input 46,2 <= 19 * ref[48]
    input(2)(46)(3) <= mcm_output(680); -- input 46,3 <= 3 * ref[49]

    -- Eq 47 Line 2
    input(2)(47)(0) <= mcm_output(642); -- input 47,0 <= 12 * ref[47]
    input(2)(47)(1) <= mcm_output(660); -- input 47,1 <= 28 * ref[48]
    input(2)(47)(2) <= mcm_output(678); -- input 47,2 <= 19 * ref[49]
    input(2)(47)(3) <= mcm_output(694); -- input 47,3 <= 3 * ref[50]

    -- Eq 48 Line 2
    input(2)(48)(0) <= mcm_output(656); -- input 48,0 <= 12 * ref[48]
    input(2)(48)(1) <= mcm_output(674); -- input 48,1 <= 28 * ref[49]
    input(2)(48)(2) <= mcm_output(692); -- input 48,2 <= 19 * ref[50]
    input(2)(48)(3) <= mcm_output(708); -- input 48,3 <= 3 * ref[51]

    -- Eq 49 Line 2
    input(2)(49)(0) <= mcm_output(670); -- input 49,0 <= 12 * ref[49]
    input(2)(49)(1) <= mcm_output(688); -- input 49,1 <= 28 * ref[50]
    input(2)(49)(2) <= mcm_output(706); -- input 49,2 <= 19 * ref[51]
    input(2)(49)(3) <= mcm_output(722); -- input 49,3 <= 3 * ref[52]

    -- Eq 50 Line 2
    input(2)(50)(0) <= mcm_output(684); -- input 50,0 <= 12 * ref[50]
    input(2)(50)(1) <= mcm_output(702); -- input 50,1 <= 28 * ref[51]
    input(2)(50)(2) <= mcm_output(720); -- input 50,2 <= 19 * ref[52]
    input(2)(50)(3) <= mcm_output(736); -- input 50,3 <= 3 * ref[53]

    -- Eq 51 Line 2
    input(2)(51)(0) <= mcm_output(698); -- input 51,0 <= 12 * ref[51]
    input(2)(51)(1) <= mcm_output(716); -- input 51,1 <= 28 * ref[52]
    input(2)(51)(2) <= mcm_output(734); -- input 51,2 <= 19 * ref[53]
    input(2)(51)(3) <= mcm_output(750); -- input 51,3 <= 3 * ref[54]

    -- Eq 52 Line 2
    input(2)(52)(0) <= mcm_output(712); -- input 52,0 <= 12 * ref[52]
    input(2)(52)(1) <= mcm_output(730); -- input 52,1 <= 28 * ref[53]
    input(2)(52)(2) <= mcm_output(748); -- input 52,2 <= 19 * ref[54]
    input(2)(52)(3) <= mcm_output(764); -- input 52,3 <= 3 * ref[55]

    -- Eq 53 Line 2
    input(2)(53)(0) <= mcm_output(726); -- input 53,0 <= 12 * ref[53]
    input(2)(53)(1) <= mcm_output(744); -- input 53,1 <= 28 * ref[54]
    input(2)(53)(2) <= mcm_output(762); -- input 53,2 <= 19 * ref[55]
    input(2)(53)(3) <= mcm_output(778); -- input 53,3 <= 3 * ref[56]

    -- Eq 54 Line 2
    input(2)(54)(0) <= mcm_output(740); -- input 54,0 <= 12 * ref[54]
    input(2)(54)(1) <= mcm_output(758); -- input 54,1 <= 28 * ref[55]
    input(2)(54)(2) <= mcm_output(776); -- input 54,2 <= 19 * ref[56]
    input(2)(54)(3) <= mcm_output(792); -- input 54,3 <= 3 * ref[57]

    -- Eq 55 Line 2
    input(2)(55)(0) <= mcm_output(754); -- input 55,0 <= 12 * ref[55]
    input(2)(55)(1) <= mcm_output(772); -- input 55,1 <= 28 * ref[56]
    input(2)(55)(2) <= mcm_output(790); -- input 55,2 <= 19 * ref[57]
    input(2)(55)(3) <= mcm_output(806); -- input 55,3 <= 3 * ref[58]

    -- Eq 56 Line 2
    input(2)(56)(0) <= mcm_output(768); -- input 56,0 <= 12 * ref[56]
    input(2)(56)(1) <= mcm_output(786); -- input 56,1 <= 28 * ref[57]
    input(2)(56)(2) <= mcm_output(804); -- input 56,2 <= 19 * ref[58]
    input(2)(56)(3) <= mcm_output(820); -- input 56,3 <= 3 * ref[59]

    -- Eq 57 Line 2
    input(2)(57)(0) <= mcm_output(782); -- input 57,0 <= 12 * ref[57]
    input(2)(57)(1) <= mcm_output(800); -- input 57,1 <= 28 * ref[58]
    input(2)(57)(2) <= mcm_output(818); -- input 57,2 <= 19 * ref[59]
    input(2)(57)(3) <= mcm_output(834); -- input 57,3 <= 3 * ref[60]

    -- Eq 58 Line 2
    input(2)(58)(0) <= mcm_output(796); -- input 58,0 <= 12 * ref[58]
    input(2)(58)(1) <= mcm_output(814); -- input 58,1 <= 28 * ref[59]
    input(2)(58)(2) <= mcm_output(832); -- input 58,2 <= 19 * ref[60]
    input(2)(58)(3) <= mcm_output(848); -- input 58,3 <= 3 * ref[61]

    -- Eq 59 Line 2
    input(2)(59)(0) <= mcm_output(810); -- input 59,0 <= 12 * ref[59]
    input(2)(59)(1) <= mcm_output(828); -- input 59,1 <= 28 * ref[60]
    input(2)(59)(2) <= mcm_output(846); -- input 59,2 <= 19 * ref[61]
    input(2)(59)(3) <= mcm_output(862); -- input 59,3 <= 3 * ref[62]

    -- Eq 60 Line 2
    input(2)(60)(0) <= mcm_output(824); -- input 60,0 <= 12 * ref[60]
    input(2)(60)(1) <= mcm_output(842); -- input 60,1 <= 28 * ref[61]
    input(2)(60)(2) <= mcm_output(860); -- input 60,2 <= 19 * ref[62]
    input(2)(60)(3) <= mcm_output(876); -- input 60,3 <= 3 * ref[63]

    -- Eq 61 Line 2
    input(2)(61)(0) <= mcm_output(838); -- input 61,0 <= 12 * ref[61]
    input(2)(61)(1) <= mcm_output(856); -- input 61,1 <= 28 * ref[62]
    input(2)(61)(2) <= mcm_output(874); -- input 61,2 <= 19 * ref[63]
    input(2)(61)(3) <= mcm_output(888); -- input 61,3 <= 3 * ref[64]

    -- Eq 62 Line 2
    input(2)(62)(0) <= mcm_output(852); -- input 62,0 <= 12 * ref[62]
    input(2)(62)(1) <= mcm_output(870); -- input 62,1 <= 28 * ref[63]
    input(2)(62)(2) <= mcm_output(884); -- input 62,2 <= 19 * ref[64]
    input(2)(62)(3) <= mcm_output(896); -- input 62,3 <= 3 * ref[65]

    -- Eq 63 Line 2
    input(2)(63)(0) <= mcm_output(866); -- input 63,0 <= 12 * ref[63]
    input(2)(63)(1) <= mcm_output(880); -- input 63,1 <= 28 * ref[64]
    input(2)(63)(2) <= mcm_output(892); -- input 63,2 <= 19 * ref[65]
    input(2)(63)(3) <= mcm_output(900); -- input 63,3 <= 3 * ref[66]

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
    input(3)(13)(3) <= mcm_output(219); -- input 13,3 <= 11 * ref[16]

    -- Eq 14 Line 3
    input(3)(14)(0) <= mcm_output(181); -- input 14,0 <= 4 * ref[14]
    input(3)(14)(1) <= mcm_output(199); -- input 14,1 <= 20 * ref[15]
    input(3)(14)(2) <= mcm_output(217); -- input 14,2 <= 27 * ref[16]
    input(3)(14)(3) <= mcm_output(233); -- input 14,3 <= 11 * ref[17]

    -- Eq 15 Line 3
    input(3)(15)(0) <= mcm_output(195); -- input 15,0 <= 4 * ref[15]
    input(3)(15)(1) <= mcm_output(213); -- input 15,1 <= 20 * ref[16]
    input(3)(15)(2) <= mcm_output(231); -- input 15,2 <= 27 * ref[17]
    input(3)(15)(3) <= mcm_output(247); -- input 15,3 <= 11 * ref[18]

    -- Eq 16 Line 3
    input(3)(16)(0) <= mcm_output(209); -- input 16,0 <= 4 * ref[16]
    input(3)(16)(1) <= mcm_output(227); -- input 16,1 <= 20 * ref[17]
    input(3)(16)(2) <= mcm_output(245); -- input 16,2 <= 27 * ref[18]
    input(3)(16)(3) <= mcm_output(261); -- input 16,3 <= 11 * ref[19]

    -- Eq 17 Line 3
    input(3)(17)(0) <= mcm_output(223); -- input 17,0 <= 4 * ref[17]
    input(3)(17)(1) <= mcm_output(241); -- input 17,1 <= 20 * ref[18]
    input(3)(17)(2) <= mcm_output(259); -- input 17,2 <= 27 * ref[19]
    input(3)(17)(3) <= mcm_output(275); -- input 17,3 <= 11 * ref[20]

    -- Eq 18 Line 3
    input(3)(18)(0) <= mcm_output(237); -- input 18,0 <= 4 * ref[18]
    input(3)(18)(1) <= mcm_output(255); -- input 18,1 <= 20 * ref[19]
    input(3)(18)(2) <= mcm_output(273); -- input 18,2 <= 27 * ref[20]
    input(3)(18)(3) <= mcm_output(289); -- input 18,3 <= 11 * ref[21]

    -- Eq 19 Line 3
    input(3)(19)(0) <= mcm_output(251); -- input 19,0 <= 4 * ref[19]
    input(3)(19)(1) <= mcm_output(269); -- input 19,1 <= 20 * ref[20]
    input(3)(19)(2) <= mcm_output(287); -- input 19,2 <= 27 * ref[21]
    input(3)(19)(3) <= mcm_output(303); -- input 19,3 <= 11 * ref[22]

    -- Eq 20 Line 3
    input(3)(20)(0) <= mcm_output(265); -- input 20,0 <= 4 * ref[20]
    input(3)(20)(1) <= mcm_output(283); -- input 20,1 <= 20 * ref[21]
    input(3)(20)(2) <= mcm_output(301); -- input 20,2 <= 27 * ref[22]
    input(3)(20)(3) <= mcm_output(317); -- input 20,3 <= 11 * ref[23]

    -- Eq 21 Line 3
    input(3)(21)(0) <= mcm_output(279); -- input 21,0 <= 4 * ref[21]
    input(3)(21)(1) <= mcm_output(297); -- input 21,1 <= 20 * ref[22]
    input(3)(21)(2) <= mcm_output(315); -- input 21,2 <= 27 * ref[23]
    input(3)(21)(3) <= mcm_output(331); -- input 21,3 <= 11 * ref[24]

    -- Eq 22 Line 3
    input(3)(22)(0) <= mcm_output(293); -- input 22,0 <= 4 * ref[22]
    input(3)(22)(1) <= mcm_output(311); -- input 22,1 <= 20 * ref[23]
    input(3)(22)(2) <= mcm_output(329); -- input 22,2 <= 27 * ref[24]
    input(3)(22)(3) <= mcm_output(345); -- input 22,3 <= 11 * ref[25]

    -- Eq 23 Line 3
    input(3)(23)(0) <= mcm_output(307); -- input 23,0 <= 4 * ref[23]
    input(3)(23)(1) <= mcm_output(325); -- input 23,1 <= 20 * ref[24]
    input(3)(23)(2) <= mcm_output(343); -- input 23,2 <= 27 * ref[25]
    input(3)(23)(3) <= mcm_output(359); -- input 23,3 <= 11 * ref[26]

    -- Eq 24 Line 3
    input(3)(24)(0) <= mcm_output(321); -- input 24,0 <= 4 * ref[24]
    input(3)(24)(1) <= mcm_output(339); -- input 24,1 <= 20 * ref[25]
    input(3)(24)(2) <= mcm_output(357); -- input 24,2 <= 27 * ref[26]
    input(3)(24)(3) <= mcm_output(373); -- input 24,3 <= 11 * ref[27]

    -- Eq 25 Line 3
    input(3)(25)(0) <= mcm_output(335); -- input 25,0 <= 4 * ref[25]
    input(3)(25)(1) <= mcm_output(353); -- input 25,1 <= 20 * ref[26]
    input(3)(25)(2) <= mcm_output(371); -- input 25,2 <= 27 * ref[27]
    input(3)(25)(3) <= mcm_output(387); -- input 25,3 <= 11 * ref[28]

    -- Eq 26 Line 3
    input(3)(26)(0) <= mcm_output(349); -- input 26,0 <= 4 * ref[26]
    input(3)(26)(1) <= mcm_output(367); -- input 26,1 <= 20 * ref[27]
    input(3)(26)(2) <= mcm_output(385); -- input 26,2 <= 27 * ref[28]
    input(3)(26)(3) <= mcm_output(401); -- input 26,3 <= 11 * ref[29]

    -- Eq 27 Line 3
    input(3)(27)(0) <= mcm_output(363); -- input 27,0 <= 4 * ref[27]
    input(3)(27)(1) <= mcm_output(381); -- input 27,1 <= 20 * ref[28]
    input(3)(27)(2) <= mcm_output(399); -- input 27,2 <= 27 * ref[29]
    input(3)(27)(3) <= mcm_output(415); -- input 27,3 <= 11 * ref[30]

    -- Eq 28 Line 3
    input(3)(28)(0) <= mcm_output(377); -- input 28,0 <= 4 * ref[28]
    input(3)(28)(1) <= mcm_output(395); -- input 28,1 <= 20 * ref[29]
    input(3)(28)(2) <= mcm_output(413); -- input 28,2 <= 27 * ref[30]
    input(3)(28)(3) <= mcm_output(429); -- input 28,3 <= 11 * ref[31]

    -- Eq 29 Line 3
    input(3)(29)(0) <= mcm_output(391); -- input 29,0 <= 4 * ref[29]
    input(3)(29)(1) <= mcm_output(409); -- input 29,1 <= 20 * ref[30]
    input(3)(29)(2) <= mcm_output(427); -- input 29,2 <= 27 * ref[31]
    input(3)(29)(3) <= mcm_output(443); -- input 29,3 <= 11 * ref[32]

    -- Eq 30 Line 3
    input(3)(30)(0) <= mcm_output(405); -- input 30,0 <= 4 * ref[30]
    input(3)(30)(1) <= mcm_output(423); -- input 30,1 <= 20 * ref[31]
    input(3)(30)(2) <= mcm_output(441); -- input 30,2 <= 27 * ref[32]
    input(3)(30)(3) <= mcm_output(457); -- input 30,3 <= 11 * ref[33]

    -- Eq 31 Line 3
    input(3)(31)(0) <= mcm_output(419); -- input 31,0 <= 4 * ref[31]
    input(3)(31)(1) <= mcm_output(437); -- input 31,1 <= 20 * ref[32]
    input(3)(31)(2) <= mcm_output(455); -- input 31,2 <= 27 * ref[33]
    input(3)(31)(3) <= mcm_output(471); -- input 31,3 <= 11 * ref[34]

    -- Eq 32 Line 3
    input(3)(32)(0) <= mcm_output(433); -- input 32,0 <= 4 * ref[32]
    input(3)(32)(1) <= mcm_output(451); -- input 32,1 <= 20 * ref[33]
    input(3)(32)(2) <= mcm_output(469); -- input 32,2 <= 27 * ref[34]
    input(3)(32)(3) <= mcm_output(485); -- input 32,3 <= 11 * ref[35]

    -- Eq 33 Line 3
    input(3)(33)(0) <= mcm_output(447); -- input 33,0 <= 4 * ref[33]
    input(3)(33)(1) <= mcm_output(465); -- input 33,1 <= 20 * ref[34]
    input(3)(33)(2) <= mcm_output(483); -- input 33,2 <= 27 * ref[35]
    input(3)(33)(3) <= mcm_output(499); -- input 33,3 <= 11 * ref[36]

    -- Eq 34 Line 3
    input(3)(34)(0) <= mcm_output(461); -- input 34,0 <= 4 * ref[34]
    input(3)(34)(1) <= mcm_output(479); -- input 34,1 <= 20 * ref[35]
    input(3)(34)(2) <= mcm_output(497); -- input 34,2 <= 27 * ref[36]
    input(3)(34)(3) <= mcm_output(513); -- input 34,3 <= 11 * ref[37]

    -- Eq 35 Line 3
    input(3)(35)(0) <= mcm_output(475); -- input 35,0 <= 4 * ref[35]
    input(3)(35)(1) <= mcm_output(493); -- input 35,1 <= 20 * ref[36]
    input(3)(35)(2) <= mcm_output(511); -- input 35,2 <= 27 * ref[37]
    input(3)(35)(3) <= mcm_output(527); -- input 35,3 <= 11 * ref[38]

    -- Eq 36 Line 3
    input(3)(36)(0) <= mcm_output(489); -- input 36,0 <= 4 * ref[36]
    input(3)(36)(1) <= mcm_output(507); -- input 36,1 <= 20 * ref[37]
    input(3)(36)(2) <= mcm_output(525); -- input 36,2 <= 27 * ref[38]
    input(3)(36)(3) <= mcm_output(541); -- input 36,3 <= 11 * ref[39]

    -- Eq 37 Line 3
    input(3)(37)(0) <= mcm_output(503); -- input 37,0 <= 4 * ref[37]
    input(3)(37)(1) <= mcm_output(521); -- input 37,1 <= 20 * ref[38]
    input(3)(37)(2) <= mcm_output(539); -- input 37,2 <= 27 * ref[39]
    input(3)(37)(3) <= mcm_output(555); -- input 37,3 <= 11 * ref[40]

    -- Eq 38 Line 3
    input(3)(38)(0) <= mcm_output(517); -- input 38,0 <= 4 * ref[38]
    input(3)(38)(1) <= mcm_output(535); -- input 38,1 <= 20 * ref[39]
    input(3)(38)(2) <= mcm_output(553); -- input 38,2 <= 27 * ref[40]
    input(3)(38)(3) <= mcm_output(569); -- input 38,3 <= 11 * ref[41]

    -- Eq 39 Line 3
    input(3)(39)(0) <= mcm_output(531); -- input 39,0 <= 4 * ref[39]
    input(3)(39)(1) <= mcm_output(549); -- input 39,1 <= 20 * ref[40]
    input(3)(39)(2) <= mcm_output(567); -- input 39,2 <= 27 * ref[41]
    input(3)(39)(3) <= mcm_output(583); -- input 39,3 <= 11 * ref[42]

    -- Eq 40 Line 3
    input(3)(40)(0) <= mcm_output(545); -- input 40,0 <= 4 * ref[40]
    input(3)(40)(1) <= mcm_output(563); -- input 40,1 <= 20 * ref[41]
    input(3)(40)(2) <= mcm_output(581); -- input 40,2 <= 27 * ref[42]
    input(3)(40)(3) <= mcm_output(597); -- input 40,3 <= 11 * ref[43]

    -- Eq 41 Line 3
    input(3)(41)(0) <= mcm_output(559); -- input 41,0 <= 4 * ref[41]
    input(3)(41)(1) <= mcm_output(577); -- input 41,1 <= 20 * ref[42]
    input(3)(41)(2) <= mcm_output(595); -- input 41,2 <= 27 * ref[43]
    input(3)(41)(3) <= mcm_output(611); -- input 41,3 <= 11 * ref[44]

    -- Eq 42 Line 3
    input(3)(42)(0) <= mcm_output(573); -- input 42,0 <= 4 * ref[42]
    input(3)(42)(1) <= mcm_output(591); -- input 42,1 <= 20 * ref[43]
    input(3)(42)(2) <= mcm_output(609); -- input 42,2 <= 27 * ref[44]
    input(3)(42)(3) <= mcm_output(625); -- input 42,3 <= 11 * ref[45]

    -- Eq 43 Line 3
    input(3)(43)(0) <= mcm_output(587); -- input 43,0 <= 4 * ref[43]
    input(3)(43)(1) <= mcm_output(605); -- input 43,1 <= 20 * ref[44]
    input(3)(43)(2) <= mcm_output(623); -- input 43,2 <= 27 * ref[45]
    input(3)(43)(3) <= mcm_output(639); -- input 43,3 <= 11 * ref[46]

    -- Eq 44 Line 3
    input(3)(44)(0) <= mcm_output(601); -- input 44,0 <= 4 * ref[44]
    input(3)(44)(1) <= mcm_output(619); -- input 44,1 <= 20 * ref[45]
    input(3)(44)(2) <= mcm_output(637); -- input 44,2 <= 27 * ref[46]
    input(3)(44)(3) <= mcm_output(653); -- input 44,3 <= 11 * ref[47]

    -- Eq 45 Line 3
    input(3)(45)(0) <= mcm_output(615); -- input 45,0 <= 4 * ref[45]
    input(3)(45)(1) <= mcm_output(633); -- input 45,1 <= 20 * ref[46]
    input(3)(45)(2) <= mcm_output(651); -- input 45,2 <= 27 * ref[47]
    input(3)(45)(3) <= mcm_output(667); -- input 45,3 <= 11 * ref[48]

    -- Eq 46 Line 3
    input(3)(46)(0) <= mcm_output(629); -- input 46,0 <= 4 * ref[46]
    input(3)(46)(1) <= mcm_output(647); -- input 46,1 <= 20 * ref[47]
    input(3)(46)(2) <= mcm_output(665); -- input 46,2 <= 27 * ref[48]
    input(3)(46)(3) <= mcm_output(681); -- input 46,3 <= 11 * ref[49]

    -- Eq 47 Line 3
    input(3)(47)(0) <= mcm_output(643); -- input 47,0 <= 4 * ref[47]
    input(3)(47)(1) <= mcm_output(661); -- input 47,1 <= 20 * ref[48]
    input(3)(47)(2) <= mcm_output(679); -- input 47,2 <= 27 * ref[49]
    input(3)(47)(3) <= mcm_output(695); -- input 47,3 <= 11 * ref[50]

    -- Eq 48 Line 3
    input(3)(48)(0) <= mcm_output(657); -- input 48,0 <= 4 * ref[48]
    input(3)(48)(1) <= mcm_output(675); -- input 48,1 <= 20 * ref[49]
    input(3)(48)(2) <= mcm_output(693); -- input 48,2 <= 27 * ref[50]
    input(3)(48)(3) <= mcm_output(709); -- input 48,3 <= 11 * ref[51]

    -- Eq 49 Line 3
    input(3)(49)(0) <= mcm_output(671); -- input 49,0 <= 4 * ref[49]
    input(3)(49)(1) <= mcm_output(689); -- input 49,1 <= 20 * ref[50]
    input(3)(49)(2) <= mcm_output(707); -- input 49,2 <= 27 * ref[51]
    input(3)(49)(3) <= mcm_output(723); -- input 49,3 <= 11 * ref[52]

    -- Eq 50 Line 3
    input(3)(50)(0) <= mcm_output(685); -- input 50,0 <= 4 * ref[50]
    input(3)(50)(1) <= mcm_output(703); -- input 50,1 <= 20 * ref[51]
    input(3)(50)(2) <= mcm_output(721); -- input 50,2 <= 27 * ref[52]
    input(3)(50)(3) <= mcm_output(737); -- input 50,3 <= 11 * ref[53]

    -- Eq 51 Line 3
    input(3)(51)(0) <= mcm_output(699); -- input 51,0 <= 4 * ref[51]
    input(3)(51)(1) <= mcm_output(717); -- input 51,1 <= 20 * ref[52]
    input(3)(51)(2) <= mcm_output(735); -- input 51,2 <= 27 * ref[53]
    input(3)(51)(3) <= mcm_output(751); -- input 51,3 <= 11 * ref[54]

    -- Eq 52 Line 3
    input(3)(52)(0) <= mcm_output(713); -- input 52,0 <= 4 * ref[52]
    input(3)(52)(1) <= mcm_output(731); -- input 52,1 <= 20 * ref[53]
    input(3)(52)(2) <= mcm_output(749); -- input 52,2 <= 27 * ref[54]
    input(3)(52)(3) <= mcm_output(765); -- input 52,3 <= 11 * ref[55]

    -- Eq 53 Line 3
    input(3)(53)(0) <= mcm_output(727); -- input 53,0 <= 4 * ref[53]
    input(3)(53)(1) <= mcm_output(745); -- input 53,1 <= 20 * ref[54]
    input(3)(53)(2) <= mcm_output(763); -- input 53,2 <= 27 * ref[55]
    input(3)(53)(3) <= mcm_output(779); -- input 53,3 <= 11 * ref[56]

    -- Eq 54 Line 3
    input(3)(54)(0) <= mcm_output(741); -- input 54,0 <= 4 * ref[54]
    input(3)(54)(1) <= mcm_output(759); -- input 54,1 <= 20 * ref[55]
    input(3)(54)(2) <= mcm_output(777); -- input 54,2 <= 27 * ref[56]
    input(3)(54)(3) <= mcm_output(793); -- input 54,3 <= 11 * ref[57]

    -- Eq 55 Line 3
    input(3)(55)(0) <= mcm_output(755); -- input 55,0 <= 4 * ref[55]
    input(3)(55)(1) <= mcm_output(773); -- input 55,1 <= 20 * ref[56]
    input(3)(55)(2) <= mcm_output(791); -- input 55,2 <= 27 * ref[57]
    input(3)(55)(3) <= mcm_output(807); -- input 55,3 <= 11 * ref[58]

    -- Eq 56 Line 3
    input(3)(56)(0) <= mcm_output(769); -- input 56,0 <= 4 * ref[56]
    input(3)(56)(1) <= mcm_output(787); -- input 56,1 <= 20 * ref[57]
    input(3)(56)(2) <= mcm_output(805); -- input 56,2 <= 27 * ref[58]
    input(3)(56)(3) <= mcm_output(821); -- input 56,3 <= 11 * ref[59]

    -- Eq 57 Line 3
    input(3)(57)(0) <= mcm_output(783); -- input 57,0 <= 4 * ref[57]
    input(3)(57)(1) <= mcm_output(801); -- input 57,1 <= 20 * ref[58]
    input(3)(57)(2) <= mcm_output(819); -- input 57,2 <= 27 * ref[59]
    input(3)(57)(3) <= mcm_output(835); -- input 57,3 <= 11 * ref[60]

    -- Eq 58 Line 3
    input(3)(58)(0) <= mcm_output(797); -- input 58,0 <= 4 * ref[58]
    input(3)(58)(1) <= mcm_output(815); -- input 58,1 <= 20 * ref[59]
    input(3)(58)(2) <= mcm_output(833); -- input 58,2 <= 27 * ref[60]
    input(3)(58)(3) <= mcm_output(849); -- input 58,3 <= 11 * ref[61]

    -- Eq 59 Line 3
    input(3)(59)(0) <= mcm_output(811); -- input 59,0 <= 4 * ref[59]
    input(3)(59)(1) <= mcm_output(829); -- input 59,1 <= 20 * ref[60]
    input(3)(59)(2) <= mcm_output(847); -- input 59,2 <= 27 * ref[61]
    input(3)(59)(3) <= mcm_output(863); -- input 59,3 <= 11 * ref[62]

    -- Eq 60 Line 3
    input(3)(60)(0) <= mcm_output(825); -- input 60,0 <= 4 * ref[60]
    input(3)(60)(1) <= mcm_output(843); -- input 60,1 <= 20 * ref[61]
    input(3)(60)(2) <= mcm_output(861); -- input 60,2 <= 27 * ref[62]
    input(3)(60)(3) <= mcm_output(877); -- input 60,3 <= 11 * ref[63]

    -- Eq 61 Line 3
    input(3)(61)(0) <= mcm_output(839); -- input 61,0 <= 4 * ref[61]
    input(3)(61)(1) <= mcm_output(857); -- input 61,1 <= 20 * ref[62]
    input(3)(61)(2) <= mcm_output(875); -- input 61,2 <= 27 * ref[63]
    input(3)(61)(3) <= mcm_output(889); -- input 61,3 <= 11 * ref[64]

    -- Eq 62 Line 3
    input(3)(62)(0) <= mcm_output(853); -- input 62,0 <= 4 * ref[62]
    input(3)(62)(1) <= mcm_output(871); -- input 62,1 <= 20 * ref[63]
    input(3)(62)(2) <= mcm_output(885); -- input 62,2 <= 27 * ref[64]
    input(3)(62)(3) <= mcm_output(897); -- input 62,3 <= 11 * ref[65]

    -- Eq 63 Line 3
    input(3)(63)(0) <= mcm_output(867); -- input 63,0 <= 4 * ref[63]
    input(3)(63)(1) <= mcm_output(881); -- input 63,1 <= 20 * ref[64]
    input(3)(63)(2) <= mcm_output(893); -- input 63,2 <= 27 * ref[65]
    input(3)(63)(3) <= mcm_output(901); -- input 63,3 <= 11 * ref[66]

	
	process (clk, rst)
	  begin
		if rst = '1' then
			for i in 0 to 63 loop 
				for j in 0 to 3 loop
					eq_input(i)(j) <= "0000000000000000";
				end loop;
			end loop;
		elsif clk'event and clk = '1' then
			
			for i in 0 to 63 loop 
				for j in 0 to 3 loop
		            eq_input(i)(j) <= input(to_integer(unsigned(control)))(i)(j);
				end loop;
			end loop;
		end if;
	end process;
END comportamental;