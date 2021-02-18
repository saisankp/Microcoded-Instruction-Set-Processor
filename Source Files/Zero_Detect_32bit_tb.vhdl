----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/14/2020 12:32:06 PM
-- Design Name: Zero Detect 32 bit testbench
-- Module Name: Zero_Detect_32bit_tb - Behavioral
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

entity Zero_Detect_32bit_tb is
end Zero_Detect_32bit_tb;

architecture Behavioral of Zero_Detect_32bit_tb is
  
  -- Component Declaration for the Unit Under Test (UUT)
    
    component Zero_Detect_32bit
    port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           Z : out STD_LOGIC);
    end component;
 
    -- inputs to test the zero detect
   signal A_signal : STD_LOGIC_VECTOR (31 downto 0);

 	-- outputs to see if the zero detect works.
   signal Z_signal : STD_LOGIC;

begin

-- Instantiate the Unit Under Test (UUT)
   uut: Zero_Detect_32bit PORT MAP (
          A => A_signal,
          Z => Z_signal
        );

   stim_proc: process
   begin	
        
        wait for 5ns;
        
        --first let's try all 1's, the output should be 0 (False).	
      A_signal <= "11111111111111111111111111111111";

      wait for 5ns;
      
      -- now try half 1's and half 0's, output should still be 0 (False).
      A_signal <= "11111111111111110000000000000000";
      
      wait for 5ns;
      
      -- finally, try all zeros, output should be 1 (True!)
      A_signal <= "00000000000000000000000000000000";
 
    --added wait; at the end so the simulation is more clear.
    wait;
   end process;
end Behavioral;
