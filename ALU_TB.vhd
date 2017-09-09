--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:36:31 01/03/2017
-- Design Name:   
-- Module Name:   /home/zwakrim/Documents/computerarch/mips/ALU_TB.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_TB IS
END ALU_TB;
 
ARCHITECTURE behavior OF ALU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         data1 : IN  std_logic_vector(31 downto 0);
         data2 : IN  std_logic_vector(31 downto 0);
         alucontrolin : IN  std_logic_vector(4 downto 0);
         aluResult : inOUT  std_logic_vector(31 downto 0);
         zero : OUT  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal data1 : std_logic_vector(31 downto 0) := (others => '0');
   signal data2 : std_logic_vector(31 downto 0) := (others => '0');
   signal alucontrolin : std_logic_vector(4 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal aluResult : std_logic_vector(31 downto 0);
   signal zero : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          data1 => data1,
          data2 => data2,
          alucontrolin => alucontrolin,
          aluResult => aluResult,
          zero => zero,
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
		 data1 <=X"00000001";
       data2 <=X"00000002";
		 alucontrolin<="00000";
		 wait for clk_period*10; 
		 data1 <=X"00000001";
       data2 <=X"00000002";
		 alucontrolin<="01100";
		 wait for clk_period*10; 
		 data1 <=X"00000001";
       data2 <=X"00000002";
		 alucontrolin<="10000";
		 wait for clk_period*10; 
		 data1 <=X"00000001";
       data2 <=X"00000001";
		 alucontrolin<="10000";
		 

      -- insert stimulus here 

      wait;
   end process;

END;
