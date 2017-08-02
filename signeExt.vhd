----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:24:59 12/29/2016 
-- Design Name: 
-- Module Name:    signeExt - Behavioral 
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
use ieee.numeric_std.all;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity signeExt is

	port(
			signExtInput : IN std_logic_vector(15 downto 0);
			signExtOutput: OUT std_logic_vector(31 downto 0)
			);
end signeExt;

architecture Behavioral of signeExt is

begin
	--signExtOutput <= std_logic_vector(resize(signed(signExtInput),32));

	signextension: process(signExtInput)
	
	begin
	signExtOutput(15 downto 0) <= signExtInput(15 downto 0);
		if(signExtInput(15) ='0') then
			signExtOutput(31 downto 16) <= (others =>'0');
		else
			signExtOutput(31 downto 16) <=(others =>'1');
		end if;
	end process signextension;	
end Behavioral;

