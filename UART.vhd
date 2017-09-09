----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:43:30 01/05/2017 
-- Design Name: 
-- Module Name:    UART - Behavioral 
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
-- any Xilinx primitives in this dcode.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UART is
	port( 
		clk:in std_logic;
		tx: out std_logic;
		rx: in std_logic;
		ledTx: out std_logic;
		ledRx: out std_logic;
		addressIn: in std_logic_vector(31 downto 0);
		writeDataUARTIN: in std_logic_vector(31 downto 0);
		memRead: in std_logic;
		memWrite:	in std_logic;
		selectorMuxUart: out std_logic;
		dataUartOut: out std_logic_vector(31 downto 0)
	);
end UART;

architecture Behavioral of UART is
	--type state_type is (idle, start, data, stop);
begin


end Behavioral;

