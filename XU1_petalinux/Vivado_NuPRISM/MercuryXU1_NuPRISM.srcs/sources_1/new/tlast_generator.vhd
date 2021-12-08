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
use IEEE.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tlast_generator is
    generic (ID : natural);
    Port ( clk : in std_logic;
           rst_n : in std_logic;
           num_samples_per_packet : in std_logic_vector (31 downto 0);
           trigger_mode           : in std_logic_vector(2 downto 0);
           trigger_enable         : in std_logic;
           trigger_ps             : in std_logic;
           trigger_external       : in std_logic;
           trigger_internal_in    : in std_logic;
           trigger_internal_out   : out std_logic;
           trigger_detected       : out std_logic;
           data                   : in std_logic_vector (31 downto 0);
           data_enable            : in std_logic;
           counter                : out std_logic_vector (31 downto 0);
           trigger_test           : out std_logic_vector(4 downto 0);
           m_axis_tdata           : out std_logic_vector (31 downto 0);
           m_axis_tvalid          : out std_logic;
           m_axis_tlast           : out std_logic;
           m_axis_tready          : in std_logic);
end tlast_generator;

architecture rtl of tlast_generator is
signal trigger_in                 : std_logic;
signal trigger_enable_r           : std_logic;
signal trigger_r                  : std_logic_vector(1 downto 0);
signal trigger_internal_r         : std_logic;
signal trigger_internal_next      : std_logic;
signal trigger_detected_r         : std_logic;
signal trigger_detected_next      : std_logic;
signal trigger_mode_r             : std_logic_vector(2 downto 0);
signal sample_counter_r           : std_logic_vector(31 downto 0);
signal sample_counter_next        : std_logic_vector(31 downto 0);

type DATA_ARRAY_TYPE is array(4 downto 0) of std_logic_vector(31 downto 0);
signal data_dly                   : DATA_ARRAY_TYPE;

component c_shift_ram_0 is
  port (
    A : in std_logic_vector(9 DOWNTO 0);
    D : in std_logic_vector(31 DOWNTO 0);
    CLK : in std_logic;
    Q : out std_logic_vector(31 DOWNTO 0)
  );
END component;

begin

--m_axis_tdata <= data;
m_axis_tvalid <= data_enable when sample_counter_r /= 0 else '0';
m_axis_tlast <= data_enable when sample_counter_r = num_samples_per_packet else '0';
counter <= sample_counter_r;
trigger_test(1 downto 0) <= trigger_r;
trigger_test(4 downto 2) <= trigger_mode_r(2 downto 0);
trigger_in <= trigger_ps when trigger_mode_r(1) = '0' else trigger_external;

trigger_internal_out <= trigger_internal_r;
trigger_detected <= trigger_detected_r;

COMB_PROC: process(sample_counter_r, trigger_r, trigger_mode_r, trigger_internal_r, trigger_enable_r,
trigger_internal_in, m_axis_tready, num_samples_per_packet, data_enable, data_dly)
variable sample_counter_v        : std_logic_vector(31 downto 0);
variable m_axis_tlast_v          : std_logic;
variable data_sum_0_v            : std_logic_vector(13 downto 0);
variable data_sum_1_v            : std_logic_vector(13 downto 0);
variable data_sum_v              : std_logic_vector(13 downto 0);
variable data_difference_v       : std_logic_vector(13 downto 0);
variable data_abs_difference_v   : std_logic_vector(13 downto 0);
type DATA_MEDIAN_TYPE is array(2 downto 0) of std_logic_vector(11 downto 0);
variable data_median_0_v         : DATA_MEDIAN_TYPE;
variable data_median_1_v         : DATA_MEDIAN_TYPE;
variable data_median_2_v         : DATA_MEDIAN_TYPE;
variable trigger_internal_v      : std_logic;
variable trigger_detected_v      : std_logic;

