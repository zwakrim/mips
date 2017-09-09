--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:14:11 01/03/2017
-- Design Name:   
-- Module Name:   /home/zwakrim/Documents/computerarch/mips/IFTB.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: InstructionFetchToplayer
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY IFTB IS
END IFTB;
 
ARCHITECTURE behavior OF IFTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InstructionFetchToplayer
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         programCounterIn : IN  std_logic_vector(31 downto 0);
         adder4OuT : OUT  std_logic_vector(31 downto 0);
         instructionOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal programCounterIn : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal adder4OuT : std_logic_vector(31 downto 0);
   signal instructionOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InstructionFetchToplayer PORT MAP (
          clk => clk,
          reset => reset,
          programCounterIn => programCounterIn,
          adder4OuT => adder4OuT,
          instructionOut => instructionOut
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		reset <='0';
      programCounterIn <=X"00000000";
		wait for clk_period*10;
		programCounterIn <=X"00000004";
		wait for clk_period*10;
		reset <='1';
		wait for clk_period*10;
		reset <='0';
      wait for clk_period*10;

      wait;
   end process;

END;
