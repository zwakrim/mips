----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:58:07 01/03/2017 
-- Design Name: 
-- Module Name:    memAccesTL - Behavioral 
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

entity memAccesTL is
	port(
		clk: in std_logic;
		--mux in
		programCounterIn: in std_logic_vector(31 downto 0);
		adderIn: in std_logic_vector(31 downto 0);
		-- mux out
		muxOut: out std_logic_vector(31 downto 0);
		
		-- and in 
		branchIn: in std_logic;
		zerIn: in std_logic;
		
		-- mem in
		memWriteIn: in std_logic;
		memReadIn: in std_logic;
		adressIn: in std_logic_vector(31 downto 0);
		writeDataIn: in std_logic_vector(31 downto 0);
		selectordatamemOUT: out std_logic;
		
		-- mem out
		readData: out std_logic_vector(31 downto 0);
		readLedDataout: out std_logic_vector(31 downto 0);
		
		--ledoutselector
		selectorledout: out std_logic;
	
		--ledsout
		led0 :out std_logic;
		led1 :out std_logic;
		led2 :out std_logic;
		led3 :out std_logic;
		led4 :out std_logic;
		led5 :out std_logic;
		led6 :out std_logic;
		led7 :out std_logic
	);
end memAccesTL;

architecture Behavioral of memAccesTL is

	component ANDP is
    Port ( zeroIn : in  STD_LOGIC;
           branchIN : in  STD_LOGIC;
           andOut : out  STD_LOGIC
			  );
	end component;
----------------------------------------------------------------------------------	
	component Mux2 is
		generic(
			width: INTEGER	:=32
		);
		port(
			INPUT_0: 	IN		STD_LOGIC_VECTOR(width-1 downto 0);
			INPUT_1:		IN		STD_LOGIC_VECTOR(width-1 downto 0);
			OUTPUT:		OUT	STD_LOGIC_VECTOR(width-1 downto 0);
			SELECTOR:	IN		STD_LOGIC
		);	
	end component;
----------------------------------------------------------------------------------
	component datamem is
			port(
				clk: in std_logic;
				AdressIn: in std_logic_vector(31 downto 0);
				writeDataIn: in std_logic_vector(31 downto 0);
				readDataOUT: out std_logic_vector(31 downto 0);
				memwriteIn: in std_logic;
				memreadIn: in std_logic;
				selectormux: out std_logic
				);
		end component;
----------------------------------------------------------------------------------
component IOMemLedControl is
port(
			clk: in std_logic;
			AdressIn: in std_logic_vector(31 downto 0);
			writeDataIn: in std_logic_vector(31 downto 0);
			readDataOUT: out std_logic_vector(31 downto 0);
			memwriteIn: in std_logic;
			memreadIn: in std_logic;
			selectormux: out std_logic;
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

-------------------------------------------------------------------------------
signal andOut: std_logic;
----------------------------------------------------------------------------------
begin
----------------------------------------------------------------------------------
	ANDP1: ANDP
    Port map ( 
			  zeroIn=>zerIn,
           branchIN=>branchIn,
           andOut=> andOut
			 );
----------------------------------------------------------------------------------		  );
	muxmemAccess: Mux2
			port map(
				INPUT_0=>programCounterIn,
				INPUT_1=> adderIn,
				OUTPUT=>	muxOut,
				SELECTOR=> andOut
			);
----------------------------------------------------------------------------------
	Datamems: datamem 
		port map(
			clk=>clk,
			AdressIn=>adressIn,
			writeDataIn=>writeDataIn,
			readDataOUT=>readData,
			memwriteIn=>memWriteIn,
			memreadIn=>memReadIn,
			selectormux=>selectordatamemOUT
			);
----------------------------------------------------------------------------------
	LEds: IOMemLedControl
		port map (
			clk=>clk,
			AdressIn=>adressIn,
			writeDataIn=>writeDataIn,
			readDataOUT=>readLedDataout,
			memwriteIn=>memWriteIn,
			memreadIn=>memReadIn,
			selectormux=>selectorledout,
			led0=>led0,
			led1=>led1,
			led2=>led2,
			led3=>led3,
			led4=>led4,
			led5=>led5,
			led6=>led6,
			led7=>led7
		);		
end Behavioral;

