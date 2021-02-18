----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 10/25/2020 01:29:45 PM
-- Design Name: 
-- Module Name: mux_2to1_tb - Behavioral
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

entity mux_2to1_tb is
end mux_2to1_tb;

architecture Behavioral of mux_2to1_tb is
    
     -- Component declaration for the Unit under test (UUT)
      component mux_2to1 
      port (In0 : in std_logic_vector(31 downto 0);
            In1 : in std_logic_vector(31 downto 0);
            s : in std_logic; 
            Z : out std_logic_vector(31 downto 0));
      end component; 

    -- Inputs
    signal In0 : std_logic_vector(31 downto 0) := (others => '0');
    signal In1 : std_logic_vector(31 downto 0);
    signal s : std_logic := '0';

    -- Output
    signal Z : std_logic_vector(31 downto 0);
    
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant Clk_period : time := 5 ns;
    
begin
-- Instantiate the Unit Under Test (UUT)
uut: mux_2to1 port map (
    In0 => In0,
    In1 => In1,
    s => s,
    Z => Z
   );
    
    stim_proc: process
    
        -- There is only two possible outputs, where S = 0 and S = 1.
        -- Let's test these two possible cases.
        begin
        In0 <= "10101010101010101010101010101010"; --A
        In1 <= "11110000111100001111000011110000"; 
        
        -- using the code below, the output Z should be In0
        wait for 5ns;
         s <= '0';
         
         -- using the code below, the output Z should be In1
        wait for 5ns;
        s <= '1';
    end process;
end Behavioral;
