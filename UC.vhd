LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY UC IS
PORT(
 
	Clock	: IN STD_LOGIC;
	Op		: IN STD_LOGIC;
	Reset	:	IN STD_LOGIC;
	FUNCinput		: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	
	FUNCoutput		: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	IMEDSrc 	: OUT STD_LOGIC;
	RegRead 	: OUT STD_LOGIC;
	RegWrite	: OUT STD_LOGIC;
	Fetch 		: OUT STD_LOGIC
	
	);
END UC;

ARCHITECTURE Behaviour OF UC IS

	--Reset,G_Fetch, ReadReg, ULA , WriteRegisters); -- 3 bits 000,001,010,011,100
	SIGNAL state : STD_LOGIC_VECTOR(2 DOWNTO 0);
	
BEGIN
	PROCESS ( reset, clock )
	BEGIN
		IF	Clock = '1' AND Clock'event THEN
		--FETCH
			IF Reset = '1' THEN
				state <= "000";
			END IF;
			CASE state IS
				WHEN "000" =>	-- Reset
					FUNCoutput <= "000";
					IMEDSrc <= '0';
					RegRead <= '0';
					RegWrite <= '0';
					Fetch <= '0';
					state <= "001";
					
				WHEN "001" =>	-- Fetch
					
					FUNCoutput <= "000";
					IMEDSrc <= '0';
					RegRead <= '0';
					RegWrite <= '0';
					Fetch <= '1';
					state <= "010";
					
				WHEN "010" =>  -- Ler Registradores
				
					FUNCoutput <= "000";
					IMEDSrc <= '0';
					RegRead <= '1';
					RegWrite <= '0';
					Fetch <= '0';
					state <= "011";
					
				WHEN "011" => -- ULA
					
					FUNCoutput <= FUNCinput;
					IMEDSrc <= Op;
					RegRead <= '0';
					RegWrite <= '0';
					Fetch <= '0';
					state <= "100";
					
				WHEN "100" => -- Escreve Registradores
					
					FUNCoutput <= "000";
					IMEDSrc <= '0';
					RegRead <= '0';
					RegWrite <= '1';
					Fetch <= '0';
					state <= "001";
					
				WHEN OTHERS =>
					state <= "000";
				END CASE;
				
		END IF;
	END PROCESS;
	
END Behaviour;
	
	