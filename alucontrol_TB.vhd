--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:26:38 01/03/2017
-- Design Name:   
-- Module Name:   /home/zwakrim/Documents/computerarch/mips/aluControl_TB.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: aluControlUnit
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
 
ENTITY aluControl_TB IS
END aluControl_TB;
 
ARCHITECTURE behavior OF aluControl_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT aluControlUnit
    PORT(
         ALUop : IN  std_logic_vector(1 downto 0);
         instruction : IN  std_logic_vector(5 downto 0);
         AluControlOut : OUT  std_logic_vector(4 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ALUop : std_logic_vector(1 downto 0) := (others => '0');
   signal instruction : std_logic_vector(5 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal AluControlOut : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: aluControlUnit PORT MAP (
          ALUop => ALUop,
          instruction => instruction,
          AluControlOut => AluControlOut,
          clk => clk
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

      -- insert stimulus here 
		ALuOP<="10";
		instruction<= "100010";
		wait for clk_period*10;
		
		ALuOP<="10";
		instruction<= "100000";
		wait for clk_period*10;
		
      wait;
   end process;

END;
