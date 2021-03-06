----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:31:03 01/27/2017 
-- Design Name: 
-- Module Name:    IOMemLedControl - Behavioral 
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

entity IOMemLedControl is
port(
			clk: in std_logic;
			AdressIn: in std_logic_vector(31 downto 0);
			writeDataIn: in std_logic_vector(31 downto 0);
			readDataOUT: out std_logic_vector(31 downto 0);
			memwriteIn: in std_logic;
			memreadIn: in std_logic;
			selectormux: out std_logic;
			led0 :out std_logic;
			led1 :out std_logic;
			led2 :out std_logic;
			led3 :out std_logic;
			led4 :out std_logic;
			led5 :out std_logic;
			led6 :out std_logic;
			led7 :out std_logic
		);
end IOMemLedControl;

architecture Behavioral of IOMemLedControl is
signal leds: std_logic_vector(7 downto 0);
begin
	dataLed: process(clk)
		type ramType is array (1 downto 0 ) of std_logic_vector(31 downto 0 ); --128 bytes
		variable ram: ramType := (others=> (others=>'0')); --alles op nul		
		 
		begin
			if(rising_edge(clk)) then 
				if(to_integer(unsigned(AdressIn))= 128) then
					selectormux<='0';	
					if (memwriteIn='1') then
						ram(128- to_integer(unsigned(AdressIn))):= writeDataIn;						
						if (to_integer(unsigned(writeDataIn))<256) then
							leds(0)<=writeDataIn(0);
							leds(1)<=writeDataIn(1);
							leds(2)<=writeDataIn(2);
							leds(3)<=writeDataIn(3);
							leds(4)<=writeDataIn(4);
							leds(5)<=writeDataIn(5);
							leds(6)<=writeDataIn(6);
							leds(7)<=writeDataIn(7);			
						end if;
					elsif(memreadIn ='1') then
						readDataOUT <= ram(128-to_integer(unsigned(AdressIn)));
						selectormux<='1';
					end if;
				end if;
			end if;
	end process ;
			led0 <= leds(0);
			led1 <= leds(1);
			led2 <= leds(2);
			led3 <= leds(3);
			led4 <= leds(4);
			led5 <= leds(5);
			led6 <= leds(6);
			led7 <= leds(7);

end Behavioral;

