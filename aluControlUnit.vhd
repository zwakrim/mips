----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:37:16 12/29/2016 
-- Design Name: 
-- Module Name:    aluControlUnit - Behavioral 
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

entity aluControlUnit is
	port(
		ALUop: IN std_logic_vector(1 downto 0);
		instruction: IN std_logic_vector(5 downto 0);
		AluControlOut: OUT std_logic_vector(4 downto 0)
	);
end aluControlUnit;

architecture Behavioral of aluControlUnit is

begin
	aluoutprocces:process(ALUop,instruction)
		begin
			if (ALUop = "10") then -- rtype 
				case instruction is				
					when "100000" =>
						AluControlOut <= "00000"; --add
-----------------------------------------------------------------------------------						
					when "100001" =>
						AluControlOut <= "00001"; --add	usigned
-----------------------------------------------------------------------------------												
					when "100100" =>
						AluControlOut <= "00010"; --Bitwise AND	
-----------------------------------------------------------------------------------						
					when "011010" =>
						AluControlOut <= "00011"; --Divide	
-------------------------------------- ---------------------------------------------						
					when "011011" =>
							AluControlOut <= "00100"; --Devide unsigded						
-----------------------------------------------------------------------------------
					when "011000" =>
						AluControlOut <= "00101"; --multiply
-----------------------------------------------------------------------------------
					when "011001" =>
						AluControlOut <= "00110"; --multiply unsigned
-----------------------------------------------------------------------------------
					when "100111" =>
						AluControlOut <= "00111"; --bitwise nor
-----------------------------------------------------------------------------------
					when "100101" =>
						AluControlOut <= "01000"; --bitwise or
-----------------------------------------------------------------------------------
					when "000000" =>
						AluControlOut <= "01001"; --sll shift left
-----------------------------------------------------------------------------------
					when "101010" =>
						AluControlOut <= "01010"; --slt set to 1 if less than
-----------------------------------------------------------------------------------
					when "101011" =>
						AluControlOut <= "01100"; --sltu set to 1 f less than unsigned
-----------------------------------------------------------------------------------
					when "000011" =>
						AluControlOut <= "01101"; --arethmetic shift right (sigedext) 
-----------------------------------------------------------------------------------
					when "000010" =>
						AluControlOut <= "01110"; --shift right (0-extend) 
-----------------------------------------------------------------------------------
					when "100010" =>
						AluControlOut <= "01111"; --substract
-----------------------------------------------------------------------------------
					when "100011" =>
						AluControlOut <= "10000"; --substract unsigned
-----------------------------------------------------------------------------------
					when "100110" =>
						AluControlOut <= "10001"; --xor 
-----------------------------------------------------------------------------------
					when others =>
						AluControlOut <= "11011";
				end case;
			elsif (ALUop = "01") then  -- beq substract 
				AluControlOut <= "10000";
			elsif (ALUop = "00") then  -- sw lw substract 
				AluControlOut <= "00000"; -- then add 
			end if;
		
		end process aluoutprocces;
end Behavioral;

