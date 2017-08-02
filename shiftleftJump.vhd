--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   07:10:47 01/03/2017
-- Design Name:   
-- Module Name:   /home/zwakrim/Documents/computerarch/mips/shiftleftJump.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shift2leftJump
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
 
ENTITY shiftleftJump IS
END shiftleftJump;
 
ARCHITECTURE behavior OF shiftleftJump IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shift2leftJump
    PORT(
         Input : IN  std_logic_vector(25 downto 0);
         Output : OUT  std_logic_vector(27 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Input : std_logic_vector(25 downto 0) := (others => '0');

 	--Outputs
   signal Output : std_logic_vector(27 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shift2leftJump PORT MAP (
          Input => Input,
          Output => Output
        );

   -- Clock process definitions
  -- <clock>_process :process
   --begin
--		<clock> <= '0';
	--wait for 10 ns;
	--	<clock> <= '1';
	--	wait for <clock>_period/2;
  -- end process;
 --

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

    --  wait for <clock>_period*10;
		Input<="11011100000000000111111111";
      -- insert stimulus here
		wait for 10 ns;			
		Input<="00011100000000000111111000";

      wait;
   end process;

END;
