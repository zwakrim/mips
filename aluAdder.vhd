----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:53:52 12/30/2016 
-- Design Name: 
-- Module Name:    aluAdder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity aluAdder is
	Port ( 
		input1: in  STD_LOGIC_VECTOR (31 downto 0);
		input2 :in  STD_LOGIC_VECTOR (31 downto 0);
		Clk : in  STD_LOGIC;
		result : out  STD_LOGIC_VECTOR (31 downto 0));
end aluAdder;

architecture Behavioral of aluAdder is

begin

	result <= input1 + input2;
end Behavioral;

