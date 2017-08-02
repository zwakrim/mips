----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:13:26 12/29/2016 
-- Design Name: 
-- Module Name:    controlUnit - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controlUnit is
	port(
			Instruction : in  STD_LOGIC_VECTOR (5 downto 0);
			RegDst : out  STD_LOGIC;
			Branch : out  STD_LOGIC;
			MemRead : out  STD_LOGIC;
			MemtoReg : out  STD_LOGIC;
			ALUOp : out std_logic_vector(1 downto 0);
			MemWrite : out  STD_LOGIC;
			ALUSrc : out  STD_LOGIC;
			RegWrite : out  STD_LOGIC;
			jump: out std_logic
			);
end controlUnit;

architecture Behavioral of controlUnit is

begin

	aluOutputs: process(Instruction)
		begin
		--if(rising_edge(clk)) then
			 case Instruction is
			
				when "000000" => --r_format
				-- add, add unsigne, bitwise AND, divide, unsigned divide,
				-- multiply, unsigned multiply , bitwise nor, bitwise or
				-- sub, unsigned sub, bitwise xor,jr jump to adress in register
					RegDST   <= '1';
					ALUSrc   <= '0';
					MemtoReg <= '0'; 
					RegWrite <= '1';
					MemRead  <= '0';
					MemWrite <= '0';
					Branch   <= '0';
					jump		<= '0';				
					ALUOp    <= "10";
						
				when "000100" => --branch if equal 
				
					RegDST   <= '0';
					ALUSrc   <= '0';
					MemtoReg <= '0'; 
					RegWrite <= '0';
					MemRead  <= '0';
					MemWrite <= '0';
					Branch   <= '1';
					jump		<= '0';							
					ALUOp    <= "01";
					
				when "100011" => --lw 
				
					RegDST   <= '0';
					ALUSrc   <= '1';
					MemtoReg <= '1'; 
					RegWrite <= '1';
					MemRead  <= '1';
					MemWrite <= '0';
					Branch   <= '0';
					jump		<= '0';							
					ALUOp    <= "00";
					
				when "101011" => --sw
				
					RegDST   <= '0';
					ALUSrc   <= '1';
					MemtoReg <= '1'; 
					RegWrite <= '0';
					MemRead  <= '0';
					MemWrite <= '1';
					Branch   <= '0';	
					jump		<= '0';		
					ALUOp    <= "11";
					
				when "000010" => --jump
				
					RegDST   <= '1';
					ALUSrc   <= '0';
					MemtoReg <= '0'; 
					RegWrite <= '0';
					MemRead  <= '0';
					MemWrite <= '0';
					Branch   <= '0';
					jump		<= '0';							
					ALUOp    <= "00";
					
				when "001000" => --addi
				
					RegDST   <= '0';
					ALUSrc   <= '1';
					MemtoReg <= '0'; 
					RegWrite <= '1';
					MemRead  <= '0';
					MemWrite <= '0';
					Branch   <= '0';
					jump		<= '0';							
					ALUOp    <= "00";
								
				when others => --default
				
					RegDST   <= '0';
					Branch   <= '0';
					MemRead  <= '0';
					MemWrite <= '0';
					MemtoReg <= '0';
					ALUSrc   <= '0';
					RegWrite <= '0';
					jump		<= '0';		
					ALUOp    <= "00";
					
			  end case;
			--end if;
		end process aluOutputs;
end Behavioral;

