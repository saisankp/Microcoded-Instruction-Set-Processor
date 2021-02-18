----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/20/2020
-- Design Name: Logical Circuit Bitslice
-- Module Name: Logic_Circuit_Bitslice - Behavioral
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

entity Logic_Circuit_Bitslice is
 Port (S0 : in std_logic;
           S1 : in std_logic;
           A : in std_logic;
           B : in std_logic;
           Z : out std_logic);
end Logic_Circuit_Bitslice;

architecture Behavioral of Logic_Circuit_Bitslice is

COMPONENT Multiplexer_4to1
    Port ( S0 : in std_logic;
           S1 : in std_logic;
           In0 : in std_logic;
           In1 : in std_logic;
           In2 : in std_logic;
           In3 : in std_logic;
           Z : out std_logic
           );
END COMPONENT;

signal A_and_B_signal : std_logic;
signal A_or_B_signal : std_logic;
signal A_xor_B_signal : std_logic;
signal not_A_signal : std_logic;

begin

-- Set the signals according to the diagram of the logical bitslice.
A_and_B_signal <= A and B;
A_or_B_signal <= A or B;
A_xor_B_signal <= A xor B;
not_A_signal <= not A;

--Now that the signals for each logical operation has been set, instantiate the multiplexer
--and map the inputs and outputs accordingly.

mux: Multiplexer_4to1 PORT MAP(
        S0 => S0,
        S1 => S1,
        In0 => A_and_B_signal,
        In1 => A_or_B_signal,
        In2 => A_xor_B_signal,
        In3 => not_A_signal,
        Z => Z
        );

end Behavioral;
