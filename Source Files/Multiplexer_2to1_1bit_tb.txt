----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/21/2020
-- Design Name: 2-1 1bit Multiplexer testbench
-- Module Name: Multiplexer_2to1_1bit_tb - Behavioral
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

entity Multiplexer_2to1_1bit_tb is
end Multiplexer_2to1_1bit_tb;

architecture Behavioral of Multiplexer_2to1_1bit_tb is
 component Multiplexer_2to1_1bit is
    Port ( In0 : in std_logic;
           In1 : in std_logic;
           S : in std_logic;
           Z : out std_logic);
end component;
    

   -- Inputs to test the multiplexer
   signal S_signal : std_logic;
   signal In0_signal : std_logic;
   signal In1_signal : std_logic;

 	-- Outputs to test if the multiplexer is correct
   signal Z_signal :std_logic;
   
begin
-- Instantiate the Unit Under Test (UUT)
   uut: Multiplexer_2to1_1bit PORT MAP (
          S => S_signal,
          In0 => In0_signal,
          In1 => In1_signal,
          Z => Z_signal
        );

   stim_proc: process
   begin	
    
     --initialize the In0 and In1 signals.
      In0_signal <= '0';
      In1_signal <= '1';
        
      wait for 5ns;
      
      --With the code below, the output should be In0(0)
      S_signal <= '0';
      
      wait for 5ns;
      
      --With the code below the output should be In1(1)
      S_signal <= '1';
      
      --added wait; at the end so the simulation is easier to read. 
      wait;
     end process;
end Behavioral;
