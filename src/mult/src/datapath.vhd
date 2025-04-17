-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.mode_in_out.all;
-----------------------------------------------

ENTITY datapath IS
	PORT (
		clk : IN std_logic;
		rst : IN  std_logic;
		ref : IN ref_bus (0 to 3 );
		address : IN std_logic_vector(5 downto 0);
		pred: OUT std_logic_vector(7 downto 0)
	);
END datapath;

ARCHITECTURE comportamental OF datapath IS


COMPONENT equation_block
	PORT (	
			input_0, input_1, input_2, input_3 : in std_logic_vector ( 15 downto 0 );
			output : out std_logic_vector ( 7 downto 0 )
	);
END COMPONENT;

COMPONENT rom
	PORT ( 
		  rst : IN std_logic;
  		  clk : IN std_logic;
		  address : IN std_logic_vector(5 downto 0);
		  data_1 : OUT std_logic_vector(7 downto 0);
		  data_2 : OUT std_logic_vector(7 downto 0);
		  data_3 : OUT std_logic_vector(7 downto 0);
		  data_4 : OUT std_logic_vector(7 downto 0)
  );
END COMPONENT;


type t_eq_input is array (0 to 3) of std_logic_vector( 15 downto 0);
signal eq_input : t_eq_input;
signal const : ref_bus (0 to 3 );

BEGIN
		eq:	equation_block
		PORT MAP (input_0 => eq_input(0), input_1 => eq_input(1), input_2 => eq_input(2), input_3 => eq_input(3), output => pred );
		r: rom
		PORT MAP (rst => rst, clk => clk, address => address, data_1 => const(0), data_2 => const(1), data_3 => const(2), data_4 => const(3) );
 
		process (clk)
		begin
			if rst = '1' then
				eq_input(0) <= "0000000000000000";
				eq_input(1) <= "0000000000000000";
				eq_input(2) <= "0000000000000000";
				eq_input(3) <= "0000000000000000";
			elsif clk'event and clk = '1' then
                eq_input(0) <= std_logic_vector(to_signed(to_integer(unsigned(ref(0))) * to_integer(signed(const(0))), 16));
                eq_input(1) <= std_logic_vector(to_signed(to_integer(unsigned(ref(1))) * to_integer(signed(const(1))), 16));
                eq_input(2) <= std_logic_vector(to_signed(to_integer(unsigned(ref(2))) * to_integer(signed(const(2))), 16));
                eq_input(3) <= std_logic_vector(to_signed(to_integer(unsigned(ref(3))) * to_integer(signed(const(3))), 16));
			end if;
		end process;
	
END comportamental;