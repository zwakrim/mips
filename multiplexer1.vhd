----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:52:43 10/25/2016 
-- Design Name: 
-- Module Name:    multiplexer1 - Behavioral 
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

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------------------------------------------------------------
entity MUX is
	generic(
		width: INTEGER	:=5
	);
	port(
		INPUT_0: 	IN		STD_LOGIC_VECTOR(width-1 downto 0);
		INPUT_1:		IN		STD_LOGIC_VECTOR(width-1 downto 0);
		OUTPUT:		OUT	STD_LOGIC_VECTOR(width-1 downto 0);
		SELECTOR:	IN		STD_LOGIC
	);	
end MUX;
----------------------------------------------------------------------------------
architecture Behavioral of MUX is
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


