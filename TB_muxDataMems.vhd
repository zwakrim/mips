--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:08:32 01/30/2017
-- Design Name:   
-- Module Name:   /home/zwakrim/Documents/computerarch/mipsZwakrim/TB_muxDataMems.vhd
-- Project Name:  mipsZwakrim
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: muxMemIO
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
 
ENTITY TB_muxDataMems IS
END TB_muxDataMems;
 
ARCHITECTURE behavior OF TB_muxDataMems IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT muxMemIO
    PORT(
         INPUT_0 : IN  std_logic_vector(31 downto 0);
         INPUT_1 : IN  std_logic_vector(31 downto 0);
         INPUT_2 : IN  std_logic_vector(31 downto 0);
         OUTPUT : OUT  std_logic_vector(31 downto 0);
         SELECTOR : IN  std_logic_vector(2 downto 0);
        -- SELECTOR2 : IN  std_logic;
         --SELECTOR3 : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal INPUT_0 : std_logic_vector(31 downto 0) := (others => '0');
   signal INPUT_1 : std_logic_vector(31 downto 0) := (others => '0');
   signal INPUT_2 : std_logic_vector(31 downto 0) := (others => '0');
   signal SELECTOR1 : std_logic := '0';
   signal SELECTOR2 : std_logic := '0';
   signal SELECTOR3 : std_logic := '0';

 	--Outputs
   signal OUTPUT : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: muxMemIO PORT MAP (
          INPUT_0 => INPUT_0,
          INPUT_1 => INPUT_1,
          INPUT_2 => INPUT_2,
          OUTPUT => OUTPUT,
          SELECTOR1 => SELECTOR1,
          SELECTOR2 => SELECTOR2,
          SELECTOR3 => SELECTOR3
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			INPUT_0 <= X"00000001";
          INPUT_1<= X"00000011";
          INPUT_2 <= X"000000ff";
			SELECTOR1<= '0';
          SELECTOR2 <= '0';
          SELECTOR3 <= '0';
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
