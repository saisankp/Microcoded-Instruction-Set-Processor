----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 01/01/2021 10:24:28 PM
-- Design Name: 
-- Module Name: Multiplexer_8to1 - Behavioral
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

entity Multiplexer_8to1 is
  port(s : in std_logic_vector(2 downto 0);
       in1 : in std_logic;
       in2 : in std_logic;
       in3 : in std_logic;
       in4 : in std_logic;
       in5 : in std_logic;
       in6 : in std_logic;
       in7 : in std_logic;
       in8 : in std_logic;
       z : out std_logic);
end Multiplexer_8to1;

architecture Behavioral of Multiplexer_8to1 is
    constant delay: Time := 5 ns;
begin
process (s, in1, in2, in3, in4, in5, in6, in7, in8)
  begin
    case s is
      when "000" => z <= in1 after delay;
      when "001" => z <= in2 after delay;
      when "010" => z <= in3 after delay;
      when "011" => z <= in4 after delay;
      when "100" => z <= in5 after delay;
      when "101" => z <= in6 after delay;
      when "110" => z <= in7 after delay;
      when "111" => z <= in8 after delay;
      when others => z <= in1 after delay;
    end case;
  end process;
end Behavioral;
