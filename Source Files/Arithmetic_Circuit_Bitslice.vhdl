----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/20/2020
-- Design Name: Arithmetic Circuit Bitslice
-- Module Name: Arithmetic_Circuit_Bitslice - Behavioral
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

entity Arithmetic_Circuit_Bitslice is
    Port ( A : in std_logic;
           B : in std_logic;
           C_in : in std_logic;
           S0 : in std_logic;
           S1 : in std_logic;
           G : out std_logic;
           C_out : out std_logic);
end Arithmetic_Circuit_Bitslice;

architecture Behavioral of Arithmetic_Circuit_Bitslice is

--First we need a 2-1 multiplexer, but it has to be a 1 bit 2-1 multiplexer (unlike the 32 bit 2-1 mux).
component Multiplexer_2to1_1bit is
    Port ( In0 : in std_logic;
           In1 : in std_logic;
           S : in std_logic;
           Z : out std_logic);
end component;

--Secondly, we need a full adder, we discussed how to make this full adder in our lectures.
component Full_Adder is
    Port ( In1 : in std_logic;
           In2 : in std_logic;
           C_in : in std_logic;
           Sum : out std_logic;
           C_out : out std_logic);
end component;

signal Y : std_logic;

begin

--Now we just map the two components according to the arithmetic bitslice diagram found in our lecture notes.
    mux: Multiplexer_2to1_1bit
    PORT MAP(
            In0 => S1,
            In1 => S0,
            S => B,
            Z => Y
            );
            
    fullAdder: Full_Adder
    PORT MAP(
            In1 => Y,
            In2 => A,
            C_in => C_in,
            Sum => G,
            C_out => C_out
            );
            
end Behavioral;
