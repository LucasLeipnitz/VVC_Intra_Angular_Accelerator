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
		ref : IN sample_bus (0 to 66 );
		pred: OUT sample_bus (0 to 63 )
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
type t_eq_input is array (0 to 63) of t_row;
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
		r0: rom
		PORT MAP (rst => rst, clk => clk, address => address, data_1 => const(0), data_2 => const(1), data_3 => const(2), data_4 => const(3) );
 
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
					eq_input(i)(0) <= std_logic_vector(to_signed(to_integer(unsigned(ref(i))) * to_integer(signed(const(0))), 16));
					eq_input(i)(1) <= std_logic_vector(to_signed(to_integer(unsigned(ref(i + 1))) * to_integer(signed(const(1))), 16));
					eq_input(i)(2) <= std_logic_vector(to_signed(to_integer(unsigned(ref(i + 2))) * to_integer(signed(const(2))), 16));
					eq_input(i)(3) <= std_logic_vector(to_signed(to_integer(unsigned(ref(i + 3))) * to_integer(signed(const(3))), 16));
				end loop;
			end if;
		end process;
	
END comportamental;