begin

  -- median filter 
  data_median_0_v(0) :=  data_dly(0)(27 downto 16);
  data_median_0_v(1) :=  data_dly(1)(11 downto 0);
  data_median_0_v(2) :=  data_dly(1)(27 downto 16);
  if signed(data_median_0_v(0)) >  signed(data_median_0_v(1)) then
    data_median_0_v(0) :=  data_dly(1)(11 downto 0);
    data_median_0_v(1) :=  data_dly(0)(27 downto 16);
  end if;
  data_median_1_v := data_median_0_v;
  if  signed(data_median_1_v(1)) >  signed(data_median_1_v(2)) then
    data_median_1_v(1) :=  data_median_0_v(2);
    data_median_1_v(2) :=  data_median_0_v(1);
  end if;  
  data_median_2_v := data_median_1_v;
  if  signed(data_median_1_v(0)) >  signed(data_median_1_v(1)) then
    data_median_2_v(0) := data_median_1_v(1);
    data_median_2_v(1) := data_median_1_v(0);
  end if;
  

  data_sum_0_v := data_dly(4)(13 downto 0) + data_dly(4)(29 downto 16);
  data_sum_1_v := data_dly(3)(13 downto 0) + data_dly(3)(29 downto 16);
  data_sum_v := data_sum_0_v + data_sum_1_v;
  data_difference_v := data_sum_v - (data_median_2_v(1) & "00");
  data_abs_difference_v := '0' & data_difference_v(12 downto 0);
  if data_difference_v(13) = '1' then
    data_abs_difference_v := '0' & (not data_difference_v(12 downto 0) + 1);
  end if;
  trigger_internal_v := '0';  
  if data_abs_difference_v(13 downto 2) > 100 then
    trigger_internal_v := '1';  
  end if;


  -- packet control
  sample_counter_v := sample_counter_r;
  trigger_detected_v := '0';
  if sample_counter_r = 0 then
    if (trigger_r(0) = '1' and trigger_r(1) = '0' and (trigger_mode_r(1 downto 0) = 1 or trigger_mode_r(1 downto 0) = 2)) 
    or (trigger_internal_r = '1' and trigger_mode_r(1 downto 0) = 3 and (trigger_mode_r(2) = '0' xnor ID = 0))
    or (trigger_internal_in = '1' and trigger_mode_r(1 downto 0) = 3 and (trigger_mode_r(2) = '1' xnor ID = 0))
    or trigger_mode_r(1 downto 0) = 0 then
      sample_counter_v(0) := trigger_enable_r;    
      trigger_detected_v := trigger_enable_r;
    end if;
  elsif m_axis_tready = '1' and data_enable = '1' then  
    sample_counter_v := sample_counter_r + 1;
    if sample_counter_r = num_samples_per_packet then
      sample_counter_v := (others => '0');
    end if;
  end if;
  
  trigger_internal_next <= trigger_internal_v;
  trigger_detected_next <= trigger_detected_v;
  sample_counter_next <= sample_counter_v;
end process;

REGX_PROC: process(clk, rst_n)
begin
  if rst_n = '0' then
    sample_counter_r <= (others => '0');
    trigger_r <= "11";
    trigger_mode_r <= "001";
    trigger_enable_r <= '0';
    trigger_detected_r <= '0';
    data_dly <= (others => (others => '0'));
  elsif clk'event and clk = '1' then
    sample_counter_r <= sample_counter_next;
    trigger_r <= trigger_r(0) & trigger_in;
    trigger_internal_r <= trigger_internal_next;
    trigger_enable_r <= trigger_enable;
    trigger_detected_r <= trigger_detected_next;
    data_dly(0) <= data;
    data_dly(1) <= data_dly(0);
    data_dly(2) <= data_dly(1);
    data_dly(3) <= data_dly(2);
    data_dly(4) <= data_dly(3);
  end if;  
end process;

SH: c_shift_ram_0 port map (
    A => num_samples_per_packet(11 downto 2),
    D =>  data,
    CLK => clk,
    Q => m_axis_tdata
  );
  
end rtl;
