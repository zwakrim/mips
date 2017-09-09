----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:29:28 01/03/2017 
-- Design Name: 
-- Module Name:    executeTM - Behavioral 
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

entity executeTM is
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
end executeTM;

architecture Behavioral of executeTM is
----------------------------------------------------------------------------------
component Mux2 is
		generic(
			width: INTEGER	:=32
		);
		port(
			INPUT_0: 	IN		STD_LOGIC_VECTOR(width-1 downto 0);
			INPUT_1:		IN		STD_LOGIC_VECTOR(width-1 downto 0);
			OUTPUT:		OUT	STD_LOGIC_VECTOR(width-1 downto 0);
			SELECTOR:	IN		STD_LOGIC
		);	
	end component;
----------------------------------------------------------------------------------	
	component aluControlUnit is
			port(
		ALUop: IN std_logic_vector(1 downto 0);
		instruction: IN std_logic_vector(5 downto 0);
		AluControlOut: OUT std_logic_vector(4 downto 0);
		clk: in std_logic
	);
	end component;
----------------------------------------------------------------------------------
	component ALU is
			port(
				data1: In std_logic_vector(31 downto 0);
				data2: in std_logic_vector(31 downto 0);
				alucontrolin: in std_logic_vector(4 downto 0);
				aluResult: out std_logic_vector(31 downto 0);
				zero: out std_logic;
				clk : in std_logic	
			);
		end component;
----------------------------------------------------------------------------------
	component shifleft2 is
			generic(
				N: INTEGER	:=2;
				width: INTEGER :=32
			); 
			port(
				Input:	IN		STD_LOGIC_VECTOR(width-1 downto 0);
				Output:	OUT	STD_LOGIC_VECTOR(width-1 downto 0)
				);
		end component;
----------------------------------------------------------------------------------
	component aluAdder is
			Port ( 
				input1: in  STD_LOGIC_VECTOR (31 downto 0);
				input2 :in  STD_LOGIC_VECTOR (31 downto 0);
				Clk : in  STD_LOGIC;
				result : out  STD_LOGIC_VECTOR (31 downto 0)
				);
		end component;
----------------------------------------------------------------------------------
signal multiplexerAluOut: std_logic_vector(31 downto 0);
signal alucontrolOut: std_logic_vector(4 downto 0);
signal shifleft2Out: std_logic_vector(31 downto 0);
----------------------------------------------------------------------------------
begin
	multiplexerALuSrc: Mux2
		generic map (width=>32)
		port map (
			INPUT_0=> readData2in,
			INPUT_1=> signextendIn,
			OUTPUT=>	multiplexerAluOut,
			SELECTOR=>	AluSrcIn
		);	
----------------------------------------------------------------------------------
	alucontrolunits: aluControlUnit
			port map(
				ALUop=>AluOP,
				instruction=>AluControlInstructions,
				AluControlOut=>alucontrolout,
				clk=>clk
			);
----------------------------------------------------------------------------------
		ALU1: ALU 
		port map (
				data1=>readData1In,
				data2=>multiplexerAluOut,
				alucontrolin=>alucontrolout,
				aluResult=>aluResultOut,
				zero=>zeroOut,
				clk => clk 
			);
----------------------------------------------------------------------------------
		shiftlef: shifleft2 
			generic map(
					N=>2,
					width=>32
				)
				port map (
					Input=>signextendIn,
					Output=>shifleft2Out
					);		
----------------------------------------------------------------------------------						
		aluAdders: aluAdder	
			Port map ( 
				input1=>adderIn1,
				input2 =>shifleft2Out,
				Clk=> clk,
				result => adderout
				);
end Behavioral;

