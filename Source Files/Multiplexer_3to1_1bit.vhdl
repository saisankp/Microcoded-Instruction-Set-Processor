----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/21/2020
-- Design Name: Multiplexer 3-1 1bit
-- Module Name: Multiplexer_3to1_1bit - Behavioral
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

entity Multiplexer_3to1_1bit is
Port ( S0 : in std_logic;
       S1 : in std_logic;
       In0 : in std_logic;
       In1 : in std_logic;
       In2 : in std_logic;
       Z : out std_logic);
end Multiplexer_3to1_1bit;




architecture Behavioral of Multiplexer_3to1_1bit is

begin

--The output Z changes depending on S1 and S0. There is no In3, so when S1 = 1 and S0 = 1, the output will just be 0.
Z <= In0 after 5 ns when (S1 = '0' and S0 = '0') else 
     In1 after 5 ns when (S1 = '0' and S0 = '1') else 
     In2 after 5 ns when (S1 = '1' and S0 = '0') else 
     '0' after 5 ns;

end Behavioral;
