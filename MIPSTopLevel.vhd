----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:14:55 10/25/2016 
-- Design Name: 
-- Module Name:    MIPSTopLevel - Behavioral 
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

entity MIPSTopLevel is
	port(
		clk: 				in		std_logic;
		reset: 			in		std_logic;
		WriteData: inout std_logic_vector(31 downto 0)
	);
end MIPSTopLevel; 
----------------------------------------------------------------------------------
architecture Behavioral of MIPSTopLevel is

----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
	
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------	

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

	end component;
	----------------------------------------------------------------------------------
	
----------------------------------------------------------------------------------
	
	----------------------------------------------------------------------------------
	
	----------------------------------------------------------------------------------
	
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

----------------------------------------------------------------------------------
		--signals
	signal pcin,pcout:	std_logic_vector(31 downto 0);
	signal instruction:	std_logic_vector(31 downto 0);
	signal multiplexerOut: std_logic_vector(4 downto 0);
	signal readData1:	std_logic_vector(31 downto 0);
	signal readData2:	std_logic_vector(31 downto 0);
	--signal writeData:	std_logic_vector(31 downto 0);
	signal signExtOut: std_logic_vector(31 downto 0);
	signal multiplexer2Out: std_logic_vector(31 downto 0);
	signal shifleft2Out: std_logic_vector(31 downto 0);
	signal aluresult: std_logic_vector(31 downto 0);
	signal aluZero: std_logic;
	signal aluAdderOut: std_logic_vector(31 downto 0);
	signal multiplexer3out:std_logic_vector(31 downto 0);
	signal readdataoutmem:std_logic_vector(31 downto 0);
	signal jumpShiftleftout: std_logic_vector (27 downto 0);
	signal multiplexerJumpOut: std_logic_vector(31 downto 0);
	
----------------------------------------------------------------------------------
  -- control signal:
  signal regdst: std_logic ;
  signal branch: std_logic ;
  signal memread: std_logic;
  signal memtoreg: std_logic;
  signal aluop: std_logic_vector(1 downto 0);
  signal memwrite: std_logic;
  signal alusrc: std_logic;
  signal regwrite: std_logic;
  signal jump: std_logic;
  
  signal alucontrolout: std_logic_vector(4 downto 0);
  
  signal andOut: std_logic;
----------------------------------------------------------------------------------	
	
begin
 
-------------------------------

----------------------------------------------------------------------------------
	

		
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
			
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------		

	---------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------
	
	
			
			----------------------------------------------------------------------------------

----------------------------------------------------------------------------------  

----------------------------------------------------------------------------------
	mux3: Mux2
		port map(
			INPUT_0=>aluAdderOut,
			INPUT_1=> pcout,
			OUTPUT=>	multiplexer3out,
			SELECTOR=> andOut
		);
		
		----------------------------------------------------------------------------------
	Datamems: datamem 
		port map(
			clk=>clk,
			AdressIn=>aluresult,
			writeDataIn=>readData2,
			readDataOUT=>readdataoutmem,
			memwriteIn=>memwrite,
			memreadIn=>memread
			);
----------------------------------------------------------------------------------
	muxdatamem: Mux2
		port map(
			INPUT_0=>readdataoutmem,
			INPUT_1=> aluresult,
			OUTPUT=>	WriteData,
			SELECTOR=> memtoreg
		);
		----------------------------------------------------------------------------------
	shift2leftJumps: shift2leftJump 
		generic map(
				N=>2,
				width=>26
			)
		port map(
			Input=>instruction(25 downto 0),
			Output=>jumpShiftleftout
				);
	muxafterjump: Mux2
		port map(
			INPUT_0=>multiplexer3out,
			INPUT_1(31 downto 28)=> pcout(31 downto 28),
			INPUT_1(27 downto 0)=> jumpShiftleftout,
			OUTPUT=> multiplexerJumpOut,
			SELECTOR=> jump
		);
end Behavioral;

