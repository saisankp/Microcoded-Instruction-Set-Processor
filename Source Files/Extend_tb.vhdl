----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 01/01/2021 10:05:44 PM
-- Design Name: 
-- Module Name: Extend_tb - Behavioral
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

entity Extend_tb is
end Extend_tb;

architecture Behavioral of Extend_tb is

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT Extend
Port ( DR : in  STD_LOGIC_VECTOR (4 downto 0);
       SB : in  STD_LOGIC_VECTOR (4 downto 0);
       extension : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

   --Inputs
   signal DR : std_logic_vector(4 downto 0) := (others => '0');
   signal SB : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal extension : std_logic_vector(31 downto 0);

   constant delay: time := 10 ns;

begin
-- Instantiate the Unit Under Test (UUT)
   uut: Extend PORT MAP (
          DR => DR,
          SB => SB,
          extension => extension
        );
 -- Stimulus process
   stim_proc: process
   begin
   
   -- Test when DR has '0' in the MSB (most significant bit).
   -- output should be "00000000000000000000000011011111"
   DR <= "00110";
   SB <= "11111";
   
   wait for delay;
   
   -- Test when DR has '1' in the MSB (most significant bit).
   -- output should be "11111111111111111111111111110101"
   DR <= "11111";
   SB <= "10101";
   
   wait for delay;
   wait;
   end process;
   
end Behavioral;
