----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/20/2020
-- Design Name: Arithmetic Circuit
-- Module Name: Arithmetic_Circuit - Behavioral
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

entity Arithmetic_Circuit is
Port ( C_In : in std_logic;
           S1 : in std_logic;
           S0 : in std_logic;
           A : in std_logic_vector (31 downto 0);
           B : in std_logic_vector (31 downto 0);
           G : out std_logic_vector (31 downto 0);
           C_Out : out std_logic;
           V_out : out std_logic);
end Arithmetic_Circuit;

architecture Behavioral of Arithmetic_Circuit is

--Let's instantiate the arithmetic bitslice 32 times for the 32 bits.
COMPONENT Arithmetic_Circuit_Bitslice
    Port ( A : in std_logic;
           B : in std_logic;
           C_in : in std_logic;
           S0 : in std_logic;
           S1 : in std_logic;
           G : out std_logic;
           C_out : out std_logic);
END COMPONENT;

--signals for the carry-out of each bit
signal C_0 : std_logic;
signal C_1 : std_logic;
signal C_2 : std_logic;
signal C_3 : std_logic;
signal C_4 : std_logic;
signal C_5 : std_logic;
signal C_6 : std_logic;
signal C_7 : std_logic;
signal C_8 : std_logic;
signal C_9 : std_logic;
signal C_10 : std_logic;
signal C_11 : std_logic;
signal C_12 : std_logic;
signal C_13 : std_logic;
signal C_14 : std_logic;
signal C_15: std_logic;
signal C_16: std_logic;
signal C_17: std_logic;
signal C_18: std_logic;
signal C_19: std_logic;
signal C_20: std_logic;
signal C_21: std_logic;
signal C_22: std_logic;
signal C_23: std_logic;
signal C_24: std_logic;
signal C_25: std_logic;
signal C_26: std_logic;
signal C_27: std_logic;
signal C_28: std_logic;
signal C_29: std_logic;
signal C_30: std_logic;
signal C_Out_Signal : std_logic;
begin

