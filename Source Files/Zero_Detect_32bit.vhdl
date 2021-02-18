----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/21/2020
-- Design Name: Zero Detect 32 bit
-- Module Name: Zero_Detect_32bit - Behavioral
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

entity Zero_Detect_32bit is
Port ( A : in std_logic_vector (31 downto 0);
       Z : out std_logic);
end Zero_Detect_32bit;

architecture Behavioral of Zero_Detect_32bit is

begin

--if the input is a 32 bit value of 0's, the output is 1 (i.e. true).
Z <= '1' after 5 ns when A = "00000000000000000000000000000000" else
     '0' after 5ns;

end Behavioral;
