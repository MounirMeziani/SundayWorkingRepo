LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

LIBRARY work;

ENTITY ALU IS 
	PORT
	(
		Ain :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Bin :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ADD, SUB, ANDop, ORop, 
		SHR, SHL, ROTR, ROTL,
		MUL, DIV, NEG, NOTop, 
		IncPC, claADD	: IN STD_LOGIC;
		Zout :  OUT  STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END ALU;

ARCHITECTURE bdf_type OF ALU IS 



COMPONENT twos_comp
PORT(
	input	:	IN STD_LOGIC_VECTOR(31 downto 0);
	output:	OUT STD_LOGIC_VECTOR(31 downto 0)
);
END COMPONENT;

COMPONENT Rotate
	PORT(
		 data : IN STD_LOGIC_VECTOR(31  DOWNTO 0);
		 direction : IN STD_LOGIC;
		 distance : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT Shift
PORT(
		data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		direction : IN STD_LOGIC;
		distance : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;


COMPONENT DividingBlock
	PORT(denom : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 numer : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 quotient : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 remain : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;


COMPONENT Adder_16bits1
PORT(
	X, Y 						:	IN 	STD_LOGIC_VECTOR(15 downto 0);
	CarryIn						:	IN 	STD_LOGIC;
	GGout, PGout, CarryOut	:	OUT STD_LOGIC;
	SumOut						:	OUT	STD_LOGIC_VECTOR(15 downto 0)
	);
END COMPONENT;


COMPONENT MultiplyBlock
PORT(
		Xin :   IN STD_LOGIC_VECTOR(31 downto 0);
		Yin :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ResultOut :  OUT  STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END COMPONENT;




SIGNAL	div_quo,div_rem :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL rot_out,shift_out  :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	dist :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	lr_sel, rot_lr_sel :  STD_LOGIC;

SIGNAL	cla16_sum_out  : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	cla16_filler :	STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
SIGNAL	booth_out : STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	RCA_c_out, gnd : STD_LOGIC;
SIGNAL	Cout, GGout, PGout : STD_LOGIC;



--COMPONENT INSTANTIATION

BEGIN 
b2v_divider : DividingBlock
PORT MAP(
			denom => Bin,
			numer => Ain,
			quotient =>div_quo,
			remain=>div_rem
		);


Adder_16bits1_inst : Adder_16bits1
PORT MAP(
			X	=> Ain(15 downto 0),
			Y => Bin(15 downto 0),
			CarryIn => '0',
			GGout => GGout,
			PGout => PGout,
			CarryOut => Cout,
			SumOut => cla16_sum_out
		);

bMulInst : MultiplyBlock			
PORT MAP(
			Xin => Ain,
			Yin => Bin,
			ResultOut => booth_out
		);

b2v_shifter : Shift
PORT MAP(
			direction => lr_sel,
			data => Ain,
			distance => dist,
			result => shift_out
		);


b2v_rotator : Rotate
PORT MAP(
			direction => rot_lr_sel,
			data => Ain,
			distance => dist,
			result => rot_out
		);


op_proc: process(Ain, Bin, ADD, SUB, ANDop, ORop, 
		SHR, SHL, ROTR, ROTL, MUL, DIV, NEG, NOTop, 
		IncPC, claADD, booth_out,Shift_out, rot_out, div_quo, div_rem, cla16_sum_out)
begin

	if incPC = '1' then
		Zout(63 downto 32) <= x"00000000";	
		Zout(31 downto 0) <= (Bin + x"00000001");
	elsif ADD  = '1' then 
		Zout(63 downto 32) <= x"00000000";
		Zout(31 downto 0) <= (Ain + Bin);
		elsif SUB = '1' then
		Zout(63 downto 32) <= x"00000000";
		Zout(31 downto 0) <= (Ain - Bin);
	elsif ANDop  = '1' then
		Zout(63 downto 32) <= x"00000000";
		Zout(31 downto 0) <= (Ain and Bin);
	elsif ORop = '1' then
		Zout(63 downto 32) <= x"00000000";
		Zout(31 downto 0) <= (Ain or Bin);	
	elsif SHR = '1' then
		Zout(63 downto 32) <= x"00000000";
		Zout(31 downto 0) <= shift_out;	
		dist <= Bin(4 downto 0); 
		lr_sel <= '1';
	elsif SHL = '1' then
		Zout(63 downto 32) <= x"00000000";
		Zout(31 downto 0) <= shift_out;
		dist <= Bin(4 downto 0); 
		lr_sel <= '0';	
	elsif ROTR = '1' then
		Zout(31 downto 0) <= x"00000000";
		Zout(63 downto 32) <=rot_out; 		
		dist <= Bin(4 downto 0); 
		rot_lr_sel <= '1';	
	elsif ROTL = '1' then
		Zout(63 downto 32) <= x"00000000";	
		Zout(31 downto 0) <=rot_out;		
		dist <= Bin(4 downto 0); 
		rot_lr_sel <= '0';
	elsif MUL  = '1' then
		Zout <= booth_out;
	elsif DIV  = '1' then
		Zout(63 downto 32) <= div_rem;		
		Zout(31 downto 0) <= div_quo; 
	elsif NEG  = '1' then
		Zout(63 downto 32) <= x"00000000";	
		Zout(31 downto 0) <= (not Bin + x"00000001");
	elsif NOTop  = '1' then
		Zout(63 downto 32) <= x"00000000";	
		Zout(31 downto 0) <= (not Bin);
	elsif claADD = '1' then
		Zout <= x"000000000000" & cla16_sum_out;
	end if;
end process;
END bdf_type; 