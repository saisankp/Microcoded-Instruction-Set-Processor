----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/20/2020 
-- Design Name: Functional Unit
-- Module Name: Functional_Unit - Behavioral
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

entity Functional_Unit is
 Port ( A : in std_logic_vector (31 downto 0);
           B : in std_logic_vector (31 downto 0);
           FS : in std_logic_vector (4 downto 0);
           V : out std_logic;
           C : out std_logic;
           N : out std_logic;
           Z : out std_logic;
           F : out std_logic_vector (31 downto 0));
end Functional_Unit;

architecture Behavioral of Functional_Unit is

component mux_2to1 
port (In0 : in std_logic_vector(31 downto 0);
      In1 : in std_logic_vector(31 downto 0);
      s : in std_logic; 
      Z : out std_logic_vector(31 downto 0));
end component;

component Arithmetic_Logic_Unit
    Port ( C_in : in std_logic;
           A : in std_logic_vector (31 downto 0);
           B : in std_logic_vector (31 downto 0);
           S0 : in std_logic;
           S1 : in std_logic;
           S2 : in std_logic;
           G : out std_logic_vector (31 downto 0);
           C_out : out std_logic;
           V_out : out std_logic);
end component;

component Shifter_32bit
    Port ( B : in std_logic_vector (31 downto 0);
           S : in std_logic_vector (1 downto 0);
           Ir : in std_logic;
           Il : in std_logic;
           H : out std_logic_vector (31 downto 0));
end component;

component Zero_Detect_32bit
    Port ( A : in std_logic_vector (31 downto 0);
           Z : out std_logic);
end component;

signal ALU_output_signal : std_logic_vector(31 downto 0); 
signal Shifter_output_signal : std_logic_vector(31 downto 0); 

begin

--instantiate all the necessary components of the functiona unit as discussed in the lectures
--then, map all the inputs and outputs accordingly. 

ALU : Arithmetic_Logic_Unit
        PORT MAP(
            C_In => FS(0),
            A => A,
            B => B,
            S0 => FS(1),
            S1 => FS(2),
            S2 => FS(3),
            G => ALU_output_signal,
            C_Out => C,
            V_Out => V
         ); 

Shifter : Shifter_32bit
        PORT MAP(
            B => B,
            S(0) => FS(2),
            S(1) => FS(3),
            -- Ir and Il will be a constant of 0.
            Ir => '0',
            Il => '0',
            H => Shifter_output_signal
         ); 
         
ZeroDetect : Zero_Detect_32bit
         PORT MAP(
            A => ALU_output_signal,
            Z => Z
          );
          
Mux : mux_2to1
        PORT MAP(
            In0 => ALU_output_signal,
            In1 => Shifter_output_signal,
            S => FS(4),
            Z => F
        );   
 
--the negative flag is set if the last bit from the ALU's output is set.
N <= ALU_output_signal(31);

end Behavioral;
