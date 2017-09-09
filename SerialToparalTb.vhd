--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:24:02 01/06/2017
-- Design Name:   
-- Module Name:   /home/zwakrim/Documents/computerarch/mips/SerialToparalTb.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SerialToParrallel
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
 
ENTITY SerialToparalTb IS
END SerialToparalTb;
 
ARCHITECTURE behavior OF SerialToparalTb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SerialToParrallel
    PORT(
         Serialin : IN  std_logic_vector(7 downto 0);
         dataOut : OUT  std_logic_vector(31 downto 0);
         ReadEn : OUT  std_logic;
         emptyIn : IN  std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Serialin : std_logic_vector(7 downto 0) := (others => '0');
   signal emptyIn : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal dataOut : std_logic_vector(31 downto 0);
   signal ReadEn : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SerialToParrallel PORT MAP (
          Serialin => Serialin,
          dataOut => dataOut,
          ReadEn => ReadEn,
          emptyIn => emptyIn,
          reset => reset,
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
      wait for 200 ns;	

      wait for clk_period*20;
		reset <='1';
		wait for clk_period*20;
		emptyIn<='0';
		reset <='0';
		Serialin<= "11111111";
      wait;
   end process;

END;
