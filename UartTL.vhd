----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:11:13 01/05/2017 
-- Design Name: 
-- Module Name:    UartTL - Behavioral 
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

entity UartTL is
	port(
		clk: in std_logic;
		rxIN: in std_logic;
		txOUT: out std_logic;
		reset: in std_logic;
		tx_start: in std_logic;
		rx_start: in std_logic;
		dataRxIn: out std_logic_vector(31 downto 0);
		dataTXOut: in std_logic_vector(7 downto 0);

		ledRX: out std_logic;
		ledTX: out std_logic
	);

end UartTL;

architecture Behavioral of UartTL is
-------------------------------------------------------
		component mod_m_counter is
			 	generic(
		N: integer := 8; --number of bits bits of dvsr
		M: integer := 163 -- mod-M−− b a u d r a t e d i v i s o r
								-- DVSR = 5 0M/ ( 1 6 ∗ b a u d r a t e )
	);	
				
			 Port ( clk : in  STD_LOGIC;
					  reset : in  STD_LOGIC;
					  max_tick : out  STD_LOGIC;
					  q : out  STD_LOGIC_VECTOR (N-1 downto 0)
					  );
		end component;

-------------------------------------------------------
		component uart_rx is
			 generic(
				DBIT: integer := 8; -- # data bits
				SB_TICK: integer := 16 --# ticks for stop bits
			 );	
			 Port ( clk : in  STD_LOGIC;
					  reset : in  STD_LOGIC;
					  rx : in  STD_LOGIC;
					  s_tick : in  STD_LOGIC;
					  rx_done_tick : out  STD_LOGIC;
					  dout : out  STD_LOGIC_VECTOR (7 downto 0);
					  ledrxout: out std_logic;
					   fullIn : in std_logic
					  );
		end component;
-------------------------------------------------------
		component uart_tx is	
			 generic(
				DBIT: integer :=8; -- # data bits
				SB_TICK: integer :=16 -- # ticks for stop bit
			);
				
			 Port ( clk : in  STD_LOGIC;
					  reset : in  STD_LOGIC;
					  tx_start : in  STD_LOGIC;
					  s_tick : in  STD_LOGIC;
					  din : in  STD_LOGIC_VECTOR (7 downto 0);
					  tx_done_tick : out  STD_LOGIC;
					  tx : out  STD_LOGIC;
					  ledTXOUT: out STD_logic
					  );
				end component ;
-------------------------------------------------------

		component Fifo is
			port(
				clk: in std_logic;
				reset: in std_logic;
				writeEn: in std_logic;
				dataIn: in std_logic_vector(7 downto 0);
				dataOut: out std_logic_vector(7 downto 0);
				readEn: in std_logic;
				empty: out std_logic;
				full: out std_logic
				
			);
		end component;

-------------------------------------------------------
signal maxTick: std_logic;
signal Qout: std_logic_vector(7 downto 0);
signal rx_done_tick: std_logic;
signal tx_done_tick: std_logic;
signal rxdataout: std_logic_vector(7 downto 0);
signal txdataIn: std_logic_vector(7 downto 0);

signal fifoRxOUT: std_logic_vector(7 downto 0);
signal fifoTXOut:std_logic_vector(7 downto 0);
signal fifoRxIN: std_logic_vector(7 downto 0);

signal readEnrx: std_logic;
signal emptyRx: std_logic;
signal fullRX: std_logic;
-------------------------------------------------------

begin
	
	baudgen: mod_m_counter			 	
			 Port map ( 
						clk => clk,
					  reset => reset,
					  max_tick=> maxTick,
					  q =>open
					  );
-------------------------------------------------------	
	rxblock: uart_rx
		Port map ( 
				clk =>clk,
				reset =>reset,
				rx => rxIN,
				s_tick =>maxTick,
				rx_done_tick =>rx_done_tick,
				dout=>  fifoRxIN,
				ledrxout=>ledRX,
				fullIn=>fullRX
				);
	txblock: uart_tx
				
			 Port map ( 
						clk =>clk,
					  reset =>reset,
					  tx_start =>rx_start,
					  s_tick =>maxTick,
					  din => dataTXOut,
					  tx_done_tick =>tx_done_tick,
					  tx=> txOUT,
					  ledTXOUT=>ledTX
		);
		-------------------------------------------------
		rxfifo: fifo
			port map (
				clk=>clk,
				reset=>reset,
				writeEn=>rx_done_tick,
				dataIn=>fifoRxIN,
				dataOut=>fifoRxOUT,
				readEn=>readEnRX,
				empty=>emptyRx,
				full=>fullRX
				
			);

end Behavioral;

