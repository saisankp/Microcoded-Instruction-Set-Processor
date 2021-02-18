----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 01/01/2021 11:20:26 PM
-- Design Name: 
-- Module Name: Multiplexer_2to1_17bit_tb - Behavioral
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

entity Multiplexer_2to1_17bit_tb is
end Multiplexer_2to1_17bit_tb;

architecture Behavioral of Multiplexer_2to1_17bit_tb is
 
 component Multiplexer_2to1_17bit
    port(s : in std_logic;
         in1 : in std_logic_vector(16 downto 0);
         in2 : in std_logic_vector(16 downto 0);
         z : out std_logic_vector(16 downto 0));
  end component;
  
  signal s: std_logic;
  signal in1: std_logic_vector(16 downto 0);
  signal in2: std_logic_vector(16 downto 0);
  signal z: std_logic_vector(16 downto 0);
  constant delay: time := 10 ns;
begin

uut: Multiplexer_2to1_17bit port map ( s => s,
                                  in1 => in1,
                                  in2 => in2,
                                   z  => z);

stimulus: process
  begin
  --initialize in1 and in2
  in1 <= "00000000000000000";
  in2 <= "11111111111111111";
  
  
  --output should be 00000000000000000
  s <= '0';
  wait for delay;
  
  --output should be 11111111111111111
  s <= '1';
  wait for delay;
 
  wait;
  end process;

end Behavioral;
