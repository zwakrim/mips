--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:08:44 01/03/2017
-- Design Name:   
-- Module Name:   /home/zwakrim/Documents/computerarch/mips/dataMem_TB.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: datamem
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
 
ENTITY dataMem_TB IS
END dataMem_TB;
 
ARCHITECTURE behavior OF dataMem_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT datamem
    PORT(
         clk : IN  std_logic;
         AdressIn : IN  std_logic_vector(31 downto 0);
         writeDataIn : IN  std_logic_vector(31 downto 0);
         readDataOUT : OUT  std_logic_vector(31 downto 0);
         memwriteIn : IN  std_logic;
         memreadIn : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal AdressIn : std_logic_vector(31 downto 0) := (others => '0');
   signal writeDataIn : std_logic_vector(31 downto 0) := (others => '0');
   signal memwriteIn : std_logic := '0';
   signal memreadIn : std_logic := '0';

 	--Outputs
   signal readDataOUT : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: datamem PORT MAP (
          clk => clk,
          AdressIn => AdressIn,
          writeDataIn => writeDataIn,
          readDataOUT => readDataOUT,
          memwriteIn => memwriteIn,
          memreadIn => memreadIn
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
		wait for clk_period*10;
		  AdressIn<= X"00000001";
		  writeDataIn<= X"01000101";
		  memwriteIn<= '1';
		  memreadIn<= '0';
		 wait for clk_period*10;
		  AdressIn<= X"00000002";
		  writeDataIn<= X"01010101";
		  memwriteIn<= '1';
		  memreadIn<= '0';
		 wait for clk_period*10;
		  AdressIn<= X"00000001";
		  writeDataIn<= X"01010101";
		  memwriteIn<= '0';
		  memreadIn<= '1';
		 wait for clk_period*10;
		  AdressIn<= X"00000002";
		  writeDataIn<= X"01010101";
		  memwriteIn<= '0';
		  memreadIn<= '1'; 		  
      wait;
   end process;

END;
