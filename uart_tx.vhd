----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:41:04 05/11/2015 
-- Design Name: 
-- Module Name:    uart_tx - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart_tx is	
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
end uart_tx;

architecture arch of uart_tx is
	type state_type is (idle, start, data, stop);
	signal state_reg, state_next: state_type;
	signal s_reg, s_next: unsigned(3 downto 0);
	signal n_reg, n_next: unsigned(2 downto 0);
	signal b_reg, b_next: std_logic_vector(7 downto 0);
	signal tx_reg, tx_next: std_logic;
begin
--FSMD state & data register
process(clk,reset)
begin
	if(reset = '1') then
		state_reg <= idle;
		s_reg <= (others => '0');
		n_reg <= (others => '0');
		b_reg <= (others => '0');
		tx_reg <= '1';
	elsif (clk'event and clk='1') then
		state_reg <= state_next;
		s_reg <= s_next;
		n_reg <= n_next;
		b_reg <= b_next;
		tx_reg <= tx_next;
	end if;
end process;

--Next state logic & data path functional units/routing
process(state_reg, s_reg, n_reg, b_reg, s_tick, tx_reg, tx_start, din)
begin
	state_next <= state_reg;
	s_next <= s_reg;
	n_next <= n_reg;
	b_next <= b_reg;
	tx_next <= tx_reg;
	tx_done_tick <= '0';
	
	case state_reg is
		
		when idle =>
			ledTXOUT<= '0';
			tx_next <= '1';
			if (tx_start ='1') then
				state_next <= start;
				s_next <= (others => '0');
				b_next <= din;
			end if;	
		
		when start =>
			ledTXOUT<= '1';
			tx_next <= '0';
			if (s_tick ='1') then
				if (s_reg = 15) then
					state_next <= data;
					s_next <= (others => '0');
					n_next <= (others => '0');
			   else
					s_next <= s_reg + 1;
				end if;	
			end if;	
		
		when data => 
			tx_next <= b_reg(0);
			if(s_tick = '1') then
				IF(s_reg = 15) THEN
					s_next <= (others => '0');
					b_next <= '0' & b_reg(7 downto 1);
					if (n_reg = DBIT - 1) then
						state_next <= stop;
					else
						n_next <= n_reg + 1;
					end if;
				ELSE
					s_next <= s_reg + 1;
				END IF;			
			end if;
			
		when stop =>
			
			tx_next <= '1';
			if (s_tick = '1') then
				IF(s_reg = SB_TICK - 1) THEN
					state_next <= idle;
					tx_done_tick <= '1';
				ELSE
					s_next <= s_reg + 1;
				END IF;			
			end if;
		end case;
end process;		

tx <= tx_reg;		

end arch;











