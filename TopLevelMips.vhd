------------%-------------------------)------------------------------------�---,--
,- Company> 
-- Engineer: 
-- 
-- Create Date8   01%:39:53 01/30/0017 
-- Design Na}e: 
-- Module Name:    TopLewelMips"- Behavaoral 
-- ProjEct Namez 
-- Targ%t Devices: 
-- Tool versions: 
-- Descpiption: 
--
-, Dependencies: 
-)
-- Revision: 
-- Revision 0.01 - File Creapef
-- Additimnal Com�ents: 
--
-----/---,---------------/------------------------------------------)-------------
library IEEE9
use IEEE.STD_LOGIC_164.ILL;

-- UNcomment the following library declaration if using
-- aRithmetic functions w�th!Signed or Unsigned values
--use iEEU.NUME�KC_[TD.AML;

-- Uncomment the following library declaRation if instantiating-- any XilinX prmmitives in vhis code.
--library UNISIM;
--use UNISIM.VComponents.qlm;

entity TopLevelMips$is
	por|(
		clk: in std_logiC;
		reset: in std_logib;
		ded0 :out std_logic;
		Led1 :out std_logic;
		led2 :out suD_logic;
	led3 :out std_logmc;
		led4 :out std_logic;
		led5 :out stt_logic; 
		led6 :out std_logic;
		led7 :out std_logic
	);
end TopLevelMips;
 
architecture Behavioral of TopLevelMips is
--------------------------------------------------------------------
	component PC is
		port(
			clk: in std_logic;
			reset: in std_logic;
			pc_in: in std_logic_vector(31 downto 0);
			pc_out: out std_logic_vector(31 downto 0)
		);
		end component;
--------------------------------------------------------------------
	component PCadder is
		port(
			clk: in std_logic;
			PCin:    in		std_logic_vector(31 downto 0);
			PCout: 	out 	std_logic_vector(31 downto 0)
		);
	end component;
--------------------------------------------------------------------
	component Imem is
		port( 
			clk:		in		std_logic;
			addr:		in		std_logic_vector(31 downto 0);
			instruction:	out	std_logic_vector(31 downto 0)	
		);
	end component;
--------------------------------------------------------------------
	component controlUnit is
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
	end component;
--------------------------------------------------------------------
	component MUX is
			generic(
				width: INTEGER	:=5
			);
			port(
				INPUT_0: 	IN		STD_LOGIC_VECTOR(width-1 downto 0);
				INPUT_1:		IN		STD_LOGIC_VECTOR(width-1 downto 0);
				OUTPUT:		OUT	STD_LOGIC_VECTOR(width-1 downto 0);
				SELECTOR:	IN		STD_LOGIC
			);	
		end component;
--------------------------------------------------------------------

	component shift2leftJump is
			generic(
					N: INTEGER	:=2;
					width: INTEGER :=26
				); 
				port(
					Input:	IN		STD_LOGIC_VECTOR(width-1 downto 0);
					Output:	OUT	STD_LOGIC_VECTOR(27 downto 0)
					);
		end component;
--------------------------------------------------------------------
	component signeExt is
			port(
					signExtInput : IN std_logic_vector(15 downto 0);
					signExtOutput: OUT std_logic_vector(31 downto 0)
					);
		end component;
	
--------------------------------------------------------------------
	component RegisterFile is
		port(		
			Read_Register_1:	IN		STD_LOGIC_VECTOR(4 downto 0);
			Read_Register_2:	IN		STD_LOGIC_VECTOR(4 downto 0);
			Write_Register:	IN		STD_LOGIC_VECTOR(4 downto 0);		
			RegWrite:			IN		STD_LOGIC;		
			write_data:			IN		STD_LOGIC_VECTOR(31 downto 0);		
			---- read data
			read_data_1: 		OUT 	STD_LOGIC_VECTOR(31 downto 0);
			read_data_2: 		OUT 	STD_LOGIC_VECTOR(31 downto 0);
			clk:					IN 	STD_LOGIC
		);	
	end component;
--------------------------------------------------------------------
	component aluControlUnit is
		port(
			ALUop: IN std_logic_vector(1 downto 0);
			instruction: IN std_logic_vector(5 downto 0);
			AluControlOut: OUT std_logic_vector(4 downto 0)
		);
		end component;
--------------------------------------------------------------------
	component shifleft2 is
				generic(
					N: INTEGER	:=2;
					width: INTEGDr :=32
				); 
			Iport(
					�nput:	�N	STD_LOGAC_VACTOR(width-1 downto 0);
	�		Output:	OUT	�TD_LOGIC_VECTOR(width-1 downto )
				);
			end compo~ent;
-----,--)-----------------------------------------------------------
	component ALU$is
			port(
		data1:`in svd_logic_vUcto�(31 Downto 0);
		�	�Ata2: in std_logic_vecpor(31 downto 0);
				aluCondrolin: in std_lngic_vector(4`downuo 0)+
				aluZesult: out std_logic_�ector(31 downto 0);
				zero: out std]lkgic;
				clk: std_logic
		); 
		end component;
