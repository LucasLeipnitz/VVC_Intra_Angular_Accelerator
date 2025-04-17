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
		control : IN std_logic_vector(3 downto 0);
		ref : IN ref_bus (0 to 3 );
		pred: OUT std_logic_vector(7 downto 0)
	);
END datapath;

ARCHITECTURE comportamental OF datapath IS


COMPONENT MCM_0
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[0]*-1
                Y2, -- Y2 = ref[0]*-3
                Y3, -- Y3 = ref[0]*-5
                Y4, -- Y4 = ref[0]*-4
                Y5, -- Y5 = ref[0]*-2
                Y6, -- Y6 = ref[0]*15
                Y7, -- Y7 = ref[0]*13
                Y8, -- Y8 = ref[0]*11
                Y9, -- Y9 = ref[0]*9
                Y10, -- Y10 = ref[0]*7
                Y11, -- Y11 = ref[0]*5
                Y12, -- Y12 = ref[0]*3
                Y13 : out std_logic_vector ( 15 downto 0 ) -- Y13 = ref[0]*1
        );
END COMPONENT;

COMPONENT MCM_1
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[1]*62
                Y2, -- Y2 = ref[1]*56
                Y3, -- Y3 = ref[1]*52
                Y4, -- Y4 = ref[1]*42
                Y5, -- Y5 = ref[1]*32
                Y6, -- Y6 = ref[1]*22
                Y7, -- Y7 = ref[1]*14
                Y8, -- Y8 = ref[1]*5
                Y9, -- Y9 = ref[1]*31
                Y10, -- Y10 = ref[1]*29
                Y11, -- Y11 = ref[1]*27
                Y12, -- Y12 = ref[1]*25
                Y13, -- Y13 = ref[1]*23
                Y14, -- Y14 = ref[1]*21
                Y15, -- Y15 = ref[1]*19
                Y16 : out std_logic_vector ( 15 downto 0 ) -- Y16 = ref[1]*17
        );
END COMPONENT;

COMPONENT MCM_2
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[2]*3
                Y2, -- Y2 = ref[2]*12
                Y3, -- Y3 = ref[2]*19
                Y4, -- Y4 = ref[2]*30
                Y5, -- Y5 = ref[2]*40
                Y6, -- Y6 = ref[2]*50
                Y7, -- Y7 = ref[2]*55
                Y8, -- Y8 = ref[2]*60
                Y9, -- Y9 = ref[2]*16
                Y10, -- Y10 = ref[2]*18
                Y11, -- Y11 = ref[2]*20
                Y12, -- Y12 = ref[2]*22
                Y13, -- Y13 = ref[2]*24
                Y14, -- Y14 = ref[2]*26
                Y15 : out std_logic_vector ( 15 downto 0 ) -- Y15 = ref[2]*28
        );
END COMPONENT;

COMPONENT MCM_3
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[3]*-2
                Y2, -- Y2 = ref[3]*-4
                Y3, -- Y3 = ref[3]*-5
                Y4, -- Y4 = ref[3]*-3
                Y5, -- Y5 = ref[3]*-1
                Y6, -- Y6 = ref[3]*2
                Y7, -- Y7 = ref[3]*4
                Y8, -- Y8 = ref[3]*6
                Y9, -- Y9 = ref[3]*8
                Y10, -- Y10 = ref[3]*10
                Y11, -- Y11 = ref[3]*12
                Y12 : out std_logic_vector ( 15 downto 0 ) -- Y12 = ref[3]*14
        );
END COMPONENT;


COMPONENT equation_block
	PORT (
			input_0, input_1, input_2, input_3 : in std_logic_vector ( 15 downto 0 );
			output : out std_logic_vector ( 7 downto 0 )
	);
END COMPONENT;

type t_input is array (0 to 55) of std_logic_vector( 15 downto 0);
type t_eq_input is array (0 to 3) of std_logic_vector( 15 downto 0);
signal 	input : t_input;
signal 	eq_input : t_eq_input;

