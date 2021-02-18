----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/20/2020 
-- Design Name: 32bit Shifter
-- Module Name: Shifter_32bit - Behavioral
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

entity Shifter_32bit is
 Port ( B : in std_logic_vector (31 downto 0);
        S : in std_logic_vector (1 downto 0);
        Ir : in std_logic;
        Il : in std_logic;
        H : out std_logic_vector (31 downto 0));
end Shifter_32bit;

architecture Behavioral of Shifter_32bit is
component Multiplexer_3to1_1bit
    Port ( S0 : in std_logic;
           S1 : in std_logic;
           In0 : in std_logic;
           In1 : in std_logic;
           In2 : in std_logic;
           Z : out std_logic);
end component;

begin

--instantiate the 3-1 1bit multiplexer 32 times to make the 32 bit shifter. 
-- Ir and Il go on the rightmost and leftmost multiplexers. (they will always be 0 for shift operations here).

--Then, map the inputs and outputs of each multiplexer accordingly.
 
    mux0: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(0),
            In1 => B(1),
            In2 => Il,
            Z => H(0)
            );
            
    mux1: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(1),
            In1 => B(2),
            In2 => B(0),
            Z => H(1)
            );
            
    mux2: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(2),
            In1 => B(3),
            In2 => B(1),
            Z => H(2)
            );
            
    mux3: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(3),
            In1 => B(4),
            In2 => B(2),
            Z => H(3)
            );

    mux4: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(4),
            In1 => B(5),
            In2 => B(3),
            Z => H(4)
            );
            
    mux5: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(5),
            In1 => B(6),
            In2 => B(4),
            Z => H(5)
            );

    mux6: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(6),
            In1 => B(7),
            In2 => B(5),
            Z => H(6)
            );

    mux7: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(7),
            In1 => B(8),
            In2 => B(6),
            Z => H(7)
            );

    mux8: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(8),
            In1 => B(9),
            In2 => B(7),
            Z => H(8)
            );

    mux9: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(9),
            In1 => B(10),
            In2 => B(8),
            Z => H(9)
            );

    mux10: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(10),
            In1 => B(11),
            In2 => B(9),
            Z => H(10)
            );

    mux11: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(11),
            In1 => B(12),
            In2 => B(10),
            Z => H(11)
            );

    mux12: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(12),
            In1 => B(13),
            In2 => B(11),
            Z => H(12)
            );

    mux13: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(13),
            In1 => B(14),
            In2 => B(12),
            Z => H(13)
            );

    mux14: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(14),
            In1 => B(15),
            In2 => B(13),
            Z => H(14)
            );

    mux15: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(15),
            In1 => B(16),
            In2 => B(14),
            Z => H(15)
            );
     
     mux16: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(16),
            In1 => B(17),
            In2 => B(15),
            Z => H(16)
            );

    mux17: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(17),
            In1 => B(18),
            In2 => B(16),
            Z => H(17)
            );
     
    mux18: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(18),
            In1 => B(19),
            In2 => B(17),
            Z => H(18)
            );
            
    mux19: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(19),
            In1 => B(20),
            In2 => B(18),
            Z => H(19)
            );
            
    mux20: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(20),
            In1 => B(21),
            In2 => B(19),
            Z => H(20)
            );
    
    mux21: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(21),
            In1 => B(22),
            In2 => B(20),
            Z => H(21)
            );
    
    mux22: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(22),
            In1 => B(23),
            In2 => B(21),
            Z => H(22)
            );
            
    mux23: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(23),
            In1 => B(24),
            In2 => B(22),
            Z => H(23)
            );
          
    mux24: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(24),
            In1 => B(25),
            In2 => B(23),
            Z => H(24)
            );

    mux25: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(25),
            In1 => B(26),
            In2 => B(24),
            Z => H(25)
            );
            
    mux26: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(26),
            In1 => B(27),
            In2 => B(25),
            Z => H(26)
            );    
            
    mux27: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(27),
            In1 => B(28),
            In2 => B(26),
            Z => H(27)
            );
      
    mux28: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(28),
            In1 => B(29),
            In2 => B(27),
            Z => H(28)
            );
            
     mux29: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(29),
            In1 => B(30),
            In2 => B(28),
            Z => H(29)
            );
            
    mux30: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(30),
            In1 => B(31),
            In2 => B(29),
            Z => H(30)
            );
    
    mux31: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(31),
            In1 => Ir,
            In2 => B(30),
            Z => H(31)
            );

end Behavioral;