--Finally, map the 32 instantiations appropriately to act as a 32 bit ripple adder.
 Bit0 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(0),
        B => B(0),
        C_in => C_in,
        G => G(0),
        C_out => C_0,
        S0 => S0,
        S1 => S1
        );
        
    Bit1 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(1),
        B => B(1),
        C_in => C_0,
        G => G(1),
        C_out => C_1,
        S0 => S0,
        S1 => S1
        );
        
        
     Bit2 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(2),
        B => B(2),
        C_in => C_1,
        G => G(2),
        C_out => C_2,
        S0 => S0,
        S1 => S1
        );
        
     Bit3 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(3),
        B => B(3),
        C_in => C_2,
        G => G(3),
        C_out => C_3,
        S0 => S0,
        S1 => S1
        );
               
     Bit4 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(4),
        B => B(4),
        C_in => C_3,
        G => G(4),
        C_out => C_4,
        S0 => S0,
        S1 => S1
        );
        
     Bit5 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(5),
        B => B(5),
        C_in => C_4,
        G => G(5),
        C_out => C_5,
        S0 => S0,
        S1 => S1
        );
        
     Bit6 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(6),
        B => B(6),
        C_in => C_5,
        G => G(6),
        C_out => C_6,
        S0 => S0,
        S1 => S1
        );
        
     Bit7 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(7),
        B => B(7),
        C_in => C_6,
        G => G(7),
        C_out => C_7,
        S0 => S0,
        S1 => S1
        );

     Bit8 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(8),
        B => B(8),
        C_in => C_7,
        G => G(8),
        C_out => C_8,
        S0 => S0,
        S1 => S1
        );
        
     Bit9 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(9),
        B => B(9),
        C_in => C_8,
        G => G(9),
        C_out => C_9,
        S0 => S0,
        S1 => S1
        );

     Bit10 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(10),
        B => B(10),
        C_in => C_9,
        G => G(10),
        C_out => C_10,
        S0 => S0,
        S1 => S1
        );
        
     Bit11 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(11),
        B => B(11),
        C_in => C_10,
        G => G(11),
        C_out => C_11,
        S0 => S0,
        S1 => S1
        );
        
     Bit12 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(12),
        B => B(12),
        C_in => C_11,
        G => G(12),
        C_out => C_12,
        S0 => S0,
        S1 => S1
        );
        
     Bit13 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(13),
        B => B(13),
        C_in => C_12,
        G => G(13),
        C_out => C_13,
        S0 => S0,
        S1 => S1
        );
        
     Bit14 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(14),
        B => B(14),
        C_in => C_13,
        G => G(14),
        C_out => C_14,
        S0 => S0,
        S1 => S1
        );

     Bit15 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(15),
        B => B(15),
        C_in => C_14,
        G => G(15),
        C_out => C_15,
        S0 => S0,
        S1 => S1
        );
        
      Bit16 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(16),
        B => B(16),
        C_in => C_15,
        G => G(16),
        C_out => C_16,
        S0 => S0,
        S1 => S1
        );  
        
      Bit17 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(17),
        B => B(17),
        C_in => C_16,
        G => G(17),
        C_out => C_17,
        S0 => S0,
        S1 => S1
        );  
        
       Bit18 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(18),
        B => B(18),
        C_in => C_17,
        G => G(18),
        C_out => C_18,
        S0 => S0,
        S1 => S1
        );  
        
       Bit19 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(19),
        B => B(19),
        C_in => C_18,
        G => G(19),
        C_out => C_19,
        S0 => S0,
        S1 => S1
        );  
        
       Bit20 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(20),
        B => B(20),
        C_in => C_19,
        G => G(20),
        C_out => C_20,
        S0 => S0,
        S1 => S1
        );  
        
        Bit21 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(21),
        B => B(21),
        C_in => C_20,
        G => G(21),
        C_out => C_21,
        S0 => S0,
        S1 => S1
        );
        
        Bit22 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(22),
        B => B(22),
        C_in => C_21,
        G => G(22),
        C_out => C_22,
        S0 => S0,
        S1 => S1
        ); 
        
        Bit23 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(23),
        B => B(23),
        C_in => C_22,
        G => G(23),
        C_out => C_23,
        S0 => S0,
        S1 => S1
        );     
        
        Bit24 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(24),
        B => B(24),
        C_in => C_23,
        G => G(24),
        C_out => C_24,
        S0 => S0,
        S1 => S1
        );  
        
        Bit25 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(25),
        B => B(25),
        C_in => C_24,
        G => G(25),
        C_out => C_25,
        S0 => S0,
        S1 => S1
        );  
        
        Bit26 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(26),
        B => B(26),
        C_in => C_25,
        G => G(26),
        C_out => C_26,
        S0 => S0,
        S1 => S1
        );  
        
        Bit27 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(27),
        B => B(27),
        C_in => C_26,
        G => G(27),
        C_out => C_27,
        S0 => S0,
        S1 => S1
        );  
        
        Bit28 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(28),
        B => B(28),
        C_in => C_27,
        G => G(28),
        C_out => C_28,
        S0 => S0,
        S1 => S1
        );  
        
        Bit29 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(29),
        B => B(29),
        C_in => C_28,
        G => G(29),
        C_out => C_29,
        S0 => S0,
        S1 => S1
        );  
        
        Bit30 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(30),
        B => B(30),
        C_in => C_29,
        G => G(30),
        C_out => C_30,
        S0 => S0,
        S1 => S1
        );  
        
        Bit31 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(31),
        B => B(31),
        C_in => C_30,
        G => G(31),
        C_out => C_Out_Signal,
        S0 => S0,
        S1 => S1
        );  
        
      --Calculate the Overflow by using XOR on the last Carry and the Carry of the 2nd last bit.
      V_Out <= (C_Out_Signal XOR C_30);
      
      --Calculate the Carry out of the whole ripple adder by getting the Carry out of the final bit.
      C_Out <= C_Out_Signal;

end Behavioral;
