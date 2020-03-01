LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Adder_4bits1 IS
PORT(
	X						:	IN 	STD_LOGIC_VECTOR(3 downto 0);
	Y 						:	IN 	STD_LOGIC_VECTOR(3 downto 0);
	carryIn				:	IN 	STD_LOGIC;
	GGout					:	OUT STD_LOGIC; 
	PGout					:	OUT STD_LOGIC;
	carryOut				:	OUT STD_LOGIC;
	Sumout				:	OUT STD_LOGIC_VECTOR(3 downto 0)
	);
END Adder_4bits1;

ARCHITECTURE behavioral OF Adder_4bits1 IS

SIGNAL Ptemp 			:	STD_LOGIC_VECTOR(3 downto 0) := "0000";
SIGNAL Gtemp 					:	STD_LOGIC_VECTOR(3 downto 0) := "0000";
SIGNAL Stemp					:	STD_LOGIC_VECTOR(3 downto 0) := "0000";
SIGNAL Ctemp			:	STD_LOGIC_VECTOR(4 downto 0) := "00000";

COMPONENT Adder_bits 
PORT(
	X 								:	IN STD_LOGIC;
	Y								:	IN STD_LOGIC;
	carryIn						:	IN STD_LOGIC;
	Gout, PropOut, Sumout	:	OUT STD_LOGIC
	);
END COMPONENT;

BEGIN

	Ctemp(0) <= carryIn;
	Adder_4bits1	:	Adder_bits PORT MAP ( X(0), Y(0), Ctemp(0), Gtemp(0), Ptemp(0), Stemp(0));
	
	Ctemp(1) <= Gtemp(0) OR (Ptemp(0) AND Ctemp(0));
	Adder_4bits2	:	Adder_bits PORT MAP ( X(1), Y(1), Ctemp(1), Gtemp(1), Ptemp(1), Stemp(1));
	
	Ctemp(2) <= Gtemp(1) OR (Ptemp(1) AND Ctemp(1));
	Adder_4bits3	:	Adder_bits PORT MAP ( X(2), Y(2), Ctemp(2), Gtemp(2), Ptemp(2), Stemp(2));
	
	Ctemp(3) <= Gtemp(2) OR (Ptemp(2) AND Ctemp(2));
	Adder_4bits4	:	Adder_bits PORT MAP ( X(3), Y(3), Ctemp(3), Gtemp(3), Ptemp(3), Stemp(3));
	
	Ctemp(4) <= Gtemp(3) OR (Ptemp(3) AND Ctemp(3));
	

	GGout <= Gtemp(3) OR (Ptemp(3) AND Gtemp(2)) OR (Ptemp(3) AND Ptemp(2) AND Gtemp(1)) OR (Ptemp(3) AND Ptemp(2) AND Ptemp(1) AND Gtemp(0));
	PGout <= Ptemp(3) AND Ptemp(2) AND Ptemp(1) AND Ptemp(0);
	carryOut <= Ctemp(4);
	Sumout <= Stemp;
	
END behavioral;