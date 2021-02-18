----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 01/03/2021 09:38:42 PM
-- Design Name: 
-- Module Name: Microprogrammed_control_tb - Behavioral
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

entity Microprogrammed_control_tb is
end Microprogrammed_control_tb;

architecture Behavioral of Microprogrammed_control_tb is
-- Component Declaration for the Unit Under Test (UUT)

component Microprogrammed_control
Port ( instruction_in : in  STD_LOGIC_VECTOR (31 downto 0);
		   reset : in STD_LOGIC;
           V : in  STD_LOGIC;
           C : in  STD_LOGIC;
           N : in  STD_LOGIC;
           Z : in  STD_LOGIC;
			  Clk : in STD_LOGIC;
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0);
           DR : out  STD_LOGIC_VECTOR (4 downto 0);
           SA : out  STD_LOGIC_VECTOR (4 downto 0);
           SB : out  STD_LOGIC_VECTOR (4 downto 0);
           TD : out  STD_LOGIC;
           TA : out  STD_LOGIC;
           TB : out  STD_LOGIC;
           MB : out  STD_LOGIC;
           FS : out  STD_LOGIC_VECTOR (4 downto 0);
           MD : out  STD_LOGIC;
           RW : out  STD_LOGIC;
           MM : out  STD_LOGIC;
           MW : out  STD_LOGIC;
           RV : out  STD_LOGIC;
           RC : out  STD_LOGIC;
           RN : out  STD_LOGIC;
           RZ : out  STD_LOGIC;
           FL : out  STD_LOGIC);
end component;


   --Inputs
   signal instruction_in : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal V : std_logic := '0';
   signal C : std_logic := '0';
   signal N : std_logic := '0';
   signal Z : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal pc_out : std_logic_vector(31 downto 0);
   signal DR : std_logic_vector(4 downto 0);
   signal SA : std_logic_vector(4 downto 0);
   signal SB : std_logic_vector(4 downto 0);
   signal TD : std_logic;
   signal TA : std_logic;
   signal TB : std_logic;
   signal MB : std_logic;
   signal FS : std_logic_vector(4 downto 0);
   signal MD : std_logic;
   signal RW : std_logic;
   signal MM : std_logic;
   signal MW : std_logic;
   signal RV : std_logic := '0';
   signal RC : std_logic := '0';
   signal RN : std_logic := '0';
   signal RZ : std_logic := '0';
   signal FL : std_logic := '0';
   
   -- Clock period definitions
   constant Clk_period : time := 20 ns;
begin
	-- Instantiate the Unit Under Test (UUT)
   uut: Microprogrammed_control PORT MAP (
          instruction_in => instruction_in,
          reset => reset,
          V => V,
          C => C,
          N => N,
          Z => Z,
          Clk => Clk,
          pc_out => pc_out,
          DR => DR,
          SA => SA,
          SB => SB,
          TD => TD,
          TA => TA,
          TB => TB,
          MB => MB,
          FS => FS,
          MD => MD,
          RW => RW,
          MM => MM,
          MW => MW,
          RV => RV,
          RC => RC,
          RN => RN,
          RZ => RZ,
          FL => FL
        );
        
        
  -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 
 
 stim_proc: process
   begin
   
   --reset first
    reset <= '1';
	 wait for 500 ns;
	
	-- test
	reset <= '0';
	instruction_in <= "00000000011000000000001101100111";
	-- output should be 
	-- pc 000000000000001, then 000000000000002, then 000000000000003, etc..
	-- dr 00000
	-- sa 11011
	-- sb 00111
	-- td 0
	-- ta 0
	-- tb 0
	-- mb 0
	-- fs 00000
	-- md 0
	-- rw 0
	-- mm 0 (iterates between 0-1)
	-- mw 0
	-- rv 0
	-- rc 0
	-- rn 0
	-- rz 0 
	-- fl 1
   wait for 1000ns;
   wait;
   end process;
end Behavioral;