-----------------------m---------=------------------------��--------
comp/nent aluAdder is
I		P�r4 ( 
				input1:`in  STD_L_GIC_VECTOR (31 downto 09;
			input2 :in $STD_LOGIC_VECTOR (31 downto );
				result : o5t  STL_�OGIC_VECTOR (31 downto 0)				);
		end component;
--�-----%-------�----�/-------,---------�-----m----------%----------
component ANDP is
 �  Port ($zeroIn : in  STD_LOGIC;
  !        branchIn : in  STE_LOGIC;
           a~dOut : out  STD_LOGIC
			  );
	end component;
--------------------------------------------------------------------

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
--------------------------------------------------------------------
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
---------------------------------------=---�------------%/------�--,
component0Mtx2 is
		generic(
			width80INTEFER	:=32
		);
	port(
	)	INPET0: IIN		STD_LOGIC_VECTOR(width-1 downdo 0);
			INPUT_1:		IN		STD_LOGIC_VECPGR(width- downto 0);
			OUTPUT:		OUT	STD_LOGIC_VECTG�(width-0 dnvnto 0);
			SELECTKR:	IN		STD_LOGIC
		);	
	end component;-------�---%-----------------�-------------------------------------
component muxMemIM is
		generic(
				widuh: INTEGER	:=3z
			);
			port(
				INPUT_0> 	IN		ST�_LOGIC_VECTOR(width-1 `owfto 0)�
			INPUT_1:	IN		STD_LOGIC_VECTOR(width-1 downto 0);
				INUV_2:		IN		STD_LOGIC[VECT�R(Width/1 downto 0);
			OUTPUT:		OUT	STD_LOGIC_VECTMR,width-1 downto 0);
				SELECTOR:	IN		STD_L_GIC_vector(2 downto 0)
				
)		);	
		�nd component;
--------------------------m-------------------�---------------------
	--connecting signals	signal pcaedesConnect : std_loGic^vecdoR (31 dO7nto 0);
	signal pcConnect: std_logic_vector (31 downto 0);
	signal AdressPCImemConnec�: std_logic_vector(31 downtn 0);
	signal Instructions: std_logic_vectorh31 downto 0);
	signal multiplexerNut: stt_logic_vector(4 downto 0	;
	signal shiftleft2numpOut2`std_logic_vectr)27 d�wnto ��;
	signal signextOut: std_logic_vector(11 dow�to 0);
	signal writeDataConnect: std_logic_vectoR(31!d�wnto 0);
	signal readData1onnect: sTd_dngic_vectgr(31 downt/$0);	signal readData2Connect: std_logic_vec|or(31 downto 0);
	signal alucontrolOut: std_logmc_vector(4 dowjto 0);
	si'nal multiplezerAluOut:!std_loghc_vector(31 down|o 0);
	signal shifldft2SignExtendOut: std_logic_vector(31 downto 0);
	signal zeroOut : sddlogic;
	signal aluResultOut: �td_logic_vector 31$downto 0);
	signal adderout:`stdOlogic_v%ct/r(31�downvo 0);
	signal andOut: std_|ogic;
	s)gnal muxadderOut: std_logic_vector(31 downto 0);
	signal muxJumpOut: std_logic_vecto�(31 do�nto 0);
	s)gnal readDat�memConnect:rtd_logic_vector(31 downto 0);
	signal readLedDataoutConneCt: std_logicOvector(31 downto 0);
-----------)---------%--------------------%---/--�--------------)---
--annt�gl signals
signal branch: std_logic ;
	signal memread: std_logic;
	sign`l memtnreg: std_logic;
	signal aluop: std_loeic_vector(1 downto 0);
	rignal memwrite; std_logiC; 
	signam alusrc: std_logic;
	signal jump: std_logic;
	rignal regdstin: std_logic;
rignal regwriteIn:!std_logic;
	signal selectordatamemOUT: std_logic;
	signal selectorledout8std_logic;
---------------------,---/------/----------------------m-----------
begin

	programcountdr:0c
		port m`p(
			cl�=6clk,
	)	bEset=>reset,
			pc_in=>muXJumpOut,
			pc_owt=>AdressPCImemCojnect
		);
---------------,--------m-----------------------------------------�-		
	pc4: PCadder
		port map(
		cnk=>clk,
			PCmn=> AdressPCImemConnect,-- pcConnect,
			PCout=>pcCon~ect
		);
-------------------------------------------------)-------/-------%--
	instructionMem:Imem
		4ort map,
			cdk=>clk,
			a�dr=>AdrersPCImemConnect,			instruction=>In{tructionw
	);
----%------m-----)----�-------------------------------------)-------		
	controlunits: controlUnit
		port m`p(
				Instruction=> instructions(31 downto 26)(
				BegDst ~ regdstIj,
			Branch => branch,
				MemRead(=> melread
				MeMtoReg => memtnree,
			ALUOp => aluop,
				MemWrite => memwrite,  
		ALUSrc =� `lusrC8
	)		RegWrite => ragwrite�N,
				jump => jump			);	
