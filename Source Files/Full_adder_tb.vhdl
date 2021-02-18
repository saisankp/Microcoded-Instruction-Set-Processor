----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/21/2020
-- Design Name: Full Adder testbench
-- Module Name: full_adder_tb - Behavioral
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

entity Full_adder_tb is
end Full_adder_tb;

architecture Behavioral of Full_adder_tb is

-- Component Declaration for the Unit Under Test (UUT)

component Full_adder 
port(  In1 : in std_logic;
       In2 : in std_logic;
       C_in : in std_logic;
       Sum : out std_logic;
       C_out : out std_logic);
end component;

    -- inputs to test the full adder 

    signal In1 : std_logic;
    signal In2 : std_logic;
    signal C_in : std_logic;
    
    --outputs to see if the full adder works
    signal Sum : std_logic;
    signal C_out : std_logic;

    constant Clk_period_For_Full_Adder : time := 10 ns;
begin

-- Instantiate the Unit Under Test (UUT)
uut: Full_adder port map (
    In1 => In1,
    In2 => In2,
    C_in => C_in,
    Sum => Sum,
    C_out => C_out
);

stim_proc: process
    begin
    
    -- Let's go through all the possibilties to test
        wait for Clk_period_For_Full_Adder;
    -- Case 1 : In1 = 0, In2 = 0, C_In = 0, hence Sum = 0 and C_Out = 0
        In1 <= '0';
        In2 <= '0';
        C_in <= '0';
        
        wait for Clk_period_For_Full_Adder;
    
    -- Case 2 : In1 = 0, In2 = 1, C_In = 0, hence Sum = 1 and C_Out = 0
        In1 <= '0';
        In2 <= '1';
        C_in <= '0';
        
        wait for Clk_period_For_Full_Adder;
    
    -- Case 3 : In1 = 1, In2 = 0, C_In = 0, hence Sum = 1 and C_Out = 0
        In1 <= '1';
        In2 <= '0';
        C_in <= '0';
       
        wait for Clk_period_For_Full_Adder;
    
    -- Case 4 : In1 = 1, In2 = 1, C_In = 0, hence Sum = 0 and C_Out = 1
        In1 <= '1';
        In2 <= '1';
        C_in <= '0';
        
        wait for Clk_period_For_Full_Adder;

    -- Case 5 : In1 = 0, In2 = 0, C_In = 1, hence Sum = 1 and C_Out = 0
        In1 <= '0';
        In2 <= '0';
        C_in <= '1';
        
        wait for Clk_period_For_Full_Adder;
    
    -- Case 6 : In1 = 0, In2 = 1, C_In = 1, hence Sum = 0 and C_Out = 1
        In1 <= '0';
        In2 <= '1';
        C_in <= '1';
        
        wait for Clk_period_For_Full_Adder;
        
    -- Case 7 : In1 = 1, In2 = 0, C_In = 1, hence Sum = 0 and C_Out = 1
        In1 <= '1';
        In2 <= '0';
        C_in <= '1';
        
        wait for Clk_period_For_Full_Adder;
        
    -- Case 8 : In1 = 1, In2 = 1, C_In = 1, hence Sum = 1 and C_Out = 1
        In1 <= '1';
        In2 <= '1';
        C_in <= '1';
        
        wait for Clk_period_For_Full_Adder;
        
        --added wait; at the end so the simulation looks clearer.
        wait;
    end process;
end Behavioral;
