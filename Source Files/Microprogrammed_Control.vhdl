----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 01/03/2021 09:08:04 PM
-- Design Name: 
-- Module Name: Microprogrammed_Control - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Microprogrammed_Control is
    Port ( instruction_in : in  STD_LOGIC_VECTOR (31 downto 0);
		   reset : in STD_LOGIC;
           V : in  STD_LOGIC;
           C : in  STD_LOGIC;
           N : in  STD_LOGIC;
           Z : in  STD_LOGIC;
		   Clk : in STD_LOGIC;
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0);
           DR : out  STD_LOGIC_VECTOR (4 downto 0);
           SA : out  STD_LOGIC_VECTOR (4 downto 0);
           SB : out  STD_LOGIC_VECTOR (4 downto 0);
           TD : out  STD_LOGIC;
           TA : out  STD_LOGIC;
           TB : out  STD_LOGIC;
           MB : out  STD_LOGIC;
           FS : out  STD_LOGIC_VECTOR (4 downto 0);
           MD : out  STD_LOGIC;
           RW : out  STD_LOGIC;
           MM : out  STD_LOGIC;
           MW : out  STD_LOGIC;
           RV : out  STD_LOGIC;
           RC : out  STD_LOGIC;
           RN : out  STD_LOGIC;
           RZ : out  STD_LOGIC;
           FL : out  STD_LOGIC);
end Microprogrammed_Control;

architecture Behavioral of Microprogrammed_Control is

component PC 
port (displacement : in std_logic_vector (31 downto 0);
        pc_load : in std_logic;
        pc_increment : in std_logic;
        clock : in std_logic;
        reset : in std_logic;
        addr_out : out std_logic_vector (31 downto 0));
end component;

component Multiplexer_8to1
port(s : in std_logic_vector(2 downto 0);
       in1 : in std_logic;
       in2 : in std_logic;
       in3 : in std_logic;
       in4 : in std_logic;
       in5 : in std_logic;
       in6 : in std_logic;
       in7 : in std_logic;
       in8 : in std_logic;
       z : out std_logic);
end component;


component Extend 
Port ( DR : in  STD_LOGIC_VECTOR (4 downto 0);
       SB : in  STD_LOGIC_VECTOR (4 downto 0);
       extension : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component IR 
 Port (data_in : in  STD_LOGIC_VECTOR (31 downto 0);
       IL : in  STD_LOGIC;
	   Clk : in STD_LOGIC;
       Opcode : out  STD_LOGIC_VECTOR (16 downto 0);
       DR : out  STD_LOGIC_VECTOR (4 downto 0);
       SA : out  STD_LOGIC_VECTOR (4 downto 0);
       SB : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component Multiplexer_2to1_17bit
 port(s : in std_logic;
      in1 : in std_logic_vector(16 downto 0);
      in2 : in std_logic_vector(16 downto 0);
      z : out std_logic_vector(16 downto 0));
end component;

component CAR
 Port ( clock : in std_logic;
        load : in std_logic;
        reset : in std_logic;
        input : in std_logic_vector (16 downto 0);
        addr_out : out std_logic_vector (16 downto 0));
end component;

component control_memory
Port (FL : out std_logic; -- 0
    RZ : out std_logic; -- 1
    RN : out std_logic; -- 2
    RC : out std_logic; -- 3
    RV : out std_logic; -- 4
    MW : out std_logic; -- 5
    MM : out std_logic; -- 6
    RW : out std_logic; -- 7
    MD : out std_logic; -- 8
    FS : out std_logic_vector(4 downto 0); -- 9 to 13
    MB : out std_logic; -- 14
    TB : out std_logic; -- 15
    TA : out std_logic; -- 16
    TD : out std_logic; -- 17
    PL : out std_logic; -- 18
    PI : out std_logic; -- 19
    IL : out std_logic; -- 20
    MC : out std_logic; -- 21
    MS : out std_logic_vector(2 downto 0); -- 22 to 24
    NA : out std_logic_vector(16 downto 0); -- 25 to 41
    IN_CAR : in std_logic_vector(16 downto 0));
end component;

   --signals
   signal MC : std_logic;
   signal IL : std_logic;
   signal PI : std_logic;
   signal PL : std_logic;
   signal not_Z : std_logic;
   signal not_C : std_logic;
   signal mux_s_out : std_logic;
   signal MS : std_logic_vector(2 downto 0);
   signal DR_signal : std_logic_vector(4 downto 0);
   signal SA_signal : std_logic_vector(4 downto 0);
   signal SB_signal : std_logic_vector(4 downto 0);
   signal NA : std_logic_vector(16 downto 0);
   signal mux_c_out : std_logic_vector(16 downto 0);
   signal car_out : std_logic_vector(16 downto 0);
   signal extend_out : std_logic_vector(31 downto 0);
   signal ir_opcode_out : std_logic_vector(16 downto 0);
begin

extender : Extend PORT MAP (
          DR => DR_signal,
          SB => SB_signal,
          extension => extend_out
        );
        
program_counter : PC PORT MAP (
          displacement => extend_out,
		  reset => reset,
		  Clock => Clk,
          pc_load => PL,
          pc_increment => PI,
          addr_out => pc_out
        );
        
mux_s : Multiplexer_8to1 PORT MAP (
          in1 => '0',
          in2 => '1',
          in3 => C,
          in4 => V,
          in5 => Z,
          in6 => N,
          in7 => not_C,
          in8 => not_Z,
          S(0) => MS(0),
          S(1) => MS(1),
          S(2) => MS(2),
          z => mux_s_out
        );		
        
instruction_register : IR PORT MAP (
          data_in => instruction_in,
          IL => IL,
		  Clk => Clk,
          Opcode => ir_opcode_out,
          DR => DR_signal,
          SA => SA_signal,
          SB => SB_signal
        );
           
mux_c : Multiplexer_2to1_17bit PORT MAP (
          In1 => NA,
          In2 => ir_opcode_out,
          S => MC,
          Z => mux_c_out
        );
       
control_address_register : CAR PORT MAP (
          input => mux_c_out,
		  reset => reset,
		  clock => Clk,
          load => mux_s_out,
          addr_out => car_out
        );   
 
c_memory : control_memory PORT MAP (
          FL => FL,
          RZ => RZ,
          RN => RN,
          RC => RC,
          RV => RV,
          MW => MW,
          MM => MM,
          RW => RW,
          MD => MD,
          FS => FS,
          MB => MB,
          TB => TB,
          TA => TA,
          TD => TD,
          PL => PL,
          PI => PI,
          IL => IL,
          MC => MC,
          MS => MS,
          NA => NA,
          IN_CAR => car_out
        );
        
DR <= DR_Signal;
SB <= SB_signal;	
SA <= SA_signal;	
not_C <= not C;
not_Z <= not Z;	
end Behavioral;

