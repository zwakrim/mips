----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:47:41 01/03/2017 
-- Design Name: 
-- Module Name:    InstructionFetchToplayer - Behavioral 
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

entity InstructionFetchToplayer is
	port(
		clk: in std_logic;
		reset: in std_logic;
		programCounterIn: in std_logic_vector(31 downto 0);
		adder4OuT: out std_logic_vector(31 downto 0);
		instructionOut: out std_logic_vector(31 downto 0)
		);

end InstructionFetchToplayer;

architecture Behavioral of InstructionFetchToplayer is

component Imem is
		port(
			clk:		in		std_logic;
			addr:		in		std_logic_vector(31 downto 0);
			instruction:	out	std_logic_vector(31 downto 0)	
		); 
	end component;
	
	component PCadder is
		port(
			clk:	 	in		std_logic;
			PCin:    in		std_logic_vector(31 downto 0);
			PCout: 	out 	std_logic_vector(31 downto 0)
		);
	end component ; 
	component PC is
		port(
			clk: in std_logic; 
			reset: in std_logic;
			pc_in: in std_logic_vector(31 downto 0);
			pc_out: out std_logic_vector(31 downto 0)
		);
	end component;
	
	-- signals 
	
	signal pcin:	std_logic_vector(31 downto 0);
--	signal instruction:	std_logic_vector(31 downto 0);
-------------------------------------------------------------------------	
begin
	programcounter: PC
			port map(
				clk,
				reset=>reset,
				pc_in=>programCounterIn,
				pc_out=>pcin
				);
-------------------------------------------------------------------------
	 pc4:pcadder
		port map(
			clk=> clk,
			PCin=>pcin,
			PCout=>adder4OuT
		);
----------------------------------------------------------------------------------	
	 instructions:Imem
		port map(
			clk=> clk,
			addr=>pcin,
			instruction=>instructionOut
		);
	
end Behavioral;

