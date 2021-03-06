LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Processador IS
PORT(
	Clock 		: IN STD_LOGIC;
	Reset		: IN STD_LOGIC
	);
END Processador;

ARCHITECTURE Behavior OF Processador IS
	COMPONENT mem
	  PORT(
		address: in integer range 0 to 8;
		data: out STD_LOGIC_VECTOR(17 DOWNTO 0)
	  );
	END COMPONENT;
	
	COMPONENT pc
	  PORT(
		Fetch		: IN STD_LOGIC;
		Input 		: IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		Clock 		: IN STD_LOGIC;
		NI			: OUT integer range 0 to 15;
		Instruction : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
	  );
	END COMPONENT;
	
	COMPONENT RegInst
	  PORT(
		Instruction : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		Op 		: OUT STD_LOGIC ;
		FUNC	: OUT	STD_LOGIC_VECTOR(2 DOWNTO 0);
		AdressA 	:	OUT	STD_LOGIC_VECTOR(2 DOWNTO 0);
		AdressB 	:	OUT	STD_LOGIC_VECTOR(2 DOWNTO 0);
		WriteAdress 	:	OUT	STD_LOGIC_VECTOR(2 DOWNTO 0);
		IMED 	:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
		Clock 	: IN STD_LOGIC 
	  );
	END COMPONENT;
	
	COMPONENT BancoReg
	  PORT(
		Ri : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		Rj : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		Rk : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		Clock 		: IN STD_LOGIC ;
		RegRead		: IN STD_LOGIC ;
		RegWrite	: IN STD_LOGIC ;
		WriteValue	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		
		SrcA	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		SrcB	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	  );
	END COMPONENT;
	
	COMPONENT ALU
	  PORT(
		SrcA	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		SrcB	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		FUNC 	: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		IMEDSrc 	: IN STD_LOGIC;
		Clock 		: IN STD_LOGIC ;
		ALUout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT UC
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
	END COMPONENT;
	
	COMPONENT MUX
	  PORT(
		Banco	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		Imed	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		IMEDSrc 	: IN STD_LOGIC;
		FinalValue 	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
	END COMPONENT;
	
	-- UC V
	
	SIGNAL Op	: STD_LOGIC;			-- RegInst -> UC
	SIGNAL IMEDSrc 	: STD_LOGIC; 		-- UC -> MUX
	SIGNAL RegRead 	: STD_LOGIC; 		-- UC -> Banco
	SIGNAL RegWrite 	: STD_LOGIC; 	-- UC -> Banco
	SIGNAL Fetch 		: STD_LOGIC; 	-- UC -> PC
	
	-- MEM V
	SIGNAL DataBUS : STD_LOGIC_VECTOR(17 DOWNTO 0); -- Mem -> PC
	
	-- PC
	SIGNAL Instruction : STD_LOGIC_VECTOR(17 DOWNTO 0); -- PC -> RegInst
	SIGNAL Adress	: integer range 0 to 8; 			-- PC -> Mem
	
	-- REG INST V
	SIGNAL Ri : STD_LOGIC_VECTOR(2 DOWNTO 0); -- RegInst -> Banco
	SIGNAL Rj :	STD_LOGIC_VECTOR(2 DOWNTO 0); -- RegInst -> Banco
	SIGNAL Rk :	STD_LOGIC_VECTOR(2 DOWNTO 0); -- RegInst -> Banco
	SIGNAL FUNCinput : STD_LOGIC_VECTOR(2 DOWNTO 0);-- RegInst -> UC
	SIGNAL FUNCoutput : STD_LOGIC_VECTOR(2 DOWNTO 0);-- UC -> ULA
	SIGNAL IMED : STD_LOGIC_VECTOR(7 DOWNTO 0);-- RegInst -> MUX
	
	-- BANCO DE REG V
	SIGNAL WriteValue :	STD_LOGIC_VECTOR(7 DOWNTO 0);	-- ULA -> Banco
	SIGNAL SrcA	: STD_LOGIC_VECTOR(7 DOWNTO 0);			-- Banco -> ULA
	SIGNAL SrcB	: STD_LOGIC_VECTOR(7 DOWNTO 0);			-- Banco -> MUX
	
	-- ULA V
	SIGNAL ValueB	: STD_LOGIC_VECTOR(7 DOWNTO 0); --MUX -> ULA
	
	
	BEGIN
		UC1 : UC PORT MAP(Clock,Op,Reset,FUNCinput,FUNCoutput,IMEDSrc,RegRead,RegWrite,Fetch);
		
		PC1 : pc PORT MAP(Fetch,DataBUS,Clock,Adress,Instruction);
		
		MEMORIA : mem PORT MAP(Adress,DataBUS);
		
		IR : RegInst PORT MAP(Instruction,Op,FUNCinput,Rj,Rk,Ri,IMED,Clock);
		
		BancoRegistradores : BancoReg PORT MAP(Ri,Rj,Rk,Clock,RegRead,RegWrite,WriteValue,SrcA,SrcB);
		
		MUX1 : MUX PORT MAP(SrcB,IMED,IMEDSrc,ValueB);
		
		ALU1 : ALU PORT MAP(SrcA,ValueB,FUNCoutput,IMEDSrc,Clock,WriteValue);
		
END Behavior;
	