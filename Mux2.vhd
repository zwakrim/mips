----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:09:21 12/29/2016 
-- Design Name: 
-- Module Name:    Mux2 - Behavioral 
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

entity Mux2 is
generic(
		width: INTEGER	:=32
	);
	port(
		INPUT_0: 	IN		STD_LOGIC_VECTOR(width-1 downto 0);
		INPUT_1:		IN		STD_LOGIC_VECTOR(width-1 downto 0);
		OUTPUT:		OUT	STD_LOGIC_VECTOR(width-1 downto 0);
		SELECTOR:	IN		STD_LOGIC
	);	
end Mux2;

architecture Behavioral of Mux2 is

begin
	muxer:process(SELECTOR,INPUT_1,INPUT_0)
		begin
			if (SELECTOR='1') then
				OUTPUT<=INPUT_1;
			else
				OUTPUT<=INPUT_0;
			end if;
		end process;
end Behavioral;

