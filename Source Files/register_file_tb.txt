----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 10/26/2020 01:59:42 PM
-- Design Name: register file testbench
-- Module Name: register_file_tb - Behavioral
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

entity register_file_tb is
end register_file_tb;

architecture Behavioral of register_file_tb is

    -- Component declaration for the Unit under test (UUT)
    component register_file 
    port(  
           D_Address: in std_logic_vector (4 downto 0);
           A_Select: in std_logic_vector (4 downto 0);
           B_Select: in std_logic_vector (4 downto 0);
           TD : in STD_LOGIC;
		   TA : in STD_LOGIC;
		   TB : in STD_LOGIC;
           enable: in std_logic;
           reset: in std_logic;
           Clk: in std_logic;
           input_data : in std_logic_vector(31 downto 0);
           reg0:  out std_logic_vector(31 downto 0);
           reg1:  out std_logic_vector(31 downto 0);
           reg2:  out std_logic_vector(31 downto 0);
           reg3:  out std_logic_vector(31 downto 0);
           reg4:  out std_logic_vector(31 downto 0);
           reg5:  out std_logic_vector(31 downto 0);
           reg6:  out std_logic_vector(31 downto 0);
           reg7:  out std_logic_vector(31 downto 0);
           reg8:  out std_logic_vector(31 downto 0);
           reg9:  out std_logic_vector(31 downto 0);
           reg10:  out std_logic_vector(31 downto 0);
           reg11:  out std_logic_vector(31 downto 0);
           reg12:  out std_logic_vector(31 downto 0);
           reg13:  out std_logic_vector(31 downto 0);
           reg14:  out std_logic_vector(31 downto 0);
           reg15:  out std_logic_vector(31 downto 0);
           reg16:  out std_logic_vector(31 downto 0);
           reg17:  out std_logic_vector(31 downto 0);
           reg18:  out std_logic_vector(31 downto 0);
           reg19:  out std_logic_vector(31 downto 0);
           reg20:  out std_logic_vector(31 downto 0);
           reg21:  out std_logic_vector(31 downto 0);
           reg22:  out std_logic_vector(31 downto 0);
           reg23:  out std_logic_vector(31 downto 0);
           reg24:  out std_logic_vector(31 downto 0);
           reg25:  out std_logic_vector(31 downto 0);
           reg26:  out std_logic_vector(31 downto 0);
           reg27:  out std_logic_vector(31 downto 0);
           reg28:  out std_logic_vector(31 downto 0);
           reg29:  out std_logic_vector(31 downto 0);
           reg30:  out std_logic_vector(31 downto 0);
           reg31:  out std_logic_vector(31 downto 0);
           reg32temp:  out std_logic_vector(31 downto 0);
           OutputA : out std_logic_vector(31 downto 0);
           OutputB : out std_logic_vector(31 downto 0));
     end component;
     
      -- Inputs to test the register file
      signal A_Select : std_logic_vector (4 downto 0) := "00000";
      signal B_Select : std_logic_vector (4 downto 0) := "00000";
      signal D_Address : std_logic_vector (4 downto 0);
      signal reset : std_logic := '0';
      signal TD : std_logic := '0';
      signal TA : std_logic := '0';
      signal TB : std_logic := '0';
      signal enable : std_logic := '0';
      signal Clk : std_logic := '0';
      signal input_data : std_logic_vector(31 downto 0) := (others => '0');

      
      -- Outputs to see if the register file is working properly
      signal reg0 : std_logic_vector(31 downto 0);
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
      signal OutputA : std_logic_vector(31 downto 0);
      signal OutputB : std_logic_vector(31 downto 0);
      
      --time constants so that we can leave enough time for each operation to happen.
      constant Clk_period_For_Register_File: time := 10ns;
      constant Clk_period_For_MUX : time := 5ns;
      
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: register_file port map(
         A_Select => A_Select,
         B_Select => B_Select,
         D_Address => D_Address,
         TD => TD,
	     TA => TA,
	     TB => TB,
         enable => enable,
         reset => reset,
         Clk => Clk,
         input_data => input_data,
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
         reg32temp => reg32,
         OutputA => OutputA,
         OutputB => OutputB);
         
