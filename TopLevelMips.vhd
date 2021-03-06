----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:56:47 01/29/2017 
-- Design Name: 
-- Module Name:    topLevelMips - Behavioral 
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

entity topLevelMips is
	port(
		clk: in std_logic;
		reset: in std_logic;
		led0 :out std_logic; 
		led1 :out std_logic;
		led2 :out std_logic;
		led3 :out std_logic;
		led4 :out std_logic; 
		led5 :out std_logic;
		led6 :out std_logic;
		led7 :out std_logic
	);
end topLevelMips;

architecture Behavioral of topLevelMips is

component ProcessorTopLevel is 
	port (
		clk: in std_logic;
		reset: in std_logic;
		--output:inout std_logic_vector(31 downto 0);
		led0 :out std_logic; 
		led1 :out std_logic;
		led2 :out std_logic;
		led3 :out std_logic;
		led4 :out std_logic; 
		led5 :out std_logic;
		led6 :out std_logic;
		led7 :out std_logic
	);
end component; 

component clockDiv is
    Port ( clk : in  STD_LOGIC;
				reset: in std_logic;
           clkDiv : out  STD_LOGIC);
end component;


signal clkconnect: std_logic;

begin

	clkdiv:clockDiv
		port map(
			clk=>clk,
			reset=>reset,
			clkDiv=> clkconnect
		);
		mipsproc:ProcessorTopLevel
port map(
		clk=>clkconnect,
		reset=>reset,
		--output:inout std_logic_vector(31 downto 0);
		led0 =>led0,
		led1 =>led1,
		led2 =>led2,
		led3 =>led3,
		led4 =>led4,
		led5 =>led5,
		led6 =>led6,
		led7 =>led7
	);
end Behavioral;

