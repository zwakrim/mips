----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:18:00 12/30/2016 
-- Design Name: 
-- Module Name:    datamem - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity datamem is
	port(
			clk: in std_logic;
			AdressIn: in std_logic_vector(31 downto 0);
			writeDataIn: in std_logic_vector(31 downto 0);
			readDataOUT: out std_logic_vector(31 downto 0);
			memwriteIn: in std_logic;
			memreadIn: in std_logic;
			selectormux: out std_logic
		);
end datamem;

architecture Behavioral of datamem is

begin

	dataMEM: process(clk)
	
		type ramType is array (127 downto 0 ) of std_logic_vector(31 downto 0 ); --128 bytes
		variable ram: ramType := (others=> (others=>'0')); --alles op nul		
		begin
		selectormux<='0';	
			if(rising_edge(clk)) then 
				if(to_integer(unsigned(AdressIn))< 128) then
					
					if (memwriteIn='1') then
						ram(to_integer(unsigned(AdressIn))):= writeDataIn;
					elsif(memreadIn ='1') then
						readDataOUT <= ram(to_integer(unsigned(AdressIn)));
						selectormux<='1';
					end if;
					
				ELSE
				selectormux<='0';	
				end if;
			end if;
	end process ;


end Behavioral;

