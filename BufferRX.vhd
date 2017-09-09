----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:09:09 01/06/2017 
-- Design Name: 
-- Module Name:    BufferRX - Behavioral 
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

entity BufferRX is
	port(
		clk : in std_logic;
		reset: in std_logic;
		clr_flag , set_flag : in std_logic ;
		din: in std_logic_vector(7 downto 0);
		dout: out std_logic_vector(7 downto 0);
		flag: out std_logic
	);
	
end BufferRX;

architecture Behavioral of BufferRX is

	signal buf_reg , buf_next : std_logic_vector (7 downto 0);
	signal flag_reg , flag_next : std_logic ;
begin
	process(clk, reset)
		begin
		--alles op nul zetten bij reset
			if (reset='1') then
				buf_reg<= ( others => '0');
				flag_reg <= '0';
			elsif(rising_edge(clk)) then
				buf_reg <= buf_next ;
				flag_reg <= flag_next ;
			end if;		
	end process;
	-------------------------------------------------
	process( buf_reg , flag_reg , set_flag , clr_flag , din )
		begin
			buf_next <= buf_reg ;
			flag_next <= flag_reg;
			if (set_flag ='1') then
				buf_next <= din;
				flag_next <= '1';
			elsif ( clr_flag ='1') then
				flag_next<= '0';
			end if;
		end process;
	dout <= buf_reg;
	flag <= flag_reg;
end Behavioral;
--ref:http://academic.csuohio.edu/chu_p/rtl/fpga_vhdl_book/fpga_vhdl_sample_chapter.pdf
