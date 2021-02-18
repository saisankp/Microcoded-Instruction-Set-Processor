----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 11/21/2020
-- Design Name: data path testbench
-- Module Name: dataPath_tb - Behavioral
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

entity dataPath_tb is
end dataPath_tb;

architecture Behavioral of dataPath_tb is
-- Component Declaration for the Unit Under Test (UUT)

   component dataPath
 Port (Enable: in std_logic; --enable that goes into the AND gate
       A_Select : in std_logic_vector (4 downto 0); --select for mux A
       B_Select: in std_logic_vector (4 downto 0); --select for mux B 
       D_Address: in std_logic_vector (4 downto 0); --select for the 5 to 32 decoder
       Constant_in: in std_logic_vector (31 downto 0); --this goes in the mux which takes in B data
       MB_select: in std_logic; --this is the select for the mux which takes in B data
       MD_select: in std_logic;  --the select for the mux which takes in F from the functional unit.
       FS: in std_logic_vector (4 downto 0); --the select for the functional unit.
       Data_in: in std_logic_vector (31 downto 0); -- goes into the mux which takes in F from the functional unit. 
       Clk: in std_logic; --the clock signal for the register file.
       reset: in std_logic;
        --TD, TA, TB (each 1 bit).
       TD : in STD_LOGIC;
       TA : in STD_LOGIC;
       TB : in STD_LOGIC;
       
        --Now, the flags from the functional unit.
       V: out std_logic;
       C: out std_logic;
       N: out std_logic;
       Z: out std_logic;
       Address_out: out std_logic_vector (31 downto 0);
       Data_out: out std_logic_vector (31 downto 0); --data out from Bus B.);
           
       --things that are not essential but added so we can see how the datapath works under the hood.
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
       reg32:  out std_logic_vector(31 downto 0);
       OutputA : out std_logic_vector(31 downto 0);
       OutputB : out std_logic_vector(31 downto 0);
       F_Out : out std_logic_vector(31 downto 0));                                        
   end component;

--signals to test our data path
signal Enable : std_logic;
signal A_select : std_logic_vector (4 downto 0);
signal B_select : std_logic_vector (4 downto 0);
signal D_Address : std_logic_vector (4 downto 0);
signal Constant_in : std_logic_vector (31 downto 0);
signal MB_select : std_logic;
signal MD_select : std_logic;
signal FS : std_logic_vector (4 downto 0);
signal Data_in : std_logic_vector (31 downto 0);

signal reset: std_logic;
signal TD : std_logic := '0';
signal TA : std_logic := '0';
signal TB : std_logic := '0';


signal V : std_logic;    
signal C : std_logic;
signal N : std_logic;  
signal Z : std_logic; 
signal Clk : std_logic; 
signal Address_out : std_logic_vector (31 downto 0);
signal Data_out : std_logic_vector (31 downto 0);


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
signal F_Signal : std_logic_vector(31 downto 0);


--time periods so we can allow just the correct time for each operation to happen.
constant Clk_period_For_Arithmetic : time := 480 ns;
constant Clk_period_For_Register_File : time := 10 ns;
constant Clk_period_For_Logic : time := 5 ns;

begin

-- Instantiate the Unit Under Test (UUT)

uut: dataPath port map (
Enable => Enable,
A_select => A_select,
B_select => B_select,
D_Address => D_Address,
Constant_in => Constant_in,
MB_select => MB_select,
MD_select => MD_select, 
FS => FS,
Data_in => Data_in,
Clk => Clk,
reset => reset,
TD => TD,
TA => TA,
TB => TB,
V => V,
C => C,
N => N, 
Z => Z,
Address_Out => Address_Out,
Data_out => Data_out,
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
OutputA => OutputA,
OutputB => OutputB,
F_Out => F_Signal
);


stim_proc : process
begin

--checklist for the datapath testbench

-- 1. Load all 32 registers with values - This shows that the registers can be loaded.
-- 2. Finally, use all combinations of FS to show that the functional unit can perform :
-- 2(a) transfers with arithmetic operations with the arithmetic unit.
-- 2(b) transfers with logical operations with the logical unit.
-- 2(c) transfers with shift operations with the shifter.

-- If we can prove all these 3 steps, we can conclude that the datapath works.

--Part 1: Load all 32 registers with values.

