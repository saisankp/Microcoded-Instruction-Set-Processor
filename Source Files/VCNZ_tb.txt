----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 01/03/2021 07:17:38 PM
-- Design Name: 
-- Module Name: VCNZ_tb - Behavioral
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

entity VCNZ_tb is
end VCNZ_tb;

architecture Behavioral of VCNZ_tb is

component VCNZ 
Port ( Vin : in std_logic;
         Cin : in std_logic;
         Nin : in std_logic;
         Zin : in std_logic;
         clock : in std_logic;
         Reset : in std_logic_vector(3 downto 0); --reset = RV + RC + RN + RZ
         FL : in std_logic;
         Vout : out std_logic;
         Cout : out std_logic;
         Nout : out std_logic;
         Zout : out std_logic); 
end component;

signal Vin : std_logic;
signal Cin : std_logic;
signal Nin : std_logic;
signal Zin : std_logic;
signal clock : std_logic;
signal Reset : std_logic_vector(3 downto 0);
signal FL : std_logic;
signal Vout : std_logic;
signal Cout : std_logic;
signal Nout : std_logic;
signal Zout : std_logic;
constant delay: Time := 10 ns;
signal clock_finish: boolean;

begin
uut : VCNZ port map (
Vin => Vin,
Cin => Cin,
Nin => Nin,
Zin => Zin,
clock => clock,
Reset => Reset,
FL => FL,
Vout => Vout,
Cout => Cout,
Nout => Nout,
Zout => Zout);

 -- Stimulus process
   stim_proc: process
   begin	
   wait for delay;
   wait for delay;
   wait for delay;
   --initialize the input flags
    Vin <= '1';
    Cin <= '1';
    Nin <= '1';
    Zin <= '1';
    FL <= '1';
    Reset <= "0000";
    wait for delay;
    Reset <= "0001";
    wait for delay;
    Reset <= "0010";
    wait for delay;
    Reset <= "0011";
    wait for delay;
    Reset <= "0100";
    wait for delay;
    Reset <= "0101";
    wait for delay;
    Reset <= "0110";
    wait for delay;
    Reset <= "0111";
    wait for delay;
    Reset <= "1000";
    wait for delay;
    Reset <= "1001";
    wait for delay;
    Reset <= "1010";
    wait for delay;
    Reset <= "1011";
    wait for delay;
    Reset <= "1100";
    wait for delay;
    Reset <= "1101";
    wait for delay;
    Reset <= "1110";
    wait for delay;
    Reset <= "1111";
    wait for delay;
    
    --when Flag load = 0, then the flags can't be loaded.
    FL <= '0';
    Reset <= "0000";
    Vin <= '1';
    Cin <= '0';
    Nin <= '1';
    Zin <= '0';
    wait for delay;
    clock_finish <= true;
    wait;
   end process;
   
    clocking: process
  begin
    while not clock_finish loop
      clock <= '0', '1' after delay / 2;
      wait for delay;
    end loop;
    wait;
  end process;

end Behavioral;
