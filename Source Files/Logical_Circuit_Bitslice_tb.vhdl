----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/20/2020
-- Design Name: Logical Circuit Bitslice testbench
-- Module Name: Logic_Circuit_Bitslice_tb - Behavioral
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

entity Logic_Circuit_Bitslice_tb is
end Logic_Circuit_Bitslice_tb;

architecture Behavioral of Logic_Circuit_Bitslice_tb is
 
  -- Component Declaration for the Unit Under Test (UUT)
component Logic_Circuit_Bitslice
    Port ( S0 : in std_logic;
           S1 : in std_logic;
           A : in std_logic;
           B : in std_logic;
           Z : out std_logic);
end component;
    

   --Inputs
   signal S0_signal : std_logic;
   signal S1_signal : std_logic;
   signal A_signal : std_logic;
   signal B_signal : std_logic;

 	--Outputs
   signal Z_signal : std_logic;
   
begin

-- Instantiate the Unit Under Test (UUT)
   uut: Logic_Circuit_Bitslice port map (
          S0 => S0_signal,
          S1 => S1_signal,
          A => A_signal,
          B => B_signal,
          Z => Z_signal
        );

   stim_proc: process
   begin	
        
      wait for 5ns;
      
      --Initialize the signals to test with.
      A_signal <= '0';
      B_signal <= '1';
      
      
      --Output = A AND B (result = 0).
      S0_signal <= '0';
      S1_signal <= '0';
      
      wait for 5ns;
      
      --Output = A OR B (result = 1).
      S0_signal <= '1';
      S1_signal <= '0';
      
      wait for 5ns;
      
      --Output = A XOR B (result = 1).
      S0_signal <= '0';
      S1_signal <= '1';
      
      wait for 5ns;
      
      --Output = !A (result = 1).
      S0_signal <= '1';
      S1_signal <= '1';
      
      --added wait; at the end so the simulation is more clear.
      wait;
   end process;
end Behavioral;
