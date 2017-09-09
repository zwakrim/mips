--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:01:04 12/29/2016
-- Design Name:   
-- Module Name:   /home/zwakrim/Documents/computerarch/mips/controlUnitTB.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: controlUnit
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
 
ENTITY controlUnitTB IS
END controlUnitTB;
 
ARCHITECTURE behavior OF controlUnitTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT controlUnit
    PORT(
         Instruction : IN  std_logic_vector(5 downto 0);
         RegDst : OUT  std_logic;
         Branch : OUT  std_logic;
         MemRead : OUT  std_logic;
         MemtoReg : OUT  std_logic;
         ALUOp : OUT  std_logic_vector(1 downto 0);
         MemWrite : OUT  std_logic;
         ALUSrc : OUT  std_logic;
         RegWrite : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Instruction : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal RegDst : std_logic;
   signal Branch : std_logic;
   signal MemRead : std_logic;
   signal MemtoReg : std_logic;
   signal ALUOp : std_logic_vector(1 downto 0);
   signal MemWrite : std_logic;
   signal ALUSrc : std_logic;
   signal RegWrite : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Instruction_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: controlUnit PORT MAP (
          Instruction => Instruction,
          RegDst => RegDst,
          Branch => Branch,
          MemRead => MemRead,
          MemtoReg => MemtoReg,
          ALUOp => ALUOp,
          MemWrite => MemWrite,
          ALUSrc => ALUSrc,
          RegWrite => RegWrite
        );

   -- Clock process definitions
   Instruction_process:process
   begin
		Instruction <= "000000";
		wait for 10 ns;
		Instruction<= "000000";
		wait for 10 ns;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for <clock>_period*10;
		Instruction<= "001000";
		wait for 100 ns;	
		Instruction<= "000000";
      -- insert stimulus here 
		

      wait;
   end process;

END;
