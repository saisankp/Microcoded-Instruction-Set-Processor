----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 01/01/2021 08:01:26 PM
-- Design Name: 
-- Module Name: IR - Behavioral
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

entity IR is
 Port (data_in : in  STD_LOGIC_VECTOR (31 downto 0);
       IL : in  STD_LOGIC;
	   Clk : in STD_LOGIC;
       Opcode : out  STD_LOGIC_VECTOR (16 downto 0);
       DR : out  STD_LOGIC_VECTOR (4 downto 0);
       SA : out  STD_LOGIC_VECTOR (4 downto 0);
       SB : out  STD_LOGIC_VECTOR (4 downto 0));
end IR;

architecture Behavioral of IR is

    component reg32
    Port ( D : in std_logic_vector(31 downto 0);
         reset : in std_logic;
         load : in std_logic;
         Clk : in std_logic;
         QOut : out std_logic_vector(31 downto 0));
    end component;


signal data_out: std_logic_vector(31 downto 0);

begin


--register
reg: reg32 PORT MAP(
D => data_in,
load => IL,
reset => '0', --this is because we don't need a reset for the instruction register.
Clk => Clk,
QOut => data_out
);

--distribute the bits according to the assignment specification.
Opcode<=data_out(31 downto 15);
	DR<=data_out(14 downto 10);
	SA<=data_out(9 downto 5);
	SB<=data_out(4 downto 0);

end Behavioral;
