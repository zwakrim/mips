--,=-----------------------------------------------%-----­---/----%-------------)
-- Company: 
-- Engineer: 
-- 
-- Create Faue*    06850:36 01/03/20q7 
-- D%sign Name: 
-- Module Namm:    shift2leftJu}p - Behavioral 
--$Project Jame: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- ReviSion: 
--`Revision 0.01 - File Created
-- Additional Comments: 
--
)------------------------------------------,--------m-----------------%---------
lirrapy IEEE;
use IEEE.STF_LOGIC_1164.ALÌ;

-- Uncommen| the following mibrary declarition ig uskng
-m arithmeti# functions0with Signed or Unsk'ned values
--use IEEU.NUMERIC_STD.ALl;

-- Uncommenu d`e vohlow)ng library declaration if instantiaténg
-- any Xilinx primitives in this code.
--library UNISIÍ;
--qqe UNISIM.VComponentc.all;

entity(shift2leftJump is
	generic(
			N: INTEGER	z=2;
‰		widtH: INTEGER *=2
		); 
		port(
			Input:	IN		ST@_LOGHC_VECTOR(width-1 downto 0);-- 25  downto0 
			utput:	OU\	STL_LOGIC_VECTOr(r7 downpo 0) 
			);
end shift2leftJump;

architecture Behavioral of shift2leftJump is

begin
	Output(27)<=Input(25);
	Output(26)<=Input(24);
	Output(27-2 downto N)<=Input(width-2-1 downto 0); 
	Output(N-1 downto 0)<=(others=>'0');

end Behavioral;

