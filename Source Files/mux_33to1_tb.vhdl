----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 10/25/2020 10:50:24 PM
-- Design Name: 33 to 1 multiplexer
-- Module Name: mux_33to1_tb - Behavioral
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

entity mux_33to1_tb is
end mux_33to1_tb;

architecture Behavioral of mux_33to1_tb is

     -- Component declaration for the Unit under test (UUT)
     component mux_33to1
     port (S : in std_logic_vector(5 downto 0);
         reg0: in std_logic_vector(31 downto 0);
         reg1: in std_logic_vector(31 downto 0);
         reg2: in std_logic_vector(31 downto 0);
         reg3: in std_logic_vector(31 downto 0);
         reg4: in std_logic_vector(31 downto 0);
         reg5: in std_logic_vector(31 downto 0);
         reg6: in std_logic_vector(31 downto 0);
         reg7: in std_logic_vector(31 downto 0);
         reg8: in std_logic_vector(31 downto 0);
         reg9: in std_logic_vector(31 downto 0);
         reg10: in std_logic_vector(31 downto 0);
         reg11: in std_logic_vector(31 downto 0);
         reg12: in std_logic_vector(31 downto 0);
         reg13: in std_logic_vector(31 downto 0);
         reg14: in std_logic_vector(31 downto 0);
         reg15: in std_logic_vector(31 downto 0);
         reg16: in std_logic_vector(31 downto 0);
         reg17: in std_logic_vector(31 downto 0);
         reg18: in std_logic_vector(31 downto 0);
         reg19: in std_logic_vector(31 downto 0);
         reg20: in std_logic_vector(31 downto 0);
         reg21: in std_logic_vector(31 downto 0);
         reg22: in std_logic_vector(31 downto 0);
         reg23: in std_logic_vector(31 downto 0);
         reg24: in std_logic_vector(31 downto 0);
         reg25: in std_logic_vector(31 downto 0);
         reg26: in std_logic_vector(31 downto 0);
         reg27: in std_logic_vector(31 downto 0);
         reg28: in std_logic_vector(31 downto 0);
         reg29: in std_logic_vector(31 downto 0);
         reg30: in std_logic_vector(31 downto 0);
         reg31: in std_logic_vector(31 downto 0);
         reg32: in std_logic_vector(31 downto 0);
         Out1: out std_logic_vector(31 downto 0));
     end component;

    -- Inputs
    signal reg0 : std_logic_vector(31 downto 0) := (others => '0');
    signal reg1 : std_logic_vector(31 downto 0);
    signal reg2 : std_logic_vector(31 downto 0);
    signal reg3 : std_logic_vector(31 downto 0);
    signal reg4 : std_logic_vector(31 downto 0);
    signal reg5 : std_logic_vector(31 downto 0);
    signal reg6 : std_logic_vector(31 downto 0);
    signal reg7 : std_logic_vector(31 downto 0);
    signal reg8 : std_logic_vector(31 downto 0);
    signal reg9 : std_logic_vector(31 downto 0);
    signal reg10 : std_logic_vector(31 downto 0);
    signal reg11 : std_logic_vector(31 downto 0);
    signal reg12 : std_logic_vector(31 downto 0);
    signal reg13 : std_logic_vector(31 downto 0);
    signal reg14 : std_logic_vector(31 downto 0);
    signal reg15 : std_logic_vector(31 downto 0);
    signal reg16 : std_logic_vector(31 downto 0);
    signal reg17 : std_logic_vector(31 downto 0);
    signal reg18 : std_logic_vector(31 downto 0);
    signal reg19 : std_logic_vector(31 downto 0);
    signal reg20 : std_logic_vector(31 downto 0);
    signal reg21 : std_logic_vector(31 downto 0);
    signal reg22 : std_logic_vector(31 downto 0);
    signal reg23 : std_logic_vector(31 downto 0);
    signal reg24 : std_logic_vector(31 downto 0);
    signal reg25 : std_logic_vector(31 downto 0);
    signal reg26 : std_logic_vector(31 downto 0);
    signal reg27 : std_logic_vector(31 downto 0);
    signal reg28 : std_logic_vector(31 downto 0);
    signal reg29 : std_logic_vector(31 downto 0);
    signal reg30 : std_logic_vector(31 downto 0);
    signal reg31 : std_logic_vector(31 downto 0);
    signal reg32 : std_logic_vector(31 downto 0);
    signal S : std_logic_vector(5 downto 0);
    
     -- Outputs
    signal Out1 : std_logic_vector(31 downto 0);
    
     -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant Clk_period : time := 5 ns;
