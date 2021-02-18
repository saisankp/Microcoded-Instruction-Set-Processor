----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 10/25/2020 03:49:19 PM
-- Design Name: 32 bit register
-- Module Name: reg32_tb - Behavioral
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

entity reg32_tb is
end reg32_tb;

architecture Behavioral of reg32_tb is

    component reg32 
    port (D : in std_logic_vector(31 downto 0);
         reset : in std_logic;
         load, Clk : in std_logic;
         QOut : out std_logic_vector(31 downto 0));
    end component;
    
    --Inputs
    signal D :  std_logic_vector(31 downto 0);
    signal load : std_logic;
    signal Clk : std_logic := '0'; -- make sure you initialise!
    signal reset : std_logic;
    --Outputs
    signal QOut : std_logic_vector(31 downto 0);
    
 -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant Clk_period : time := 5 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
       uut: reg32 port map (
       D => D,
       load => load,
       reset => reset,
       Clk => Clk,
       QOut => QOut
       );
       
    stim_proc: process
     begin	
     -- First test value to be loaded is 10101010101010101010101010101010
     -- Clk changes every 5ns (independent of other delays)
     -- load changes every 10ns.
     
     --test reset first, the register should output 0's!
      Clk <= '0';
      reset <= '1';
      wait for 5ns;
      Clk <= '1';
      wait for 5ns;
      Clk <= '0';
      wait for 5ns;
      Clk <= '1';
      
      --now, let's test the register by actually loading values!
      reset <= '0';
      D <= "10101010101010101010101010101010"; 
      Clk <= '0';
      load <= '0';
     
      wait for 5ns;
      Clk <= '1';
      
      wait for 5ns;
      Clk <= '0';
      load <= '1';
      
      wait for 5ns;
      Clk <= '1';
      
      wait for 5ns;
      Clk <= '0';
      load <= '0';
      
    -- Second test value to be loaded is 00000000000000000000000000000000
       D <= "00000000000000000000000000000000"; 
      Clk <= '0';
      load <= '0';
      
      wait for 5ns;
      Clk <= '1';
      
      wait for 5ns;
      Clk <= '0';
      load <= '1';
      
      wait for 5ns;
      Clk <= '1';
      
      wait for 5ns;
      Clk <= '0';
      load <= '0';
      
      -- Second test value to be loaded is 11111111111111111111111111111111
       D <= "11111111111111111111111111111111"; 
      Clk <= '0';
      load <= '0';
      
      wait for 5ns;
      Clk <= '1';
      
      wait for 5ns;
      Clk <= '0';
      load <= '1';
      
      wait for 5ns;
      Clk <= '1';
      
      wait for 5ns;
      Clk <= '0';
      load <= '0';
    wait;
    end process;
end Behavioral;
