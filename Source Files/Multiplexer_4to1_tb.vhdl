----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/13/2020 
-- Design Name: 4-1 Multiplexer 1bit testbench
-- Module Name: Multiplexer_4to1_tb - Behavioral
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

entity Multiplexer_4to1_tb is
end Multiplexer_4to1_tb;

architecture Behavioral of Multiplexer_4to1_tb is

-- Component declaration for the Unit under test (UUT)

component Multiplexer_4to1
port (S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           In0 : in STD_LOGIC;
           In1 : in STD_LOGIC;
           In2 : in STD_LOGIC;
           In3 : in STD_LOGIC;
           Z : out STD_LOGIC);
end component;

    --inputs
    signal S0 : std_logic;
    signal S1 : std_logic;
    signal In0 : std_logic;
    signal In1 : std_logic;
    signal In2 : std_logic;
    signal In3 : std_logic;
    
    --Outputs
    signal Z : std_logic;
    

begin

   
    -- Instantiate the Unit Under Test (UUT)
   uut: Multiplexer_4to1 port map (
          S0 => S0,
          S1 => S1,
          In0 => In0,
          In1 => In1,
          In2 => In2,
          In3 => In3,
          Z => Z
        );
        
    stim_proc: process
   begin
   In0 <= '1';
   In1 <= '0';
   In2 <= '1';
   In3 <= '0';
   
   wait for 5ns;
   
   --With the code below, Z should be In0.
   S0 <= '0';
   S1 <= '0';
   
   wait for 5ns;
   
   --With the code below, Z should be In1.
   S0 <= '1';
   S1 <= '0';
   
   wait for 5ns;
   
   --With the code below, Z should be In2.
   S0 <= '0';
   S1 <= '1';
   
   wait for 5ns;
   
   --With the code below, Z should be In3.
   S0 <= '1';
   S1 <= '1';
   
   wait for 5ns;
   
   --added wait; so that the simulation looks cleaner.
   wait;
   end process;

end Behavioral;
