----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/20/2020
-- Design Name: Arithmetic Circuit testbench
-- Module Name: Arithmetic_Circuit_tb - Behavioral
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

entity Arithmetic_Circuit_tb is
end Arithmetic_Circuit_tb;

architecture Behavioral of Arithmetic_Circuit_tb is
   -- Component Declaration for the Unit Under Test (UUT)
    
    component Arithmetic_Circuit
    Port ( C_In : in std_logic;
           S1 : in std_logic;
           S0 : in std_logic;
           A : in std_logic_vector (31 downto 0);
           B : in std_logic_vector (31 downto 0);
           G : out std_logic_vector (31 downto 0);
           C_Out : out std_logic;
           V_out : out std_logic);
end component;
    

   --Inputs to test with.
   signal A_signal : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
   signal B_signal : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
   signal C_in_signal : std_logic := '0';
   signal S0_signal : std_logic := '0';
   signal S1_signal : std_logic := '0';

 	--Outputs to see the results of our simulation.
   signal G_signal : std_logic_vector (31 downto 0);
   signal C_out_signal : std_logic;
   signal V_out_signal : std_logic;
   
 
   constant Clk_period_For_Arithmetic : time := 485 ns;
begin

-- Instantiate the Unit Under Test (UUT)
   uut: Arithmetic_Circuit PORT MAP (
          A => A_signal,
          B => B_signal,
          S0 => S0_signal,
          S1 => S1_signal,
          C_in => C_in_signal,
          G => G_signal,
          C_out => C_out_signal,
          V_out => V_out_signal
        );

   stim_proc: process
   begin	
        
       wait for Clk_period_For_Arithmetic;
       A_signal <= "11111111111111111111111111111111";
       B_signal <= "11111111111111111111111111111111";
      
       C_in_signal <= '0';
      
       --output should be A (result = FFFFFFFF)
       S0_signal <= '0';
       S1_signal <= '0';
       wait for Clk_period_For_Arithmetic;
      
       A_signal <= "00000000000000000000000000000001"; --
       B_signal <= "01111111111111111111111111111111";-- 
      
       --Output is A + B hence it's going to have an overflow since we add 1 to +2147483647 in decimal. Result = 0x80000000 in hex with an overflow. 
       --If the Overflow flag is set, then we know that the overflow flag is working properly.
      
       S0_signal <= '1';
       S1_signal <= '0';
      
       wait for Clk_period_For_Arithmetic;
      
       A_signal <= "11111111111111111111111111111111";
       B_signal <= "00000000000000000000000000000000";
               
       --Output will be A + !B, hence it will be FFFFFFFE with a carry out of 1 since we add two 32 bit numbers filled with 1's.
       -- If this carry flag is set , then we know the carry flag is working properly.
       S0_signal <= '0';
       S1_signal <= '1';
      
       wait for Clk_period_For_Arithmetic;
      
       A_signal <= "00000000000000000000000000000000";
      
       --Output will be A - 1 hence it will be -1 i.e. FFFFFFFF in 2's complement with no flags being set.
       S0_signal <= '1';
       S1_signal <= '1';
         
       wait for Clk_period_For_Arithmetic;
      
       --Test with Carry-In = 1
       
       C_in_signal <= '1';
      
       A_signal <= "01111111111111111111111111111111";
      
       --The output should be A + 1, hence the output will be 0x80000000 in hex with an overflow. 
       --If the overflow flag is set here, then the overflow flag is working.
       S0_signal <= '0';
       S1_signal <= '0';
       wait for Clk_period_For_Arithmetic;
      
       A_signal <= "11111111111111111111111111111111";
       B_signal <= "00000000000000000000000000000000";
        
       --The output should be A + B + 1, hence it will be 00000000 in hex, with the carry flag being set.
       --If the carry flag is set here, then the carry flag is working.
       S0_signal <= '1';
       S1_signal <= '0';
      
       wait for Clk_period_For_Arithmetic;
      
       --The output should be A + !B + 1, hence it will be FFFFFFFF with the carry flag being set.
       --If the carry flag is set here, then the carry flag is working.
       S0_signal <= '0';
       S1_signal <= '1';
      
       wait for Clk_period_For_Arithmetic;
     
       A_signal <= "00000000000000000000000000000000";
      
       --The output should be A  i.e. 00000000, with the C flag being set because Carry in = 1.
       
       S0_signal <= '1';
       S1_signal <= '1';
      
       wait for Clk_period_For_Arithmetic;
       --If all the outputs match appropriately, and every flag is set at the correct time, then the arithmetic circuit is working.
     
       --Added wait; at the end to make the simulation more readable.
       wait;
   end process;
end Behavioral;
