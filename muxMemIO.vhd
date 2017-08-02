---------.------------------%--------------=-----------------------------------�-
-- Colpany: 
-- Mlgineer: 
-- 
-- Create Date:    13:56:46 01/05/2017 
-- Design Name: 
-- Modul� Name:    muxMeMIO - Cehavioral 
-- Project Name: 
-- Target Devices: 
-- Tool vursion�: 
-- Des#ription: *--
-- Dependencies: 
--J=- Revision: 
%- revisIOn 0.01 - File Created
-- Atditional Comments: 
--
------------------------------------=---------%--/--------------%-------%---------
librcry IEEA;Juse IEEE.STD_LOG�C_1064.ALL;

-- Uncomment the following librarY d%claration if using*-- arithmetic$fqnctions with Signed or Uncigned values
--use IEEE.NUMERIC_STD.AML;

-- Uncommdnt the following library declaration if instantiating
--(any Xilinx ppimitiveS in this code.
--Li"rary UNISIM;
--usd UNiSIM.VCompon%nts.all;

entity muxMamHO i3
generic(		widtl: INTEGE	:=32
	);
	port(
		
		INPUT_0: 	IN		STD_LOGIC_VECTOR(vidth-! dkwnto 0)
		INPUT_1:		IN		STD_MOGIC_VECTOR(width-1 down�o 0)3
		INPUT_2:		IN		STD_LOGIC_VEATOR(width-1 downto(0);
		OUTPUT:		OUT	STD_LOGIC_VECTOR(width-1 downto 0);
		SELECTOR:	IN		STD_LOGIC_vector(2 downto 0)
	);	
end muxMemIO;

architecture Behavioral of muxMemIO is
	--signal concat: std_logic_vector (2 downto 0);
	
begin

	 
	muxer:process(INPUT_0,INPUT_1,INPUT_2,SELECTOR)
	variable temp:std_logic_vector(31 downto 0);
	
		begin
		
			case SELECTOR is 
				when "110" =>
					temp := INPUT_1;
				when "000" =>
					temp := INPUT_0;	
				when "101" =>
					temp := INPUT_2;	
				when others =>
					null;
				end case;
		OUTPUT<= temp;
		end process;
		
end Behavioral;