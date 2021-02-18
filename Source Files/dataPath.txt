----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/21/2020
-- Design Name: data path
-- Module Name: dataPath - Behavioral
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

entity dataPath is
Port ( Enable: in std_logic;
       A_Select : in std_logic_vector (4 downto 0); --select for mux A
       B_Select: in std_logic_vector (4 downto 0); --select for mux B 
       D_Address: in std_logic_vector (4 downto 0); --select for the 5 to 32 decoder
       Constant_in: in std_logic_vector (31 downto 0); --this goes in the mux which takes in B data
       MB_select: in std_logic; --this is the select for the mux which takes in B data
       MD_select: in std_logic;  --the select for the mux which takes in F from the functional unit.
       FS: in std_logic_vector (4 downto 0); --the select for the functional unit.
       Data_in: in std_logic_vector (31 downto 0); -- goes into the mux which takes in F from the functional unit. 
       Clk: in std_logic; --the clock signal for the register file.
       
       reset: in std_logic;
        --TD, TA, TB (each 1 bit).
       TD : in STD_LOGIC;
       TA : in STD_LOGIC;
       TB : in STD_LOGIC;
		   
        --Now, the flags from the functional unit.
       V: out std_logic;
       C: out std_logic;
       N: out std_logic;
       Z: out std_logic;
       Address_out: out std_logic_vector (31 downto 0);
       Data_out: out std_logic_vector (31 downto 0); --data out from Bus B.);
           
           --things that are not essential but added so we can see how the datapath works under the hood.
       reg0:  out std_logic_vector(31 downto 0);
       reg1:  out std_logic_vector(31 downto 0);
       reg2:  out std_logic_vector(31 downto 0);
       reg3:  out std_logic_vector(31 downto 0);
       reg4:  out std_logic_vector(31 downto 0);
       reg5:  out std_logic_vector(31 downto 0);
       reg6:  out std_logic_vector(31 downto 0);
       reg7:  out std_logic_vector(31 downto 0);
       reg8:  out std_logic_vector(31 downto 0);
       reg9:  out std_logic_vector(31 downto 0);
       reg10:  out std_logic_vector(31 downto 0);
       reg11:  out std_logic_vector(31 downto 0);
       reg12:  out std_logic_vector(31 downto 0);
       reg13:  out std_logic_vector(31 downto 0);
       reg14:  out std_logic_vector(31 downto 0);
       reg15:  out std_logic_vector(31 downto 0);
       reg16:  out std_logic_vector(31 downto 0);
       reg17:  out std_logic_vector(31 downto 0);
       reg18:  out std_logic_vector(31 downto 0);
       reg19:  out std_logic_vector(31 downto 0);
       reg20:  out std_logic_vector(31 downto 0);
       reg21:  out std_logic_vector(31 downto 0);
       reg22:  out std_logic_vector(31 downto 0);
       reg23:  out std_logic_vector(31 downto 0);
       reg24:  out std_logic_vector(31 downto 0);
       reg25:  out std_logic_vector(31 downto 0);
       reg26:  out std_logic_vector(31 downto 0);
       reg27:  out std_logic_vector(31 downto 0);
       reg28:  out std_logic_vector(31 downto 0);
       reg29:  out std_logic_vector(31 downto 0);
       reg30:  out std_logic_vector(31 downto 0);
       reg31:  out std_logic_vector(31 downto 0);
       reg32: out std_logic_vector(31 downto 0);
       OutputA : out std_logic_vector(31 downto 0);
       OutputB : out std_logic_vector(31 downto 0);
       F_Out : out std_logic_vector(31 downto 0));     
end dataPath;

