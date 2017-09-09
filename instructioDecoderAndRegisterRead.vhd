----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:00:51 01/03/2017 
-- Design Name: 
-- Module Name:    instructioDecoderAndRegisterRead - Behavioral 
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

entity instructioDecoderAndRegisterRead is
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

end instructioDecoderAndRegisterRead;

architecture Behavioral of instructioDecoderAndRegisterRead is

	component controlUnit is
		port(
				Instruction : in  STD_LOGIC_VECTOR (31 downto 26);
				RegDst : out  STD_LOGIC;
				Branch : out  STD_LOGIC;
				MemRead : out  STD_LOGIC;
				MemtoReg : out  STD_LOGIC;
				ALUOp : out std_logic_vector(1 downto 0);
				MemWrite : out  STD_LOGIC;
				ALUSrc : out  STD_LOGIC;
				RegWrite : out  STD_LOGIC;
				jump: out std_logic;
				clk: in std_logic
				);
	end component;
----------------------------------------------------------------------------------	
	component MUX is
		generic(
			width: INTEGER	:=5
		);
		port(
			INPUT_0: 	IN		STD_LOGIC_VECTOR(width-1 downto 0);
			INPUT_1:		IN		STD_LOGIC_VECTOR(width-1 downto 0);
			OUTPUT:		OUT	STD_LOGIC_VECTOR(width-1 downto 0);
			SELECTOR:	IN		STD_LOGIC
		);	
	end component;
----------------------------------------------------------------------------------	
	component RegisterFile is
		port(		
			Read_Register_1:	IN		STD_LOGIC_VECTOR(4 downto 0);
			Read_Register_2:	IN		STD_LOGIC_VECTOR(4 downto 0);
			Write_Register:	IN		STD_LOGIC_VECTOR(4 downto 0);		
			RegWrite:			IN		STD_LOGIC;		
			write_data:			IN		STD_LOGIC_VECTOR(31 downto 0);		
			---- read data
			read_data_1: 		OUT 	STD_LOGIC_VECTOR(31 downto 0);
			read_data_2: 		OUT 	STD_LOGIC_VECTOR(31 downto 0);
			clk:					IN 	STD_LOGIC
		);	
	end component;
----------------------------------------------------------------------------------	
	component signeExt is
		port(
				signExtInput : IN std_logic_vector(15 downto 0);
				signExtOutput: OUT std_logic_vector(31 downto 0)
				);
	end component;
----------------------------------------------------------------------------------	
	component shift2leftJump is
		generic(
				N: INTEGER	:=2;
				width: INTEGER :=26
			); 
			port(
				Input:	IN		STD_LOGIC_VECTOR(width-1 downto 0);
				Output:	OUT	STD_LOGIC_VECTOR(27 downto 0)
				);
	end component;
-----------------------------------------------------------------	
	signal multiplexerOut: std_logic_vector(4 downto 0);
	signal regdstIn: std_logic ;
	signal regwriteIN: std_logic;
	
--------------------------------------------------------------	 
begin
	controlunits: controlUnit
	port map(
				Instruction=> instructions(31 downto 26),
				RegDst => regdstIn,
				Branch => branch,
				MemRead => memread,
				MemtoReg => memtoreg,
				ALUOp => aluop,
				MemWrite => memwrite,  
				ALUSrc => alusrc,
				RegWrite => regwriteIN,
				jump => jump,
				clk=>clk
				);	
----------------------------------------------------------------------------------
	multiplexer: MUX
			generic map (width=>5)
			port map (
				INPUT_0=> 	instructions(20 downto 16),
				INPUT_1=>	instructions(15 downto 11),
				OUTPUT=>		multiplexerOut,
				SELECTOR=>	regdstIN
			);	
----------------------------------------------------------------------------------		
		Registers : RegisterFile
			port map(
				Read_Register_1=>instructions(25 downto 21),
				Read_Register_2=>instructions(20 downto 16),
				Write_Register=>multiplexerOut,		
				RegWrite=> regwriteIn,	
				write_data=> writeData,
				---- read data
				read_data_1=>readData1,
				read_data_2=>readData2,
				clk=> clk
			);	
	----------------------------------------------------------------------------------			
		signeExtension : signeExt
			port map(
					signExtInput=> instructions(15 downto 0),
					signExtOutput=> signextOut
					);
	----------------------------------------------------------------------------------
		shift2leftJumps: shift2leftJump 
			generic map(
					N=>2,
					width=>26
				)
			port map(
				Input=>instructions(25 downto 0),
				Output=>shiftleft2jumpOut
					);
		----------------------------------------------------------------------------------
			--outFunctions<= instructions(5 downto 0);
end Behavioral;

