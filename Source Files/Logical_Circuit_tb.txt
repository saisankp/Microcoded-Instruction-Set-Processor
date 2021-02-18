----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/21/2020
-- Design Name: Logical Circuit testbench
-- Module Name: Logic_Circuit_tb - Behavioral
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

entity Logic_Circuit_tb is
end Logic_Circuit_tb;

architecture Behavioral of Logic_Circuit_tb is
     -- Component Declaration for the Unit Under Test (UUT)
    
    component Logical_Circuit
    Port ( S0 : in std_logic;
           S1 : in std_logic;
           A : in std_logic_vector (31 downto 0);
           B : in std_logic_vector (31 downto 0);
           G : out std_logic_vector (31 downto 0));
end component;

   -- inputs
   signal A_signal : std_logic_vector (31 downto 0);
   signal B_signal : std_logic_vector (31 downto 0);
   signal S0_signal : std_logic;
   signal S1_signal : std_logic;

 	-- outputs
   signal G_signal : std_logic_vector (31 downto 0);
   constant Clk_period_For_Logic : time := 5 ns;
   
begin

-- Instantiate the Unit Under Test (UUT)
   uut: Logical_Circuit PORT MAP (
          A => A_signal,
          B => B_signal,
          S0 => S0_signal,
          S1 => S1_signal,
          G => G_signal
        );

   stim_proc: process
   begin	
   
      wait for Clk_period_For_Logic;
      --Initizalize the A and B signals for logical operations.
      A_signal <= "00000000000000000000000000000100"; --value of 4 in binary
      B_signal <= "00000000000000000000000000000101"; --value of 5 in binary
   
      -- result = A AND B
      -- hence 100 AND 101 = 100 (i.e. 4 in decimal)
      S0_signal <= '0';
      S1_signal <= '0';
      
      wait for Clk_period_For_Logic;
      
      -- result = A OR B
      -- hence 100 OR 101 = 101 (i.e. 5 in decimal)
      S0_signal <= '1';
      S1_signal <= '0';
      
      wait for Clk_period_For_Logic;
      
      -- result = A XOR B
      -- hence 100 XOR 101 = 1 (i.e. 1 in decimal)
      S0_signal <= '0';
      S1_signal <= '1';
      
      wait for Clk_period_For_Logic;
      
      -- result = NOT A
      -- hence !(00000000000000000000000000000100) = FFFFFFFB in hex.
      S0_signal <= '1';
      S1_signal <= '1';
      
      wait for Clk_period_For_Logic;
      
      --if all these values show up properly, then the shifter works.
      
      --added wait; at the end so the simulation is more clear.
      wait;
   end process;
end Behavioral;
