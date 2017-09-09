----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:27:44 01/03/2017 
-- Design Name: 
-- Module Name:    ProcessorTopLevel - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProcessorTopLevel is 
	port (
		clk: in std_logic;
		reset: in std_logic;
		--output:inout std_logic_vector(31 downto 0);
		led0 :out std_logic; 
		led1 :out std_logic;
		led2 :out std_logic;
		led3 :out std_logic;
		led4 :out std_logic; 
		led5 :out std_logic;
		led6 :out std_logic;
		led7 :out std_logic
	);
end ProcessorTopLevel; 

architecture Behavioral of ProcessorTopLevel is

	component InstructionFetchToplayer is
		port(
			clk: in std_logic;
			reset: in std_logic;
			programCounterIn: in std_logic_vector(31 downto 0);
			adder4OuT: out std_logic_vector(31 downto 0);
			instructionOut: out std_logic_vector(31 downto 0)
			);
	end component;
-------------------------------------------------------------------------------
	component instructioDecoderAndRegisterRead is
		port(
			clk: in std_logic;
			instructions: in std_logic_vector(31 downto 0);
			writeData: in std_logic_vector(31 downto 0);
			shiftleft2jumpOut: out std_logic_vector(27 downto 0);
			-- output control
			--RegDst : out  STD_LOGIC;
			Branch : out  STD_LOGIC;
			MemRead : out  STD_LOGIC;
			MemtoReg : out  STD_LOGIC;
			ALUOp : out std_logic_vector(1 downto 0);
			MemWrite : out  STD_LOGIC;
			ALUSrc : out  STD_LOGIC;
			--RegWrite : out  STD_LOGIC;
			jump: out std_logic;
			--output register
			readData1: out std_logic_vector(31 downto 0);
			readData2: out std_logic_vector(31 downto 0);
			--output sign extend
			signextOut: out std_logic_vector(31 downto 0)
			-- functions
			--outFunctions: out std_logic_vector(5 downto 0)
		);

	end component;
-------------------------------------------------------------------------------
	component executeTM is
		port(
			clk: in std_logic;
			--aluop in from ID
			AluControlInstructions: in std_logic_vector(5 downto 0);
			AluOP: in std_logic_vector(1 downto 0);
			-- mux in from id
			readData2in: in std_logic_vector(31 downto 0);
			signextendIn: in std_logic_vector(31 downto 0);
			AluSrcIn: in std_logic;
			-- alu in from id
			readData1In: in std_logic_vector(31 downto 0);
			--adder in from IF
			adderIn1: in std_logic_vector(31 downto 0);		
			--outputs
			adderout: out std_logic_vector(31 downto 0);
			zeroOut: out std_logic;
			aluResultOut: out std_logic_vector(31 downto 0)
		);
	end component;
-------------------------------------------------------------------------------
component memAccesTL is
	port(
		clk: in std_logic;
		--mux in
		programCounterIn: in std_logic_vector(31 downto 0);
		adderIn: in std_logic_vector(31 downto 0);
		-- mux out
		muxOut: out std_logic_vector(31 downto 0);
		
		-- and in 
		branchIn: in std_logic;
		zerIn: in std_logic;
		
		-- mem in
		memWriteIn: in std_logic;
		memReadIn: in std_logic;
		adressIn: in std_logic_vector(31 downto 0);
		writeDataIn: in std_logic_vector(31 downto 0);
		selectordatamemOUT: out std_logic;
		
		-- mem out
		readData: out std_logic_vector(31 downto 0);
		readLedDataout: out std_logic_vector(31 downto 0);
		
		--ledoutselector
		selectorledout: out std_logic;
	
		--ledsout
		led0 :out std_logic;
		led1 :out std_logic;
		led2 :out std_logic;
		led3 :out std_logic;
		led4 :out std_logic;
		led5 :out std_logic;
		led6 :out std_logic;
		led7 :out std_logic
	);
end component;
-------------------------------------------------------------------------------
component WriteBackTL is
	port(
		clk: in std_logic;
			--mux1 in pc
			MemMuxIn: in std_logic_vector(31 downto 0);
			shiftleft2jumpIn: in std_logic_vector(27 downto 0);
			pcAdderIn: In std_logic_vector(3 downto 0);
			jumpIn: in std_logic;
			--mux 1 out
			muxPCOut: out std_logic_vector(31 downto 0);
			
			-- mux2 datamemory in
			readDataIn: in std_logic_vector(31 downto 0);
			AluResultIn: in std_logic_vector(31 downto 0);
			memToReg: in std_logic;
			
			selectorDatamem: in std_logic;
			-- mux2 datamemory out 
			
			muxDatamemOut: out std_logic_vector(31 downto 0);
			
			--led blokken
			readDataLedIN: IN std_logic_vector(31 downto 0); 
			selectorLedIn: in std_logic
		);
