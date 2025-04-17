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
		address : IN std_logic_vector(5 downto 0);
		ref : IN sample_bus (0 to 18 );
		pred: OUT sample_bus (0 to 15 )
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


type t_row is array (0 to 3) of std_logic_vector( 15 downto 0);
type t_const is array (0 to 3) of std_logic_vector( 7 downto 0);
type t_eq_input is array (0 to 15) of t_row;
signal eq_input : t_eq_input;
signal const : t_const;

BEGIN
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
		r0: rom
		PORT MAP (rst => rst, clk => clk, address => address, data_1 => const(0), data_2 => const(1), data_3 => const(2), data_4 => const(3) );
 
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
					eq_input(i)(0) <= std_logic_vector(to_signed(to_integer(unsigned(ref(i))) * to_integer(signed(const(0))), 16));
					eq_input(i)(1) <= std_logic_vector(to_signed(to_integer(unsigned(ref(i + 1))) * to_integer(signed(const(1))), 16));
					eq_input(i)(2) <= std_logic_vector(to_signed(to_integer(unsigned(ref(i + 2))) * to_integer(signed(const(2))), 16));
					eq_input(i)(3) <= std_logic_vector(to_signed(to_integer(unsigned(ref(i + 3))) * to_integer(signed(const(3))), 16));
				end loop;
			end if;
		end process;
	
END comportamental;