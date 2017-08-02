----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:23:55 12/29/2016 
-- Design Name: 
-- Module Name:    shifleft2 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shifleft2 is
	generic(
		N: INTEGER	:=2;
		width: INTEGER :=32
	); 
	port(
		Input:	IN		STD_LOGIC_VECTOR(width-1 downto 0);
		Output:	OUT	STD_LOGIC_VECTOR(width-1 downto 0)
		);
end shifleft2;
----------------------------------------------------------------------------------
architecture Behavioral of shifleft2 is
begin
----------------------------------------------------------------------------------
	Output(width-1)<=Input(width-1);
	Output(width-2 downto N)<=Input(width-2-N downto 0);
	Output(N-1 downto 0)<=(others=>'0');
----------------------------------------------------------------------------------
end Behavioral;
