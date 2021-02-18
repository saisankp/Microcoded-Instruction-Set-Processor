----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/21/2020
-- Design Name: Multiplexer 3-1 1bit testbench
-- Module Name: Multiplexer_3to1_1bit_tb - Behavioral
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

entity Multiplexer_3to1_1bit_tb is
end Multiplexer_3to1_1bit_tb;

architecture Behavioral of Multiplexer_3to1_1bit_tb is

  -- Component Declaration for the Unit Under Test (UUT)
component Multiplexer_3to1_1bit is
    Port ( S0 : in std_logic;
           S1 : in std_logic;
           In0 : in std_logic;
           In1 : in std_logic;
           In2 : in std_logic;
           Z : out std_logic);
end component;

    -- Inputs to test the multiplexer
   signal In0_signal : std_logic;
   signal In1_signal : std_logic;
   signal In2_signal : std_logic;
   signal S0_signal : std_logic;
   signal S1_signal : std_logic;
  

 	-- Outputs to see if the multiplexer is correct
   signal Z_signal : std_logic;


begin

-- Instantiate the Unit Under Test (UUT)
   uut: Multiplexer_3to1_1bit PORT MAP (
          S0 => S0_signal,
          S1 => S1_signal,
          In0 => In0_signal,
          In1 => In1_signal,
          In2 => In2_signal,
          Z => Z_signal
        );

    stim_proc: process
   begin	
        
      wait for 5ns;
      
      --Since S0 = 0 and S1 = 0, then the output is In0 (1)
      S0_signal <= '0';
      S1_signal <= '0';
      In0_signal <= '1';
      In1_signal <= '0';
      In2_signal <= '1';
      
      wait for 5ns;
 
      --Since S1 = 1 and S0 = 1, then the output is In1 (0)
       S0_signal <= '1';
       S1_signal <= '0';
      
      wait for 5ns;	
      
      --Since S0 = 0 and S1 = 1, then the output is In2 (1)
      S0_signal <= '0';
      S1_signal <= '1';
      
      wait for 5ns;	
      
      --Since S0 = 1 and S1 = 1, then the output is In3 (i.e. 0 since this is a 3-1 mux)
      S0_signal <= '1';
      S1_signal <= '1';
      
      wait for 5ns;
      
      --added wait; at the end of the testbench so the simulation looks cleaner.
      wait;
   end process;
end Behavioral;
