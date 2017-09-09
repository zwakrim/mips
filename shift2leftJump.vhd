----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:50:36 01/03/2017 
-- Design Name: 
-- Module Name:    shift2leftJump - Behavioral 
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

entity shift2leftJump is
	generic(
			N: INTEGER	:=2;
			width: INTEGER :=26
		); 
		port(
			Input:	IN		STD_LOGIC_VECTOR(width-1 downto 0);-- 25  downto0 
			Output:	OUT	STD_LOGIC_VECTOR(27 downto 0) 
			);
end shift2leftJump;

architecture Behavioral of shift2leftJump is

begin
	Output(27)<=Input(25);
	Output(26)<=Input(24);
	Output(27-2 downto N)<=Input(width-2-1 downto 0); 
	Output(N-1 downto 0)<=(others=>'0');

end Behavioral;

