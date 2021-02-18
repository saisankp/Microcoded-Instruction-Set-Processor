----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai 
-- 
-- Create Date: 11/21/2020
-- Design Name: Full Adder
-- Module Name: Full_Adder - Behavioral
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

entity Full_Adder is
    Port ( In1 : in std_logic;
           In2 : in std_logic;
           C_in : in std_logic;
           Sum : out std_logic;
           C_out : out std_logic);
end Full_Adder;

architecture Behavioral of Full_Adder is

--signals for calculating the Sum and Carry-Out
signal S1, S2, S3 : std_logic;

begin
s1 <= (In1 xor In2) after 5ns;
s2 <= (c_in and S1) after 5ns;
s3 <= (In1 and In2) after 5ns;
sum <= (S1 xor C_in) after 5ns;
c_out <= (S2 or S3) after 5ns;


end Behavioral;
