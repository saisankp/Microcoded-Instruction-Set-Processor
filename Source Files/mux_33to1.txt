----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 10/25/2020 07:20:24 PM
-- Design Name: 33 to 1 multiplexer
-- Module Name: mux_33to1 - Behavioral
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

entity mux_33to1 is
  Port ( S : in std_logic_vector(5 downto 0);
         reg0: in std_logic_vector(31 downto 0);
         reg1: in std_logic_vector(31 downto 0);
         reg2: in std_logic_vector(31 downto 0);
         reg3: in std_logic_vector(31 downto 0);
         reg4: in std_logic_vector(31 downto 0);
         reg5: in std_logic_vector(31 downto 0);
         reg6: in std_logic_vector(31 downto 0);
         reg7: in std_logic_vector(31 downto 0);
         reg8: in std_logic_vector(31 downto 0);
         reg9: in std_logic_vector(31 downto 0);
         reg10: in std_logic_vector(31 downto 0);
         reg11: in std_logic_vector(31 downto 0);
         reg12: in std_logic_vector(31 downto 0);
         reg13: in std_logic_vector(31 downto 0);
         reg14: in std_logic_vector(31 downto 0);
         reg15: in std_logic_vector(31 downto 0);
         reg16: in std_logic_vector(31 downto 0);
         reg17: in std_logic_vector(31 downto 0);
         reg18: in std_logic_vector(31 downto 0);
         reg19: in std_logic_vector(31 downto 0);
         reg20: in std_logic_vector(31 downto 0);
         reg21: in std_logic_vector(31 downto 0);
         reg22: in std_logic_vector(31 downto 0);
         reg23: in std_logic_vector(31 downto 0);
         reg24: in std_logic_vector(31 downto 0);
         reg25: in std_logic_vector(31 downto 0);
         reg26: in std_logic_vector(31 downto 0);
         reg27: in std_logic_vector(31 downto 0);
         reg28: in std_logic_vector(31 downto 0);
         reg29: in std_logic_vector(31 downto 0);
         reg30: in std_logic_vector(31 downto 0);
         reg31: in std_logic_vector(31 downto 0);
         reg32: in std_logic_vector(31 downto 0);
         Out1: out std_logic_vector(31 downto 0));
end mux_33to1;

architecture Behavioral of mux_33to1 is
begin
  with S select
       Out1 <= reg0 after 5ns when "000000",
               reg1 after 5ns when "000001", 
               reg2 after 5ns when "000010", 
               reg3 after 5ns when "000011", 
               reg4 after 5ns when "000100", 
               reg5 after 5ns when "000101",
               reg6 after 5ns when "000110",
               reg7 after 5ns when "000111", 
               reg8 after 5ns when "001000", 
               reg9 after 5ns when "001001",
               reg10 after 5ns when "001010",
               reg11 after 5ns when "001011", 
               reg12 after 5ns when "001100", 
               reg13 after 5ns when "001101", 
               reg14 after 5ns when "001110", 
               reg15 after 5ns when "001111", 
               reg16 after 5ns when "010000", 
               reg17 after 5ns when "010001", 
               reg18 after 5ns when "010010",
               reg19 after 5ns when "010011", 
               reg20 after 5ns when "010100",
               reg21 after 5ns when "010101", 
               reg22 after 5ns when "010110", 
               reg23 after 5ns when "010111", 
               reg24 after 5ns when "011000", 
               reg25 after 5ns when "011001", 
               reg26 after 5ns when "011010",
               reg27 after 5ns when "011011",
               reg28 after 5ns when "011100", 
               reg29 after 5ns when "011101",
               reg30 after 5ns when "011110", 
               reg31 after 5ns when "011111",
               reg32 after 5ns when "1-----",
               "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" when others;      
  end Behavioral;
