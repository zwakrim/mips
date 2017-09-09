----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:22:30 05/11/2015 
-- Design Name: 
-- Module Name:    mod_m_counter - Behavioral 
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

--1 9 2 0 0 baud , 8 d a t a b i t s , 1 s t o p b i t , 2 ˆ 2 FIFO
entity mod_m_counter is
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
end mod_m_counter;

architecture arch of mod_m_counter is
	signal r_reg: unsigned(N-1 downto 0); --r register 8 bits
	signal r_next: unsigned(N-1 downto 0); -- r next ook 8 bits
begin
	--register
	process(clk, reset)
	begin
		if(reset = '1') then
			r_reg <= (others =>'0'); -- alles op nul zetten
		elsif (clk' event and clk='1') then -- zelfde als risign edge?
			r_reg <= r_next; --
		end if;
	end process;
	
	--next state logic
	r_next <= (others =>'0') when r_reg =(M-1) else r_reg +1; -- r next = nul als 162 -1 
	
	--output logic
	q <= std_logic_vector(r_reg);
	max_tick <= '1' when r_reg=(M-1) else '0'; -- max tik = 1 bij r_reg 162
	
end arch;













