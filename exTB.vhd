--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:31:56 01/27/2017
-- Design Name:   
-- Module Name:   /home/zwakrim/Documents/computerarch/mips/exTB.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: executeTM
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
 
ENTITY exTB IS
END exTB;
 
ARCHITECTURE behavior OF exTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT executeTM
    PORT(
         clk : IN  std_logic;
         AluControlInstructions : IN  std_logic_vector(5 downto 0);
         AluOP : IN  std_logic_vector(1 downto 0);
         readData2in : IN  std_logic_vector(31 downto 0);
         signextendIn : IN  std_logic_vector(31 downto 0);
         AluSrcIn : IN  std_logic;
         readData1In : IN  std_logic_vector(31 downto 0);
         adderIn1 : IN  std_logic_vector(31 downto 0);
         adderout : OUT  std_logic_vector(31 downto 0);
         zeroOut : OUT  std_logic;
         aluResultOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal AluControlInstructions : std_logic_vector(5 downto 0) := (others => '0');
   signal AluOP : std_logic_vector(1 downto 0) := (others => '0');
   signal readData2in : std_logic_vector(31 downto 0) := (others => '0');
   signal signextendIn : std_logic_vector(31 downto 0) := (others => '0');
   signal AluSrcIn : std_logic := '0';
   signal readData1In : std_logic_vector(31 downto 0) := (others => '0');
   signal adderIn1 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal adderout : std_logic_vector(31 downto 0);
   signal zeroOut : std_logic;
   signal aluResultOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: executeTM PORT MAP (
          clk => clk,
          AluControlInstructions => AluControlInstructions,
          AluOP => AluOP,
          readData2in => readData2in,
          signextendIn => signextendIn,
          AluSrcIn => AluSrcIn,
          readData1In => readData1In,
          adderIn1 => adderIn1,
          adderout => adderout,
          zeroOut => zeroOut,
          aluResultOut => aluResultOut
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
