----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:34:45 01/06/2017 
-- Design Name: 
-- Module Name:    SerialToParrallel - Behavioral 
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

entity SerialToParrallel is
	port(
		Serialin: in std_logic_vector(7 downto 0);
		dataOut: out std_logic_vector(31 downto 0);
		ReadEn: out std_logic;
		emptyIn: in std_logic;
		reset: in std_logic;
		clk: in std_logic
	);
end SerialToParrallel;

architecture Behavioral of SerialToParrallel is

signal counter: integer;
signal dataconcat: std_logic_vector(31 downto 0);
type FifoArray is array (0 to 3) of STD_LOGIC_VECTOR (7 downto 0);
signal dataArray : FifoArray;

begin
	process(clk, serialIn)
	begin
		if(rising_edge(clk)) then
			if(reset ='1') then -- alles op nul zetten
				dataconcat<= (others=>'0');
				counter <= 0;
				dataArray <= (others=>(others=>'0'));
				readEn<='0';
			else
				if(emptyIn='0') then
					readEn<='1';
					if (counter < 4)then
						dataArray(counter) <= Serialin;
						counter<= counter +1;
--					else
--						dataconcat<= dataArray(0) & dataArray(1) & dataArray(2) & dataArray(3);
--						counter <= 0;
--						readEn<='0';
					end if;
				end if;
			end if;
		end if;
	end process;
	dataOut <=dataconcat;
end Behavioral;

