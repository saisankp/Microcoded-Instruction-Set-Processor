----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Prathamesh Sai
-- 
-- Create Date: 01/03/2021 04:53:35 PM
-- Design Name: 
-- Module Name: memory - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memory is
Port ( address : in std_logic_vector(31 downto 0);
       write_data : in std_logic_vector(31 downto 0);
       clock : in std_logic;
       MemWrite : in std_logic;
       MemRead : in std_logic;
       read_data : out std_logic_vector(31 downto 0));
end memory;

architecture Behavioral of memory is
type mem_array is array(0 to 511) of std_logic_vector(31 downto 0);
constant gate_delay: Time := 1 ns;
begin
 mem_process: process(address, write_data, clock)
    variable data_mem : mem_array := (
    
    --code with operations such as ADI, LD, SR, INC, NOT, ADD, DEC, BNE, B:
     -- 00
    -- |      Opcode       |   DR    |   SA   |  SB   |
      "00000000000000000"  & "00010" & "00010" & "00010", -- 0 adi R2, R2, #2  ; a = 2
      "00000000000000101"  & "00001" & "00001" & "00001", -- 1 add R1, R2, R2  ; b = a + a
      
                                                       --while (a != -3) {
      "00000000000000101"  & "00011" & "00011" & "00010", -- 2 add R3, R3, R2  ; c = c + a
      "00000000000001010"  & "00010" & "00010" & "00000", --  3 dec r2, r2     ; a-- }
      "00000000000000111"  & "00111" & "00010" & "00101",  -- 4 bne -3, R2
      
 
      "00000000000000010"  & "00011" & "00011" & "00011",   --5 st [r3], r3    ; Memory.halfword[c] = c 
      "00000000000000001"  & "00001" & "00011" & "00011",  --6 ld r1, [r3]     ; duplicate_b = Mem.halfword[c]
      "00000000000000100"  & "00001" & "00001" & "00000",   --7  not r1, r1,   ; a = !(a)
      "00000000000000011"  & "00011" & "00011" & "00000",   --8 inc r2, r2     ; duplicate_b++
      
                                                       --while (1)    {infinite loop}
      "00000000000001001"  & "00010" & "00000" & "00010",   -- 9 sr R2, R2 ;   a >>= a
      "00000000000000110"  & "00111" & "00000" & "00110",   -- a B -2
     
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 01
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000",-- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000",-- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 02
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000",-- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000",-- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 03
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000",-- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 04
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000",-- a
      "00000000000000000000000000000000",-- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 05
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000",-- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000",-- f
      -- 06
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 07
      "00000000000000000000000000000000",-- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 08
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 09
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000",-- 1
      "00000000000000000000000000000000",-- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000",-- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 0a
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000",-- 9
      "00000000000000000000000000000000",-- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000",-- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 0b
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 0c
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000",-- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 0d
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 0e
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 0f
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 10
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 11
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 12
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 13
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 14
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 15
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 16
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 17
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 18
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 19
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 1a
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 1b
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 1c
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 1d
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 1e
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000", -- f
      -- 1f
      "00000000000000000000000000000000", -- 0
      "00000000000000000000000000000000", -- 1
      "00000000000000000000000000000000", -- 2
      "00000000000000000000000000000000", -- 3
      "00000000000000000000000000000000", -- 4
      "00000000000000000000000000000000", -- 5
      "00000000000000000000000000000000", -- 6
      "00000000000000000000000000000000", -- 7
      "00000000000000000000000000000000", -- 8
      "00000000000000000000000000000000", -- 9
      "00000000000000000000000000000000", -- a
      "00000000000000000000000000000000", -- b
      "00000000000000000000000000000000", -- c
      "00000000000000000000000000000000", -- d
      "00000000000000000000000000000000", -- e
      "00000000000000000000000000000000"  -- f
    );
variable addr:integer;
    begin -- the following type conversion function is in std_logic_arith
addr:=conv_integer(unsigned(address(2 downto 0)));
if MemWrite ='1' then
data_mem(addr):= write_data;
elsif MemRead='1' then
read_data <= data_mem(addr) after 10 ns;
end if;
end process;
end Behavioral;