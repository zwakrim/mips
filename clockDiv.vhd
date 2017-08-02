----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:51:23 01/29/2017 
-- Design Name: 
-- Module Name:    clockDiv - Behavioral 
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
 
 -- source https://www.codeproject.com/Tips/444385/Frequency-Divider-with-VHDL
entity clockDiv is
    Port ( clk : in  STD_LOGIC;
	 reset: in std_logic;
           clkDiv : out  STD_LOGIC);
end clockDiv;

architecture Behavioral of clockDiv is
		signal temporal: STD_LOGIC;
    signal counter : integer range 0 to 25 := 0;
begin

  frequency_divider: process (reset, clk) begin
        if (reset = '1') then
            temporal <= '0';
            counter <= 0;
        elsif rising_edge(clk) then
            if (counter = 25) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clkDiv <= temporal;
end Behavioral;

