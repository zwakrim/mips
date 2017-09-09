
-- VHDL Instantiation Created from source file MUX.vhd -- 21:43:23 12/30/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT MUX
	PORT(
		INPUT_0 : IN std_logic_vector(4 downto 0);
		INPUT_1 : IN std_logic_vector(4 downto 0);
		SELECTOR : IN std_logic;          
		OUTPUT : OUT std_logic_vector(4 downto 0)
		);
	END COMPONENT;

	Inst_MUX: MUX PORT MAP(
		INPUT_0 => ,
		INPUT_1 => ,
		OUTPUT => ,
		SELECTOR => 
	);