--Let's load R0 - R5 with meaningful values, so that we can test the flags for the arithetic operations.
--However, let's load R6-R31 with arbitrary values. 
--We shall transfer the results of the operations from the functional unit into R6-R20 to show that data transfers work.

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

enable <= '1';
MD_Select <= '1';

A_Select <= "00000";
B_Select <= "00000";
MB_Select <= '0';

D_Address <= "00000";
Data_in <= "11111111111111111111111111111111";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "00001";
Data_in <= "00000000000000000000000000000000";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "00010";
Data_in <= "01111111111111111111111111111111";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "00011";
Data_in <= "00000000000000000000000000000001";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "00100";
Data_in <= "00000000000000000000000000000100";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "00101";
Data_in <= "00000000000000000000000000000101";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "00110";
Data_in <= "00000000000000000000000000000110";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "00111";
Data_in <= "00000000000000000000000000000111";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "01000";
Data_in <= "00000000000000000000000000001000";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "01001";
Data_in <= "00000000000000000000000000001001";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "01010";
Data_in <= "00000000000000000000000000001010";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "01011";
Data_in <= "00000000000000000000000000001011";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "01100";
Data_in <= "00000000000000000000000000001100";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "01101";
Data_in <= "00000000000000000000000000001101";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "01110";
Data_in <= "00000000000000000000000000001110";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "01111";
Data_in <= "00000000000000000000000000001111";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "10000";
Data_in <= "00000000000000000000000000010000";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "10001";
Data_in <= "00000000000000000000000000010001";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "10010";
Data_in <= "00000000000000000000000000010010";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "10011";
Data_in <= "00000000000000000000000000010011";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "10100";
Data_in <= "00000000000000000000000000010100";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "10101";
Data_in <= "00000000000000000000000000010101";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "10110";
Data_in <= "00000000000000000000000000010110";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "10111";
Data_in <= "00000000000000000000000000010111";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "11000";
Data_in <= "00000000000000000000000000011000";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "11001";
Data_in <= "00000000000000000000000000011001";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "11010";
Data_in <= "00000000000000000000000000011010";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "11011";
Data_in <= "00000000000000000000000000011011";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "11100";
Data_in <= "00000000000000000000000000011100";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "11101";
Data_in <= "00000000000000000000000000011101";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "11110";
Data_in <= "00000000000000000000000000011110";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

D_Address <= "11111";
Data_in <= "00000000000000000000000000011111";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

TD <= '1';
Data_in <= "00000000000000000000000000100000";

wait for Clk_period_For_Register_File;
Clk <= '1';
wait for Clk_period_For_Register_File;
Clk <= '0';

wait for Clk_period_For_Register_File;
Clk <= '1';
TD <= '0';
A_Select <= "00000";
B_Select <= "00000";

wait for Clk_period_For_Register_File;
Clk <= '0';

MD_Select <= '0';

--Now, test the FS combinations:


-- part 2(a) transfers with arithmetic operations with the arithmetic unit.
-- A Data and B Data are currently outputting the contents of R0 (i.e. FFFFFFFF). 
FS <= "00000";  --F = A 
D_Address <= "00110"; -- store A (i.e. FFFFFFFF) into R6, with N = 1

wait for Clk_period_For_Arithmetic;
Clk <= '1';

A_Select <= "00010"; -- A = R2 = 7FFFFFFF

wait for Clk_period_For_Register_File;
Clk <= '0';

MD_Select <= '0';
FS <= "00001";  --F = A + 1
D_Address <= "00111"; -- store the result 80000000 into R7, with V = 1 and N = 1

wait for Clk_period_For_Arithmetic;
Clk <= '1';

A_Select <= "00011"; -- A = R3 = 00000001
B_Select <= "00010"; -- B = R2 = 7FFFFFFF

wait for Clk_period_For_Register_File;
Clk <= '0';
FS <= "00010";  --F = A + B
D_Address <= "01000"; -- store the result 80000000 into R8, with V = 1 and N = 1

wait for Clk_period_For_Arithmetic;
Clk <= '1';

A_Select <= "00000"; -- A = R0 = FFFFFFFF
B_Select <= "00001"; -- B = R1 = 00000000

wait for Clk_period_For_Register_File;
Clk <= '0';
FS <= "00011";  --F = A + B + 1
D_Address <= "01001"; -- store the result 00000000 into R9, with C = 1 and Z = 1

wait for Clk_period_For_Arithmetic;
Clk <= '1';

