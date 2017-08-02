--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:27:38 01/30/2017
-- Design Name:   
-- Module Name:   /home/zwakrim/Documents/computerarch/mipsZwakrim/testMips.vhd
-- Project Name:  mipsZwakrim
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TopLevelMips
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
 
ENTITY testMips IS
END testMips;
 
ARCHITECTURE behavior OF testMips IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TopLevelMips
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         regdstin : OUT  std_logic;
         input : IN  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal input : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal regdstin : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TopLevelMips PORT MAP (
          clk => clk,
          reset => reset,
          regdstin => regdstin,
          input => input
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

      wait for clk_period*100;

       wait for clk_period*100;
		reset <='1';
		wait for clk_period*100;
		reset <='0';
		input<= X"00000000";
      wait;
   end process;

END;
