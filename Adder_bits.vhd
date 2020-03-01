LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Adder_Bits IS
PORT(
	X : IN STD_LOGIC;
	Y :	IN STD_LOGIC;
	carryIn	:	IN STD_LOGIC;
	Gout:	OUT STD_LOGIC;
	PropOut:	OUT STD_LOGIC;
	Sumout	:	OUT STD_LOGIC
);
END Adder_Bits;


--logical bit adding 
ARCHITECTURE behavioral OF Adder_Bits IS
BEGIN
	Gout <= X AND Y;
	PropOut <= X XOR Y;
	Sumout <= (X XOR Y) XOR carryIn;
END behavioral;