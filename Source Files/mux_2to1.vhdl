----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 10/25/2020 11:52:41 AM
-- Design Name: 
-- Module Name: mux_2to1 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

 -- make the 2 to 1 multiplexer 32 bits!
entity mux_2to1 is
    Port ( In0 : in std_logic_vector(31 downto 0);
            In1 : in std_logic_vector(31 downto 0);
            s : in std_logic; 
            Z : out std_logic_vector(31 downto 0));
end mux_2to1;

architecture Behavioral of mux_2to1 is
begin
Z <= In0 after 5ns when S = '0' else
     In1 after 5ns when S = '1' else 
     "00000000000000000000000000000000" after 5ns;
end Behavioral;
