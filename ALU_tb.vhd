LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ALU_tb IS
END ;
ARCHITECTURE ALU_tb_arch OF ALU_tb IS


SIGNAL Ain_tb,Bin_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL ADD_tb, SUB_tb, ANDop_tb, ORop_tb, 
		SHR_tb, SHL_tb, ROTR_tb, ROTL_tb,
		MUL_tb, DIV_tb, NEG_tb, NOTop_tb, 
		IncPC_tb, claADD_tb	:  STD_LOGIC;

SIGNAL Zout_tb : STD_LOGIC_VECTOR(63 DOWNTO 0);

component ALU 
	PORT
	(
		Ain :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Bin :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ADD, SUB, ANDop, ORop, SHR, SHL, ROTR, ROTL,MUL, DIV, NEG, NOTop, IncPC, claADD	: IN STD_LOGIC;
		Zout :  OUT  STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END component ALU;


BEGIN
	 DUT1 : ALU
	--port mapping: between the DUT and the testbench signals
	 PORT MAP (
	  Ain => Ain_tb ,
	  Bin => Bin_tb ,
	  ADD =>ADD_tb,
	  SUB => SUB_tb ,
	  ANDop  => ANDop_tb,
	  ORop => ORop_tb ,
	  SHR => SHR_tb ,
	  SHL =>SHL_tb,
	  ROTR => ROTR_tb,
	  ROTL =>ROTL_tb,
	  MUL =>MUL_tb,
	  DIV =>DIV_tb,
	  NEG =>NEG_tb,
	  NOTop =>NOTop_tb,
	  IncPC =>IncPC_tb,
	  claADD  =>claADD_tb,
	  Zout =>Zout_tb

	  );



sim_process: process
	 begin
	 Bin_tb <= x"00000010";
	 Ain_tb <= x"00000100";

		ADD_tb<=  '1','0' after 10ns;
		wait for 20ns;
		SUB_tb <='1','0' after 10ns;
		wait for 20ns;
		ANDop_tb <='1','0' after 10ns;
		wait for 20ns;
		ORop_tb <= '1','0' after 10ns;
		wait for 20ns;
		SHR_tb <= '1','0' after 10ns;
		wait for 20ns;
		SHL_tb <= '1','0' after 10ns;
		wait for 20ns;
		ROTR_tb <= '1','0' after 10ns;
		wait for 20ns;
		ROTL_tb <= '1','0' after 10ns;
		wait for 20ns;
		MUL_tb <= '1','0' after 10ns;
		wait for 20ns;
		DIV_tb <= '1','0' after 10ns;
		wait for 20ns;
		NEG_tb<= '1','0' after 10ns;
		wait for 20ns;
		NOTop_tb<= '1','0' after 10ns;
		wait for 20ns;
		claADD_tb<= '1','0' after 10ns;
		wait for 20ns;
		IncPC_tb<= '1','0' after 10ns;
		wait for 20ns;


	 end process sim_process; 


	 END; 