--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:59:02 12/29/2016
-- Design Name:   
-- Module Name:   /home/zwakrim/Documents/computerarch/mips/signExtTB.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: signeExt
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
 
ENTITY signExtTB IS
END signExtTB;
 
	ARCHITECTURE behavior OF signExtTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT signeExt
    PORT(
         signExtInput : IN  std_logic_vector(15 downto 0);
         signExtOutput : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal signExtInput : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal signExtOutput : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant signExtInput_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: signeExt PORT MAP (
          signExtInput => signExtInput,
          signExtOutput => signExtOutput
        );

   -- Clock process definitions
  signExtInput_process :process
   begin
		signExtInput <= "0000000000000000";
		wait for signExtInput_period/2;
		signExtInput <= "0000000000000000";
		wait for signExtInput_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

    --  wait for signExtInputperiod*10;

      -- insert stimulus here 
		      wait for 100 ns;	

		signExtInput<="0000000000000001";
            wait for 100 ns;	
		signExtInput<="1000000000000001";

      wait;
   end process;

END;
