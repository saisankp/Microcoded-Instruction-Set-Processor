----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/13/2020
-- Design Name: 4-1 multiplexer 1bit
-- Module Name: Multiplexer_4to1 - Behavioral
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

entity Multiplexer_4to1 is
 Port (S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           In0 : in STD_LOGIC;
           In1 : in STD_LOGIC;
           In2 : in STD_LOGIC;
           In3 : in STD_LOGIC;
           Z : out STD_LOGIC );
end Multiplexer_4to1;

architecture Behavioral of Multiplexer_4to1 is

begin

--The output changes depending on the combination of S1 and S0.
Z <= In0 after 5 ns when (S1 = '0' and S0 = '0') else 
     In1 after 5 ns when ( S1 = '0' and S0 = '1') else 
     In2 after 5 ns when (S1 = '1' and S0 = '0') else 
     In3 after 5 ns when (S1 = '1' and S0 = '1') else  
     '0' after 5 ns;

end Behavioral;