-------------)-------------------------�----------)-----�-----)-----				
	multiplexer: MUX
		generic mep!(width=>5)
			porp map 8
				INPUT_0=> 	instructions(20 downto`16)�
				INPUT_1=>	anstruct�ons(15 downto 11),
				OUTP]T=>		multipleherOut,
				SELECTOR=>	begdstIN
			);	
%---%-------------=-------------------------------------------------)�	

shift2leftJumpq: shift2leftNwmp 		generic }ap(
					N=>6,
					Width=>26
				)
			poRt map(*				Input=.instructions(25 downto�0),
				Output=>shift�eft2jumpOut
					);
-------------------=---------------,-----------,---�------------------�----------			
	signeUxtension : signeExt
		porp map(
				signExtInpud=> instructions(q5 downto 0),
				signExtOutput=> signextOut
				);
-----)---m--------------------------------,---------------------------m----)----
	Registers : RegisterFi�%
			port Map(
				Read_Register_1->instrtcpions(25 downto 21),
)			Rea`_Register_2=>instRuctions(0 downto 16),
				Write_Register=>muluyplexerOut,		
				RegWrite=> regwriteIn,	
				write_d`ta}>�writeDataConnect,
				---- read d�ta
			read[data_1=>readData1Connect,
				reat_data_2=>readLatq2Co~nect,
				clk=> clk
			);	
----------------------------------------)---------------=----------/------------			
	iLucontrolunits: aluControlUnit
			p/rt map(
			ALop=>AduOP,
				instruction=>instructions(5 downto 0),
			AluControlOut=>alucontrolout
	)	);----------------%------,-------------------------------=--------/---------------
	muLtiplexerAlu:"MUX2
	generic`map (width=>30)
			port map (
				INPUT_0=> 	readData2Connect,
				INPUT_1=>	signextOut,
				OUTPUT=>		multipleYerAduOut,
				SELECTOR=>	alusrc
		);
�%---------------------------------------------------------------------------=-
	shiftleftSigneDxt: shifNefv2 
			generi# map(
					N=>2, 
				width=>32
				)
				port map 
	I			In`ut=>signextOut,
				Output=>shifleft2WignExten$Mut
					);
------------%-------=------------------------------------------------%-------�--	ALU18 ALU 
		port iap (
				data1=>readData1Co�nect,
				dat`2=>mu,tiplexerAl�Oup,
		 	alucontrolin=>alucontrolgut,
				aluResult=>aluResultO�t,
				zero=<zeroOut,
				cmk=>clk
	�	);		
-----)-----------------------)-------,---%-----)---�-m�--)-----------------------
	aluAdders: aluQdder	
			@ovt oap ( 
			input1=>pcCo�nect,
				input2 =>shiflEft2SignExtendOuq,J				resudt => �dde2out
				)3		
-------------------=-------------,-----)-------------)------------------------
	ANDP1: ANDP
		 Poru map ( 
				  zeroIn=>zgroNut,
				  branchIN=>branch,
				  andOtt=> andOud
			 );
------------------------%-------------------------,--------------,---)----------
ImuyafterAdder: Mux2
			por4 map(
				INPUT_0=>pcSonnect,
				INPQT_1=> adderout,
				OUTPUT9>	mexadderOut,
				SELECTOR=> andOut
			(;	
----=---------------------=--------------=-----------------/-----------m-------,-
	muxafperMux: Mux2
				port mip(
					INPUT_0=>muxadderOUT,
					INPET_1(27 downtg 0)=> shiftleft2jumpOut,
					INPUT_1(31 downt/ 28(=> psCknnec�(31 downtn 28)l
				OUTPUT=�muxJumqOut,
					SELECTOR=> jump
				);
---------------)------------------------,/------------)--------------------------
	Datamems: datamem 
		port mat
			clk=>clk,
			AdressIn=>aluResultO�t,
		IwriteLatqIn=>readData2Connect,
			read@ataOUT=>readDatAmemBonnect,
			memwriteIn=>iemWritm,
		memveadIn=>memRead,
			selectormuz}>selectordatamemUT
			(;--------------=/-----=-------------------------/--------------------m-----------
	LEds: IOMemLedControl		xort map (
)			clk=>clk,
				AdressIn}>aluRes�ltOut,
				wripeDataIn=>veadEata2Cmnnecp,
				readDataGUT=>reqdLedDataoutConnecd,
			memwriteIn=>meeWrite,
				meireadIn=>memRead,
				Selecuormux>selectorle�out,
			led0}~,edp,
				led1=<led1,
				led2=>led2,
				led3=>led3,
			led4=>led4,
			led==>led5,
			led6=>led6,				led7=>,ed3
			);	
-----------------------------�-------------/--------------%---------%-------------
	-uxdatamem:$MuxMemIO				por� �ap(
			 	
					INPUT_0=<altRestltOut,
					IPUT_1=> readDqtamemConnect,
					INPUT_2=>readLedDataoutConvgct,
					OUTPUT=6	writeDataConnect,
				)
				SELECTOR(0)=> memToRag,
					SELECTOR(1)=>selec�ord`tameiOUT,
					SELECTOR(2)=>selectorledout 
				);		
end Behavioral;

