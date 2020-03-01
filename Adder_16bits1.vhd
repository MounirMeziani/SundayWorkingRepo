LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;




ENTITY Adder_16bits1 IS
PORT(
	X                 :	IN  STD_LOGIC_VECTOR(15 downto 0);
	Y 						:	IN  STD_LOGIC_VECTOR(15 downto 0);
	CarryIn				:	IN  STD_LOGIC;
	GGout					:	OUT STD_LOGIC;
	PGout					:	OUT STD_LOGIC;
	CarryOut				:	OUT STD_LOGIC;
	SumOut				:	OUT STD_LOGIC_VECTOR(15 downto 0)
	);
END Adder_16bits1;


ARCHITECTURE behavioral OF Adder_16bits1 IS

SIGNAL Ptemp    	:	STD_LOGIC_VECTOR(3 downto 0) := "0000";
SIGNAL Gtemp		:	STD_LOGIC_VECTOR(3 downto 0) := "0000";
SIGNAL Stemp		:	STD_LOGIC_VECTOR(3 downto 0) := "0000";
SIGNAL Stemp1  	:	STD_LOGIC_VECTOR(3 downto 0);
SIGNAL Stemp2		:	STD_LOGIC_VECTOR(3 downto 0);
SIGNAL Stemp3		:	STD_LOGIC_VECTOR(3 downto 0);
SIGNAL Stemp4		:	STD_LOGIC_VECTOR(3 downto 0);
SIGNAL Ctemp0		:	STD_LOGIC;
SIGNAL Ctemp1		:	STD_LOGIC;
SIGNAL Ctemp2  	:	STD_LOGIC;
SIGNAL Ctemp3		:	STD_LOGIC;
SIGNAL Ctemp4		:	STD_LOGIC;

ALIAS X_Part1 IS X(3 downto 0);
ALIAS Y_Part1 IS Y(3 downto 0);
ALIAS X_Part2 IS X(7 downto 4);
ALIAS Y_Part2 IS Y(7 downto 4);
ALIAS X_Part3 IS X(11 downto 8);
ALIAS Y_Part3 IS Y(11 downto 8);
ALIAS X_Part4 IS X(15 downto 12);
ALIAS Y_Part4 IS Y(15 downto 12);


COMPONENT Adder_4bits1
PORT(
	X, Y 				:	IN 	STD_LOGIC_VECTOR(3 downto 0);
	CarryIn			:	IN 	STD_LOGIC;
	GGout				:	OUT	STD_LOGIC;
	PGout   			:	OUT	STD_LOGIC;
	CarryOut			:	OUT	STD_LOGIC;
	SumOut			:	OUT	STD_LOGIC_VECTOR(3 downto 0)
	);
END COMPONENT;

COMPONENT Addet_bits1 
PORT(
	X			:	IN STD_LOGIC;
	Y			:	IN STD_LOGIC;
	CarryIn	:	IN STD_LOGIC;
	Gout		:	OUT STD_LOGIC;
	PropOut 	  :	OUT STD_LOGIC;
	carryOut	:	OUT STD_LOGIC
	);
END COMPONENT;

BEGIN

	Ctemp0 <= CarryIn;
	
	Adder_16bits1	:	Adder_4bits1 PORT MAP( X_part1, 
														  Y_part1,
														  Ctemp0,
														  Gtemp(0),
														  Ptemp(0),
														  Ctemp1, 
														  Stemp1);
														  
	Adder_16bits2	:	Adder_4bits1 PORT MAP( X_part2, 
														  Y_part2,
														  Ctemp1, 
														  Gtemp(1), 
														  Ptemp(1), 
														  Ctemp2, 
														  Stemp2);
	Adder_16bits3	:	Adder_4bits1 PORT MAP( X_part3, 
														  Y_part3, 
														  Ctemp2, 
														  Gtemp(2), 
														  Ptemp(2), 
														  Ctemp3, 
														  Stemp3);
	Adder_16bits4	:	Adder_4bits1 PORT MAP( X_part4,
														  Y_part4, 
														  Ctemp4, 
														  Gtemp(3), 
														  Ptemp(3), 
														  Ctemp4, 
														  Stemp4);
	
	GGout <= Gtemp(3) OR (Ptemp(3) AND Gtemp(2))	OR (Ptemp(3) AND Ptemp(2) AND Gtemp(1)) OR (Ptemp(3) AND Ptemp(2) AND Ptemp(1) AND Gtemp(0));
	PGout <= Ptemp(3) AND Ptemp(2) AND Ptemp(1) AND Ptemp(0);

	CarryOut <= Ctemp4;
	
	SumOut <=  Stemp1 & Stemp2 & Stemp3 & Stemp4;
	
END behavioral;