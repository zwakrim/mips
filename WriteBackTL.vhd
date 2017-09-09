----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:16:17 01/03/2017 
-- Design Name: 
-- Module Name:    WriteBackTL - Behavioral 
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

entity WriteBackTL is
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
			
			--led
			readDataLedIN:	in std_logic_vector(31 downto 0);
			selectorLedIn: in std_logic
			
		);
end WriteBackTL;

architecture Behavioral of WriteBackTL is

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
	
	
	component muxMemIO is
		generic(
				width: INTEGER	:=32
			);
			port(
				clk: in std_logic;
				INPUT_0: 	IN		STD_LOGIC_VECTOR(width-1 downto 0);
				INPUT_1:		IN		STD_LOGIC_VECTOR(width-1 downto 0);
				INPUT_2:		IN		STD_LOGIC_VECTOR(width-1 downto 0);
				OUTPUT:		OUT	STD_LOGIC_VECTOR(width-1 downto 0);
				SELECTOR1:	IN		STD_LOGIC;
				SELECTOR2:	IN		STD_LOGIC;
				SELECTOR3:	IN		STD_LOGIC
			);	
		end component;
	

begin

	muxafterjump: Mux2
		port map(
			INPUT_0=>MemMuxIn,
			INPUT_1(31 downto 28)=> pcAdderIn,
			INPUT_1(27 downto 0)=> shiftleft2jumpIn,
			OUTPUT=> muxPCOut,
			SELECTOR=> jumpIn
		);
		
	muxdatamem: MuxMemIO
			port map(
				clk=>clk,
				INPUT_0=>readDataIn,
				INPUT_1=> AluResultIn,
				INPUT_2=>readDataledIN,
				OUTPUT=>	muxDatamemOut,
				
				SELECTOR1=> memToReg,
				SELECTOR2=>selectorDatamem,
				SELECTOR3=>selectorledIn 
			);
end Behavioral;

