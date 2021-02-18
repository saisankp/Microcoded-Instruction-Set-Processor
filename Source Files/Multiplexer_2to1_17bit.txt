----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 01/01/2021 11:17:39 PM
-- Design Name: 
-- Module Name: Multiplexer_2to1_17bit - Behavioral
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

entity Multiplexer_2to1_17bit is
 port(s : in std_logic;
      in1 : in std_logic_vector(16 downto 0);
      in2 : in std_logic_vector(16 downto 0);
      z : out std_logic_vector(16 downto 0));
end Multiplexer_2to1_17bit;

architecture Behavioral of Multiplexer_2to1_17bit is
constant delay: Time := 5 ns;
begin
 process(s, in1, in2)
  begin
    case s is
      when '0' => z <= in1 after delay;
      when '1' => z <= in2 after delay;
      when others => z <= in1 after delay;
    end case;
  end process;

end Behavioral;
