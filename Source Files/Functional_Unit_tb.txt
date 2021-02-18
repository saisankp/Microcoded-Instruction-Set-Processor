----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/20/2020
-- Design Name: Functional Unit testbench
-- Module Name: Functional_Unit_tb - Behavioral
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

entity Functional_Unit_tb is
end Functional_Unit_tb;

architecture Behavioral of Functional_Unit_tb is
 
 -- Component Declaration for the Unit Under Test (UUT)
    
    component Functional_Unit
    Port ( A : in std_logic_vector (31 downto 0);
           B : in std_logic_vector (31 downto 0);
           FS : in std_logic_vector (4 downto 0);
           V : out std_logic;
           C : out std_logic;
           N : out std_logic;
           Z : out std_logic;
           F : out std_logic_vector (31 downto 0));
end component;

   -- Inputs to test with
   signal A_signal : std_logic_vector (31 downto 0) := (others => '0');
   signal B_signal : std_logic_vector (31 downto 0) := (others => '0');
   signal FS_signal : std_logic_vector (4 downto 0) := (others => '0');
 
 	-- Outputs to see if the functional unit works
   signal V_signal : std_logic;
   signal C_signal : std_logic;
   signal N_signal : std_logic;
   signal Z_signal : std_logic;
   signal F_signal : std_logic_vector(31 downto 0);
   
   --Constants to make the time periods for each operation easier to pass.
   constant Clk_period_For_Arithmetic : time := 485 ns;
   constant Clk_period_For_Logic : time := 5 ns;
   constant Clk_period_For_Shifting : time := 5 ns;
   
begin

	-- Instantiate the Unit Under Test (UUT)
   uut: Functional_Unit PORT MAP (
          A => A_signal,
          B => B_signal,
          FS => FS_signal,
          V => V_signal,
          C => C_signal,
          N => N_signal,
          Z => Z_signal,
          F => F_signal
        );

-- begin process
stim_proc : process
begin
wait for Clk_period_For_Arithmetic;
A_signal <= "11111111111111111111111111111111";
B_signal <= "11111111111111111111111111111111";

-- First let's test the arithmetic operations..

--output should have A (FFFFFFFF)
--flags that are set should be: N = 1
FS_signal <= "00000";
wait for Clk_period_For_Arithmetic;
   
A_signal <= "01111111111111111111111111111111"; 

--output should have A + 1 (0x80000000 in hex with an overflow)
--flags that are set should be: V = 1 , N = 1
FS_signal <= "00001";
wait for Clk_period_For_Arithmetic;

 A_signal <= "00000000000000000000000000000001"; 
 B_signal <= "01111111111111111111111111111111";

--output should be A + B (0x80000000 in hex with an overflow again)
--flags that are set should be: v = 1, N = 1
FS_signal <= "00010";
wait for Clk_period_For_Arithmetic;

A_signal <= "11111111111111111111111111111111";
B_signal <= "00000000000000000000000000000000";

--output should be A + B + 1 (i.e. 00000000 in hex with the carry out flag set)
--flags that are set should be: C = 1, Z = 1
FS_signal <= "00011";
wait for Clk_period_For_Arithmetic;

A_signal <= "11111111111111111111111111111111";
B_signal <= "00000000000000000000000000000000";

--output should be A + !B (FFFFFFFE with a carry out of 1)
--flags that are set should be: C = 1, N = 1
FS_signal <= "00100";
wait for Clk_period_For_Arithmetic;

A_signal <= "11111111111111111111111111111111";
B_signal <= "00000000000000000000000000000000";

--output should be A + !B + 1 (FFFFFFFF with the carry flag being set)
--flags that are set should be: C = 1, N = 1
FS_signal <= "00101";
wait for Clk_period_For_Arithmetic;

A_signal <= "00000000000000000000000000000000";

--output should be A - 1 (-1 i.e. FFFFFFFF in 2's complement with no flags being set.)
--flags that are set should be: N = 1
FS_signal <= "00110";
wait for Clk_period_For_Arithmetic;

A_signal <= "00000000000000000000000000000000";

--output should be A (00000000, with the C flag being set because Carry in = 1.)
--flags that are set should be: C = 1, Z = 1
FS_signal <= "00111";
wait for Clk_period_For_Arithmetic;
-- If the F signal corresponds appropriately to the operations above, and the flags are set according to the
-- comments above, then the Arithmetic Unit is working properly.

wait for Clk_period_For_Arithmetic;


-- Now let's test the logical unit
wait for Clk_period_For_Logic;
A_signal <= "00000000000000000000000000000100"; --value of 4 in binary
B_signal <= "00000000000000000000000000000101"; --value of 5 in binary

--output should be A & B (4 in decimal)
FS_signal <= "01000";
wait for Clk_period_For_Logic;

--output should be A | B (5 in decimal)
FS_signal <= "01010";
wait for Clk_period_For_Logic;

--output should be A ^ B (1 in decimal)
FS_signal <= "01100";
wait for Clk_period_For_Logic;

--output should be !A (0xFFFFFFFB in hex)
FS_signal <= "01110";
wait for Clk_period_For_Logic;

--if the output is the same as the comments above, then the logical unit is working.
wait for Clk_period_For_Logic;
wait for Clk_period_For_Logic;

--Therefore, so far, we have proven that the Arithemtic and Logical Unit work, therefore the ALU works.

--Finally, Lets test the shifting operations to conclude the functional unit.

wait for Clk_period_For_Shifting;

B_signal <= "00000000000000000000000000000101"; -- the value of 5 in decimal

--output should be B (i.e. 5)
FS_signal <= "10000";
wait for Clk_period_For_Shifting;


--output should be srB (i.e. shift right) = 10 (2 in decimal)
FS_signal <= "10100";
wait for Clk_period_For_Shifting;


--output should be slB (i.e. shift left) = 1010 (0x0000000a in hex).
FS_signal <= "11000";
wait for Clk_period_For_Shifting;

-- F = slB
-- result = 10

wait for Clk_period_For_Shifting;

--if all the shift operations are correctly mapped to the output, then the shifter works.

--Now we have tested all components of the functional unit -> The ALU + shifter.
--and that the V, C, N, Z Flags are set appropriately for the ALU's output.
 
wait;
end process; 

end Behavioral;
