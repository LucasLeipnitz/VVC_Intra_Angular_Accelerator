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
		control : IN std_logic_vector(5 downto 0);
		ref : IN ref_bus (0 to 3 );
		pred: OUT std_logic_vector(7 downto 0)
	);
END datapath;

ARCHITECTURE comportamental OF datapath IS


COMPONENT MCM_0
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[0]*-1
                Y2, -- Y2 = ref[0]*-2
                Y3, -- Y3 = ref[0]*-3
                Y4, -- Y4 = ref[0]*-4
                Y5, -- Y5 = ref[0]*-5
                Y6, -- Y6 = ref[0]*-6
                Y7, -- Y7 = ref[0]*16
                Y8, -- Y8 = ref[0]*15
                Y9, -- Y9 = ref[0]*14
                Y10, -- Y10 = ref[0]*13
                Y11, -- Y11 = ref[0]*12
                Y12, -- Y12 = ref[0]*11
                Y13, -- Y13 = ref[0]*10
                Y14, -- Y14 = ref[0]*9
                Y15, -- Y15 = ref[0]*8
                Y16, -- Y16 = ref[0]*7
                Y17, -- Y17 = ref[0]*6
                Y18, -- Y18 = ref[0]*5
                Y19, -- Y19 = ref[0]*4
                Y20, -- Y20 = ref[0]*3
                Y21, -- Y21 = ref[0]*2
                Y22 : out std_logic_vector ( 15 downto 0 ) -- Y22 = ref[0]*1
        );
END COMPONENT;

COMPONENT MCM_1
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[1]*64
                Y2, -- Y2 = ref[1]*63
                Y3, -- Y3 = ref[1]*62
                Y4, -- Y4 = ref[1]*60
                Y5, -- Y5 = ref[1]*58
                Y6, -- Y6 = ref[1]*57
                Y7, -- Y7 = ref[1]*56
                Y8, -- Y8 = ref[1]*55
                Y9, -- Y9 = ref[1]*54
                Y10, -- Y10 = ref[1]*53
                Y11, -- Y11 = ref[1]*52
                Y12, -- Y12 = ref[1]*49
                Y13, -- Y13 = ref[1]*46
                Y14, -- Y14 = ref[1]*44
                Y15, -- Y15 = ref[1]*42
                Y16, -- Y16 = ref[1]*39
                Y17, -- Y17 = ref[1]*36
                Y18, -- Y18 = ref[1]*33
                Y19, -- Y19 = ref[1]*30
                Y20, -- Y20 = ref[1]*29
                Y21, -- Y21 = ref[1]*28
                Y22, -- Y22 = ref[1]*24
                Y23, -- Y23 = ref[1]*20
                Y24, -- Y24 = ref[1]*18
                Y25, -- Y25 = ref[1]*16
                Y26, -- Y26 = ref[1]*15
                Y27, -- Y27 = ref[1]*14
                Y28, -- Y28 = ref[1]*12
                Y29, -- Y29 = ref[1]*10
                Y30, -- Y30 = ref[1]*7
                Y31, -- Y31 = ref[1]*4
                Y32, -- Y32 = ref[1]*2
                Y33, -- Y33 = ref[1]*32
                Y34, -- Y34 = ref[1]*31
                Y35, -- Y35 = ref[1]*27
                Y36, -- Y36 = ref[1]*26
                Y37, -- Y37 = ref[1]*25
                Y38, -- Y38 = ref[1]*23
                Y39, -- Y39 = ref[1]*22
                Y40, -- Y40 = ref[1]*21
                Y41, -- Y41 = ref[1]*19
                Y42 : out std_logic_vector ( 15 downto 0 ) -- Y42 = ref[1]*17
        );
END COMPONENT;

