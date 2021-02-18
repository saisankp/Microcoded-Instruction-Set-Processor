----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai 
-- 
-- Create Date: 11/20/2020
-- Design Name: Arithmetic Logic Unit
-- Module Name: Arithmetic_Logic_Unit - Behavioral
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

entity Arithmetic_Logic_Unit is
 Port ( C_in : in std_logic;
        A : in std_logic_vector(31 downto 0); 
        B : in std_logic_vector(31 downto 0); 
        S0 : in std_logic;
        S1 : in std_logic;
        S2 : in std_logic;
        G : out std_logic_vector(31 downto 0); 
        C_out : out std_logic;
        V_out : out std_logic);
end Arithmetic_Logic_Unit;

architecture Behavioral of Arithmetic_Logic_Unit is
component Arithmetic_Circuit
    port ( C_In : in std_logic;
           S1 : in std_logic;
           S0 : in std_logic;
           A : in std_logic_vector(31 downto 0); 
           B : in std_logic_vector(31 downto 0); 
           G : out std_logic_vector(31 downto 0); 
           C_Out : out std_logic;
           V_Out : out std_logic);
end component;

component Logical_Circuit
    port ( S0 : in std_logic;
           S1 : in std_logic;
           A : in std_logic_vector(31 downto 0); 
           B : in std_logic_vector(31 downto 0); 
           G : out std_logic_vector(31 downto 0));
 end component;
     
component mux_2to1 
     port ( In0 : in std_logic_vector(31 downto 0);
            In1 : in std_logic_vector(31 downto 0);
            s : in std_logic; 
            Z : out std_logic_vector(31 downto 0));      
end component;

signal arithmetic_output : std_logic_vector(31 downto 0); 
signal logic_output : std_logic_vector(31 downto 0); 

begin

--let's instantiate the components of the ALU first.

arithmetic_unit : Arithmetic_Circuit
       PORT MAP(
           C_in => C_in,
           A => A,
           B => B,
           S0 => S0,
           S1 => S1,
           C_out => C_out,
           V_out => V_out,
           G => arithmetic_output
        );
        
logic_unit : Logical_Circuit
       PORT MAP(
           A => A,
           B => B,
           S0 => S0,
           S1 => S1,
           G => logic_output
        );
        
mux : mux_2to1
        PORT MAP(
            S => S2,
            In0 => arithmetic_output,
            In1 => logic_output,
            Z => G
         );       

end Behavioral;
