--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:37:23 01/27/2017
-- Design Name:   
-- Module Name:   /home/zwakrim/Documents/computerarch/mips/mipsTB.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ProcessorTopLevel
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
-------------------- ------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mipsTB IS
END mipsTB;
 
ARCHITECTURE behavior OF mipsTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProcessorTopLevel
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
--         output : INOUT  std_logic_vector(31 downto 0);
         led0 : OUT  std_logic;
         led1 : OUT  std_logic;
         led2 : OUT  std_logic;
         led3 : OUT  std_logic;
         led4 : OUT  std_logic;
         led5 : OUT  std_logic;
         led6 : OUT  std_logic;
         led7 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';

	--BiDirs
   signal output : std_logic_vector(31 downto 0);

 	--Outputs
   signal led0 : std_logic;
   signal led1 : std_logic;
   signal led2 : std_logic;
   signal led3 : std_logic;
   signal led4 : std_logic;
   signal led5 : std_logic;
   signal led6 : std_logic;
   signal led7 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProcessorTopLevel PORT MAP (
          clk => clk,
          reset => reset,
--          output => output,
          led0 => led0,
          led1 => led1,
          led2 => led2,
          led3 => led3,
          led4 => led4,
          led5 => led5,
          led6 => led6,
          led7 => led7
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
		reset<='1';
		
      wait for clk_period*100;
		reset<='0';
		 wait for clk_period*100;
		reset<='0';
      -- insert stimulus here 
      wait;
   end process;

END;