COMPONENT MCM_2
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[2]*2
                Y2, -- Y2 = ref[2]*4
                Y3, -- Y3 = ref[2]*7
                Y4, -- Y4 = ref[2]*10
                Y5, -- Y5 = ref[2]*12
                Y6, -- Y6 = ref[2]*14
                Y7, -- Y7 = ref[2]*15
                Y8, -- Y8 = ref[2]*16
                Y9, -- Y9 = ref[2]*18
                Y10, -- Y10 = ref[2]*20
                Y11, -- Y11 = ref[2]*24
                Y12, -- Y12 = ref[2]*28
                Y13, -- Y13 = ref[2]*29
                Y14, -- Y14 = ref[2]*30
                Y15, -- Y15 = ref[2]*33
                Y16, -- Y16 = ref[2]*36
                Y17, -- Y17 = ref[2]*39
                Y18, -- Y18 = ref[2]*42
                Y19, -- Y19 = ref[2]*44
                Y20, -- Y20 = ref[2]*46
                Y21, -- Y21 = ref[2]*49
                Y22, -- Y22 = ref[2]*52
                Y23, -- Y23 = ref[2]*53
                Y24, -- Y24 = ref[2]*54
                Y25, -- Y25 = ref[2]*55
                Y26, -- Y26 = ref[2]*56
                Y27, -- Y27 = ref[2]*57
                Y28, -- Y28 = ref[2]*58
                Y29, -- Y29 = ref[2]*60
                Y30, -- Y30 = ref[2]*62
                Y31, -- Y31 = ref[2]*63
                Y32, -- Y32 = ref[2]*17
                Y33, -- Y33 = ref[2]*19
                Y34, -- Y34 = ref[2]*21
                Y35, -- Y35 = ref[2]*22
                Y36, -- Y36 = ref[2]*23
                Y37, -- Y37 = ref[2]*25
                Y38, -- Y38 = ref[2]*26
                Y39, -- Y39 = ref[2]*27
                Y40 : out std_logic_vector ( 15 downto 0 ) -- Y40 = ref[2]*31
        );
END COMPONENT;

COMPONENT MCM_3
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[3]*-1
                Y2, -- Y2 = ref[3]*-2
                Y3, -- Y3 = ref[3]*-3
                Y4, -- Y4 = ref[3]*-4
                Y5, -- Y5 = ref[3]*-5
                Y6, -- Y6 = ref[3]*-6
                Y7, -- Y7 = ref[3]*1
                Y8, -- Y8 = ref[3]*2
                Y9, -- Y9 = ref[3]*3
                Y10, -- Y10 = ref[3]*4
                Y11, -- Y11 = ref[3]*5
                Y12, -- Y12 = ref[3]*6
                Y13, -- Y13 = ref[3]*7
                Y14, -- Y14 = ref[3]*8
                Y15, -- Y15 = ref[3]*9
                Y16, -- Y16 = ref[3]*10
                Y17, -- Y17 = ref[3]*11
                Y18, -- Y18 = ref[3]*12
                Y19, -- Y19 = ref[3]*13
                Y20, -- Y20 = ref[3]*14
                Y21 : out std_logic_vector ( 15 downto 0 ) -- Y21 = ref[3]*15
        );
END COMPONENT;


COMPONENT equation_block
	PORT (
			input_0, input_1, input_2, input_3 : in std_logic_vector ( 15 downto 0 );
			output : out std_logic_vector ( 7 downto 0 )
	);
END COMPONENT;

type t_input is array (0 to 124) of std_logic_vector( 15 downto 0);
type t_eq_input is array (0 to 3) of std_logic_vector( 15 downto 0);
signal 	input : t_input;
signal 	eq_input : t_eq_input;