end component; 
-------------------------------------------------------------------------------

signal PCin: std_logic_vector(31 downto 0);
signal adder4: std_logic_vector(31 downto 0);
signal instructions: std_logic_vector(31 downto 0);

signal shift2jump: std_logic_vector(27 downto 0);

signal writeDataBack: std_logic_vector(31 downto 0);

signal readData1Out: std_logic_vector(31 downto 0);
signal readData2Out: std_logic_vector(31 downto 0);
signal signextOut: std_logic_vector(31 downto 0);

signal AdderEXOut: std_logic_vector(31 downto 0);
signal zeroExOut: std_logic;
signal aluEXOut: std_logic_vector(31 downto 0);

signal memMuxOut: std_logic_vector(31 downto 0);
signal memDataMemOut: std_logic_vector(31 downto 0);

signal selectordatamemconnect: std_logic;
signal selectorLedconnect: std_logic;

signal readdataledConnect: std_logic_vector(31 downto 0);

signal muxdatamemeOUTconnect: std_logic_vector(31 downto 0);

--control signal

  signal branch: std_logic ;
  signal memread: std_logic;
  signal memtoreg: std_logic;
  signal aluop: std_logic_vector(1 downto 0);
  signal memwrite: std_logic;
  signal alusrc: std_logic;
  signal jump: std_logic;
-------------------------------------------------------------------------------
begin
	iFetch:InstructionFetchToplayer
		port map(
			clk=> clk,
			reset=> reset,
			programCounterIn=>PCin,
			adder4OuT=> adder4,
			instructionOut=>instructions
			);
			
-------------------------------------------------------------------------------
	ID: instructioDecoderAndRegisterRead
		port map(
			clk=>clk,
			instructions => instructions,
			writeData=>muxdatamemeOUTconnect,--writeDataBack,
			shiftleft2jumpOut=> shift2jump,
			-- output control
			Branch => branch,
			MemRead => memread,
			MemtoReg => memtoreg,
			ALUOp => aluop,
			MemWrite=> memwrite,
			ALUSrc=> alusrc,
			jump=> jump,
			--output register
			readData1=>readData1Out,
			readData2=>readData2Out,
			--output sign extend
			signextOut=>signextOut
			-- functions
			--outFunctions=>instructions(5 downto 0)
		);	
-------------------------------------------------------------------------------
	EX:executeTM 
		port map(
			clk=> clk,
			--aluop in from ID
			AluControlInstructions=> instructions(5 downto 0),
			AluOP=> aluop,
			-- mux in from id
			readData2in=>readData2Out,
			signextendIn=>signextOut,
			AluSrcIn=>AluSrc,
			-- alu in from id
			readData1In=>readData1Out,
			--adder in from IF
			adderIn1=>adder4,
			--outputs
			adderout=>AdderEXOut,
			zeroOut=>zeroExOUT,
			aluResultOut=>aluEXOut
		);
-------------------------------------------------------------------------------
	MEM: memAccesTL
		port map(
			clk=>clk,
			--mux in
			programCounterIn=>adder4,
			adderIn=>AdderEXOut,
			-- mux out
			muxOut=>memMuxOut,
			
			-- and in 
			branchIn=>branch,
			zerIn=>zeroExOUT,
			
			-- mem in
			memWriteIn=> memwrite,
			memReadIn=>memread,
			adressIn=>aluEXOut,
			writeDataIn=>readData2Out,
			
			-- mem out
			readData=>memDataMemOut,
			
			readLedDataout=> readdataledConnect,
			selectordatamemOUT=>selectordatamemconnect,
			
			selectorledout=>selectorLedconnect,
			
			led0=>led0,
			led1=>led1,
			led2=>led2,
			led3=>led3,
			led4=>led4,
			led5=>led5,
			led6=>led6,
			led7=>led7
		);	
-------------------------------------------------------------------------------		
		WB: WriteBackTL
			port map(
					--mux1 in pc
					clk=>clk,
					MemMuxIn=> memMuxOut,
					shiftleft2jumpIn=>shift2jump,
					pcAdderIn=>adder4(31 downto 28),
					jumpIn=> jump,
					--mux 1 out
					muxPCOut=> PCin,
					
					-- mux2 datamemory in
					readDataIn=> memDataMemOut,
					AluResultIn=> aluEXOut,
					memToReg=> memtoreg,
					-- mux2 datamemory out 
					
					muxDatamemOut=>muxdatamemeOUTconnect,
					selectorDatamem=>selectordatamemconnect,
					
					readDataLedIN=>readdataledConnect,
					selectorLedIn=>selectorLedconnect
				);
-------------------------------------------------------------------------------		
	
end Behavioral;

