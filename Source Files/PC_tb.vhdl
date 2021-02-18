----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 01/02/2021 06:50:22 PM
-- Design Name: 
-- Module Name: PC_tb - Behavioral
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

entity PC_tb is
end PC_tb;

architecture Behavioral of PC_tb is
component PC
    port (displacement : in std_logic_vector (31 downto 0);
          pc_load : in std_logic;
          pc_increment : in std_logic;
          clock : in std_logic;
          reset : in std_logic;
          addr_out : out std_logic_vector (31 downto 0));
  end component;
 
signal displacement: std_logic_vector (31 downto 0);
signal pc_load: std_logic;
signal pc_increment: std_logic;
signal clock: std_logic;
signal reset: std_logic;
signal addr_out: std_logic_vector (31 downto 0);
  constant delay: time := 485 ns;
  signal stop_the_clock: boolean;
begin
 uut: PC port map ( displacement => displacement,
                    pc_load  => pc_load,
                    pc_increment => pc_increment,
                    clock => clock,
                    reset => reset,
                    addr_out => addr_out);

  stimulus: process
  begin

  clock <= '0';
  wait for delay;
  
  --initialize inputs
  displacement <= "00000000000000000000000000000000";
  pc_load <= '0';
  pc_increment <= '0';
  reset <= '1';

  clock <= '1';
  wait for delay; 
  
  reset <= '0'; --back to normal
  
  clock <= '0';
  wait for delay;
   
  pc_load <= '0';
  pc_increment <= '1';
   
  clock <= '1';
  wait for delay;  --at this point, we incremented PC, so it does displacement + 1 = x"0" + x"1" =  x"1"
  
  clock <= '0';
  wait for delay;
  
  displacement <= x"000000ff";
  pc_load <= '1';
  pc_increment <= '0';
  
  clock <= '1';
  wait for delay; --at this point, we loaded with the PC, so it does displacement + current address = x"1" + x"ff" = x"100"

  clock <= '0';
  wait for delay;
   
  pc_load <= '0';
  pc_increment <= '1'; 
   
  clock <= '1';
  wait for delay; --at this point, we incremented PC, so it does previous displacement + 1 = x"100" + x"1" = x"101"

  clock <= '0';
  wait for delay;
   
  displacement <= x"0000ffff";
  pc_load <= '1';
  pc_increment <= '0';
  
  clock <= '1';
  wait for delay; --at this point, we loaded PC, so it does displacement + current address = x"101" + x"0000ffff" = x"10100"

  clock <= '0';
  wait for delay;
   
  pc_load <= '0';
  pc_increment <= '0';
  
  clock <= '1';
  wait for delay; --at this point, we simply continue to output the same output since PL and PI are both 0 (output: x"10100")

  clock <= '0';
  wait for delay;
   
  reset <= '1';
  
  clock <= '1';
  wait for delay; --at this point, the program should output 0's, since reset = 1.
  wait;
  end process;
end Behavioral;
