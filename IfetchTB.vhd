--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:08:21 01/03/2017
-- Design Name:   
-- Module Name:   /home/zwakrim/Documents/computerarch/mips/IfetchTB.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: instructioDecoderAndRegisterRead
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
 
ENTITY IfetchTB IS
END IfetchTB;
 
ARCHITECTURE behavior OF IfetchTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instructioDecoderAndRegisterRead
    PORT(
         clk : IN  std_logic;
         instructions : IN  std_logic_vector(31 downto 0);
         writeData : IN  std_logic_vector(31 downto 0);
         shiftleft2jumpOut : OUT  std_logic_vector(27 downto 0);
         Branch : OUT  std_logic;
         MemRead : OUT  std_logic;
         MemtoReg : OUT  std_logic;
         ALUOp : OUT  std_logic_vector(1 downto 0);
         MemWrite : OUT  std_logic;
         ALUSrc : OUT  std_logic;
         jump : OUT  std_logic;
         readData1 : OUT  std_logic_vector(31 downto 0);
         readData2 : OUT  std_logic_vector(31 downto 0);
         signextOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal instructions : std_logic_vector(31 downto 0) := (others => '0');
   signal writeData : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal shiftleft2jumpOut : std_logic_vector(27 downto 0);
   signal Branch : std_logic;
   signal MemRead : std_logic;
   signal MemtoReg : std_logic;
   signal ALUOp : std_logic_vector(1 downto 0);
   signal MemWrite : std_logic;
   signal ALUSrc : std_logic;
   signal jump : std_logic;
   signal readData1 : std_logic_vector(31 downto 0);
   signal readData2 : std_logic_vector(31 downto 0);
   signal signextOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instructioDecoderAndRegisterRead PORT MAP (
          clk => clk,
          instructions => instructions,
          writeData => writeData,
          shiftleft2jumpOut => shiftleft2jumpOut,
          Branch => Branch,
          MemRead => MemRead,
          MemtoReg => MemtoReg,
          ALUOp => ALUOp,
          MemWrite => MemWrite,
          ALUSrc => ALUSrc,
          jump => jump,
          readData1 => readData1,
          readData2 => readData2,
          signextOut => signextOut
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
		instructions<=X"00000000";
		reset<='0';
		wait for clk_period*10;

      wait;
   end process;

END;
