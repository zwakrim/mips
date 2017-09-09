----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:28:02 01/06/2017 
-- Design Name: 
-- Module Name:    memUart - Behavioral 
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

entity memUart is
	port(
		clk: in std_logic;
		memRead: in std_logic;
		memWirte: in std_logic;
		AdressIn: in std_logic_vector(31 downto 0);
		WriteDataProcIN: in std_logic_vector(31 downto 0);
		WriteDataUartIN: in sdt_logic_vector(31 downto 0);
		
		DataOutTXUart: out std_logic_vector(7 downto 0);
		DataInRXUart: In std_logic_vector(7 downto 0)
		
	);
end memUart;

architecture Behavioral of memUart is

begin


end Behavioral;

