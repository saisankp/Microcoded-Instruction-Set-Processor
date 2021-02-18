----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/20/2020
-- Design Name: Arithmetic Logic Unit testbench
-- Module Name: Arithmetic_Logic_Unit_tb - Behavioral
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

entity Arithmetic_Logic_Unit_tb is
end Arithmetic_Logic_Unit_tb;

architecture Behavioral of Arithmetic_Logic_Unit_tb is
-- Component Declaration for the Unit Under Test (UUT)
    
    component Arithmetic_Logic_Unit
    Port ( C_in : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           G : out STD_LOGIC_VECTOR (31 downto 0);
           C_out : out STD_LOGIC;
           V_out : out STD_LOGIC);
end component;

    -- inputs to test with
   signal A_signal : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
   signal B_signal : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
   signal C_in_signal : STD_LOGIC := '0';
   signal S0_signal : STD_LOGIC := '0';
   signal S1_signal : STD_LOGIC := '0';
   signal S2_signal : STD_LOGIC := '0';

 	-- outputs to see if the ALU is working
   signal G_signal : STD_LOGIC_VECTOR (31 downto 0);
   signal C_out_signal : STD_LOGIC;
   signal V_out_signal : STD_LOGIC;
   
--time constants to let the ALU have the necessary time to calculate it's operations.
constant Clk_period_For_Arithmetic : time := 485 ns;
constant Clk_period_For_Logic : time := 5 ns;

begin

	-- Instantiate the Unit Under Test (UUT)
   uut: Arithmetic_Logic_Unit PORT MAP (
          A => A_signal,
          B => B_signal,
          S0 => S0_signal,
          S1 => S1_signal,
          S2 => S2_signal,
          C_in => C_in_signal,
          G => G_signal,
          C_out => C_out_signal,
          V_out => V_out_signal
        );

   stim_proc: process
   begin	
   
      wait for Clk_period_For_Arithmetic;
      --Initialize the variables we are using
      A_signal <= "11111111111111111111111111111111";
      B_signal <= "11111111111111111111111111111111";
   
      --First Let's test the arithmetic operations (i.e. when S2 = 0)
      S2_signal <= '0';
   
      C_in_signal <= '0';
      
      -- output should be A (FFFFFFFF) with no flags set
      S0_signal <= '0';
      S1_signal <= '0';
      wait for Clk_period_For_Arithmetic;
      
      -- output should be A+B (80000000) with V = 1
      A_signal <= "00000000000000000000000000000001";
      B_signal <= "01111111111111111111111111111111";
      S0_signal <= '1';
      S1_signal <= '0';
      
      wait for Clk_period_For_Arithmetic;
      
      -- output should be A+!B (FFFFFFFE) with C = 1
      A_signal <= "11111111111111111111111111111111";
      B_signal <= "00000000000000000000000000000000";
      S0_signal <= '0';
      S1_signal <= '1';
      
      wait for Clk_period_For_Arithmetic;
      
      -- output should be A - 1 (-1 i.e. FFFFFFFF in 2's complement) with no flags set.
      A_signal <= "00000000000000000000000000000000";
      S0_signal <= '1';
      S1_signal <= '1';
      
     wait for Clk_period_For_Arithmetic;
      
       -- Test with Carry-in = 1
       
      C_in_signal <= '1';
      -- output should be A + 1 (80000000) with V = 1
      A_signal <= "01111111111111111111111111111111";
      S0_signal <= '0';
      S1_signal <= '0';
      
      wait for Clk_period_For_Arithmetic;
      
      -- output should be A + B + 1 (00000000) with C = 1
      A_signal <= "11111111111111111111111111111111";
      B_signal <= "00000000000000000000000000000000";
      S0_signal <= '1';
      S1_signal <= '0';
      
      wait for Clk_period_For_Arithmetic;
      
      -- output should be A + !B + 1 (FFFFFFFF) with C = 1
      A_signal <= "11111111111111111111111111111111";
      B_signal <= "00000000000000000000000000000000";
      S0_signal <= '0';
      S1_signal <= '1';
      
      wait for Clk_period_For_Arithmetic;
      
       -- output should be A (00000000) with C = 1
       A_signal <= "00000000000000000000000000000000";
      S0_signal <= '1';
      S1_signal <= '1';
      
      wait for Clk_period_For_Arithmetic;
      
      --now that all the arithmetic operations have been tested, now let's test the logic!
      -- To test the logical operations, S2 = 1;
      S2_signal <= '1';
      A_signal <= "00000000000000000000000000000100"; --value of 4 in binary
      B_signal <= "00000000000000000000000000000101"; --value of 5 in binary
      wait for Clk_period_For_Logic;
      
       -- output should be A AND B => 4 
      S0_signal <= '0';
      S1_signal <= '0';
      
      wait for Clk_period_For_Logic;
      
      -- output should be A OR B => 5
      S0_signal <= '1';
      S1_signal <= '0';
      
      wait for Clk_period_For_Logic;
      
      -- output should be A XOR B => 1
      S0_signal <= '0';
      S1_signal <= '1';
      
      wait for Clk_period_For_Logic;
      
      -- output should be NOT A => FFFFFFFB
      S0_signal <= '1';
      S1_signal <= '1';
      
      wait for Clk_period_For_Logic;
      
      --Now the logical circuit has been tested too.
      
      --If the arithmetic operations and logic operations are accurately calculated while setting off the correct
      --flags, then the arithmetic logical unit (ALU) is working properly.
      
      --added wait; at the end so the simulation is clearer to see.
      wait;
   end process;
end Behavioral;
