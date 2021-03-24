LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY pc IS
PORT(
	Fetch		: IN STD_LOGIC;
	Input 		: IN STD_LOGIC_VECTOR(17 DOWNTO 0);
	Clock 		: IN STD_LOGIC;
	NI			: OUT integer range 0 to 15;
	Instruction : OUT STD_LOGIC_VECTOR(17 DOWNTO 0));
END pc;

ARCHITECTURE Behavior OF pc IS
	SIGNAL Contador	:	integer range 0 to 15;
BEGIN
	PROCESS (Clock) -- Alterar do Clock
	BEGIN
		IF Clock = '1' AND Clock'event THEN
			IF Fetch = '1' THEN
				Instruction <= Input;
				Contador <= Contador+1;
				NI <= Contador+1;
			END IF;
		END IF;
		END PROCESS;
END Behavior;
