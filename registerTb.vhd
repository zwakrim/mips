--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:12:16 12/30/2016
-- Design Name:   
-- Module Name:   /home/zwakrim/Documents/computerarch/mips/registerTb.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RegisterFile
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
    
ENTITY registerTb Is
END registerTb;
 
ARCHITECTURE behavior OF registerTb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterFile
    PORT(
         Read_Register_1 : IN  std_logic_vector(4 downto 0);
         Read_Register_2 : IN  std_logic_vector(4 downto 0);
         Write_Register : IN  std_logic_vector(4 downto 0);
         RegWrite : IN  std_logic;
         write_data : IN  std_logic_vector(31 downto 0);
         read_data_1 : OUT  std_logic_vector(31 downto 0);
         read_data_2 : OUT  std_logic_vector(31 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Read_Register_1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Read_Register_2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Write_Register : std_logic_vector(4 downto 0) := (others => '0');
   signal RegWrite : std_logic := '0';
   signal write_data : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal read_data_1 : std_logic_vector(31 downto 0);
   signal read_data_2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
          Read_Register_1 => Read_Register_1,
          Read_Register_2 => Read_Register_2,
          Write_Register => Write_Register,
          RegWrite => RegWrite,
          write_data => write_data,
          read_data_1 => read_data_1,
          read_data_2 => read_data_2,
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

      wait;
   end process;

END;
