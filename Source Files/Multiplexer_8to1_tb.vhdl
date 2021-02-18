----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 01/01/2021 10:29:36 PM
-- Design Name: 
-- Module Name: Multiplexer_8to1_tb - Behavioral
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

entity Multiplexer_8to1_tb is
end Multiplexer_8to1_tb;

architecture Behavioral of Multiplexer_8to1_tb is

 component Multiplexer_8to1
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
  end component;

  signal s: std_logic_vector(2 downto 0);
  signal in1: std_logic;
  signal in2: std_logic;
  signal in3: std_logic;
  signal in4: std_logic;
  signal in5: std_logic;
  signal in6: std_logic;
  signal in7: std_logic;
  signal in8: std_logic;
  signal z: std_logic;
  
  constant delay: time := 10 ns;
begin
ut: Multiplexer_8to1 port map( s => s,
                               in1 => in1,
                               in2 => in2,
                               in3 => in3,
                               in4 => in4,
                               in5 => in5,
                               in6 => in6,
                               in7 => in7,
                               in8 => in8,
                                z  => z );

  stimulus: process
  begin

    -- set in1-in8 to arbitrary values to test with

    in1 <= '1';
    in2 <= '0';
    in3 <= '1';
    in4 <= '0';
    in5 <= '1';
    in6 <= '0';
    in7 <= '1';
    in8 <= '0';

    -- testing the 8-1 1bit mux.
    s <= "000";
    wait for delay;
    s <= "001";
    wait for delay;
    s <= "010";
    wait for delay;
    s <= "011";
    wait for delay;
    s <= "100";
    wait for delay;
    s <= "101";
    wait for delay;
    s <= "110";
    wait for delay;
    s <= "111";
    wait for delay;

    wait;
  end process;

end Behavioral;
