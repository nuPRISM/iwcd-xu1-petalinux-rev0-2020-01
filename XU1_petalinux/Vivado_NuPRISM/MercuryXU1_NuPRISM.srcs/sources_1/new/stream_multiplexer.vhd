----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.06.2021 17:19:23
-- Design Name: 
-- Module Name: stream_multiplexer - combinational
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stream_multiplexer is
    Port ( clk_sample : in std_logic;
           gpio : in STD_LOGIC_VECTOR (19 downto 0);
           adc0_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc1_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc2_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc3_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc4_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc5_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc6_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc7_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc8_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc9_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc10_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc11_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc12_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc13_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc14_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc15_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc16_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc17_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc18_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc19_sample : in STD_LOGIC_VECTOR (31 downto 0);
           adc_sample_selected_0 : out STD_LOGIC_VECTOR (31 downto 0);
           adc_sample_selected_1 : out STD_LOGIC_VECTOR (31 downto 0);
           adc_sample_valid : in STD_LOGIC_VECTOR (19 downto 0);
           adc_sample_valid_selected_0 : out STD_LOGIC;
           adc_sample_valid_selected_1 : out STD_LOGIC
           );
end stream_multiplexer;

architecture combinational of stream_multiplexer is
signal adc_sample_selected_0_next : STD_LOGIC_VECTOR (31 downto 0);
signal adc_sample_selected_1_next : STD_LOGIC_VECTOR (31 downto 0);
signal adc_sample_selected_0_rn   : STD_LOGIC_VECTOR (31 downto 0);
signal adc_sample_selected_1_rn   : STD_LOGIC_VECTOR (31 downto 0);

signal adc_sample_valid_selected_0_next : STD_LOGIC;
signal adc_sample_valid_selected_1_next : STD_LOGIC;
signal adc_sample_valid_selected_0_rn   : STD_LOGIC;
signal adc_sample_valid_selected_1_rn   : STD_LOGIC;

begin

adc_sample_selected_0_next <= adc0_sample when gpio(12 downto 8) = 0 else
    adc1_sample when gpio(12 downto 8) = 1 else
    adc2_sample when gpio(12 downto 8) = 2 else
    adc3_sample when gpio(12 downto 8) = 3 else
    adc4_sample when gpio(12 downto 8) = 4 else
    adc5_sample when gpio(12 downto 8) = 5 else
    adc6_sample when gpio(12 downto 8) = 6 else
    adc7_sample when gpio(12 downto 8) = 7 else
    adc8_sample when gpio(12 downto 8) = 8 else
    adc9_sample when gpio(12 downto 8) = 9 else
    adc10_sample when gpio(12 downto 8) = 10 else
    adc11_sample when gpio(12 downto 8) = 11 else
    adc12_sample when gpio(12 downto 8) = 12 else
    adc13_sample when gpio(12 downto 8) = 13 else
    adc14_sample when gpio(12 downto 8) = 14 else
    adc15_sample when gpio(12 downto 8) = 15 else
    adc16_sample when gpio(12 downto 8) = 16 else
    adc17_sample when gpio(12 downto 8) = 17 else
    adc18_sample when gpio(12 downto 8) = 18 else
    adc19_sample;
    
adc_sample_selected_1_next <= adc0_sample when gpio(17 downto 13) = 0 else
    adc1_sample when gpio(17 downto 13) = 1 else
    adc2_sample when gpio(17 downto 13) = 2 else
    adc3_sample when gpio(17 downto 13) = 3 else
    adc4_sample when gpio(17 downto 13) = 4 else
    adc5_sample when gpio(17 downto 13) = 5 else
    adc6_sample when gpio(17 downto 13) = 6 else
    adc7_sample when gpio(17 downto 13) = 7 else
    adc8_sample when gpio(17 downto 13) = 8 else
    adc9_sample when gpio(17 downto 13) = 9 else
    adc10_sample when gpio(17 downto 13) = 10 else
    adc11_sample when gpio(17 downto 13) = 11 else
    adc12_sample when gpio(17 downto 13) = 12 else
    adc13_sample when gpio(17 downto 13) = 13 else
    adc14_sample when gpio(17 downto 13) = 14 else
    adc15_sample when gpio(17 downto 13) = 15 else
    adc16_sample when gpio(17 downto 13) = 16 else
    adc17_sample when gpio(17 downto 13) = 17 else
    adc18_sample when gpio(17 downto 13) = 18 else
    adc19_sample;
    
 adc_sample_valid_selected_0_next <= adc_sample_valid(conv_integer( gpio(12 downto 8)));
 adc_sample_valid_selected_1_next <= adc_sample_valid(conv_integer( gpio(17 downto 13)));

REGN_PROC: process(clk_sample)
begin
  if clk_sample'event and clk_sample = '0' then
    adc_sample_selected_0_rn <= adc_sample_selected_0_next;
    adc_sample_selected_1_rn <= adc_sample_selected_1_next;
    adc_sample_valid_selected_0_rn <= adc_sample_valid_selected_0_next;
    adc_sample_valid_selected_1_rn <= adc_sample_valid_selected_1_next;
  end if;  
end process;

REGP_PROC: process(clk_sample)
begin
  if clk_sample'event and clk_sample = '1' then
    adc_sample_selected_0 <= adc_sample_selected_0_rn;
    adc_sample_selected_1 <= adc_sample_selected_1_rn;
    adc_sample_valid_selected_0 <= adc_sample_valid_selected_0_rn;
    adc_sample_valid_selected_1 <= adc_sample_valid_selected_1_rn;
  end if;  
end process;

end combinational;
