----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:37:17 12/29/2016 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU is
	port(
		data1: In std_logic_vector(31 downto 0);
		data2: in std_logic_vector(31 downto 0);
		alucontrolin: in std_logic_vector(4 downto 0);
		aluResult: out std_logic_vector(31 downto 0);
		zero: out std_logic;
		clk : in std_logic	
	);
end ALU;

architecture Behavioral of ALU is
	--signal zerosOut: std_logic_vector(31 downto 0) := (others => '0'); --32 zeros als output
   	signal bufferint : std_logic_vector(31 downto 0);

begin
	
	AluCalc: process(clk, data1,data2,alucontrolin)
		begin
			if(rising_edge(Clk)) then
				zero<='0'; -- giv defalut value to zero 
				case alucontrolin is
------------------------------------------------------------------------------------
						-- r Type
					when "00000"=> --add
						aluResult <= std_logic_vector(signed(data1) + signed(data2));
					-----------------------------------------
					when "00001"=> --add unsigned
						aluResult <= std_logic_vector(unsigned(data1) + unsigned(data2));
					-----------------------------------------
					when "00010"=> --bitwise and
						aluResult <= data1 and data2;
					-----------------------------------------
					when "00011"=> --devide
						if (data2 /= x"00000000") then
							aluResult <= std_logic_vector(signed(data1) / signed(data2));
						end if;
					-----------------------------------------
					when "00100"=> --devide unsigned
						if (data2 /= x"00000000") then
						
							aluResult <= std_logic_vector(unsigned(data1) / unsigned(data2));
						end if;
					-----------------------------------------
					when "00101"=> --multiply
						--aluResult <= to_stdlogicvector(to_integer(signed(data1)) * to_integer(signed(data2)));
					-----------------------------------------
					when "00110"=> --multiply unsigned
						--aluResult <= std_logic_vector(unsigned(data1) * unsigned(data2));
					-----------------------------------------
					when "00111"=> --bitwise nor
						aluResult <= data1 nor data2;
					-----------------------------------------
					when "01000"=> --bitwise or
						aluResult <= data1 or data2;
					-----------------------------------------
					when "01001"=> --logical shift left
						aluResult <=to_stdlogicvector(to_bitvector(data1) sll to_integer(unsigned(data2)));
					-----------------------------------------
					when "01010"=> --set to 1 if less than
						if(signed(data1)< signed(data2)) then
							aluResult <= X"00000001";
						
						else
							aluResult <= X"00000000";
						end if;
					-----------------------------------------
					when "01100"=> --set to 1 if less than unsigned
						if(unsigned(data1)< unsigned(data2)) then
							aluResult <= X"00000001";
							else
							aluResult <= X"00000000";
						end if;
					-----------------------------------------
					when "01101"=> --arithmetic shift right
						aluResult <=to_stdlogicvector(to_bitvector(data1) sra to_integer(unsigned(data2)));
					-----------------------------------------
				 	when "01110"=> --logic shift right
						aluResult <=to_stdlogicvector(to_bitvector(data1) srl to_integer(unsigned(data2)));
					-----------------------------------------
					when "01111"=> --substract
						aluResult <= std_logic_vector(signed(data1) - signed(data2));
					-----------------------------------------
					when "10000"=> --substract unsigned
						bufferint <= std_logic_vector(unsigned(data1) - unsigned(data2));
							if (bufferint= X"00000000") then
								zero<='1';
							else
								zero <='0';
						end if ;
					-----------------------------------------
					when "10001"=> --multiply unsigned
						aluResult <=data1 xor data2;
					-----------------------------------------
					when others =>
						null;
				end case;
			end if;
		
		end process AluCalc;
end Behavioral;

