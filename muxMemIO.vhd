----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:56:46 01/05/2017 
-- Design Name: 
-- Module Name:    muxMemIO - Behavioral 
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

entity muxMemIO is
generic(
		width: INTEGER	:=32
	);
	port(
		clk: in std_logic;
		INPUT_0: 	IN		STD_LOGIC_VECTOR(width-1 downto 0);
		INPUT_1:		IN		STD_LOGIC_VECTOR(width-1 downto 0);
		INPUT_2:		IN		STD_LOGIC_VECTOR(width-1 downto 0);
		OUTPUT:		OUT	STD_LOGIC_VECTOR(width-1 downto 0);
		SELECTOR1:	IN		STD_LOGIC;
		SELECTOR2:	IN		STD_LOGIC;
		SELECTOR3:	IN		STD_LOGIC
	);	
end muxMemIO;

architecture Behavioral of muxMemIO is

	
	
begin

	
	muxer:process(SELECTOR1,SELECTOR2,SELECTOR3,clk)
		variable concat: std_logic_vector (2 downto 0);
	
		begin
		concat:= SELECTOR1 & SELECTOR2 & SELECTOR3;
			case concat is 
				when "110" =>
					OUTPUT <= INPUT_0;
				when "000" =>
					OUTPUT <= INPUT_1;	
				when "101" =>
					OUTPUT <= INPUT_2;	
				when others =>
					OUTPUT <= INPUT_1;
				end case;

--			 if( SELECTOR1 ='1' AND SELECTOR2 ='1' AND SELECTOR3 ='0') then
--				OUTPUT <= INPUT_0;
--			elsif( SELECTOR1 ='0' AND SELECTOR2 ='0' AND SELECTOR3 ='0') then
--					OUTPUT<= INPUT_1;
--			elsif(SELECTOR1 ='1' AND SELECTOR2 ='0' AND SELECTOR3 ='1') then
--					OUTPUT<= INPUT_2;
--			 end if;			 
		end process;
end Behavioral;