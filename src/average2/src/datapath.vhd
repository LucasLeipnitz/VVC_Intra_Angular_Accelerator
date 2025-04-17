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
		control : IN std_logic_vector(4 downto 0);
		ref : IN ref_bus (0 to 3 );
		pred: OUT std_logic_vector(7 downto 0)
	);
END datapath;

ARCHITECTURE comportamental OF datapath IS


COMPONENT MCM_0
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[0]*-2
                Y2, -- Y2 = ref[0]*-4
                Y3, -- Y3 = ref[0]*-6
                Y4, -- Y4 = ref[0]*-5
                Y5, -- Y5 = ref[0]*-3
                Y6, -- Y6 = ref[0]*-1
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
                Y1, -- Y1 = ref[1]*63
                Y2, -- Y2 = ref[1]*61
                Y3, -- Y3 = ref[1]*57
                Y4, -- Y4 = ref[1]*55
                Y5, -- Y5 = ref[1]*53
                Y6, -- Y6 = ref[1]*50
                Y7, -- Y7 = ref[1]*45
                Y8, -- Y8 = ref[1]*40
                Y9, -- Y9 = ref[1]*34
                Y10, -- Y10 = ref[1]*29
                Y11, -- Y11 = ref[1]*26
                Y12, -- Y12 = ref[1]*19
                Y13, -- Y13 = ref[1]*15
                Y14, -- Y14 = ref[1]*13
                Y15, -- Y15 = ref[1]*8
                Y16, -- Y16 = ref[1]*3
                Y17, -- Y17 = ref[1]*32
                Y18, -- Y18 = ref[1]*31
                Y19, -- Y19 = ref[1]*30
                Y20, -- Y20 = ref[1]*28
                Y21, -- Y21 = ref[1]*27
                Y22, -- Y22 = ref[1]*25
                Y23, -- Y23 = ref[1]*24
                Y24, -- Y24 = ref[1]*23
                Y25, -- Y25 = ref[1]*22
                Y26, -- Y26 = ref[1]*21
                Y27, -- Y27 = ref[1]*20
                Y28, -- Y28 = ref[1]*18
                Y29 : out std_logic_vector ( 15 downto 0 ) -- Y29 = ref[1]*17
        );
END COMPONENT;

COMPONENT MCM_2
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[2]*1
                Y2, -- Y2 = ref[2]*5
                Y3, -- Y3 = ref[2]*11
                Y4, -- Y4 = ref[2]*14
                Y5, -- Y5 = ref[2]*17
                Y6, -- Y6 = ref[2]*22
                Y7, -- Y7 = ref[2]*28
                Y8, -- Y8 = ref[2]*31
                Y9, -- Y9 = ref[2]*37
                Y10, -- Y10 = ref[2]*43
                Y11, -- Y11 = ref[2]*47
                Y12, -- Y12 = ref[2]*52
                Y13, -- Y13 = ref[2]*54
                Y14, -- Y14 = ref[2]*56
                Y15, -- Y15 = ref[2]*59
                Y16, -- Y16 = ref[2]*62
                Y17, -- Y17 = ref[2]*16
                Y18, -- Y18 = ref[2]*18
                Y19, -- Y19 = ref[2]*19
                Y20, -- Y20 = ref[2]*20
                Y21, -- Y21 = ref[2]*21
                Y22, -- Y22 = ref[2]*23
                Y23, -- Y23 = ref[2]*24
                Y24, -- Y24 = ref[2]*25
                Y25, -- Y25 = ref[2]*26
                Y26, -- Y26 = ref[2]*27
                Y27, -- Y27 = ref[2]*29
                Y28 : out std_logic_vector ( 15 downto 0 ) -- Y28 = ref[2]*30
        );
END COMPONENT;

COMPONENT MCM_3
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[3]*-2
                Y2, -- Y2 = ref[3]*-4
                Y3, -- Y3 = ref[3]*-6
                Y4, -- Y4 = ref[3]*-5
                Y5, -- Y5 = ref[3]*-3
                Y6, -- Y6 = ref[3]*-1
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

type t_input is array (0 to 99) of std_logic_vector( 15 downto 0);
type t_eq_input is array (0 to 3) of std_logic_vector( 15 downto 0);
signal 	input : t_input;
signal 	eq_input : t_eq_input;

