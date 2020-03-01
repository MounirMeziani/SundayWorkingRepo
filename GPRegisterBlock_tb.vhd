LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.numeric_std.all;

ENTITY GPRegisterBlock_tb IS
END;

ARCHITECTURE GPRegisterBlock_tb_arch OF GPRegisterBlock_tb IS

SIGNAL R0_in_tb:   STD_LOGIC;
SIGNAL R1_in_tb:   STD_LOGIC;
SIGNAL R2_in_tb:   STD_LOGIC;
SIGNAL R3_in_tb:   STD_LOGIC;
SIGNAL R4_in_tb:   STD_LOGIC;
SIGNAL R5_in_tb:   STD_LOGIC;
SIGNAL R6_in_tb:   STD_LOGIC;
SIGNAL R7_in_tb:   STD_LOGIC;
SIGNAL R8_in_tb:   STD_LOGIC;
SIGNAL R9_in_tb:   STD_LOGIC;
SIGNAL R10_in_tb:   STD_LOGIC;
SIGNAL R11_in_tb:   STD_LOGIC;
SIGNAL R12_in_tb:   STD_LOGIC;
SIGNAL R13_in_tb:   STD_LOGIC;
SIGNAL R14_in_tb:   STD_LOGIC;
SIGNAL R15_in_tb:   STD_LOGIC;
SIGNAL clk_tb:   STD_LOGIC;
SIGNAL clr_tb:   STD_LOGIC;
SIGNAL d_tb:   STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL R0_busmuxin_tb:    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL R10_busmuxin_tb:    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL R11_busmuxin_tb:    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL R12_busmuxin_tb:    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL R13_busmuxin_tb:    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL R14_busmuxin_tb:    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL R15_busmuxin_tb:    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL R1_busmuxin_tb:    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL R2_busmuxin_tb:    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL R3_busmuxin_tb:    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL R4_busmuxin_tb:    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL R5_busmuxin_tb:    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL R6_busmuxin_tb:    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL R7_busmuxin_tb:    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL R8_busmuxin_tb:    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL R9_busmuxin_tb:    STD_LOGIC_VECTOR(31 DOWNTO 0);

TYPE State IS (default, one, two, three);
SIGNAL Present_state: State:= default;

COMPONENT GPRegisterBlock
PORT(
R0_in: IN STD_LOGIC;
R1_in:  IN STD_LOGIC;
R2_in: IN  STD_LOGIC;
R3_in: IN STD_LOGIC;
R4_in: IN STD_LOGIC;
R5_in:  IN STD_LOGIC;
R6_in: IN  STD_LOGIC;
R7_in: IN  STD_LOGIC;
R8_in: IN  STD_LOGIC;
R9_in: IN  STD_LOGIC;
R10_in: IN  STD_LOGIC;
R11_in: IN  STD_LOGIC;
R12_in: IN  STD_LOGIC;
R13_in: IN  STD_LOGIC;
R14_in: IN  STD_LOGIC;
R15_in: IN  STD_LOGIC;
clk : IN STD_LOGIC;
clr : IN STD_LOGIC;
d : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
R0_busmuxin: OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
R10_busmuxin: OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
R11_busmuxin: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
R12_busmuxin: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
R13_busmuxin: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
R14_busmuxin: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
R15_busmuxin: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
R1_busmuxin: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
R2_busmuxin: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
R3_busmuxin: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
R4_busmuxin: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
R5_busmuxin: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
R6_busmuxin: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
R7_busmuxin: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
R8_busmuxin: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
R9_busmuxin: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END COMPONENT GPRegisterBlock;

BEGIN --begin architecture

DUT1 : GPRegisterBlock
PORT MAP (
R0_in => R0_in_tb,
R1_in => R1_in_tb,
R2_in => R2_in_tb,
R3_in => R3_in_tb,
R4_in => R4_in_tb,
R5_in => R5_in_tb,
R6_in => R6_in_tb,
R7_in => R7_in_tb,
R8_in => R8_in_tb,
R9_in => R9_in_tb,
R10_in => R10_in_tb,
R11_in => R11_in_tb,
R12_in => R12_in_tb,
R13_in => R13_in_tb,
R14_in => R14_in_tb,
R15_in => R15_in_tb,
clk => clk_tb,
clr => clr_tb,
d => d_tb,

R0_busmuxin => R0_busmuxin_tb,
R1_busmuxin => R1_busmuxin_tb,
R2_busmuxin => R2_busmuxin_tb,
R3_busmuxin => R3_busmuxin_tb,
R4_busmuxin => R4_busmuxin_tb,
R5_busmuxin => R5_busmuxin_tb,
R6_busmuxin => R6_busmuxin_tb,
R7_busmuxin => R7_busmuxin_tb,
R8_busmuxin => R8_busmuxin_tb,
R9_busmuxin => R9_busmuxin_tb,
R10_busmuxin => R10_busmuxin_tb,
R11_busmuxin => R11_busmuxin_tb,
R12_busmuxin => R12_busmuxin_tb,
R13_busmuxin => R13_busmuxin_tb,
R14_busmuxin => R14_busmuxin_tb,
R15_busmuxin => R15_busmuxin_tb
);

clock_process: process
begin
clk_tb <= '1', '0' after 10ns;
wait for 20ns;
end process;


state_process: process(clk_tb)
begin
if(rising_edge(clk_tb)) then
case Present_state is
when default =>
Present_state <= one;
when one =>
Present_state <= two;
when two =>
Present_state <= three;
when three =>
Present_state <= default;
end case;
end if;
end process;


defstates_process: process(Present_state)
begin
case Present_state is
when default =>
d_tb <= x"00000000";
R0_in_tb <= '1', '0' after 25ns;
when one =>
d_tb <= x"AAAAAAAA";
R1_in_tb <= '1', '0' after 25ns;
when two =>
d_tb <= x"BBBBBBBB";
R2_in_tb <= '1', '0' after 25ns;
when three =>
d_tb <= x"CCCCCCCC";
R0_in_tb <= '1', '0' after 25ns;
end case;
end process;


END;