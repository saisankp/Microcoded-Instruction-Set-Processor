----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/21/2020
-- Design Name: Logical Circuit
-- Module Name: Logical_Circuit - Behavioral
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

entity Logical_Circuit is
 Port (S0 : in std_logic;
       S1 : in std_logic;
       A : in std_logic_vector (31 downto 0);
       B : in std_logic_vector (31 downto 0);
       G : out std_logic_vector (31 downto 0));
end Logical_Circuit;

architecture Behavioral of Logical_Circuit is

component Logic_Circuit_Bitslice
    Port ( S0 : in std_logic;
           S1 : in std_logic;
           A : in std_logic;
           B : in std_logic;
           Z : out std_logic);
end component;

begin

--instantiate the logical bitslice 32 times, and map the inputs and outputs accoridngly.

Bit0 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(0),
        B => B(0),
        Z => G(0),
        S0 => S0,
        S1 => S1
        );
        
Bit1 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(1),
        B => B(1),
        Z => G(1),
        S0 => S0,
        S1 => S1
        );
        
Bit2 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(2),
        B => B(2),
        Z => G(2),
        S0 => S0,
        S1 => S1
        );
        
Bit3 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(3),
        B => B(3),
        Z => G(3),
        S0 => S0,
        S1 => S1
        );

Bit4 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(4),
        B => B(4),
        Z => G(4),
        S0 => S0,
        S1 => S1
        );
        
Bit5 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(5),
        B => B(5),
        Z => G(5),
        S0 => S0,
        S1 => S1
        );
        
Bit6 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(6),
        B => B(6),
        Z => G(6),
        S0 => S0,
        S1 => S1
        );
        
Bit7 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(7),
        B => B(7),
        Z => G(7),
        S0 => S0,
        S1 => S1
        );
        
Bit8 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(8),
        B => B(8),
        Z => G(8),
        S0 => S0,
        S1 => S1
        );
        
Bit9 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(9),
        B => B(9),
        Z => G(9),
        S0 => S0,
        S1 => S1
        );
        
Bit10 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(10),
        B => B(10),
        Z => G(10),
        S0 => S0,
        S1 => S1
        );
        
Bit11 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(11),
        B => B(11),
        Z => G(11),
        S0 => S0,
        S1 => S1
        );
        
Bit12 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(12),
        B => B(12),
        Z => G(12),
        S0 => S0,
        S1 => S1
        );
        
Bit13 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(13),
        B => B(13),
        Z => G(13),
        S0 => S0,
        S1 => S1
        );
        
Bit14 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(14),
        B => B(14),
        Z => G(14),
        S0 => S0,
        S1 => S1
        );
        
Bit15 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(15),
        B => B(15),
        Z => G(15),
        S0 => S0,
        S1 => S1
        );
        
Bit16 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(16),
        B => B(16),
        Z => G(16),
        S0 => S0,
        S1 => S1
        );

Bit17 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(17),
        B => B(17),
        Z => G(17),
        S0 => S0,
        S1 => S1
        );

Bit18 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(18),
        B => B(18),
        Z => G(18),
        S0 => S0,
        S1 => S1
        );

Bit19 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(19),
        B => B(19),
        Z => G(19),
        S0 => S0,
        S1 => S1
        );

Bit20 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(20),
        B => B(20),
        Z => G(20),
        S0 => S0,
        S1 => S1
        );
        
Bit21 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(21),
        B => B(21),
        Z => G(21),
        S0 => S0,
        S1 => S1
        );

Bit22 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(22),
        B => B(22),
        Z => G(22),
        S0 => S0,
        S1 => S1
        );
        
Bit23 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(23),
        B => B(23),
        Z => G(23),
        S0 => S0,
        S1 => S1
        );

Bit24 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(24),
        B => B(24),
        Z => G(24),
        S0 => S0,
        S1 => S1
        );
        
Bit25 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(25),
        B => B(25),
        Z => G(25),
        S0 => S0,
        S1 => S1
        );  
        
Bit26 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(26),
        B => B(26),
        Z => G(26),
        S0 => S0,
        S1 => S1
        );      
        
Bit27 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(27),
        B => B(27),
        Z => G(27),
        S0 => S0,
        S1 => S1
        );
        
Bit28 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(28),
        B => B(28),
        Z => G(28),
        S0 => S0,
        S1 => S1
        );
        
Bit29 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(29),
        B => B(29),
        Z => G(29),
        S0 => S0,
        S1 => S1
        );
        
Bit30 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(30),
        B => B(30),
        Z => G(30),
        S0 => S0,
        S1 => S1
        ); 
        
Bit31 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(31),
        B => B(31),
        Z => G(31),
        S0 => S0,
        S1 => S1
        );       
end Behavioral;
