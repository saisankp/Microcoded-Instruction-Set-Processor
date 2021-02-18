----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 01/01/2021 08:44:01 PM
-- Design Name: 
-- Module Name: zero_fill - Behavioral
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

entity zero_fill is
  Port (SB : in  STD_LOGIC_VECTOR (4 downto 0);
	    constant_out : out STD_LOGIC_VECTOR (31 downto 0));
end zero_fill;

architecture Behavioral of zero_fill is

begin
--fill in zeroes, but keep the 5 bits from 4 downto 0 as SB.
constant_out(4 downto 0) <= SB;
constant_out(31 downto 5) <= "000000000000000000000000000";

end Behavioral;