begin
-- Instantiate the Unit Under Test (UUT)
uut: mux_33to1 port map (
  S => S,
  reg0 => reg0,
  reg1 => reg1,
  reg2 => reg2,
  reg3 => reg3,
  reg4 => reg4,
  reg5 => reg5,
  reg6 => reg6,
  reg7 => reg7,
  reg8 => reg8,
  reg9 => reg9,
  reg10 => reg10,
  reg11 => reg11,
  reg12 => reg12,
  reg13 => reg13,
  reg14 => reg14,
  reg15 => reg15,
  reg16 => reg16,
  reg17 => reg17,
  reg18 => reg18,
  reg19 => reg19,
  reg20 => reg20,
  reg21 => reg21,
  reg22 => reg22,
  reg23 => reg23,
  reg24 => reg24,
  reg25 => reg25,
  reg26 => reg26,
  reg27 => reg27,
  reg28 => reg28,
  reg29 => reg29,
  reg30 => reg30,
  reg31 => reg31,
  reg32 => reg32,
  Out1 => Out1
  );

     stim_proc: process
     begin
     -- Let's fill each register with it's register number in binary
     -- e.g. regx will contain x in binary
     reg0 <= "00000000000000000000000000000000";
     reg1 <= "00000000000000000000000000000001";
     reg2 <= "00000000000000000000000000000010";
     reg3 <= "00000000000000000000000000000011";
     reg4 <= "00000000000000000000000000000100";
     reg5 <= "00000000000000000000000000000101";
     reg6 <= "00000000000000000000000000000110";
     reg7 <= "00000000000000000000000000000111";
     reg8 <= "00000000000000000000000000001000";
     reg9 <= "00000000000000000000000000001001";
     reg10 <= "00000000000000000000000000001010";
     reg11 <= "00000000000000000000000000001011";
     reg12 <= "00000000000000000000000000001100";
     reg13 <= "00000000000000000000000000001101";
     reg14 <= "00000000000000000000000000001110";
     reg15 <= "00000000000000000000000000001111";
     reg16 <= "00000000000000000000000000010000";
     reg17 <= "00000000000000000000000000010001";
     reg18 <= "00000000000000000000000000010010";
     reg19 <= "00000000000000000000000000010011";
     reg20 <= "00000000000000000000000000010100";
     reg21 <= "00000000000000000000000000010101";
     reg22 <= "00000000000000000000000000010110";
     reg23 <= "00000000000000000000000000010111";
     reg24 <= "00000000000000000000000000011000";
     reg25 <= "00000000000000000000000000011001";
     reg26 <= "00000000000000000000000000011010";
     reg27 <= "00000000000000000000000000011011";
     reg28 <= "00000000000000000000000000011100";
     reg29 <= "00000000000000000000000000011101";
     reg30 <= "00000000000000000000000000011110";
     reg31 <= "00000000000000000000000000011111";
     reg32 <= "00000000000000000000000000100000";
     
     -- Now let's test these inputs for all possible cases of select!
     
     --Below the output should be reg0
     wait for 5ns; 
         s <= "000000";
         
     --Below the output should be reg1
     wait for 5ns; 
         s <= "000001"; 
         
     --Below the output should be reg2
     wait for 5ns; 
         s <= "000010"; 
     
     --Below the output should be reg3
     wait for 5ns; 
         s <= "000011"; 
     
     --Below the output should be reg4
     wait for 5ns; 
         s <= "000100"; 
      
     --Below the output should be reg5
     wait for 5ns; 
         s <= "000101";    
      
     --Below the output should be reg6
     wait for 5ns; 
         s <= "000110";    
         
     --Below the output should be reg7
     wait for 5ns; 
         s <= "000111";   
      
     --Below the output should be reg8
     wait for 5ns; 
         s <= "001000";
         
      --Below the output should be reg9
     wait for 5ns; 
         s <= "001001";     
         
     --Below the output should be reg10
     wait for 5ns; 
         s <= "001010"; 
     
     --Below the output should be reg11
     wait for 5ns; 
         s <= "001011";      
     
     --Below the output should be reg12
     wait for 5ns; 
         s <= "001100";   
     
      --Below the output should be reg13
     wait for 5ns; 
         s <= "001101";   
     
      --Below the output should be reg14
     wait for 5ns; 
         s <= "001110";  
     
      --Below the output should be reg15
     wait for 5ns; 
         s <= "001111";  
     
     --Below the output should be reg16
     wait for 5ns; 
         s <= "010000";  
     
      --Below the output should be reg17
     wait for 5ns; 
         s <= "010001"; 
         
      --Below the output should be reg18
     wait for 5ns; 
         s <= "010010";  
     
       --Below the output should be reg19
     wait for 5ns; 
         s <= "010011"; 
         
     --Below the output should be reg20
     wait for 5ns; 
         s <= "010100";         
         
     --Below the output should be reg21
     wait for 5ns; 
         s <= "010101"; 
         
     --Below the output should be reg22
     wait for 5ns; 
         s <= "010110";    
     
     --Below the output should be reg23
     wait for 5ns; 
         s <= "010111"; 
     
     --Below the output should be reg24
     wait for 5ns; 
         s <= "011000"; 
     
     --Below the output should be reg25
     wait for 5ns; 
         s <= "011001"; 
     
      --Below the output should be reg26
     wait for 5ns; 
         s <= "011010";
     
     --Below the output should be reg27
     wait for 5ns; 
         s <= "011011"; 
     
     --Below the output should be reg28
     wait for 5ns; 
         s <= "011100";  
     
     --Below the output should be reg29
     wait for 5ns; 
         s <= "011101"; 
     
     --Below the output should be reg30
     wait for 5ns; 
         s <= "011110";  
     
     --Below the output should be reg31
     wait for 5ns; 
         s <= "011111"; 
         
     --Below the output should be reg32 (temporary register)
     wait for 5ns; 
         s <= "100000"; 
         
     wait for 5ns;     
     end process;
end Behavioral;
