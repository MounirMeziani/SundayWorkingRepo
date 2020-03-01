  
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

ENTITY MultiplyBlock IS
	PORT
	(
		Xin		   :  IN STD_LOGIC_VECTOR(31 downto 0);
		Yin 			:  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ResultOut 	:  OUT  STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END MultiplyBlock;

ARCHITECTURE MultiplyBlock_arch OF  MultiplyBlock IS
BEGIN
	process(Xin, Yin)
	variable result	:  STD_LOGIC_VECTOR(63 downto 0);
	variable	temp :  STD_LOGIC_VECTOR(63 downto 0);
				
	variable toAdd 	: STD_LOGIC_VECTOR(31 downto 0);
	variable	toSub 	: STD_LOGIC_VECTOR(31 downto 0);

	begin
		toAdd := Xin;
		toSub := (0 - Xin);
		result := x"0000000000000000";
		for i in 0 to 31 loop
			if (i = 0) then
				if (Yin(0) = '1') then
					temp(31 downto 0):= toSub;
				end if;
			else 
				if (Yin(i) = '1' and Yin(i-1) = '0') then
					temp:= x"00000000" & toSub;
				elsif (Yin(i) = '0' and Yin(i-1) = '1') then
					temp:= x"00000000" & toAdd;
				else
					temp := x"00000000" & x"00000000";
				end if;
			end if;
			
		--Sign Extension
			if (temp(31) = '1') then
				temp(63 downto 32) := x"FFFFFFFF";
			elsif (temp(31) = '0') then
				temp(63 downto 32) := x"00000000";
			end if;
			temp := STD_LOGIC_VECTOR(SHIFT_LEFT(UNSIGNED(temp), i));
			result := result + temp;
		end loop;
		ResultOut <= result;
	end process;
END;