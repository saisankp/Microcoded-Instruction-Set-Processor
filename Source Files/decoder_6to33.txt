----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 10/24/2020 03:08:04 PM
-- Design Name: 5 to 33 line decoder
-- Module Name: decoder_6to33 - Behavioral
-- Project Name: project_1
-- Target Devices: 
-- Tool Versions: 
-- Description: Takes in 6 inputs and outputs 33 lines.
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

entity decoder_6to33 is
  Port (A: in std_logic_vector(5 downto 0);  --6 bits for 6 inputs
        Q: out std_logic_vector(32 downto 0)); --33 outputs
end decoder_6to33;

architecture Behavioral of decoder_6to33 is
constant gate_delay: Time:= 5 ns;
begin
process(A)
   begin
      case A is
         when "000000" => Q <= "000000000000000000000000000000001" after gate_delay;
         when "000001" => Q <= "000000000000000000000000000000010" after gate_delay;
         when "000010" => Q <= "000000000000000000000000000000100" after gate_delay;
         when "000011" => Q <= "000000000000000000000000000001000" after gate_delay;
         when "000100" => Q <= "000000000000000000000000000010000" after gate_delay;
         when "000101" => Q <= "000000000000000000000000000100000" after gate_delay;
         when "000110" => Q <= "000000000000000000000000001000000" after gate_delay;
         when "000111" => Q <= "000000000000000000000000010000000" after gate_delay;
         when "001000" => Q <= "000000000000000000000000100000000" after gate_delay;
         when "001001" => Q <= "000000000000000000000001000000000" after gate_delay;
         when "001010" => Q <= "000000000000000000000010000000000" after gate_delay;
         when "001011" => Q <= "000000000000000000000100000000000" after gate_delay;
         when "001100" => Q <= "000000000000000000001000000000000" after gate_delay;
         when "001101" => Q <= "000000000000000000010000000000000" after gate_delay;
         when "001110" => Q <= "000000000000000000100000000000000" after gate_delay;
         when "001111" => Q <= "000000000000000001000000000000000" after gate_delay;
         when "010000" => Q <= "000000000000000010000000000000000" after gate_delay;
         when "010001" => Q <= "000000000000000100000000000000000" after gate_delay;
         when "010010" => Q <= "000000000000001000000000000000000" after gate_delay;
         when "010011" => Q <= "000000000000010000000000000000000" after gate_delay;
         when "010100" => Q <= "000000000000100000000000000000000" after gate_delay;
         when "010101" => Q <= "000000000001000000000000000000000" after gate_delay;
         when "010110" => Q <= "000000000010000000000000000000000" after gate_delay;
         when "010111" => Q <= "000000000100000000000000000000000" after gate_delay;
         when "011000" => Q <= "000000001000000000000000000000000" after gate_delay;
         when "011001" => Q <= "000000010000000000000000000000000" after gate_delay;
         when "011010" => Q <= "000000100000000000000000000000000" after gate_delay;
         when "011011" => Q <= "000001000000000000000000000000000" after gate_delay;
         when "011100" => Q <= "000010000000000000000000000000000" after gate_delay;
         when "011101" => Q <= "000100000000000000000000000000000" after gate_delay;
         when "011110" => Q <= "001000000000000000000000000000000" after gate_delay;
         when "011111" => Q <= "010000000000000000000000000000000" after gate_delay;
         when "1XXXXX" => Q <= "100000000000000000000000000000000" after gate_delay;
         when others =>   Q <= "000000000000000000000000000000000" after gate_delay;
      end case;
   end process;
end Behavioral;
