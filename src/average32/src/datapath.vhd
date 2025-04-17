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
		control : IN std_logic;
		ref : IN ref_bus (0 to 3 );
		pred: OUT std_logic_vector(7 downto 0)
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
                Y1, -- Y1 = ref[1]*36
                Y2 : out std_logic_vector ( 15 downto 0 ) -- Y2 = ref[1]*24
        );
END COMPONENT;

COMPONENT MCM_2
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[2]*34
                Y2 : out std_logic_vector ( 15 downto 0 ) -- Y2 = ref[2]*23
        );
END COMPONENT;

COMPONENT MCM_3
        PORT (
                X : in std_logic_vector ( 7 downto 0 );
                Y1, -- Y1 = ref[3]*-3
                Y2 : out std_logic_vector ( 15 downto 0 ) -- Y2 = ref[3]*7
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
        PORT MAP ( X => ref(0), Y1 => input(0), Y2 => input(1) );
        m1 : MCM_1
        PORT MAP ( X => ref(1), Y1 => input(2), Y2 => input(3) );
        m2 : MCM_2
        PORT MAP ( X => ref(2), Y1 => input(4), Y2 => input(5) );
        m3 : MCM_3
        PORT MAP ( X => ref(3), Y1 => input(6), Y2 => input(7) );
 
		process (rst, clk)
		begin
			if rst = '1' then
					eq_input(0) <= "0000000000000000";
					eq_input(1) <= "0000000000000000";
					eq_input(2) <= "0000000000000000";
					eq_input(3) <= "0000000000000000";
				elsif clk'event and clk = '1' then
				    case control is
				        when '0' =>
				                eq_input(0) <= input(0); -- input 0 <= -3 * ref[0]
				                eq_input(1) <= input(2); -- input 1 <= 36 * ref[1]
				                eq_input(2) <= input(4); -- input 2 <= 34 * ref[2]
				                eq_input(3) <= input(6); -- input 3 <= -3 * ref[3]
				        when '1' =>
				                eq_input(0) <= input(1); -- input 0 <= 8 * ref[0]
				                eq_input(1) <= input(3); -- input 1 <= 24 * ref[1]
				                eq_input(2) <= input(5); -- input 2 <= 23 * ref[2]
				                eq_input(3) <= input(7); -- input 3 <= 7 * ref[3]
				        when others => -- default case for not using latch
				                eq_input(0) <= "0000000000000000";
				                eq_input(1) <= "0000000000000000";
				                eq_input(2) <= "0000000000000000";
				                eq_input(3) <= "0000000000000000";
			  		end case;
				end if;
		  end process;
END comportamental;