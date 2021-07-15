----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.05.2021 13:00:33
-- Design Name: 
-- Module Name: tlast_generator - rtl
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
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tlast_generator is
    Port ( clk : in STD_LOGIC;
           rst_n : in STD_LOGIC;
           num_samples_per_packet : in STD_LOGIC_VECTOR (31 downto 0);
           triger_enable : in STD_LOGIC;
           triger : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR (31 downto 0);
           data_enable : in STD_LOGIC;
           counter : out STD_LOGIC_VECTOR (31 downto 0);
           triger_test : out std_logic_vector(2 downto 0);
           m_axis_tdata : out STD_LOGIC_VECTOR (31 downto 0);
           m_axis_tvalid : out STD_LOGIC;
           m_axis_tlast : out STD_LOGIC;
           m_axis_tready : in STD_LOGIC);
end tlast_generator;

architecture rtl of tlast_generator is
signal triger_r                   : std_logic_vector(1 downto 0);
signal triger_enable_r            : std_logic;
signal sample_counter_r           : std_logic_vector(31 downto 0);
signal sample_counter_next        : std_logic_vector(31 downto 0);
begin

m_axis_tdata <= data;
m_axis_tvalid <= data_enable when sample_counter_r /= 0 else '0';
m_axis_tlast <= data_enable when sample_counter_r = num_samples_per_packet else '0';
counter <= sample_counter_r;
triger_test(1 downto 0) <= triger_r;
triger_test(2) <= triger_enable_r;

COMB_PROC: process(sample_counter_r, triger_r, triger_enable_r, m_axis_tready, num_samples_per_packet, data_enable)
variable sample_counter_v        : std_logic_vector(31 downto 0);
variable m_axis_tlast_v          : std_logic;
begin
  sample_counter_v := sample_counter_r;
  if sample_counter_r = 0 then
    if (triger_r(0) = '1' and triger_r(1) = '0') or triger_enable_r = '0' then
      sample_counter_v(0) := '1';    
    end if;
  elsif m_axis_tready = '1' and data_enable = '1' then  
    sample_counter_v := sample_counter_r + 1;
    if sample_counter_r = num_samples_per_packet then
      sample_counter_v := (others => '0');
    end if;
  end if;
  
  sample_counter_next <= sample_counter_v;
end process;

REGX_PROC: process(clk, rst_n)
begin
  if rst_n = '0' then
    sample_counter_r <= (others => '0');
    triger_r <= "11";
    triger_enable_r <= '1';   
  elsif clk'event and clk = '1' then
    sample_counter_r <= sample_counter_next;
    triger_r <= triger_r(0) & triger;
    triger_enable_r <= triger_enable;
  end if;  
end process;

end rtl;
