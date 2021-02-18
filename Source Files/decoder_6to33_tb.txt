----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 10/24/2020 08:32:21 PM
-- Design Name: 6 to 33 line decoder
-- Module Name: decoder_6to33_tb - Behavioral
-- Project Name: -
-- Target Devices: - 
-- Tool Versions: -
-- Description: Takes in 5 inputs and outputs 32 lines.
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

entity decoder_6to33_tb is
end decoder_6to33_tb;

architecture Behavioral of decoder_6to33_tb is

-- Component Declaration for the Unit Under Test (UUT)

    component decoder_6to33
    Port (A: in std_logic_vector(5 downto 0);  --6 bits for 6 inputs
        Q: out std_logic_vector(32 downto 0)); --33 outputs
    end component;
    
  --signals for input/output
  signal A: std_logic_vector(5 downto 0);
  signal Q: std_logic_vector(32 downto 0);

begin
-- Instantiate the Unit Under Test (UUT)
uut: decoder_6to33 port map (
A => A,
Q => Q
);
stim_proc: process
    begin
    --In this testbench, Let's test this 6 to 33 decoder using all combinations of possible input values.
    wait for 5ns;
    A <= "000000";
    wait for 5ns;
    A <= "000001";
    wait for 5ns;
    A <= "000010";
    wait for 5ns;
    A <= "000011";
    wait for 5ns;
    A <= "000100";
    wait for 5ns;
    A <= "000101";
    wait for 5ns;
    A <= "000110";
    wait for 5ns;
    A <= "000111";
    wait for 5ns;
    A <= "001000";
    wait for 5ns;
    A <= "001001";
    wait for 5ns;
    A <= "001010";
    wait for 5ns;
    A <= "001011";
    wait for 5ns;
    A <= "001100";
    wait for 5ns;
    A <= "001101";
    wait for 5ns;
    A <= "001110";
    wait for 5ns;
    A <= "001111";
    wait for 5ns;
    A <= "010000";
    wait for 5ns;
    A <= "010001";
    wait for 5ns;
    A <= "010010";
    wait for 5ns;
    A <= "010011";
    wait for 5ns;
    A <= "010100";
    wait for 5ns;
    A <= "010101";
    wait for 5ns;
    A <= "010110";
    wait for 5ns;
    A <= "010111";
    wait for 5ns;
    A <= "011000";
    wait for 5ns;
    A <= "011001";
    wait for 5ns;
    A <= "011010";
    wait for 5ns;
    A <= "011011";
    wait for 5ns;
    A <= "011100";
    wait for 5ns;
    A <= "011101";
    wait for 5ns;
    A <= "011110";
    wait for 5ns;
    A <= "011111";
    wait for 5ns;
    A <= "100000";
    wait for 5ns;
    wait;
    end process;
end Behavioral;