A_Select <= "00000"; -- A = R0 = FFFFFFFF
B_Select <= "00001"; -- B = R1 = 00000000

wait for Clk_period_For_Register_File;
Clk <= '0';
FS <= "00100";  --F = A + !B
D_Address <= "01010"; -- store the result FFFFFFFE into R10, with C = 1 and N = 1

wait for Clk_period_For_Arithmetic;
Clk <= '1';

A_Select <= "00000"; -- A = R0 = FFFFFFFF
B_Select <= "00001"; -- B = R1 = 00000000

wait for Clk_period_For_Register_File;
Clk <= '0';
FS <= "00101";  --F = A + !B + 1
D_Address <= "01011"; -- store the result FFFFFFFF into R11, with C = 1 and N  = 1

wait for Clk_period_For_Arithmetic;
Clk <= '1';

A_Select <= "00001"; -- A = R1 =  00000000
B_Select <= "00001"; -- B = R1 = 00000000

wait for Clk_period_For_Register_File;
Clk <= '0';
FS <= "00110";  --F = A - 1
D_Address <= "01100"; -- store the result FFFFFFFF into R12, with no flags set.

wait for Clk_period_For_Arithmetic;
Clk <= '1';

A_Select <= "00001"; -- A = R1 = 00000000
B_Select <= "00001"; -- B = R1 = 00000000

wait for Clk_period_For_Register_File;
Clk <= '0';
FS <= "00111";  --F = A 
D_Address <= "01101"; -- store A (i.e. 00000000) into R13, with Z = 1

wait for Clk_period_For_Arithmetic;
Clk <= '1';


-- 2(b) transfers with logical operations with the logical unit.

A_Select <= "00100"; -- A = R4 = 4
B_Select <= "00101"; -- B = R5 = 5

wait for Clk_period_For_Register_File;

Clk <= '0';
FS <= "01000";  --F = A AND B
D_Address <= "01110"; -- store the result 4 into R14

wait for Clk_period_For_Arithmetic;
Clk <= '1';

A_Select <= "00100"; -- A = R4 = 4
B_Select <= "00101"; -- B = R5 = 5

wait for Clk_period_For_Register_File;
Clk <= '0';
FS <= "01010";  --F = A OR B
D_Address <= "01111"; -- store the result 5 into R15

wait for Clk_period_For_Arithmetic;
Clk <= '1';

A_Select <= "00100"; -- A = R4 = 4
B_Select <= "00101"; -- B = R5 = 5

wait for Clk_period_For_Register_File;
Clk <= '0';
FS <= "01100";  --F = A XOR B
D_Address <= "10000"; -- store the result 1 into R16

wait for Clk_period_For_Arithmetic;
Clk <= '1';

A_Select <= "00100"; -- A = R4 = 4
B_Select <= "00101"; -- B = R5 = 5

wait for Clk_period_For_Register_File;
Clk <= '0';
FS <= "01110";  --F = !A
D_Address <= "10001"; -- store the result FFFFFFFB into R17.

wait for Clk_period_For_Arithmetic;
Clk <= '1';


-- part 2(c) transfers with shift operations with the shifter.

A_Select <= "00100"; -- A = R4 = 4
B_Select <= "00101"; -- B = R5 = 5

wait for Clk_period_For_Register_File;
Clk <= '0';
FS <= "10000";  --F = B
D_Address <= "10010"; -- store the result 5 int R18

wait for Clk_period_For_Arithmetic;
Clk <= '1';

A_Select <= "00100"; -- A = R4 = 4
B_Select <= "00101"; -- B = R5 = 5

wait for Clk_period_For_Register_File;
Clk <= '0';
FS <= "10100";  --F = srB
D_Address <= "10011"; -- store the result 2 into R19.

wait for Clk_period_For_Arithmetic;
Clk <= '1';

A_Select <= "00100"; -- A = R4 = 4
B_Select <= "00101"; -- B = R5 = 5

wait for Clk_period_For_Register_File;
Clk <= '0';
FS <= "11000";  --F = srB
D_Address <= "10100"; -- store the result 0000000A into R20.

wait for Clk_period_For_Arithmetic;
Clk <= '1';


--We have shown that the register file works in part 1.
--We have shown that the functional unit, MUX B, and MUX D work in part 2.

--Hence, we have proven that the datapath works.


--added wait; at the end so the simulation looks cleaner
wait;
end process;
end Behavioral;