architecture Behavioral of dataPath is
component register_file 
    Port (
           A_Select: in std_logic_vector (4 downto 0);
           B_Select: in std_logic_vector (4 downto 0);
           D_Address: in std_logic_vector (4 downto 0);
           reset: in std_logic;
           TD : in STD_LOGIC;
           TA : in STD_LOGIC;
           TB : in STD_LOGIC;
           enable: in std_logic; 
           Clk: in std_logic;
           input_data : in std_logic_vector(31 downto 0);
           reg0:  out std_logic_vector(31 downto 0);
           reg1:  out std_logic_vector(31 downto 0);
           reg2:  out std_logic_vector(31 downto 0);
           reg3:  out std_logic_vector(31 downto 0);
           reg4:  out std_logic_vector(31 downto 0);
           reg5:  out std_logic_vector(31 downto 0);
           reg6:  out std_logic_vector(31 downto 0);
           reg7:  out std_logic_vector(31 downto 0);
           reg8:  out std_logic_vector(31 downto 0);
           reg9:  out std_logic_vector(31 downto 0);
           reg10:  out std_logic_vector(31 downto 0);
           reg11:  out std_logic_vector(31 downto 0);
           reg12:  out std_logic_vector(31 downto 0);
           reg13:  out std_logic_vector(31 downto 0);
           reg14:  out std_logic_vector(31 downto 0);
           reg15:  out std_logic_vector(31 downto 0);
           reg16:  out std_logic_vector(31 downto 0);
           reg17:  out std_logic_vector(31 downto 0);
           reg18:  out std_logic_vector(31 downto 0);
           reg19:  out std_logic_vector(31 downto 0);
           reg20:  out std_logic_vector(31 downto 0);
           reg21:  out std_logic_vector(31 downto 0);
           reg22:  out std_logic_vector(31 downto 0);
           reg23:  out std_logic_vector(31 downto 0);
           reg24:  out std_logic_vector(31 downto 0);
           reg25:  out std_logic_vector(31 downto 0);
           reg26:  out std_logic_vector(31 downto 0);
           reg27:  out std_logic_vector(31 downto 0);
           reg28:  out std_logic_vector(31 downto 0);
           reg29:  out std_logic_vector(31 downto 0);
           reg30:  out std_logic_vector(31 downto 0);
           reg31:  out std_logic_vector(31 downto 0);
           reg32temp:  out std_logic_vector(31 downto 0);
           OutputA : out std_logic_vector(31 downto 0);
           OutputB : out std_logic_vector(31 downto 0));
end component;


component Functional_Unit
Port ( A : in std_logic_vector (31 downto 0);
       B : in std_logic_vector (31 downto 0);
       FS : in std_logic_vector (4 downto 0);
       V : out std_logic; 
       C : out std_logic; 
       N : out std_logic; 
       Z : out std_logic;
       F : out std_logic_vector (31 downto 0));
end component;

component mux_2to1 
Port ( In0 : in std_logic_vector(31 downto 0);
       In1 : in std_logic_vector(31 downto 0);
       s : in std_logic; 
       Z : out std_logic_vector(31 downto 0));
end component;

signal A_data : std_logic_vector (31 downto 0);
signal B_data_before_mux : std_logic_vector (31 downto 0);
signal B_data : std_logic_vector (31 downto 0);
signal F_signal : std_logic_vector (31 downto 0);
signal D_data : std_logic_vector (31 downto 0); --data output from MUX D.

begin


FunctionalUnit : Functional_Unit port map (
A => A_data,
B => B_data,
FS => FS,
V => V,
C => C,
N => N,
Z => Z,
F => F_Signal
);


registerFile: register_file port map( 
A_Select => A_Select,
B_Select => B_Select,
D_Address => D_Address,
reset => reset,
TD => TD,
TA => TA,
TB => TB,
enable => enable,
Clk => Clk,
input_data => D_Data,
reg0 => reg0,
reg1 => reg1,
reg2 => reg2,
reg3 => reg3,
reg4 => reg4,
reg5 => reg5,
reg6 => reg6,
reg7 => reg7,
reg8 => reg8,
reg9 => reg9,
reg10 => reg10,
reg11 => reg11,
reg12 => reg12,
reg13 => reg13,
reg14 => reg14,
reg15 => reg15,
reg16 => reg16,
reg17 => reg17,
reg18 => reg18,
reg19 => reg19,
reg20 => reg20,
reg21 => reg21,
reg22 => reg22,
reg23 => reg23,
reg24 => reg24,
reg25 => reg25,
reg26 => reg26,
reg27 => reg27,
reg28 => reg28,
reg29 => reg29,
reg30 => reg30,
reg31 => reg31,
reg32temp => reg32,
OutputA => A_data,
OutputB => B_data_before_mux
);


MuxB : mux_2to1 port map (
In0 => B_data_before_mux,
In1 => Constant_in,
s => MB_select,
Z => B_data
);

MuxD : mux_2to1 port map (
In0 => F_Signal,
In1 => Data_in,
s => MD_select,
Z => D_data
);

Address_Out <= A_Data;
Data_Out <= B_Data;

--OutputB and B_Data are different values, since OutputB is the B_data before going through MUX B.
OutputA <= A_Data;
OutputB <= B_data_before_mux;

--Finally, let's make the F Signal visible in the simulation so that we can see what's going on under the hood.
F_Out <= F_Signal;

end Behavioral;