BEGIN
		eq:	equation_block
		PORT MAP ( input_0 => eq_input(0), input_1 => eq_input(1), input_2 => eq_input(2), input_3 => eq_input(3), output => pred );
		m0 : MCM_0
        PORT MAP ( X => ref(0), Y1 => input(0), Y2 => input(1), Y3 => input(2), Y4 => input(3), Y5 => input(4), Y6 => input(5), Y7 => input(6), Y8 => input(7), Y9 => input(8), Y10 => input(9), Y11 => input(10), Y12 => input(11), Y13 => input(12), Y14 => input(13), Y15 => input(14), Y16 => input(15), Y17 => input(16), Y18 => input(17), Y19 => input(18), Y20 => input(19), Y21 => input(20), Y22 => input(21) );
        m1 : MCM_1
        PORT MAP ( X => ref(1), Y1 => input(22), Y2 => input(23), Y3 => input(24), Y4 => input(25), Y5 => input(26), Y6 => input(27), Y7 => input(28), Y8 => input(29), Y9 => input(30), Y10 => input(31), Y11 => input(32), Y12 => input(33), Y13 => input(34), Y14 => input(35), Y15 => input(36), Y16 => input(37), Y17 => input(38), Y18 => input(39), Y19 => input(40), Y20 => input(41), Y21 => input(42), Y22 => input(43), Y23 => input(44), Y24 => input(45), Y25 => input(46), Y26 => input(47), Y27 => input(48), Y28 => input(49), Y29 => input(50) );
        m2 : MCM_2
        PORT MAP ( X => ref(2), Y1 => input(51), Y2 => input(52), Y3 => input(53), Y4 => input(54), Y5 => input(55), Y6 => input(56), Y7 => input(57), Y8 => input(58), Y9 => input(59), Y10 => input(60), Y11 => input(61), Y12 => input(62), Y13 => input(63), Y14 => input(64), Y15 => input(65), Y16 => input(66), Y17 => input(67), Y18 => input(68), Y19 => input(69), Y20 => input(70), Y21 => input(71), Y22 => input(72), Y23 => input(73), Y24 => input(74), Y25 => input(75), Y26 => input(76), Y27 => input(77), Y28 => input(78) );
        m3 : MCM_3
        PORT MAP ( X => ref(3), Y1 => input(79), Y2 => input(80), Y3 => input(81), Y4 => input(82), Y5 => input(83), Y6 => input(84), Y7 => input(85), Y8 => input(86), Y9 => input(87), Y10 => input(88), Y11 => input(89), Y12 => input(90), Y13 => input(91), Y14 => input(92), Y15 => input(93), Y16 => input(94), Y17 => input(95), Y18 => input(96), Y19 => input(97), Y20 => input(98), Y21 => input(99) );
 
		process (rst, clk)
			begin
				if rst = '1' then
					eq_input(0) <= "0000000000000000";
					eq_input(1) <= "0000000000000000";
					eq_input(2) <= "0000000000000000";
					eq_input(3) <= "0000000000000000";
				elsif clk'event and clk = '1' then
			    	case control is
				        when "00000"=>
				                eq_input(0) <= "0000000000000000"; -- input 0 <= 0 * ref[0]
				                eq_input(1) <= input(22); -- input 1 <= 63 * ref[1]
				                eq_input(2) <= input(51); -- input 2 <= 1 * ref[2]
				                eq_input(3) <= "0000000000000000"; -- input 3 <= 0 * ref[3]
				        when "00001"=>
				                eq_input(0) <= input(0); -- input 0 <= -2 * ref[0]
				                eq_input(1) <= input(23); -- input 1 <= 61 * ref[1]
				                eq_input(2) <= input(52); -- input 2 <= 5 * ref[2]
				                eq_input(3) <= "0000000000000000"; -- input 3 <= 0 * ref[3]
				        when "00010"=>
				                eq_input(0) <= input(0); -- input 0 <= -2 * ref[0]
				                eq_input(1) <= input(24); -- input 1 <= 57 * ref[1]
				                eq_input(2) <= input(53); -- input 2 <= 11 * ref[2]
				                eq_input(3) <= input(79); -- input 3 <= -2 * ref[3]
				        when "00011"=>
				                eq_input(0) <= input(1); -- input 0 <= -4 * ref[0]
				                eq_input(1) <= input(25); -- input 1 <= 55 * ref[1]
				                eq_input(2) <= input(54); -- input 2 <= 14 * ref[2]
				                eq_input(3) <= input(79); -- input 3 <= -2 * ref[3]
				        when "00100"=>
				                eq_input(0) <= input(1); -- input 0 <= -4 * ref[0]
				                eq_input(1) <= input(26); -- input 1 <= 53 * ref[1]
				                eq_input(2) <= input(55); -- input 2 <= 17 * ref[2]
				                eq_input(3) <= input(79); -- input 3 <= -2 * ref[3]
				        when "00101"=>
				                eq_input(0) <= input(2); -- input 0 <= -6 * ref[0]
				                eq_input(1) <= input(27); -- input 1 <= 50 * ref[1]
				                eq_input(2) <= input(56); -- input 2 <= 22 * ref[2]
				                eq_input(3) <= input(79); -- input 3 <= -2 * ref[3]
				        when "00110"=>
				                eq_input(0) <= input(3); -- input 0 <= -5 * ref[0]
				                eq_input(1) <= input(28); -- input 1 <= 45 * ref[1]
				                eq_input(2) <= input(57); -- input 2 <= 28 * ref[2]
				                eq_input(3) <= input(80); -- input 3 <= -4 * ref[3]
				        when "00111"=>
				                eq_input(0) <= input(1); -- input 0 <= -4 * ref[0]
				                eq_input(1) <= input(29); -- input 1 <= 40 * ref[1]
				                eq_input(2) <= input(58); -- input 2 <= 31 * ref[2]
				                eq_input(3) <= input(80); -- input 3 <= -4 * ref[3]
				        when "01000"=>
				                eq_input(0) <= input(1); -- input 0 <= -4 * ref[0]
				                eq_input(1) <= input(30); -- input 1 <= 34 * ref[1]
				                eq_input(2) <= input(59); -- input 2 <= 37 * ref[2]
				                eq_input(3) <= input(80); -- input 3 <= -4 * ref[3]
				        when "01001"=>
				                eq_input(0) <= input(1); -- input 0 <= -4 * ref[0]
				                eq_input(1) <= input(31); -- input 1 <= 29 * ref[1]
				                eq_input(2) <= input(60); -- input 2 <= 43 * ref[2]
				                eq_input(3) <= input(80); -- input 3 <= -4 * ref[3]
				        when "01010"=>
				                eq_input(0) <= input(4); -- input 0 <= -3 * ref[0]
				                eq_input(1) <= input(32); -- input 1 <= 26 * ref[1]
				                eq_input(2) <= input(61); -- input 2 <= 47 * ref[2]
				                eq_input(3) <= input(81); -- input 3 <= -6 * ref[3]
				        when "01011"=>
				                eq_input(0) <= input(0); -- input 0 <= -2 * ref[0]
				                eq_input(1) <= input(33); -- input 1 <= 19 * ref[1]
				                eq_input(2) <= input(62); -- input 2 <= 52 * ref[2]
				                eq_input(3) <= input(82); -- input 3 <= -5 * ref[3]
				        when "01100"=>
				                eq_input(0) <= input(0); -- input 0 <= -2 * ref[0]
				                eq_input(1) <= input(34); -- input 1 <= 15 * ref[1]
				                eq_input(2) <= input(63); -- input 2 <= 54 * ref[2]
				                eq_input(3) <= input(80); -- input 3 <= -4 * ref[3]
				        when "01101"=>
				                eq_input(0) <= input(0); -- input 0 <= -2 * ref[0]
				                eq_input(1) <= input(35); -- input 1 <= 13 * ref[1]
				                eq_input(2) <= input(64); -- input 2 <= 56 * ref[2]
				                eq_input(3) <= input(83); -- input 3 <= -3 * ref[3]
				        when "01110"=>
				                eq_input(0) <= input(5); -- input 0 <= -1 * ref[0]
				                eq_input(1) <= input(36); -- input 1 <= 8 * ref[1]
				                eq_input(2) <= input(65); -- input 2 <= 59 * ref[2]
				                eq_input(3) <= input(79); -- input 3 <= -2 * ref[3]
				        when "01111"=>
				                eq_input(0) <= "0000000000000000"; -- input 0 <= 0 * ref[0]
				                eq_input(1) <= input(37); -- input 1 <= 3 * ref[1]
				                eq_input(2) <= input(66); -- input 2 <= 62 * ref[2]
				                eq_input(3) <= input(84); -- input 3 <= -1 * ref[3]
				        when "10000"=>
				                eq_input(0) <= input(6); -- input 0 <= 16 * ref[0]
				                eq_input(1) <= input(38); -- input 1 <= 32 * ref[1]
				                eq_input(2) <= input(67); -- input 2 <= 16 * ref[2]
				                eq_input(3) <= "0000000000000000"; -- input 3 <= 0 * ref[3]
				        when "10001"=>
				                eq_input(0) <= input(7); -- input 0 <= 15 * ref[0]
				                eq_input(1) <= input(39); -- input 1 <= 31 * ref[1]
				                eq_input(2) <= input(55); -- input 2 <= 17 * ref[2]
				                eq_input(3) <= input(85); -- input 3 <= 1 * ref[3]
				        when "10010"=>
				                eq_input(0) <= input(8); -- input 0 <= 14 * ref[0]
				                eq_input(1) <= input(40); -- input 1 <= 30 * ref[1]
				                eq_input(2) <= input(68); -- input 2 <= 18 * ref[2]
				                eq_input(3) <= input(86); -- input 3 <= 2 * ref[3]
				        when "10011"=>
				                eq_input(0) <= input(9); -- input 0 <= 13 * ref[0]
				                eq_input(1) <= input(31); -- input 1 <= 29 * ref[1]
				                eq_input(2) <= input(69); -- input 2 <= 19 * ref[2]
				                eq_input(3) <= input(87); -- input 3 <= 3 * ref[3]
				        when "10100"=>
				                eq_input(0) <= input(10); -- input 0 <= 12 * ref[0]
				                eq_input(1) <= input(41); -- input 1 <= 28 * ref[1]
				                eq_input(2) <= input(70); -- input 2 <= 20 * ref[2]
				                eq_input(3) <= input(88); -- input 3 <= 4 * ref[3]
				        when "10101"=>
				                eq_input(0) <= input(11); -- input 0 <= 11 * ref[0]
				                eq_input(1) <= input(42); -- input 1 <= 27 * ref[1]
				                eq_input(2) <= input(71); -- input 2 <= 21 * ref[2]
				                eq_input(3) <= input(89); -- input 3 <= 5 * ref[3]
				        when "10110"=>
				                eq_input(0) <= input(12); -- input 0 <= 10 * ref[0]
				                eq_input(1) <= input(32); -- input 1 <= 26 * ref[1]
				                eq_input(2) <= input(56); -- input 2 <= 22 * ref[2]
				                eq_input(3) <= input(90); -- input 3 <= 6 * ref[3]
				        when "10111"=>
				                eq_input(0) <= input(13); -- input 0 <= 9 * ref[0]
				                eq_input(1) <= input(43); -- input 1 <= 25 * ref[1]
				                eq_input(2) <= input(72); -- input 2 <= 23 * ref[2]
				                eq_input(3) <= input(91); -- input 3 <= 7 * ref[3]
				        when "11000"=>
				                eq_input(0) <= input(14); -- input 0 <= 8 * ref[0]
				                eq_input(1) <= input(44); -- input 1 <= 24 * ref[1]
				                eq_input(2) <= input(73); -- input 2 <= 24 * ref[2]
				                eq_input(3) <= input(92); -- input 3 <= 8 * ref[3]
				        when "11001"=>
				                eq_input(0) <= input(15); -- input 0 <= 7 * ref[0]
				                eq_input(1) <= input(45); -- input 1 <= 23 * ref[1]
				                eq_input(2) <= input(74); -- input 2 <= 25 * ref[2]
				                eq_input(3) <= input(93); -- input 3 <= 9 * ref[3]
				        when "11010"=>
				                eq_input(0) <= input(16); -- input 0 <= 6 * ref[0]
				                eq_input(1) <= input(46); -- input 1 <= 22 * ref[1]
				                eq_input(2) <= input(75); -- input 2 <= 26 * ref[2]
				                eq_input(3) <= input(94); -- input 3 <= 10 * ref[3]
				        when "11011"=>
				                eq_input(0) <= input(17); -- input 0 <= 5 * ref[0]
				                eq_input(1) <= input(47); -- input 1 <= 21 * ref[1]
				                eq_input(2) <= input(76); -- input 2 <= 27 * ref[2]
				                eq_input(3) <= input(95); -- input 3 <= 11 * ref[3]
				        when "11100"=>
				                eq_input(0) <= input(18); -- input 0 <= 4 * ref[0]
				                eq_input(1) <= input(48); -- input 1 <= 20 * ref[1]
				                eq_input(2) <= input(57); -- input 2 <= 28 * ref[2]
				                eq_input(3) <= input(96); -- input 3 <= 12 * ref[3]
				        when "11101"=>
				                eq_input(0) <= input(19); -- input 0 <= 3 * ref[0]
				                eq_input(1) <= input(33); -- input 1 <= 19 * ref[1]
				                eq_input(2) <= input(77); -- input 2 <= 29 * ref[2]
				                eq_input(3) <= input(97); -- input 3 <= 13 * ref[3]
				        when "11110"=>
				                eq_input(0) <= input(20); -- input 0 <= 2 * ref[0]
				                eq_input(1) <= input(49); -- input 1 <= 18 * ref[1]
				                eq_input(2) <= input(78); -- input 2 <= 30 * ref[2]
				                eq_input(3) <= input(98); -- input 3 <= 14 * ref[3]
				        when "11111"=>
				                eq_input(0) <= input(21); -- input 0 <= 1 * ref[0]
				                eq_input(1) <= input(50); -- input 1 <= 17 * ref[1]
				                eq_input(2) <= input(58); -- input 2 <= 31 * ref[2]
				                eq_input(3) <= input(99); -- input 3 <= 15 * ref[3]
				        when others => -- default case for not using latch
				                eq_input(0) <= "0000000000000000";
				                eq_input(1) <= "0000000000000000";
				                eq_input(2) <= "0000000000000000";
				                eq_input(3) <= "0000000000000000";
					end case;
		  		end if;
		  end process;
END comportamental;