stim_proc: process
    begin
     -- hold reset state, which should set all registers to 0!
		Clk <= '0';
		reset <= '1';
		wait for Clk_period_For_Register_File;
		Clk <= '1';
		wait for Clk_period_For_Register_File;
		Clk <= '0';
		wait for Clk_period_For_Register_File;
		Clk <= '1';
		
		--now, let's set the reset to 0, and then test the register file!
		wait for 100 ns;
		reset <= '0';
		enable <= '1';
		Clk <= '0';
	    input_data <= "00000001001001101011010111001011";
	    D_Address <= "00000";
	    TD <= '0';
	  
	    wait for Clk_period_For_Register_File;
        Clk <= '1';
        wait for Clk_period_For_Register_File;
        Clk <= '0';
        
      D_Address <= "00001";
      input_data <= "00000001001001101011010111001010";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
     
      D_Address <= "00010";
      input_data <= "00000001001001101011010111001001";
     
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "00011";
      input_data <= "00000001001001101011010111001000";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "00100";
      input_data <= "00000001001001101011010111000111";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "00101";
      input_data <= "00000001001001101011010111000110";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "00110";
      input_data <= "00000001001001101011010111000101";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "00111";
      input_data <= "00000001001001101011010111000100";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "01000";
      input_data <= "00000001001001101011010111000011";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "01001";
      input_data <= "00000001001001101011010111000010";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "01010";
      input_data <= "00000001001001101011010111000001";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "01011";                      
      input_data <= "00000001001001101011010111000000";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "01100";                      
      input_data <= "00000001001001101011010110111111";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "01101";                      
      input_data <= "00000001001001101011010110111110";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "01110";                      
      input_data <= "00000001001001101011010110111101";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "01111";                      
      input_data <= "00000001001001101011010110111100";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "10000";                      
      input_data <= "00000001001001101011010110111011";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "10001";                      
      input_data <= "00000001001001101011010110111010";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "10010";                      
      input_data <= "00000001001001101011010110111001";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "10011";                      
      input_data <= "00000001001001101011010110111000";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "10100";                      
      input_data <= "00000001001001101011010110110111";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "10101";                      
      input_data <= "00000001001001101011010110110110";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "10110";                      
      input_data <= "00000001001001101011010110110101";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "10111";                      
      input_data <= "00000001001001101011010110110100";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "11000";                      
      input_data <= "00000001001001101011010110110011";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "11001";                      
      input_data <= "00000001001001101011010110110010";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "11010";                      
      input_data <= "00000001001001101011010110110001";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "11011";                      
      input_data <= "00000001001001101011010110110000";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "11100";                      
      input_data <= "00000001001001101011010110101111";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "11101";                      
      input_data <= "00000001001001101011010110101110";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "11110";                      
      input_data <= "00000001001001101011010110101101";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      D_Address <= "11111";                      
      input_data <= "00000001001001101011010110101100";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      TD <= '1';                     
      input_data <= "00000001001001101011010110101011";
      
      wait for Clk_period_For_Register_File;
      Clk <= '1';
      wait for Clk_period_For_Register_File;
      Clk <= '0';
      
      
      --Now all the registers are loaded, now show that A_Select and B_Select can be changed appropriately to output
      --different values in OutputA (i.e. A_Data) and OutputB (i.e. B_Data_Before_Mux)
   
      --First, the A_Select
      A_Select <= "00000";
      wait for Clk_period_For_MUX;
      A_Select <= "00001";
      wait for Clk_period_For_MUX;
      A_Select <= "00010";
      wait for Clk_period_For_MUX;
      A_Select <= "00011";
      wait for Clk_period_For_MUX;
      A_Select <= "00100";
      wait for Clk_period_For_MUX;
      A_Select <= "00101";
      wait for Clk_period_For_MUX;
      A_Select <= "00110";
      wait for Clk_period_For_MUX;
      A_Select <= "00111";
      wait for Clk_period_For_MUX;
      A_Select <= "01000";
      wait for Clk_period_For_MUX;
      A_Select <= "01001";
      wait for Clk_period_For_MUX;
      A_Select <= "01010";
      wait for Clk_period_For_MUX;
      A_Select <= "01011";
      wait for Clk_period_For_MUX;
      A_Select <= "01100";
      wait for Clk_period_For_MUX;
      A_Select <= "01101";
      wait for Clk_period_For_MUX;
      A_Select <= "01110";
      wait for Clk_period_For_MUX;
      A_Select <= "01111";
      wait for Clk_period_For_MUX;
      A_Select <= "10000";
      wait for Clk_period_For_MUX;
      A_Select <= "10001";
      wait for Clk_period_For_MUX;
      A_Select <= "10010";
      wait for Clk_period_For_MUX;
      A_Select <= "10011";
      wait for Clk_period_For_MUX;
      A_Select <= "10100";
      wait for Clk_period_For_MUX;
      A_Select <= "10101";
      wait for Clk_period_For_MUX;
      A_Select <= "10110";
      wait for Clk_period_For_MUX;
      A_Select <= "10111";
      wait for Clk_period_For_MUX;
      A_Select <= "11000";
      wait for Clk_period_For_MUX;
      A_Select <= "11001";
      wait for Clk_period_For_MUX;
      A_Select <= "11010";
      wait for Clk_period_For_MUX;
      A_Select <= "11011";
      wait for Clk_period_For_MUX;
      A_Select <= "11100";
      wait for Clk_period_For_MUX;
      A_Select <= "11101";
      wait for Clk_period_For_MUX;
      A_Select <= "11110";
      wait for Clk_period_For_MUX;
      A_Select <= "11111";
      wait for Clk_period_For_MUX;
      TA <= '1';
      wait for Clk_period_For_MUX;
      
      
      --Now the B_Select
      B_Select <= "00000";
      wait for Clk_period_For_MUX;
      B_Select <= "00001";
      wait for Clk_period_For_MUX;
      B_Select <= "00010";
      wait for Clk_period_For_MUX;
      B_Select <= "00011";
      wait for Clk_period_For_MUX;
      B_Select <= "00100";
      wait for Clk_period_For_MUX;
      B_Select <= "00101";
      wait for Clk_period_For_MUX;
      B_Select <= "00110";
      wait for Clk_period_For_MUX;
      B_Select <= "00111";
      wait for Clk_period_For_MUX;
      B_Select <= "01000";
      wait for Clk_period_For_MUX;
      B_Select <= "01001";
      wait for Clk_period_For_MUX;
      B_Select <= "01010";
      wait for Clk_period_For_MUX;
      B_Select <= "01011";
      wait for Clk_period_For_MUX;
      B_Select <= "01100";
      wait for Clk_period_For_MUX;
      B_Select <= "01101";
      wait for Clk_period_For_MUX;
      B_Select <= "01110";
      wait for Clk_period_For_MUX;
      B_Select <= "01111";
      wait for Clk_period_For_MUX;
      B_Select <= "10000";
      wait for Clk_period_For_MUX;
      B_Select <= "10001";
      wait for Clk_period_For_MUX;
      B_Select <= "10010";
      wait for Clk_period_For_MUX;
      B_Select <= "10011";
      wait for Clk_period_For_MUX;
      B_Select <= "10100";
      wait for Clk_period_For_MUX;
      B_Select <= "10101";
      wait for Clk_period_For_MUX;
      B_Select <= "10110";
      wait for Clk_period_For_MUX;
      B_Select <= "10111";
      wait for Clk_period_For_MUX;
      B_Select <= "11000";
      wait for Clk_period_For_MUX;
      B_Select <= "11001";
      wait for Clk_period_For_MUX;
      B_Select <= "11010";
      wait for Clk_period_For_MUX;
      B_Select <= "11011";
      wait for Clk_period_For_MUX;
      B_Select <= "11100";
      wait for Clk_period_For_MUX;
      B_Select <= "11101";
      wait for Clk_period_For_MUX;
      B_Select <= "11110";
      wait for Clk_period_For_MUX;
      B_Select <= "11111";
      wait for Clk_period_For_MUX;
      TB <= '1';
      wait for Clk_period_For_MUX;
      
      --Now the register file has been tested appropriately.
    end process;
end Behavioral;

  
