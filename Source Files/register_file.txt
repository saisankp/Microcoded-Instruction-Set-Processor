----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 10/26/2020
-- Design Name: register file
-- Module Name: register_file - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_file is
    Port ( 
           --DR (5 bits)
           D_Address: in std_logic_vector (4 downto 0);
           
           --SA (5 bits)
           A_Select: in std_logic_vector (4 downto 0);
           
           --SB (5 bits)
           B_Select: in std_logic_vector (4 downto 0);
          
           --TD, TA, TB (each 1 bit).
           TD : in STD_LOGIC;
		   TA : in STD_LOGIC;
		   TB : in STD_LOGIC;
     
           -- enable for the AND gates 
           enable: in std_logic; 
           
           reset: in std_logic;
           -- Clock
           Clk: in std_logic;
           
           -- data that comes into the registers.
           input_data : in std_logic_vector(31 downto 0);
        
 
           -- the 32 outputs from the registers!
           -- these are not necessary to output, but they are added just 
           -- so it is easier to understand the testbench simulation.
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
           reg32temp:  out std_logic_vector(31 downto 0); --the temporary extra register
           OutputA : out std_logic_vector(31 downto 0);
           OutputB : out std_logic_vector(31 downto 0));
            
           
end register_file;

architecture Behavioral of register_file is
--components

    -- 32 bit register for register file
    component reg32
    port(
           D : in std_logic_vector(31 downto 0);
           reset : in std_logic;
           load : in std_logic;
           Clk : in std_logic;
           QOut : out std_logic_vector(31 downto 0)
           );
     end component;
     
    -- 6 to 33 decoder
    component decoder_6to33
    Port (A: in std_logic_vector(5 downto 0);  --6 bits for 6 inputs
          Q: out std_logic_vector(32 downto 0)
          ); 
    end component;
   
    -- 32bit 2 to 1 line multiplexer
    component mux_2to1
    port(
           In0 : in std_logic_vector(31 downto 0);
           In1 : in std_logic_vector(31 downto 0);
           s : in std_logic; 
           Z : out std_logic_vector(31 downto 0));
    end component;
    
    -- 32bit 33 to 1 line multiplexer
    component mux_33to1
    port(  S : in std_logic_vector(5 downto 0);
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
           Out1: out std_logic_vector(31 downto 0)
           );
    end component;
    
     -- signals
     
     --signal from decoder to and-gate
    signal decoder_reg0: std_logic;
    signal decoder_reg1: std_logic;
    signal decoder_reg2: std_logic;
    signal decoder_reg3: std_logic;
    signal decoder_reg4: std_logic;
    signal decoder_reg5: std_logic;
    signal decoder_reg6: std_logic;
    signal decoder_reg7: std_logic;
    signal decoder_reg8: std_logic;
    signal decoder_reg9: std_logic;
    signal decoder_reg10: std_logic;
    signal decoder_reg11: std_logic;
    signal decoder_reg12: std_logic;
    signal decoder_reg13: std_logic;
    signal decoder_reg14: std_logic;
    signal decoder_reg15: std_logic;
    signal decoder_reg16: std_logic;
    signal decoder_reg17: std_logic;
    signal decoder_reg18: std_logic;
    signal decoder_reg19: std_logic;
    signal decoder_reg20: std_logic;
    signal decoder_reg21: std_logic;
    signal decoder_reg22: std_logic;
    signal decoder_reg23: std_logic;
    signal decoder_reg24: std_logic;
    signal decoder_reg25: std_logic;
    signal decoder_reg26: std_logic;
    signal decoder_reg27: std_logic;
    signal decoder_reg28: std_logic;
    signal decoder_reg29: std_logic;
    signal decoder_reg30: std_logic;
    signal decoder_reg31: std_logic;
     
    signal decoder_reg32: std_logic;
    
  
     
     
     --signals to load the 32 32bit registers
    signal load_reg0: std_logic;
    signal load_reg1: std_logic; 
    signal load_reg2: std_logic;
    signal load_reg3: std_logic; 
    signal load_reg4: std_logic; 
    signal load_reg5: std_logic;  
    signal load_reg6: std_logic; 
    signal load_reg7: std_logic;  
    signal load_reg8: std_logic;  
    signal load_reg9: std_logic; 
    signal load_reg10: std_logic;
    signal load_reg11: std_logic; 
    signal load_reg12: std_logic;
    signal load_reg13: std_logic; 
    signal load_reg14: std_logic; 
    signal load_reg15: std_logic;
    signal load_reg16: std_logic; 
    signal load_reg17: std_logic; 
    signal load_reg18: std_logic; 
    signal load_reg19: std_logic;
    signal load_reg20: std_logic; 
    signal load_reg21: std_logic; 
    signal load_reg22: std_logic; 
    signal load_reg23: std_logic; 
    signal load_reg24: std_logic; 
    signal load_reg25: std_logic; 
    signal load_reg26: std_logic; 
    signal load_reg27: std_logic; 
    signal load_reg28: std_logic; 
    signal load_reg29: std_logic;
    signal load_reg30: std_logic;
    signal load_reg31: std_logic;
    
    signal load_reg32: std_logic;
    
    --signals for the outputs from the registers
    signal reg0_q: std_logic_vector(31 downto 0);
    signal reg1_q: std_logic_vector(31 downto 0);
    signal reg2_q: std_logic_vector(31 downto 0);
    signal reg3_q: std_logic_vector(31 downto 0);
    signal reg4_q: std_logic_vector(31 downto 0);
    signal reg5_q: std_logic_vector(31 downto 0);
    signal reg6_q: std_logic_vector(31 downto 0);
    signal reg7_q: std_logic_vector(31 downto 0);  
    signal reg8_q: std_logic_vector(31 downto 0); 
    signal reg9_q: std_logic_vector(31 downto 0); 
    signal reg10_q: std_logic_vector(31 downto 0);
    signal reg11_q: std_logic_vector(31 downto 0);
    signal reg12_q: std_logic_vector(31 downto 0);
    signal reg13_q: std_logic_vector(31 downto 0);
    signal reg14_q: std_logic_vector(31 downto 0);
    signal reg15_q: std_logic_vector(31 downto 0);
    signal reg16_q: std_logic_vector(31 downto 0);
    signal reg17_q: std_logic_vector(31 downto 0);
    signal reg18_q: std_logic_vector(31 downto 0);
    signal reg19_q: std_logic_vector(31 downto 0);
    signal reg20_q: std_logic_vector(31 downto 0);
    signal reg21_q: std_logic_vector(31 downto 0);
    signal reg22_q: std_logic_vector(31 downto 0);
    signal reg23_q: std_logic_vector(31 downto 0);
    signal reg24_q: std_logic_vector(31 downto 0);
    signal reg25_q: std_logic_vector(31 downto 0);
    signal reg26_q: std_logic_vector(31 downto 0);
    signal reg27_q: std_logic_vector(31 downto 0);
    signal reg28_q: std_logic_vector(31 downto 0);
    signal reg29_q: std_logic_vector(31 downto 0);
    signal reg30_q: std_logic_vector(31 downto 0);
    signal reg31_q: std_logic_vector(31 downto 0);
    
    signal reg32_q: std_logic_vector(31 downto 0);
    
    signal d_data: std_logic_vector(31 downto 0);
