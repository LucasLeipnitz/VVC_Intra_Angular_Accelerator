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
		ref : IN ref_bus (0 to 3 );
		pred: OUT std_logic_vector(7 downto 0)
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
                Y1, -- Y1 = ref[1]*53
                Y2, -- Y2 = ref[1]*18
                Y3, -- Y3 = ref[1]*28
                Y4 : out std_logic_vector ( 15 downto 0 ) -- Y4 = ref[1]*20
        );
END COMPONENT;

COMPONENT MCM_2
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[2]*16
                Y2, -- Y2 = ref[2]*51
                Y3, -- Y3 = ref[2]*19
                Y4 : out std_logic_vector ( 15 downto 0 ) -- Y4 = ref[2]*27
        );
END COMPONENT;

COMPONENT MCM_3
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[3]*-2
                Y2, -- Y2 = ref[3]*-3
                Y3, -- Y3 = ref[3]*3
                Y4 : out std_logic_vector ( 15 downto 0 ) -- Y4 = ref[3]*11
        );
END COMPONENT;


COMPONENT equation_block
	PORT (
			input_0, input_1, input_2, input_3 : in std_logic_vector ( 15 downto 0 );
			output : out std_logic_vector ( 7 downto 0 )
	);
END COMPONENT;

type t_input is array (0 to 31) of std_logic_vector( 15 downto 0);
type t_eq_input is array (0 to 3) of std_logic_vector( 15 downto 0);
signal 	input : t_input;
signal 	eq_input : t_eq_input;

BEGIN
		eq:	equation_block
		PORT MAP ( input_0 => eq_input(0), input_1 => eq_input(1), input_2 => eq_input(2), input_3 => eq_input(3), output => pred );
		m0 : MCM_0
        PORT MAP ( X => ref(0), Y1 => input(0), Y2 => input(1), Y3 => input(2), Y4 => input(3) );
        m1 : MCM_1
        PORT MAP ( X => ref(1), Y1 => input(4), Y2 => input(5), Y3 => input(6), Y4 => input(7) );
        m2 : MCM_2
        PORT MAP ( X => ref(2), Y1 => input(8), Y2 => input(9), Y3 => input(10), Y4 => input(11) );
        m3 : MCM_3
        PORT MAP ( X => ref(3), Y1 => input(12), Y2 => input(13), Y3 => input(14), Y4 => input(15) );
 
		process (rst, clk)
		begin
			if rst = '1' then
				eq_input(0) <= "0000000000000000";
				eq_input(1) <= "0000000000000000";
				eq_input(2) <= "0000000000000000";
				eq_input(3) <= "0000000000000000";
			elsif clk'event and clk = '1' then
			    case control is
			        when "00"=>
			                eq_input(0) <= input(0); -- input 0 <= -3 * ref[0]
			                eq_input(1) <= input(4); -- input 1 <= 53 * ref[1]
			                eq_input(2) <= input(8); -- input 2 <= 16 * ref[2]
			                eq_input(3) <= input(12); -- input 3 <= -2 * ref[3]
			        when "01"=>
			                eq_input(0) <= input(1); -- input 0 <= -2 * ref[0]
			                eq_input(1) <= input(5); -- input 1 <= 18 * ref[1]
			                eq_input(2) <= input(9); -- input 2 <= 51 * ref[2]
			                eq_input(3) <= input(13); -- input 3 <= -3 * ref[3]
			        when "10"=>
			                eq_input(0) <= input(2); -- input 0 <= 12 * ref[0]
			                eq_input(1) <= input(6); -- input 1 <= 28 * ref[1]
			                eq_input(2) <= input(10); -- input 2 <= 19 * ref[2]
			                eq_input(3) <= input(14); -- input 3 <= 3 * ref[3]
			        when "11"=>
			                eq_input(0) <= input(3); -- input 0 <= 4 * ref[0]
			                eq_input(1) <= input(7); -- input 1 <= 20 * ref[1]
			                eq_input(2) <= input(11); -- input 2 <= 27 * ref[2]
			                eq_input(3) <= input(15); -- input 3 <= 11 * ref[3]
			        when others => -- default case for not using latch
			                eq_input(0) <= "0000000000000000";
			                eq_input(1) <= "0000000000000000";
			                eq_input(2) <= "0000000000000000";
			                eq_input(3) <= "0000000000000000";
			  	end case;
			end if;
		end process;
END comportamental;