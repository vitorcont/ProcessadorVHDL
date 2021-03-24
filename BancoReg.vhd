LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY BancoReg IS
PORT(
	Ri : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	Rj : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	Rk : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	Clock 		: IN STD_LOGIC ;
	RegRead		: IN STD_LOGIC ;
	RegWrite	: IN STD_LOGIC ;
	WriteValue	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	SrcA	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	SrcB	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END BancoReg;

ARCHITECTURE Behavior OF BancoReg IS
	SIGNAL R0	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL R1	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL R2	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL R3	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL R4	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL R5	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL R6	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL R7	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	
BEGIN
	PROCESS (Clock) -- Alterar do Clock
	BEGIN
		IF Clock = '1' AND Clock'event THEN
			IF RegRead = '1' THEN
				CASE Rj IS
					WHEN "000" =>
						SrcA <= R0;
					WHEN "001" =>
						SrcA <= R1;
					WHEN "010" =>
						SrcA <= R2;
					WHEN "011" =>
						SrcA <= R3;
					WHEN "100" =>
						SrcA <= R4;
					WHEN "101" =>
						SrcA <= R5;
					WHEN "110" =>
						SrcA <= R6;
					WHEN "111" =>
						SrcA <= R7;
					WHEN OTHERS =>
						SrcA <= R6;
				END CASE;

				CASE Rk IS
					WHEN "000" =>
						SrcB <= R0;
					WHEN "001" =>
						SrcB <= R1;
					WHEN "010" =>
						SrcB <= R2;
					WHEN "011" =>
						SrcB <= R3;
					WHEN "100" =>
						SrcB <= R4;
					WHEN "101" =>
						SrcB <= R5;
					WHEN "110" =>
						SrcB <= R6;
					WHEN "111" =>
						SrcB <= R7;
					WHEN OTHERS =>
						SrcB <= R7;
				END CASE;
			END IF;
			IF RegWrite = '1' THEN
				CASE Ri IS
				WHEN "000" =>
					R0 <= WriteValue;
				WHEN "001" =>
					R1 <= WriteValue;
				WHEN "010" =>
					R2 <= WriteValue;
				WHEN "011" =>
					R3 <= WriteValue;
				WHEN "100" =>
					R4 <= WriteValue;
				WHEN "101" =>
					R5 <= WriteValue;
				WHEN "110" =>
					R6 <= WriteValue;
				WHEN "111" =>
					R7 <= WriteValue;
				WHEN OTHERS =>
					R7 <= WriteValue;
				END CASE;
			END IF;
		END IF;
	END PROCESS;
END Behavior;