BEGIN
		eq:	equation_block
		PORT MAP ( input_0 => eq_input(0), input_1 => eq_input(1), input_2 => eq_input(2), input_3 => eq_input(3), output => pred );
		 m0 : MCM_0
        PORT MAP ( X => ref(0), Y1 => input(0), Y2 => input(1), Y3 => input(2), Y4 => input(3), Y5 => input(4), Y6 => input(5), Y7 => input(6), Y8 => input(7), Y9 => input(8), Y10 => input(9), Y11 => input(10), Y12 => input(11), Y13 => input(12) );
        m1 : MCM_1
        PORT MAP ( X => ref(1), Y1 => input(13), Y2 => input(14), Y3 => input(15), Y4 => input(16), Y5 => input(17), Y6 => input(18), Y7 => input(19), Y8 => input(20), Y9 => input(21), Y10 => input(22), Y11 => input(23), Y12 => input(24), Y13 => input(25), Y14 => input(26), Y15 => input(27), Y16 => input(28) );
        m2 : MCM_2
        PORT MAP ( X => ref(2), Y1 => input(29), Y2 => input(30), Y3 => input(31), Y4 => input(32), Y5 => input(33), Y6 => input(34), Y7 => input(35), Y8 => input(36), Y9 => input(37), Y10 => input(38), Y11 => input(39), Y12 => input(40), Y13 => input(41), Y14 => input(42), Y15 => input(43) );
        m3 : MCM_3
        PORT MAP ( X => ref(3), Y1 => input(44), Y2 => input(45), Y3 => input(46), Y4 => input(47), Y5 => input(48), Y6 => input(49), Y7 => input(50), Y8 => input(51), Y9 => input(52), Y10 => input(53), Y11 => input(54), Y12 => input(55) );
 
		process (rst, clk)
		begin
			if rst = '1' then
					eq_input(0) <= "0000000000000000";
					eq_input(1) <= "0000000000000000";
					eq_input(2) <= "0000000000000000";
					eq_input(3) <= "0000000000000000";
				elsif clk'event and clk = '1' then
				    case control is
				        when "0000"=>
				                eq_input(0) <= input(0); -- input 0 <= -1 * ref[0]
				                eq_input(1) <= input(13); -- input 1 <= 62 * ref[1]
				                eq_input(2) <= input(29); -- input 2 <= 3 * ref[2]
				                eq_input(3) <= "0000000000000000"; -- input 3 <= 0 * ref[3]
				        when "0001"=>
				                eq_input(0) <= input(1); -- input 0 <= -3 * ref[0]
				                eq_input(1) <= input(14); -- input 1 <= 56 * ref[1]
				                eq_input(2) <= input(30); -- input 2 <= 12 * ref[2]
				                eq_input(3) <= input(44); -- input 3 <= -2 * ref[3]
				        when "0010"=>
				                eq_input(0) <= input(2); -- input 0 <= -5 * ref[0]
				                eq_input(1) <= input(15); -- input 1 <= 52 * ref[1]
				                eq_input(2) <= input(31); -- input 2 <= 19 * ref[2]
				                eq_input(3) <= input(44); -- input 3 <= -2 * ref[3]
				        when "0011"=>
				                eq_input(0) <= input(3); -- input 0 <= -4 * ref[0]
				                eq_input(1) <= input(16); -- input 1 <= 42 * ref[1]
				                eq_input(2) <= input(32); -- input 2 <= 30 * ref[2]
				                eq_input(3) <= input(45); -- input 3 <= -4 * ref[3]
				        when "0100"=>
				                eq_input(0) <= input(3); -- input 0 <= -4 * ref[0]
				                eq_input(1) <= input(17); -- input 1 <= 32 * ref[1]
				                eq_input(2) <= input(33); -- input 2 <= 40 * ref[2]
				                eq_input(3) <= input(45); -- input 3 <= -4 * ref[3]
				        when "0101"=>
				                eq_input(0) <= input(4); -- input 0 <= -2 * ref[0]
				                eq_input(1) <= input(18); -- input 1 <= 22 * ref[1]
				                eq_input(2) <= input(34); -- input 2 <= 50 * ref[2]
				                eq_input(3) <= input(46); -- input 3 <= -5 * ref[3]
				        when "0110"=>
				                eq_input(0) <= input(4); -- input 0 <= -2 * ref[0]
				                eq_input(1) <= input(19); -- input 1 <= 14 * ref[1]
				                eq_input(2) <= input(35); -- input 2 <= 55 * ref[2]
				                eq_input(3) <= input(47); -- input 3 <= -3 * ref[3]
				        when "0111"=>
				                eq_input(0) <= "0000000000000000"; -- input 0 <= 0 * ref[0]
				                eq_input(1) <= input(20); -- input 1 <= 5 * ref[1]
				                eq_input(2) <= input(36); -- input 2 <= 60 * ref[2]
				                eq_input(3) <= input(48); -- input 3 <= -1 * ref[3]
				        when "1000"=>
				                eq_input(0) <= input(5); -- input 0 <= 15 * ref[0]
				                eq_input(1) <= input(21); -- input 1 <= 31 * ref[1]
				                eq_input(2) <= input(37); -- input 2 <= 16 * ref[2]
				                eq_input(3) <= "0000000000000000"; -- input 3 <= 0 * ref[3]
				        when "1001"=>
				                eq_input(0) <= input(6); -- input 0 <= 13 * ref[0]
				                eq_input(1) <= input(22); -- input 1 <= 29 * ref[1]
				                eq_input(2) <= input(38); -- input 2 <= 18 * ref[2]
				                eq_input(3) <= input(49); -- input 3 <= 2 * ref[3]
				        when "1010"=>
				                eq_input(0) <= input(7); -- input 0 <= 11 * ref[0]
				                eq_input(1) <= input(23); -- input 1 <= 27 * ref[1]
				                eq_input(2) <= input(39); -- input 2 <= 20 * ref[2]
				                eq_input(3) <= input(50); -- input 3 <= 4 * ref[3]
				        when "1011"=>
				                eq_input(0) <= input(8); -- input 0 <= 9 * ref[0]
				                eq_input(1) <= input(24); -- input 1 <= 25 * ref[1]
				                eq_input(2) <= input(40); -- input 2 <= 22 * ref[2]
				                eq_input(3) <= input(51); -- input 3 <= 6 * ref[3]
				        when "1100"=>
				                eq_input(0) <= input(9); -- input 0 <= 7 * ref[0]
				                eq_input(1) <= input(25); -- input 1 <= 23 * ref[1]
				                eq_input(2) <= input(41); -- input 2 <= 24 * ref[2]
				                eq_input(3) <= input(52); -- input 3 <= 8 * ref[3]
				        when "1101"=>
				                eq_input(0) <= input(10); -- input 0 <= 5 * ref[0]
				                eq_input(1) <= input(26); -- input 1 <= 21 * ref[1]
				                eq_input(2) <= input(42); -- input 2 <= 26 * ref[2]
				                eq_input(3) <= input(53); -- input 3 <= 10 * ref[3]
				        when "1110"=>
				                eq_input(0) <= input(11); -- input 0 <= 3 * ref[0]
				                eq_input(1) <= input(27); -- input 1 <= 19 * ref[1]
				                eq_input(2) <= input(43); -- input 2 <= 28 * ref[2]
				                eq_input(3) <= input(54); -- input 3 <= 12 * ref[3]
				        when "1111"=>
				                eq_input(0) <= input(12); -- input 0 <= 1 * ref[0]
				                eq_input(1) <= input(28); -- input 1 <= 17 * ref[1]
				                eq_input(2) <= input(32); -- input 2 <= 30 * ref[2]
				                eq_input(3) <= input(55); -- input 3 <= 14 * ref[3]
				        when others => -- default case for not using latch
				                eq_input(0) <= "0000000000000000";
				                eq_input(1) <= "0000000000000000";
				                eq_input(2) <= "0000000000000000";
				                eq_input(3) <= "0000000000000000";
			  		end case;
				end if;
		  end process;
END comportamental;