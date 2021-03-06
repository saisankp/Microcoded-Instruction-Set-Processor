----------------------------------------------------------------------------------
-- Company: Trinity College Dublin                                                
-- Engineer: Prathamesh Sai                                                       
--                                                                                
-- Create Date: 11/20/2020                                                        
-- Design Name: Arithmetic Circuit Bitslice testbench                                      
-- Module Name: Arithmetic_Circuit_Bitslice_tb - Behavioral                          
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

library ieee;
use ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- USE ieee.numeric_std.ALL;
 
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity Arithmetic_Circuit_Bitslice_tb IS
end Arithmetic_Circuit_Bitslice_tb;
 
architecture Behavioral of Arithmetic_Circuit_Bitslice_tb is
 
-- Component Declaration for the Unit Under Test (UUT)
component Arithmetic_Circuit_Bitslice
    Port ( A : in std_logic;
           B : in std_logic;
           S0 : in std_logic;
           S1 : in std_logic;
           C_in : in std_logic;
           G : out std_logic;
           C_out : out std_logic);
end component;
    

   --Inputs to test with.
   signal A_signal : STD_LOGIC := '0';
   signal B_signal : STD_LOGIC := '0';
   signal C_in_signal : STD_LOGIC := '0';
   signal S0_signal : STD_LOGIC := '0';
   signal S1_signal : STD_LOGIC := '0';

 	--Outputs to see the results.
   signal G_signal : STD_LOGIC;
   signal C_out_signal : STD_LOGIC;
   
  -- let's make the time between each input 20ns, so we can see the results more clearly.
  constant Clk_period_For_Arithmetic_Bitslice : time := 20 ns;
 
begin
 
   -- Instantiate the Unit Under Test (UUT)
   uut: Arithmetic_Circuit_Bitslice PORT MAP (
          A => A_signal,
          B => B_signal,
          S0 => S0_signal,
          S1 => S1_signal,
          C_in => C_in_signal,
          G => G_signal,
          C_out => C_out_signal
        );

   stim_proc: process
   begin	
        
      wait for Clk_period_For_Arithmetic_Bitslice;
      
      A_signal <= '0';  --A = 0
      B_signal <= '1';  --B = 1
      
      --First, let's test with the Carry-in = 0.
      C_in_signal <= '0'; 
      
      wait for Clk_period_For_Arithmetic_Bitslice;
      
      -- Output should be A (result = 0, C_out = 0)
      S0_signal <= '0';
      S1_signal <= '0';
      
      wait for Clk_period_For_Arithmetic_Bitslice;
      
      -- Output should be A + B (result = 1, C_out = 0)
      S0_signal <= '1';
      S1_signal <= '0';
      
      wait for Clk_period_For_Arithmetic_Bitslice;
      
      -- Output should be A + !B (result = 0, C_out = 0)
      S0_signal <= '0';
      S1_signal <= '1';
      
      wait for Clk_period_For_Arithmetic_Bitslice;
      
      -- Output should be A - 1 (result = -1 {i.e. 1 in 2's complement} C_out = 0)
      S0_signal <= '1';
      S1_signal <= '1';
      
      wait for Clk_period_For_Arithmetic_Bitslice;
      
      
      --now test with the Carry-in = 1.
      C_in_signal <= '1';
      
      wait for Clk_period_For_Arithmetic_Bitslice;
      
      -- Output should be A + 1 (result = 1, C_out = 1)
      S0_signal <= '0';
      S1_signal <= '0';
      
      wait for Clk_period_For_Arithmetic_Bitslice;
      
      -- Output should be A + B + 1 (result = 0 with C_out = 0)
      S0_signal <= '1';
      S1_signal <= '0';
      
      wait for Clk_period_For_Arithmetic_Bitslice;
      
      -- Output should be A + !B + 1 (result = 1 with C_Out = 1)
      S0_signal <= '0';
      S1_signal <= '1';
      
      wait for Clk_period_For_Arithmetic_Bitslice;
      
      -- Output should be A (result = 0 with C_Out = 1)
      S0_signal <= '1';
      S1_signal <= '1';
      
      --used wait; at the end to make the simulation more readable.
      wait;
   end process;

end Behavioral;
