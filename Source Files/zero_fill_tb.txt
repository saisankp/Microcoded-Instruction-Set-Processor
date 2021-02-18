----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 01/01/2021 08:46:47 PM
-- Design Name: 
-- Module Name: zero_fill_tb - Behavioral
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

entity zero_fill_tb is
end zero_fill_tb;

architecture Behavioral of zero_fill_tb is
 -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT zero_fill
    Port (SB : in  STD_LOGIC_VECTOR (4 downto 0);
	    constant_out : out STD_LOGIC_VECTOR (31 downto 0));
    END COMPONENT;
    
     --Inputs
   signal SB : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal constant_out : std_logic_vector(31 downto 0);  
   constant delay: time := 10 ns;
    
begin
	-- Instantiate the Unit Under Test (UUT)
   uut: zero_fill PORT MAP (
          SB => SB,
          constant_out => constant_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
   
   --test all possible values of SB.
    SB <= "00000";
    wait for delay;
    
    SB <= "00001";
    wait for delay;
    
    SB <= "00010";
    wait for delay;
    
    SB <= "00011";
    wait for delay;
    
    SB <= "00100";
    wait for delay;
    
    SB <= "00101";
    wait for delay;
    
    SB <= "00110";
    wait for delay;
    
    SB <= "00111";
    wait for delay;
    
    SB <= "01000";
    wait for delay;
    
    SB <= "01001";
    wait for delay;
    
    SB <= "01010";
    wait for delay;
    
    SB <= "01011";
    wait for delay;
    
    SB <= "01100";
    wait for delay;
    
    SB <= "01101";
    wait for delay;
    
    SB <= "01110";
    wait for delay;
    
    SB <= "01111";
    wait for delay;
    
    SB <= "10000";
    wait for delay;
    
    SB <= "10001";
    wait for delay;
    
    SB <= "10010";
    wait for delay;
    
    SB <= "10011";
    wait for delay;
    
    SB <= "10100";
    wait for delay;
    
    SB <= "10101";
    wait for delay;
    
    SB <= "10110";
    wait for delay;
    
    SB <= "10111";
    wait for delay;
    
    SB <= "11000";
    wait for delay;
    
    SB <= "11001";
    wait for delay;
    
    SB <= "11010";
    wait for delay;
    
    SB <= "11011";
    wait for delay;
    
    SB <= "11100";
    wait for delay;
    
    SB <= "11101";
    wait for delay;
    
    SB <= "11110";
    wait for delay;
    
    SB <= "11111";
    wait for delay;
    wait;
   end process;

end Behavioral;
