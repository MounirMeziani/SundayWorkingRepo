LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY MDmux IS
PORT(
--mux signals
mem_read : IN STD_LOGIC;
bus_mux_out : IN STD_LOGIC_VECTOR(31 downto 0);
mem_data_in : IN STD_LOGIC_VECTOR(31 downto 0);
mem_mux_out : BUFFER STD_LOGIC_VECTOR(31 downto 0));

END MDmux;

ARCHITECTURE description OF MDmux IS

BEGIN
mux : process(mem_read, mem_data_in,bus_mux_out)
begin

if mem_read = '1' then
mem_mux_out <= x"00000000";
mem_mux_out <= mem_data_in;
elsif mem_read = '0' then
mem_mux_out <= x"00000000";
mem_mux_out <= bus_mux_out;
end if;
end process;


END description;