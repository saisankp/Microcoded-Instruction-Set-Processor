----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 10/25/2020 03:37:37 PM
-- Design Name: 32 bit register
-- Module Name: reg32 - Behavioral
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

entity reg32 is
  Port ( D : in std_logic_vector(31 downto 0);
         reset : in std_logic;
         load : in std_logic;
         Clk : in std_logic;
         QOut : out std_logic_vector(31 downto 0));
end reg32;

architecture Behavioral of reg32 is

begin
process (Clk) 
begin 
  if(rising_edge(Clk)) then 
  if reset='1' then 
  QOut <= x"00000000" after 5ns;
   elsif load='1' then
     QOut <= D after 5ns;
    end if;
   end if;
end process;
end Behavioral;
