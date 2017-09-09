----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:22:02 01/06/2017 
-- Design Name: 
-- Module Name:    Fifo - Behavioral 
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

--ref http://www.deathbylogic.com/2013/07/vhdl-standard-fifo/
entity Fifo is
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
end Fifo;

architecture Behavioral of Fifo is

begin
	process(clk)
		
		type FifoArray is array (0 to 3) of STD_LOGIC_VECTOR (7 downto 0);
		variable Memory : FifoArray;

		variable Head : natural range 0 to 3;
		variable Tail : natural range 0 to 3;
	
		variable Looped : boolean;
		begin
			if (rising_edge(CLK))then
			--alles op nul zetten en empty op nul 
				if reset = '1' then
					Head := 0;
					Tail := 0;
					
					Looped := false;
					
					Full  <= '0';
					Empty <= '1';
				else
					if(readEn ='1') then
						if((looped= true) or (head /= tail)) then -- /= verschillend van 
							--update data outpu 
							DataOut <= Memory(Tail);
							-- Update Tail pointer as needed
							if (Tail = 3) then --tail +1 als hij niet gelijk is aan 4
								Tail := 0;				
								Looped := false;
							else
								Tail := Tail + 1;
							end if;
						end if;
					end if;
				if (WriteEn = '1') then
					if ((Looped = false) or (Head /= Tail)) then
						-- Write Data to Memory
						Memory(Head) := DataIn;			
						-- Increment Head pointer as needed
					if (Head = 3) then
						Head := 0;
							
						Looped := true; 
					else
						Head := Head + 1;
					end if;
				end if;
			end if;
					-- Update Empty and Full flags
				if (Head = Tail) then
					if Looped then
						Full <= '1'; --looped true dan is het full 
						else
						Empty <= '1'; -- anders zijn ze gelijk aan nul leeg 
						end if;
					else
						Empty	<= '0';
						Full	<= '0';
					end if;
				end if;
			end if;
	end process;

end Behavioral;