begin
    -- port maps

    -- register 0
    reg00 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg0,
            Clk => Clk,
            QOut => reg0_q
    );
    
    -- register 1
    reg01 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg1,
            Clk => Clk,
            QOut => reg1_q
    );
    
    -- register 2
    reg02: reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg2,
            Clk => Clk,
            QOut => reg2_q
    );
    
    -- register 3
    reg03 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg3,
            Clk => Clk,
            QOut => reg3_q
    );
    
    -- register 4
    reg04 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg4,
            Clk => Clk,
            QOut => reg4_q
    );
    
    -- register 5
    reg05 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg5,
            Clk => Clk,
            QOut => reg5_q
    );
    
    -- register 6
    reg06 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg6,
            Clk => Clk,
            QOut => reg6_q
    );
    
    -- register 7
    reg07 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg7,
            Clk => Clk,
            QOut => reg7_q
    );
    
    -- register 8
    reg08 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg8,
            Clk => Clk,
            QOut => reg8_q
    );
    
    -- register 9
    reg09 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg9,
            Clk => Clk,
            QOut => reg9_q
    );
    
    -- register 10
    reg010 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg10,
            Clk => Clk,
            QOut => reg10_q
    );
    
    -- register 11
    reg011 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg11,
            Clk => Clk,
            QOut => reg11_q
    );
    
    -- register 12
    reg012 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg12,
            Clk => Clk,
            QOut => reg12_q
    );
    
    -- register 13
    reg013 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg13,
            Clk => Clk,
            QOut => reg13_q
    );
    
    -- register 14
    reg014 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg14,
            Clk => Clk,
            QOut => reg14_q
    );
    
    -- register 15
    reg015 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg15,
            Clk => Clk,
            QOut => reg15_q
    );
    
    -- register 16
    reg016 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg16,
            Clk => Clk,
            QOut => reg16_q
    );
    
    -- register 17
    reg017 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg17,
            Clk => Clk,
            QOut => reg17_q
    );
    
    -- register 18
    reg018 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg18,
            Clk => Clk,
            QOut => reg18_q
    );
    
    -- register 19
    reg019 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg19,
            Clk => Clk,
            QOut => reg19_q
    );
    
    -- register 20
    reg020 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg20,
            Clk => Clk,
            QOut => reg20_q
    );
    
    -- register 21
    reg0021 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg21,
            Clk => Clk,
            QOut => reg21_q
    );
    
    -- register 22
    reg022 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg22,
            Clk => Clk,
            QOut => reg22_q
    );
    
    -- register 23
    reg023 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg23,
            Clk => Clk,
            QOut => reg23_q
    );
    
    -- register 24
    reg024 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg24,
            Clk => Clk,
            QOut=> reg24_q
    );
    
    -- register 25
    reg0025 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg25,
            Clk => Clk,
            QOut => reg25_q
    );
    
    
    -- register 26
    reg0026 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg26,
            Clk => Clk,
            QOut => reg26_q
    );
    
    -- register 27
    reg027 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg27,
            Clk => Clk,
            QOut => reg27_q
    );
    
    -- register 28
    reg028 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg28,
            Clk => Clk,
            QOut => reg28_q
    );
    
    -- register 29
    reg029 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg29,
            Clk => Clk,
            QOut => reg29_q
    );
    
    -- register 30
    reg030 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg30,
            Clk => Clk,
            QOut => reg30_q
    );
    
    -- register 31
    reg031 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg31,
            Clk => Clk,
            QOut => reg31_q
    );
    
    -- register 32 (Extra Temporary register)
    reg032 : reg32 port map(
            D => d_data,
            reset => reset,
            load => load_reg32,
            Clk => Clk,
            QOut => reg32_q
    );
    
  
   -- Destination Register Decoder
   des_decoder_6to33: decoder_6to33 port map(
               A(0) => D_Address(0),
               A(1) => D_Address(1),
               A(2) => D_Address(2),
               A(3) => D_Address(3),
               A(4) => D_Address(4),
               A(5) => TD,
               Q(0) => decoder_reg0,
               Q(1) => decoder_reg1,
               Q(2) => decoder_reg2,
               Q(3) => decoder_reg3,
               Q(4) => decoder_reg4,
               Q(5) => decoder_reg5,
               Q(6) => decoder_reg6,
               Q(7) => decoder_reg7,
               Q(8) => decoder_reg8,
               Q(9) => decoder_reg9,
               Q(10) => decoder_reg10,
               Q(11) => decoder_reg11,
               Q(12) => decoder_reg12,
               Q(13) => decoder_reg13,
               Q(14) => decoder_reg14,
               Q(15) => decoder_reg15,
               Q(16) => decoder_reg16,
               Q(17) => decoder_reg17,
               Q(18) => decoder_reg18,
               Q(19) => decoder_reg19,
               Q(20) => decoder_reg20,
               Q(21) => decoder_reg21,
               Q(22) => decoder_reg22,
               Q(23) => decoder_reg23,
               Q(24) => decoder_reg24,
               Q(25) => decoder_reg25,
               Q(26) => decoder_reg26,
               Q(27) => decoder_reg27,
               Q(28) => decoder_reg28,
               Q(29) => decoder_reg29,
               Q(30) => decoder_reg30,
               Q(31) => decoder_reg31,
               Q(32) => decoder_reg32
               );
                
   -- 32 to 1 source register multiplexer (Path A)
   mux_33to1ForA: mux_33to1 port map(
                S(0) => A_Select(0),
                S(1) => A_Select(1),
                S(2) => A_Select(2),
                S(3) => A_Select(3),
                S(4) => A_Select(4),
                S(5) => TA,
                reg0 => reg0_q,
                reg1 => reg1_q,
                reg2 => reg2_q,
                reg3 => reg3_q,
                reg4 => reg4_q,
                reg5 => reg5_q,
                reg6 => reg6_q,
                reg7 => reg7_q,
                reg8 => reg8_q,
                reg9 => reg9_q,
                reg10 => reg10_q,
                reg11 => reg11_q,
                reg12 => reg12_q,
                reg13 => reg13_q,
                reg14 => reg14_q,
                reg15 => reg15_q,
                reg16 => reg16_q,
                reg17 => reg17_q,
                reg18 => reg18_q,
                reg19 => reg19_q,
                reg20 => reg20_q,
                reg21 => reg21_q,
                reg22 => reg22_q,
                reg23 => reg23_q,
                reg24 => reg24_q,
                reg25 => reg25_q,
                reg26 => reg26_q,
                reg27 => reg27_q,
                reg28 => reg28_q,
                reg29 => reg29_q,
                reg30 => reg30_q,
                reg31 => reg31_q,
                reg32 => reg32_q,
                Out1 => OutputA
                );
   
      -- 32 to 1 source register multiplexer (Path B)
   mux_33to1ForB: mux_33to1 port map(
                S(0) => B_Select(0),
                S(1) => B_Select(1),
                S(2) => B_Select(2),
                S(3) => B_Select(3),
                S(4) => B_Select(4),
                S(5) => TB,
                reg0 => reg0_q,
                reg1 => reg1_q,
                reg2 => reg2_q,
                reg3 => reg3_q,
                reg4 => reg4_q,
                reg5 => reg5_q,
                reg6 => reg6_q,
                reg7 => reg7_q,
                reg8 => reg8_q,
                reg9 => reg9_q,
                reg10 => reg10_q,
                reg11 => reg11_q,
                reg12 => reg12_q,
                reg13 => reg13_q,
                reg14 => reg14_q,
                reg15 => reg15_q,
                reg16 => reg16_q,
                reg17 => reg17_q,
                reg18 => reg18_q,
                reg19 => reg19_q,
                reg20 => reg20_q,
                reg21 => reg21_q,
                reg22 => reg22_q,
                reg23 => reg23_q,
                reg24 => reg24_q,
                reg25 => reg25_q,
                reg26 => reg26_q,
                reg27 => reg27_q,
                reg28 => reg28_q,
                reg29 => reg29_q,
                reg30 => reg30_q,
                reg31 => reg31_q,
                reg32 => reg32_q,
                Out1 => OutputB
                );
                
   load_reg0 <= (decoder_reg0 and enable) or reset;
   load_reg1 <= (decoder_reg1 and enable) or reset;
   load_reg2 <= (decoder_reg2 and enable) or reset;
   load_reg3 <= (decoder_reg3 and enable) or reset;
   load_reg4 <= (decoder_reg4 and enable) or reset;
   load_reg5 <= (decoder_reg5 and enable) or reset;
   load_reg6 <= (decoder_reg6 and enable) or reset;
   load_reg7 <= (decoder_reg7 and enable) or reset;
   load_reg8 <= (decoder_reg8 and enable) or reset;
   load_reg9 <= (decoder_reg9 and enable) or reset;
   load_reg10 <= (decoder_reg10 and enable) or reset;
   load_reg11 <= (decoder_reg11 and enable) or reset;
   load_reg12 <= (decoder_reg12 and enable) or reset;
   load_reg13 <= (decoder_reg13 and enable) or reset;
   load_reg14 <= (decoder_reg14 and enable) or reset;
   load_reg15 <= (decoder_reg15 and enable) or reset;
   load_reg16 <= (decoder_reg16 and enable) or reset;
   load_reg17 <= (decoder_reg17 and enable) or reset;
   load_reg18 <= (decoder_reg18 and enable) or reset;
   load_reg19 <= (decoder_reg19 and enable) or reset;
   load_reg20 <= (decoder_reg20 and enable) or reset;
   load_reg21 <= (decoder_reg21 and enable) or reset;
   load_reg22 <= (decoder_reg22 and enable) or reset;
   load_reg23 <= (decoder_reg23 and enable) or reset;
   load_reg24 <= (decoder_reg24 and enable) or reset;
   load_reg25 <= (decoder_reg25 and enable) or reset;
   load_reg26 <= (decoder_reg26 and enable) or reset;
   load_reg27 <= (decoder_reg27 and enable) or reset;
   load_reg28 <= (decoder_reg28 and enable) or reset;
   load_reg29 <= (decoder_reg29 and enable) or reset;
   load_reg30 <= (decoder_reg30 and enable) or reset;
   load_reg31 <= (decoder_reg31 and enable) or reset;
   load_reg32 <= (TD and enable) or reset;
  
   d_data <= x"00000000" when reset='1' else input_data;
   
      
   reg0 <= reg0_q;
   reg1 <= reg1_q;
   reg2 <= reg2_q;
   reg3 <= reg3_q;
   reg4 <= reg4_q;
   reg5 <= reg5_q;
   reg6 <= reg6_q;
   reg7 <= reg7_q;
   reg8 <= reg8_q;
   reg9 <= reg9_q;
   reg10 <= reg10_q;
   reg11 <= reg11_q;
   reg12 <= reg12_q;
   reg13 <= reg13_q;
   reg14 <= reg14_q;
   reg15 <= reg15_q;
   reg16 <= reg16_q;
   reg17 <= reg17_q;
   reg18 <= reg18_q;
   reg19 <= reg19_q;
   reg20 <= reg20_q;
   reg21 <= reg21_q;
   reg22 <= reg22_q;
   reg23 <= reg23_q;
   reg24 <= reg24_q;
   reg25 <= reg25_q;
   reg26 <= reg26_q;
   reg27 <= reg27_q;
   reg28 <= reg28_q;
   reg29 <= reg29_q;
   reg30 <= reg30_q;
   reg31 <= reg31_q;
   reg32temp <= reg32_q;


end Behavioral;
