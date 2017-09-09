----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:40:50 05/11/2015 
-- Design Name: 
-- Module Name:    uart_rx - Behavioral 
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

entity uart_rx is
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
end uart_rx;

architecture arch of uart_rx is

	type state_type is (idle, start, data, stop);
	signal state_reg, state_next: state_type;
	signal s_reg, s_next: unsigned(3 downto 0);
	signal n_reg, n_next: unsigned(2 downto 0);
	signal b_reg, b_next: std_logic_vector(7 downto 0);
	
begin
--FSMD state & data register
		process(clk,reset)
		begin
			if(reset = '1') then
				state_reg <= idle;
				s_reg <= (others => '0');
				n_reg <= (others => '0');
				b_reg <= (others => '0');
			elsif (clk'event and clk='1') then
				state_reg <= state_next;
				-- alles op nul zettten
				s_reg <= s_next; -- telt tot  7 en dan tot 15 om in het midden van de bit te zijn
				n_reg <= n_next; -- telt van 0 tot 7 om 8 bits te hebben
				b_reg <= b_next; -- gekregen bits worden hier onthourd
			end if;
		end process;

--Next state logic & data path functional units/routing
	process(state_reg, s_reg, n_reg, b_reg, s_tick, rx)
		begin
			state_next <= state_reg;
			s_next <= s_reg;
			n_next <= n_reg;
			b_next <= b_reg;
			rx_done_tick <= '0';

		case state_reg is
				
				when idle =>
					ledrxout<='0';
					if (rx ='0') then -- rx naar laag beginnen van het receiven
						if(fullin='0') then
							state_next <= start; -- state start
							s_next <= (others => '0');
						end if;
					end if;	
				
				when start =>
					ledrxout<= '1';
					if (s_tick ='1') then
						if (s_reg = 7) then -- beginnen te tellen tot 1 om in het midden te zijn 
							state_next <= data; -- next state data
							s_next <= (others => '0'); --registers op nul zetten
							n_next <= (others => '0');
						else
							s_next <= s_reg + 1;
						end if;	
					end if;	
					
				when data =>	
					if(s_tick = '1') then
						if (s_reg = 15) then -- als we in het midden zitten
							s_next <= (others => '0'); --s reg terug om nul zetten om daarnaa weer tot 15 te kunnen tellen 
							b_next <= rx & b_reg(7 downto 1); --b reg = rxbit concatenet  bnext is 8ste bit geconateneerd met de rest
							if (n_reg=DBIT - 1) then --als n reg =8-1 DBIT = 8  als men 8 bits heeft dan stoppen
								state_next <= stop;  -- next state stop 
							else
								n_next <= n_reg + 1; 
							end if;
						else
							s_next <= s_reg + 1;
						END IF;			
					end if;

					
				when stop => -- stoppen 
					if (s_tick = '1') then 
						IF(s_reg = SB_TICK - 1) THEN  -- s_reg = 15 dan stop bit
							state_next <= idle; -- next state idle
							rx_done_tick <= '1'; -- gedaan is op 1
						ELSE
							s_next <= s_reg + 1; 
						END IF;			
					end if;
				end case;
		end process;			

	dout <= b_reg; -- dout = b_reg			
			
end arch;

