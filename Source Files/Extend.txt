----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 01/01/2021 09:57:47 PM
-- Design Name: 
-- Module Name: Extend - Behavioral
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

entity Extend is
Port ( DR : in  STD_LOGIC_VECTOR (4 downto 0);
       SB : in  STD_LOGIC_VECTOR (4 downto 0);
       extension : out  STD_LOGIC_VECTOR (31 downto 0));
end Extend;

architecture Behavioral of Extend is

begin
    --fill bit 31 down to 10 with ones if bit 0 from DR = 0, else fill with zeroes.
    --The remaining bits are for DR and SB.
    extension(31 downto 10) <= "0000000000000000000000" when (DR(4)='0') else "1111111111111111111111";
    extension(9 downto 5) <= DR;   
    extension(4 downto 0) <= SB;

end Behavioral;
