----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/20/2020 
-- Design Name: 32bit Shifter testbench
-- Module Name: Shifter_32bit_tb - Behavioral
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

entity Shifter_32bit_tb is
end Shifter_32bit_tb;

architecture Behavioral of Shifter_32bit_tb is
 
 -- Component Declaration for the Unit Under Test (UUT) 
    component Shifter_32bit
    Port ( B : in std_logic_vector (31 downto 0);
           S : in std_logic_vector (1 downto 0);
           Ir : in STD_LOGIC;
           Il : in STD_LOGIC;
           H : out std_logic_vector (31 downto 0));
end component;
   
   -- Inputs to test with
   signal B_signal : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
   signal S_signal : std_logic_vector (1 downto 0) := "00";
   signal Ir_signal : STD_LOGIC := '0';
   signal Il_signal : STD_LOGIC := '0';

 	-- Outputs to test with
   signal H_signal : std_logic_vector (31 downto 0);
   
   
   constant Clk_period_For_Shifter : time := 5 ns;
   
   
begin

-- Instantiate the Unit Under Test (UUT)
   uut: Shifter_32bit port map (
          B => B_signal,
          S => S_signal,
          Ir => Ir_signal,
          Il => Il_signal,
          H => H_signal
        );

   stim_proc: process
   begin	

      wait for Clk_period_For_Shifter;
      
      --Initialize the B signal and what gets shifted in
      B_signal <= "00000000000000000000000000000101"; -- the value of 5 in decimal
      Ir_signal <= '0';
      Il_signal <= '0';
      
      wait for Clk_period_For_Shifter;
     
     -- this should output just the value B itself, i.e. 5 in decimal.
      S_signal <= "00";
      
      wait for Clk_period_For_Shifter;	
      
      --this should output the result of a shift operation on B to the RIGHT.(srB)
      --101 shifted right is 10 (i.e. 2 in decimal), which should be the output.
      S_signal <= "01";
      
      wait for Clk_period_For_Shifter;
      	
      --this should be the result of a LEFT shift operation on B to the LEFT. (slB)	
      --101 shifted to the left should be 1010 (i.e. 10 in decimal or 0000000a in hex.)
      S_signal <= "10";
      
      wait for Clk_period_For_Shifter;	
     --if all these outputs match the comments above, then the shifter is working properly.
     
     --added wait; at the end so the simulation is more clear.
      wait;
   end process;
end Behavioral;
