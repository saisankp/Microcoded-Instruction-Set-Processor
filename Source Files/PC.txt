----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 01/02/2021 06:24:53 PM
-- Design Name: 
-- Module Name: PC - Behavioral
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

entity PC is
port (displacement : in std_logic_vector (31 downto 0);
        pc_load : in std_logic;
        pc_increment : in std_logic;
        clock : in std_logic;
        reset : in std_logic;
        addr_out : out std_logic_vector (31 downto 0));
end PC;

architecture Behavioral of PC is
component  Arithmetic_Logic_Unit is 
Port ( C_in : in std_logic;
        A : in std_logic_vector(31 downto 0); 
        B : in std_logic_vector(31 downto 0); 
        S0 : in std_logic;
        S1 : in std_logic;
        S2 : in std_logic;
        G : out std_logic_vector(31 downto 0); 
        C_out : out std_logic;
        V_out : out std_logic);
end component;

signal curr_address: std_logic_vector(31 downto 0);
signal alu_out: std_logic_vector(31 downto 0);
signal sel: std_logic_vector(3 downto 0);
signal C_out: std_logic;
signal V_out: std_logic;
constant output_delay: time := 485 ns;
constant gate_delay: time := 1ns;
begin
ALU : Arithmetic_Logic_Unit port map (  
A => curr_address,
B => displacement,
C_in => sel(0),
S0 => sel(1),
S1 => sel(2),
S2 => sel(3),
G => alu_out,
C_out => C_out,
V_out => V_out);

addr_out <= curr_address;

 process(clock, reset)
  begin
   if pc_load='1' and pc_increment='0' then
      sel <= x"2" after gate_delay; --i.e. sel = 10, meaning C_in = 0 and sel(1) = 1, hence we do A + B
    elsif pc_load='0' and pc_increment='1' then
      sel <= x"1" after gate_delay; --i.e. sel = 1, meaning C_in  = 1, hence we do A + 1 (increment) like we did in CAR (control address register).
    elsif pc_load='0' and pc_increment='0' then
      sel <= x"0" after gate_delay; --i.e. sel = 0 , meaning C_in and S0-S2 is all zero, hence G = A (A is outputted, and nothing happens)
    end if;
    if(rising_edge(clock)) then
      if reset='1' then
        curr_address <= "00000000000000000000000000000000" after output_delay;
        sel <= x"0" after output_delay; --i.e. sel = 0 , meaning C_in and S0-S2 is all zero, hence G = A (A is outputted, and nothing happens)
      else
        --Decided to not simply use the '+' operator, but rather use the ALU.
        curr_address <= alu_out after output_delay; --output the address from the ALU's computation.
      end if;
    end if;
  end process;
end Behavioral;
