-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
-----------------------------------------------

package mode_in_out is
	type sample_bus is array(integer range <>) of std_logic_vector ( 7 downto 0);
end package mode_in_out;