BEGIN
		eq:	equation_block
		PORT MAP ( input_0 => eq_input(0), input_1 => eq_input(1), input_2 => eq_input(2), input_3 => eq_input(3), output => pred );
		m0 : MCM_0
        PORT MAP ( X => ref(0), Y1 => input(0), Y2 => input(1), Y3 => input(2), Y4 => input(3), Y5 => input(4), Y6 => input(5), Y7 => input(6), Y8 => input(7), Y9 => input(8), Y10 => input(9), Y11 => input(10), Y12 => input(11), Y13 => input(12), Y14 => input(13), Y15 => input(14), Y16 => input(15), Y17 => input(16), Y18 => input(17), Y19 => input(18), Y20 => input(19), Y21 => input(20), Y22 => input(21) );
        m1 : MCM_1
        PORT MAP ( X => ref(1), Y1 => input(22), Y2 => input(23), Y3 => input(24), Y4 => input(25), Y5 => input(26), Y6 => input(27), Y7 => input(28), Y8 => input(29), Y9 => input(30), Y10 => input(31), Y11 => input(32), Y12 => input(33), Y13 => input(34), Y14 => input(35), Y15 => input(36), Y16 => input(37), Y17 => input(38), Y18 => input(39), Y19 => input(40), Y20 => input(41), Y21 => input(42), Y22 => input(43), Y23 => input(44), Y24 => input(45), Y25 => input(46), Y26 => input(47), Y27 => input(48), Y28 => input(49), Y29 => input(50), Y30 => input(51), Y31 => input(52), Y32 => input(53), Y33 => input(54), Y34 => input(55), Y35 => input(56), Y36 => input(57), Y37 => input(58), Y38 => input(59), Y39 => input(60), Y40 => input(61), Y41 => input(62), Y42 => input(63) );
        m2 : MCM_2
        PORT MAP ( X => ref(2), Y1 => input(64), Y2 => input(65), Y3 => input(66), Y4 => input(67), Y5 => input(68), Y6 => input(69), Y7 => input(70), Y8 => input(71), Y9 => input(72), Y10 => input(73), Y11 => input(74), Y12 => input(75), Y13 => input(76), Y14 => input(77), Y15 => input(78), Y16 => input(79), Y17 => input(80), Y18 => input(81), Y19 => input(82), Y20 => input(83), Y21 => input(84), Y22 => input(85), Y23 => input(86), Y24 => input(87), Y25 => input(88), Y26 => input(89), Y27 => input(90), Y28 => input(91), Y29 => input(92), Y30 => input(93), Y31 => input(94), Y32 => input(95), Y33 => input(96), Y34 => input(97), Y35 => input(98), Y36 => input(99), Y37 => input(100), Y38 => input(101), Y39 => input(102), Y40 => input(103) );
        m3 : MCM_3
        PORT MAP ( X => ref(3), Y1 => input(104), Y2 => input(105), Y3 => input(106), Y4 => input(107), Y5 => input(108), Y6 => input(109), Y7 => input(110), Y8 => input(111), Y9 => input(112), Y10 => input(113), Y11 => input(114), Y12 => input(115), Y13 => input(116), Y14 => input(117), Y15 => input(118), Y16 => input(119), Y17 => input(120), Y18 => input(121), Y19 => input(122), Y20 => input(123), Y21 => input(124) );
 
		process (rst, clk)
			begin
				if rst = '1' then
					eq_input(0) <= "0000000000000000";
					eq_input(1) <= "0000000000000000";
					eq_input(2) <= "0000000000000000";
					eq_input(3) <= "0000000000000000";
				elsif clk'event and clk = '1' then
				    case control is
				        when "000000"=>
				                eq_input(0) <= "0000000000000000"; -- input 0 <= 0 * ref[0]
				                eq_input(1) <= input(22); -- input 1 <= 64 * ref[1]
				                eq_input(2) <= "0000000000000000"; -- input 2 <= 0 * ref[2]
				                eq_input(3) <= "0000000000000000"; -- input 3 <= 0 * ref[3]
				        when "000001"=>
				                eq_input(0) <= input(0); -- input 0 <= -1 * ref[0]
				                eq_input(1) <= input(23); -- input 1 <= 63 * ref[1]
				                eq_input(2) <= input(64); -- input 2 <= 2 * ref[2]
				                eq_input(3) <= "0000000000000000"; -- input 3 <= 0 * ref[3]
				        when "000010"=>
				                eq_input(0) <= input(1); -- input 0 <= -2 * ref[0]
				                eq_input(1) <= input(24); -- input 1 <= 62 * ref[1]
				                eq_input(2) <= input(65); -- input 2 <= 4 * ref[2]
				                eq_input(3) <= "0000000000000000"; -- input 3 <= 0 * ref[3]
				        when "000011"=>
				                eq_input(0) <= input(1); -- input 0 <= -2 * ref[0]
				                eq_input(1) <= input(25); -- input 1 <= 60 * ref[1]
				                eq_input(2) <= input(66); -- input 2 <= 7 * ref[2]
				                eq_input(3) <= input(104); -- input 3 <= -1 * ref[3]
				        when "000100"=>
				                eq_input(0) <= input(1); -- input 0 <= -2 * ref[0]
				                eq_input(1) <= input(26); -- input 1 <= 58 * ref[1]
				                eq_input(2) <= input(67); -- input 2 <= 10 * ref[2]
				                eq_input(3) <= input(105); -- input 3 <= -2 * ref[3]
				        when "000101"=>
				                eq_input(0) <= input(2); -- input 0 <= -3 * ref[0]
				                eq_input(1) <= input(27); -- input 1 <= 57 * ref[1]
				                eq_input(2) <= input(68); -- input 2 <= 12 * ref[2]
				                eq_input(3) <= input(105); -- input 3 <= -2 * ref[3]
				        when "000110"=>
				                eq_input(0) <= input(3); -- input 0 <= -4 * ref[0]
				                eq_input(1) <= input(28); -- input 1 <= 56 * ref[1]
				                eq_input(2) <= input(69); -- input 2 <= 14 * ref[2]
				                eq_input(3) <= input(105); -- input 3 <= -2 * ref[3]
				        when "000111"=>
				                eq_input(0) <= input(3); -- input 0 <= -4 * ref[0]
				                eq_input(1) <= input(29); -- input 1 <= 55 * ref[1]
				                eq_input(2) <= input(70); -- input 2 <= 15 * ref[2]
				                eq_input(3) <= input(105); -- input 3 <= -2 * ref[3]
				        when "001000"=>
				                eq_input(0) <= input(3); -- input 0 <= -4 * ref[0]
				                eq_input(1) <= input(30); -- input 1 <= 54 * ref[1]
				                eq_input(2) <= input(71); -- input 2 <= 16 * ref[2]
				                eq_input(3) <= input(105); -- input 3 <= -2 * ref[3]
				        when "001001"=>
				                eq_input(0) <= input(4); -- input 0 <= -5 * ref[0]
				                eq_input(1) <= input(31); -- input 1 <= 53 * ref[1]
				                eq_input(2) <= input(72); -- input 2 <= 18 * ref[2]
				                eq_input(3) <= input(105); -- input 3 <= -2 * ref[3]
				        when "001010"=>
				                eq_input(0) <= input(5); -- input 0 <= -6 * ref[0]
				                eq_input(1) <= input(32); -- input 1 <= 52 * ref[1]
				                eq_input(2) <= input(73); -- input 2 <= 20 * ref[2]
				                eq_input(3) <= input(105); -- input 3 <= -2 * ref[3]
				        when "001011"=>
				                eq_input(0) <= input(5); -- input 0 <= -6 * ref[0]
				                eq_input(1) <= input(33); -- input 1 <= 49 * ref[1]
				                eq_input(2) <= input(74); -- input 2 <= 24 * ref[2]
				                eq_input(3) <= input(106); -- input 3 <= -3 * ref[3]
				        when "001100"=>
				                eq_input(0) <= input(5); -- input 0 <= -6 * ref[0]
				                eq_input(1) <= input(34); -- input 1 <= 46 * ref[1]
				                eq_input(2) <= input(75); -- input 2 <= 28 * ref[2]
				                eq_input(3) <= input(107); -- input 3 <= -4 * ref[3]
				        when "001101"=>
				                eq_input(0) <= input(4); -- input 0 <= -5 * ref[0]
				                eq_input(1) <= input(35); -- input 1 <= 44 * ref[1]
				                eq_input(2) <= input(76); -- input 2 <= 29 * ref[2]
				                eq_input(3) <= input(107); -- input 3 <= -4 * ref[3]
				        when "001110"=>
				                eq_input(0) <= input(3); -- input 0 <= -4 * ref[0]
				                eq_input(1) <= input(36); -- input 1 <= 42 * ref[1]
				                eq_input(2) <= input(77); -- input 2 <= 30 * ref[2]
				                eq_input(3) <= input(107); -- input 3 <= -4 * ref[3]
				        when "001111"=>
				                eq_input(0) <= input(3); -- input 0 <= -4 * ref[0]
				                eq_input(1) <= input(37); -- input 1 <= 39 * ref[1]
				                eq_input(2) <= input(78); -- input 2 <= 33 * ref[2]
				                eq_input(3) <= input(107); -- input 3 <= -4 * ref[3]
				        when "010000"=>
				                eq_input(0) <= input(3); -- input 0 <= -4 * ref[0]
				                eq_input(1) <= input(38); -- input 1 <= 36 * ref[1]
				                eq_input(2) <= input(79); -- input 2 <= 36 * ref[2]
				                eq_input(3) <= input(107); -- input 3 <= -4 * ref[3]
				        when "010001"=>
				                eq_input(0) <= input(3); -- input 0 <= -4 * ref[0]
				                eq_input(1) <= input(39); -- input 1 <= 33 * ref[1]
				                eq_input(2) <= input(80); -- input 2 <= 39 * ref[2]
				                eq_input(3) <= input(107); -- input 3 <= -4 * ref[3]
				        when "010010"=>
				                eq_input(0) <= input(3); -- input 0 <= -4 * ref[0]
				                eq_input(1) <= input(40); -- input 1 <= 30 * ref[1]
				                eq_input(2) <= input(81); -- input 2 <= 42 * ref[2]
				                eq_input(3) <= input(107); -- input 3 <= -4 * ref[3]
				        when "010011"=>
				                eq_input(0) <= input(3); -- input 0 <= -4 * ref[0]
				                eq_input(1) <= input(41); -- input 1 <= 29 * ref[1]
				                eq_input(2) <= input(82); -- input 2 <= 44 * ref[2]
				                eq_input(3) <= input(108); -- input 3 <= -5 * ref[3]
				        when "010100"=>
				                eq_input(0) <= input(3); -- input 0 <= -4 * ref[0]
				                eq_input(1) <= input(42); -- input 1 <= 28 * ref[1]
				                eq_input(2) <= input(83); -- input 2 <= 46 * ref[2]
				                eq_input(3) <= input(109); -- input 3 <= -6 * ref[3]
				        when "010101"=>
				                eq_input(0) <= input(2); -- input 0 <= -3 * ref[0]
				                eq_input(1) <= input(43); -- input 1 <= 24 * ref[1]
				                eq_input(2) <= input(84); -- input 2 <= 49 * ref[2]
				                eq_input(3) <= input(109); -- input 3 <= -6 * ref[3]
				        when "010110"=>
				                eq_input(0) <= input(1); -- input 0 <= -2 * ref[0]
				                eq_input(1) <= input(44); -- input 1 <= 20 * ref[1]
				                eq_input(2) <= input(85); -- input 2 <= 52 * ref[2]
				                eq_input(3) <= input(109); -- input 3 <= -6 * ref[3]
				        when "010111"=>
				                eq_input(0) <= input(1); -- input 0 <= -2 * ref[0]
				                eq_input(1) <= input(45); -- input 1 <= 18 * ref[1]
				                eq_input(2) <= input(86); -- input 2 <= 53 * ref[2]
				                eq_input(3) <= input(108); -- input 3 <= -5 * ref[3]
				        when "011000"=>
				                eq_input(0) <= input(1); -- input 0 <= -2 * ref[0]
				                eq_input(1) <= input(46); -- input 1 <= 16 * ref[1]
				                eq_input(2) <= input(87); -- input 2 <= 54 * ref[2]
				                eq_input(3) <= input(107); -- input 3 <= -4 * ref[3]
				        when "011001"=>
				                eq_input(0) <= input(1); -- input 0 <= -2 * ref[0]
				                eq_input(1) <= input(47); -- input 1 <= 15 * ref[1]
				                eq_input(2) <= input(88); -- input 2 <= 55 * ref[2]
				                eq_input(3) <= input(107); -- input 3 <= -4 * ref[3]
				        when "011010"=>
				                eq_input(0) <= input(1); -- input 0 <= -2 * ref[0]
				                eq_input(1) <= input(48); -- input 1 <= 14 * ref[1]
				                eq_input(2) <= input(89); -- input 2 <= 56 * ref[2]
				                eq_input(3) <= input(107); -- input 3 <= -4 * ref[3]
				        when "011011"=>
				                eq_input(0) <= input(1); -- input 0 <= -2 * ref[0]
				                eq_input(1) <= input(49); -- input 1 <= 12 * ref[1]
				                eq_input(2) <= input(90); -- input 2 <= 57 * ref[2]
				                eq_input(3) <= input(106); -- input 3 <= -3 * ref[3]
				        when "011100"=>
				                eq_input(0) <= input(1); -- input 0 <= -2 * ref[0]
				                eq_input(1) <= input(50); -- input 1 <= 10 * ref[1]
				                eq_input(2) <= input(91); -- input 2 <= 58 * ref[2]
				                eq_input(3) <= input(105); -- input 3 <= -2 * ref[3]
				        when "011101"=>
				                eq_input(0) <= input(0); -- input 0 <= -1 * ref[0]
				                eq_input(1) <= input(51); -- input 1 <= 7 * ref[1]
				                eq_input(2) <= input(92); -- input 2 <= 60 * ref[2]
				                eq_input(3) <= input(105); -- input 3 <= -2 * ref[3]
				        when "011110"=>
				                eq_input(0) <= "0000000000000000"; -- input 0 <= 0 * ref[0]
				                eq_input(1) <= input(52); -- input 1 <= 4 * ref[1]
				                eq_input(2) <= input(93); -- input 2 <= 62 * ref[2]
				                eq_input(3) <= input(105); -- input 3 <= -2 * ref[3]
				        when "011111"=>
				                eq_input(0) <= "0000000000000000"; -- input 0 <= 0 * ref[0]
				                eq_input(1) <= input(53); -- input 1 <= 2 * ref[1]
				                eq_input(2) <= input(94); -- input 2 <= 63 * ref[2]
				                eq_input(3) <= input(104); -- input 3 <= -1 * ref[3]
				        when "100000"=>
				                eq_input(0) <= input(6); -- input 0 <= 16 * ref[0]
				                eq_input(1) <= input(54); -- input 1 <= 32 * ref[1]
				                eq_input(2) <= input(71); -- input 2 <= 16 * ref[2]
				                eq_input(3) <= "0000000000000000"; -- input 3 <= 0 * ref[3]
				        when "100001"=>
				                eq_input(0) <= input(6); -- input 0 <= 16 * ref[0]
				                eq_input(1) <= input(54); -- input 1 <= 32 * ref[1]
				                eq_input(2) <= input(71); -- input 2 <= 16 * ref[2]
				                eq_input(3) <= "0000000000000000"; -- input 3 <= 0 * ref[3]
				        when "100010"=>
				                eq_input(0) <= input(7); -- input 0 <= 15 * ref[0]
				                eq_input(1) <= input(55); -- input 1 <= 31 * ref[1]
				                eq_input(2) <= input(95); -- input 2 <= 17 * ref[2]
				                eq_input(3) <= input(110); -- input 3 <= 1 * ref[3]
				        when "100011"=>
				                eq_input(0) <= input(7); -- input 0 <= 15 * ref[0]
				                eq_input(1) <= input(55); -- input 1 <= 31 * ref[1]
				                eq_input(2) <= input(95); -- input 2 <= 17 * ref[2]
				                eq_input(3) <= input(110); -- input 3 <= 1 * ref[3]
				        when "100100"=>
				                eq_input(0) <= input(8); -- input 0 <= 14 * ref[0]
				                eq_input(1) <= input(40); -- input 1 <= 30 * ref[1]
				                eq_input(2) <= input(72); -- input 2 <= 18 * ref[2]
				                eq_input(3) <= input(111); -- input 3 <= 2 * ref[3]
				        when "100101"=>
				                eq_input(0) <= input(8); -- input 0 <= 14 * ref[0]
				                eq_input(1) <= input(40); -- input 1 <= 30 * ref[1]
				                eq_input(2) <= input(72); -- input 2 <= 18 * ref[2]
				                eq_input(3) <= input(111); -- input 3 <= 2 * ref[3]
				        when "100110"=>
				                eq_input(0) <= input(9); -- input 0 <= 13 * ref[0]
				                eq_input(1) <= input(41); -- input 1 <= 29 * ref[1]
				                eq_input(2) <= input(96); -- input 2 <= 19 * ref[2]
				                eq_input(3) <= input(112); -- input 3 <= 3 * ref[3]
				        when "100111"=>
				                eq_input(0) <= input(9); -- input 0 <= 13 * ref[0]
				                eq_input(1) <= input(41); -- input 1 <= 29 * ref[1]
				                eq_input(2) <= input(96); -- input 2 <= 19 * ref[2]
				                eq_input(3) <= input(112); -- input 3 <= 3 * ref[3]
				        when "101000"=>
				                eq_input(0) <= input(10); -- input 0 <= 12 * ref[0]
				                eq_input(1) <= input(42); -- input 1 <= 28 * ref[1]
				                eq_input(2) <= input(73); -- input 2 <= 20 * ref[2]
				                eq_input(3) <= input(113); -- input 3 <= 4 * ref[3]
				        when "101001"=>
				                eq_input(0) <= input(10); -- input 0 <= 12 * ref[0]
				                eq_input(1) <= input(42); -- input 1 <= 28 * ref[1]
				                eq_input(2) <= input(73); -- input 2 <= 20 * ref[2]
				                eq_input(3) <= input(113); -- input 3 <= 4 * ref[3]
				        when "101010"=>
				                eq_input(0) <= input(11); -- input 0 <= 11 * ref[0]
				                eq_input(1) <= input(56); -- input 1 <= 27 * ref[1]
				                eq_input(2) <= input(97); -- input 2 <= 21 * ref[2]
				                eq_input(3) <= input(114); -- input 3 <= 5 * ref[3]
				        when "101011"=>
				                eq_input(0) <= input(11); -- input 0 <= 11 * ref[0]
				                eq_input(1) <= input(56); -- input 1 <= 27 * ref[1]
				                eq_input(2) <= input(97); -- input 2 <= 21 * ref[2]
				                eq_input(3) <= input(114); -- input 3 <= 5 * ref[3]
				        when "101100"=>
				                eq_input(0) <= input(12); -- input 0 <= 10 * ref[0]
				                eq_input(1) <= input(57); -- input 1 <= 26 * ref[1]
				                eq_input(2) <= input(98); -- input 2 <= 22 * ref[2]
				                eq_input(3) <= input(115); -- input 3 <= 6 * ref[3]
				        when "101101"=>
				                eq_input(0) <= input(12); -- input 0 <= 10 * ref[0]
				                eq_input(1) <= input(57); -- input 1 <= 26 * ref[1]
				                eq_input(2) <= input(98); -- input 2 <= 22 * ref[2]
				                eq_input(3) <= input(115); -- input 3 <= 6 * ref[3]
				        when "101110"=>
				                eq_input(0) <= input(13); -- input 0 <= 9 * ref[0]
				                eq_input(1) <= input(58); -- input 1 <= 25 * ref[1]
				                eq_input(2) <= input(99); -- input 2 <= 23 * ref[2]
				                eq_input(3) <= input(116); -- input 3 <= 7 * ref[3]
				        when "101111"=>
				                eq_input(0) <= input(13); -- input 0 <= 9 * ref[0]
				                eq_input(1) <= input(58); -- input 1 <= 25 * ref[1]
				                eq_input(2) <= input(99); -- input 2 <= 23 * ref[2]
				                eq_input(3) <= input(116); -- input 3 <= 7 * ref[3]
				        when "110000"=>
				                eq_input(0) <= input(14); -- input 0 <= 8 * ref[0]
				                eq_input(1) <= input(43); -- input 1 <= 24 * ref[1]
				                eq_input(2) <= input(74); -- input 2 <= 24 * ref[2]
				                eq_input(3) <= input(117); -- input 3 <= 8 * ref[3]
				        when "110001"=>
				                eq_input(0) <= input(14); -- input 0 <= 8 * ref[0]
				                eq_input(1) <= input(43); -- input 1 <= 24 * ref[1]
				                eq_input(2) <= input(74); -- input 2 <= 24 * ref[2]
				                eq_input(3) <= input(117); -- input 3 <= 8 * ref[3]
				        when "110010"=>
				                eq_input(0) <= input(15); -- input 0 <= 7 * ref[0]
				                eq_input(1) <= input(59); -- input 1 <= 23 * ref[1]
				                eq_input(2) <= input(100); -- input 2 <= 25 * ref[2]
				                eq_input(3) <= input(118); -- input 3 <= 9 * ref[3]
				        when "110011"=>
				                eq_input(0) <= input(15); -- input 0 <= 7 * ref[0]
				                eq_input(1) <= input(59); -- input 1 <= 23 * ref[1]
				                eq_input(2) <= input(100); -- input 2 <= 25 * ref[2]
				                eq_input(3) <= input(118); -- input 3 <= 9 * ref[3]
				        when "110100"=>
				                eq_input(0) <= input(16); -- input 0 <= 6 * ref[0]
				                eq_input(1) <= input(60); -- input 1 <= 22 * ref[1]
				                eq_input(2) <= input(101); -- input 2 <= 26 * ref[2]
				                eq_input(3) <= input(119); -- input 3 <= 10 * ref[3]
				        when "110101"=>
				                eq_input(0) <= input(16); -- input 0 <= 6 * ref[0]
				                eq_input(1) <= input(60); -- input 1 <= 22 * ref[1]
				                eq_input(2) <= input(101); -- input 2 <= 26 * ref[2]
				                eq_input(3) <= input(119); -- input 3 <= 10 * ref[3]
				        when "110110"=>
				                eq_input(0) <= input(17); -- input 0 <= 5 * ref[0]
				                eq_input(1) <= input(61); -- input 1 <= 21 * ref[1]
				                eq_input(2) <= input(102); -- input 2 <= 27 * ref[2]
				                eq_input(3) <= input(120); -- input 3 <= 11 * ref[3]
				        when "110111"=>
				                eq_input(0) <= input(17); -- input 0 <= 5 * ref[0]
				                eq_input(1) <= input(61); -- input 1 <= 21 * ref[1]
				                eq_input(2) <= input(102); -- input 2 <= 27 * ref[2]
				                eq_input(3) <= input(120); -- input 3 <= 11 * ref[3]
				        when "111000"=>
				                eq_input(0) <= input(18); -- input 0 <= 4 * ref[0]
				                eq_input(1) <= input(44); -- input 1 <= 20 * ref[1]
				                eq_input(2) <= input(75); -- input 2 <= 28 * ref[2]
				                eq_input(3) <= input(121); -- input 3 <= 12 * ref[3]
				        when "111001"=>
				                eq_input(0) <= input(18); -- input 0 <= 4 * ref[0]
				                eq_input(1) <= input(44); -- input 1 <= 20 * ref[1]
				                eq_input(2) <= input(75); -- input 2 <= 28 * ref[2]
				                eq_input(3) <= input(121); -- input 3 <= 12 * ref[3]
				        when "111010"=>
				                eq_input(0) <= input(19); -- input 0 <= 3 * ref[0]
				                eq_input(1) <= input(62); -- input 1 <= 19 * ref[1]
				                eq_input(2) <= input(76); -- input 2 <= 29 * ref[2]
				                eq_input(3) <= input(122); -- input 3 <= 13 * ref[3]
				        when "111011"=>
				                eq_input(0) <= input(19); -- input 0 <= 3 * ref[0]
				                eq_input(1) <= input(62); -- input 1 <= 19 * ref[1]
				                eq_input(2) <= input(76); -- input 2 <= 29 * ref[2]
				                eq_input(3) <= input(122); -- input 3 <= 13 * ref[3]
				        when "111100"=>
				                eq_input(0) <= input(20); -- input 0 <= 2 * ref[0]
				                eq_input(1) <= input(45); -- input 1 <= 18 * ref[1]
				                eq_input(2) <= input(77); -- input 2 <= 30 * ref[2]
				                eq_input(3) <= input(123); -- input 3 <= 14 * ref[3]
				        when "111101"=>
				                eq_input(0) <= input(20); -- input 0 <= 2 * ref[0]
				                eq_input(1) <= input(45); -- input 1 <= 18 * ref[1]
				                eq_input(2) <= input(77); -- input 2 <= 30 * ref[2]
				                eq_input(3) <= input(123); -- input 3 <= 14 * ref[3]
				        when "111110"=>
				                eq_input(0) <= input(21); -- input 0 <= 1 * ref[0]
				                eq_input(1) <= input(63); -- input 1 <= 17 * ref[1]
				                eq_input(2) <= input(103); -- input 2 <= 31 * ref[2]
				                eq_input(3) <= input(124); -- input 3 <= 15 * ref[3]
				        when "111111"=>
				                eq_input(0) <= input(21); -- input 0 <= 1 * ref[0]
				                eq_input(1) <= input(63); -- input 1 <= 17 * ref[1]
				                eq_input(2) <= input(103); -- input 2 <= 31 * ref[2]
				                eq_input(3) <= input(124); -- input 3 <= 15 * ref[3]
				        when others => -- default case for not using latch
				                eq_input(0) <= "0000000000000000";
				                eq_input(1) <= "0000000000000000";
				                eq_input(2) <= "0000000000000000";
				                eq_input(3) <= "0000000000000000";
					end if;
		  		end case;
		  end process;
END comportamental;