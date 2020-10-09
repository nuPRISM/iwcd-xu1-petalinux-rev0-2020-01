---------------------------------------------------------------------------------------------------
-- Project          : Mercury+ XU1 Reference Design
-- File description : Top Level
-- File name        : system_top_PE1.vhd
-- Author           : Diana Ungureanu
---------------------------------------------------------------------------------------------------
-- Copyright (c) 2018 by Enclustra GmbH, Switzerland. All rights are reserved.
-- Unauthorized duplication of this document, in whole or in part, by any means is prohibited
-- without the prior written permission of Enclustra GmbH, Switzerland.
--
-- Although Enclustra GmbH believes that the information included in this publication is correct
-- as of the date of publication, Enclustra GmbH reserves the right to make changes at any time
-- without notice.
--
-- All information in this document may only be published by Enclustra GmbH, Switzerland.
---------------------------------------------------------------------------------------------------
-- Description:
-- This is a top-level file for Mercury+ XU1 Reference Design
--
---------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author           | Remarks
-- ------------------------------------------------------------------------------------------------
-- 1.0     | 24.04.2016 | D. Ungureanu     | First released version
-- 2.0     | 20.10.2017 | D. Ungureanu     | Consistency checks
-- 3.0     | 11.06.2018 | D. Ungureanu     | Consistency checks
--
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- libraries
---------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;


library surf;
use surf.StdRtlPkg.all;

library amc_carrier_core;

--try assign ing a logic vector to each instance
---------------------------------------------------------------------------------------------------
-- entity declaration
---------------------------------------------------------------------------------------------------

entity system_top is
  -- generic(
  --   N_SERDES_G    : positive := 9
  -- );
port (

-------------------------------------------------------------------------------------------
-- processor system
-------------------------------------------------------------------------------------------

-- LEDs
Led2_N                   : out	std_logic;
  -- I2C on PL side
I2c_Scl                  : inout	std_logic;
I2c_Sda                  : inout	std_logic;
-- Bank 64
IO_B64_AG4               : inout	std_logic       := 'Z';
IO_B64_AG9               : inout	std_logic       := 'Z';
IO_B64_AH11              : inout	std_logic       := 'Z';
IO_B64_AJ1               : inout	std_logic       := 'Z';
FPGA_SDATA               : inout	std_logic       := 'Z';
SEL0                     : inout	std_logic       := 'Z';
SMA_TRIG	               : inout	std_logic       := 'Z';
IO_B64_L11_GC_AJ7_N	     : inout	std_logic       := 'Z';
SEL4	           			   : inout	std_logic       := 'Z';
SEL3                 	   : inout	std_logic       := 'Z';
ADC3_DB1_n			     	   : inout	std_logic       := 'Z';
ADC3_DB1_p			     	   : inout	std_logic       := 'Z';
ADC4_DC1_p				       : inout	std_logic       := 'Z';
ADC4_DC1_n				       : inout	std_logic       := 'Z';
ADC3_DA0_n               : inout	std_logic       := 'Z';
ADC3_DA0_p               : inout	std_logic       := 'Z';
ADC4_DD1_n               : inout	std_logic       := 'Z';
ADC4_DD1_p               : inout	std_logic       := 'Z';
ADC4_DD0_p               : inout	std_logic       := 'Z';
ADC4_DD0_n               : inout	std_logic       := 'Z';
ADC4_DC0_p               : inout	std_logic       := 'Z';
ADC4_DC0_n               : inout	std_logic       := 'Z';
ADC3_DA1_n               : inout	std_logic       := 'Z';
ADC3_DA1_p               : inout	std_logic       := 'Z';
RJ45_LVDS_TRIG_p			   : inout	std_logic       := 'Z';
RJ45_LVDS_TRIG_n			   : inout	std_logic       := 'Z';
ADC3_DB0_n		      	   : inout	std_logic       := 'Z';
ADC3_DB0_p               : inout	std_logic       := 'Z';
ADC4_FCLK_p              : inout	std_logic       := 'Z';
ADC4_FCLK_n              : inout	std_logic       := 'Z';
ADC4_DB1_p               : inout	std_logic       := 'Z';
ADC4_DB1_n               : inout	std_logic       := 'Z';
ADC3_FCLK_p				       : inout	std_logic       := 'Z';
ADC3_FCLK_n				       : inout	std_logic       := 'Z';
ADC4_DB0_n				       : inout	std_logic       := 'Z';
ADC4_DB0_p				       : inout	std_logic       := 'Z';
IO_B64_L2_AG13_P			   : inout	std_logic       := 'Z';
IO_B64_L2_AH13_N			   : inout	std_logic       := 'Z';
UART_SEL_0               : inout	std_logic       := 'Z';
UART_SEL_1               : inout	std_logic       := 'Z';
SMA_CLK                  : inout	std_logic       := 'Z';
UART_SEL_4               : inout	std_logic       := 'Z';
UART_SEL_2               : inout	std_logic       := 'Z';
UART_SEL_3               : inout	std_logic       := 'Z';
FPGA_SCLK                : inout	std_logic       := 'Z';
FPGA_SDOUT               : inout	std_logic       := 'Z';
SEL5                     : inout	std_logic       := 'Z';
SEL6                     : inout	std_logic       := 'Z';
MAX10_SPARE1			       : inout	std_logic       := 'Z';
MAX10_SPARE0			       : inout	std_logic       := 'Z';
SEL2                     : inout	std_logic       := 'Z';
SEL1                     : inout	std_logic       := 'Z';

-- Bank 65
ADC3_DD1_p               : inout	std_logic       := 'Z';
ADC3_DD1_n               : inout	std_logic       := 'Z';
ADC1_DC1_n               : inout	std_logic       := 'Z';
ADC1_DC1_p               : inout	std_logic       := 'Z';
ADC4_DCLK_p				       : inout	std_logic       := 'Z';
ADC4_DCLK_n				       : inout	std_logic       := 'Z';
ADC1_DCLK_p				       : inout	std_logic       := 'Z';
ADC1_DCLK_n				       : inout	std_logic       := 'Z';
ADC0_DC1_n				       : inout	std_logic       := 'Z';
ADC0_DC1_p				       : inout	std_logic       := 'Z';
ADC0_DB0_p				       : inout	std_logic       := 'Z';
ADC0_DB0_n				       : inout	std_logic       := 'Z';
ADC0_DD1_n               : inout	std_logic       := 'Z';
ADC0_DD1_p               : inout	std_logic       := 'Z';
ADC1_DA1_p               : inout	std_logic       := 'Z';
ADC1_DA1_n               : inout	std_logic       := 'Z';
ADC1_DB0_p               : inout	std_logic       := 'Z';
ADC1_DB0_n               : inout	std_logic       := 'Z';
ADC1_DA0_p               : inout	std_logic       := 'Z';
ADC1_DA0_n               : inout	std_logic       := 'Z';
ADC0_DB1_p               : inout	std_logic       := 'Z';
ADC0_DB1_n               : inout	std_logic       := 'Z';
ADC3_DC0_p				       : inout	std_logic       := 'Z';
ADC3_DC0_n				       : inout	std_logic       := 'Z';
ADC0_DD0_n               : inout	std_logic       := 'Z';
ADC0_DD0_p               : inout	std_logic       := 'Z';
ADC0_DC0_p               : inout	std_logic       := 'Z';
ADC0_DC0_n               : inout	std_logic       := 'Z';
ADC0_FCLK_p              : inout	std_logic       := 'Z';
ADC0_FCLK_n              : inout	std_logic       := 'Z';
ADC0_DA0_n				       : inout	std_logic       := 'Z';
ADC0_DA0_p               : inout	std_logic       := 'Z';
ADC0_DA1_n	         	   : inout	std_logic       := 'Z';
ADC0_DA1_p		      	   : inout	std_logic       := 'Z';
ADC3_DC1_p				       : inout	std_logic       := 'Z';
ADC3_DC1_n			     	   : inout	std_logic       := 'Z';
ADC3_DD0_p               : inout	std_logic       := 'Z';
ADC3_DD0_n               : inout	std_logic       := 'Z';
ADC4_DA1_p               : inout	std_logic       := 'Z';
ADC4_DA1_n               : inout	std_logic       := 'Z';
ADC4_DA0_n               : inout	std_logic       := 'Z';
ADC4_DA0_p               : inout	std_logic       := 'Z';
ADC1_DD0_n               : inout	std_logic       := 'Z';
ADC1_DD0_p               : inout	std_logic       := 'Z';
ADC1_DC0_p               : inout	std_logic       := 'Z';
ADC1_DC0_n               : inout	std_logic       := 'Z';
ADC1_DB1_p               : inout	std_logic       := 'Z';
ADC1_DB1_n               : inout	std_logic       := 'Z';
ADC1_FCLK_p              : inout	std_logic       := 'Z';
ADC1_FCLK_n              : inout	std_logic       := 'Z';

-- Bank 66
ADC1_SEN	               : inout	std_logic       := 'Z';
ADC0_SEN	               : inout	std_logic       := 'Z';
MAX10_SPARE6				     : inout	std_logic       := 'Z';
MAX10_SPARE7				     : inout	std_logic       := 'Z';
ADC1_DD1_n				       : inout	std_logic       := 'Z';
ADC1_DD1_p				       : inout	std_logic       := 'Z';
IO_B66_L13_GC_U8_P		   : inout	std_logic       := 'Z';
IO_B66_L13_GC_V8_N		   : inout	std_logic       := 'Z';
IO_B66_L14_GC_Y8_N		   : inout	std_logic       := 'Z';
IO_B66_L14_GC_Y9_P		   : inout	std_logic       := 'Z';
IO_B66_L15_AD11_U11_P	   : inout	std_logic       := 'Z';
IO_B66_L15_AD11_V11_N	   : inout	std_logic       := 'Z';
IO_B66_L16_AD3_W10_N	   : inout	std_logic       := 'Z';
IO_B66_L16_AD3_W11_P	   : inout	std_logic       := 'Z';
IO_B66_L17_AD10_U9_P	   : inout	std_logic       := 'Z';
IO_B66_L17_AD10_V9_N	   : inout	std_logic       := 'Z';
IO_B66_L18_AD2_T11_P	   : inout	std_logic       := 'Z';
IO_B66_L18_AD2_U10_N	   : inout	std_logic       := 'Z';
IO_B66_L19_AD9_T10_N	   : inout	std_logic       := 'Z';
IO_B66_L19_AD9_R10_P	   : inout	std_logic       := 'Z';
MAX10_SPARE2					   : inout	std_logic       := 'Z';
MAX10_SPARE4					   : inout	std_logic       := 'Z';
IO_B66_L20_AD1_P10_N	   : inout	std_logic       := 'Z';
IO_B66_L20_AD1_P11_P	   : inout	std_logic       := 'Z';
IO_B66_L21_AD8_M12_N	   : inout	std_logic       := 'Z';
IO_B66_L21_AD8_N12_P	   : inout	std_logic       := 'Z';
IO_B66_L22_AD0_M10_N	   : inout	std_logic       := 'Z';
IO_B66_L22_AD0_N10_P	   : inout	std_logic       := 'Z';
IO_B66_L23_L11_N			   : inout	std_logic       := 'Z';
IO_B66_L23_L12_P			   : inout	std_logic       := 'Z';
IO_B66_L24_K10_N			   : inout	std_logic       := 'Z';
IO_B66_L24_L10_P			   : inout	std_logic       := 'Z';
MAX10_SPARE3					   : inout	std_logic       := 'Z';
MAX10_SPARE5					   : inout	std_logic       := 'Z';
MAX10_SPARE8				     : inout	std_logic       := 'Z';
MAX10_SPARE9				     : inout	std_logic       := 'Z';
MAX10_SPARE10				     : inout	std_logic       := 'Z';
IO_B66_L4_AD7_V2_P		   : inout	std_logic       := 'Z';
MAX10_SPARE13				     : inout	std_logic       := 'Z';
MAX10_SPARE12				     : inout	std_logic       := 'Z';
ADC3_SEN	               : inout	std_logic       := 'Z';
ADC4_SEN	               : inout	std_logic       := 'Z';
ADC_PDN	                 : inout	std_logic       := 'Z';
ADC_RST	                 : inout	std_logic       := 'Z';
ADC_SDOUT	               : inout	std_logic       := 'Z';
ADC2_SEN	               : inout	std_logic       := 'Z';
ADC_SDATA	               : inout	std_logic       := 'Z';
ADC_SCLK	               : inout	std_logic       := 'Z';
IO_B66_N11               : inout	std_logic       := 'Z';
IO_B66_Y10               : inout	std_logic       := 'Z';

-- Bank 48
ADC2_DD1_n				       : inout	std_logic       := 'Z';
ADC2_DD1_p				       : inout	std_logic       := 'Z';
ADC2_DD0_n				       : inout	std_logic       := 'Z';
ADC2_DD0_p				       : inout	std_logic       := 'Z';
ADC2_DC1_n				       : inout	std_logic       := 'Z';
ADC2_DC1_p				       : inout	std_logic       := 'Z';
IO_B48_L1_AD15_B11_N	   : inout	std_logic       := 'Z';
IO_B48_L1_AD15_C12_P	   : inout	std_logic       := 'Z';
IO_B48_L2_AD14_A11_N	   : inout	std_logic       := 'Z';
IO_B48_L2_AD14_A12_P	   : inout	std_logic       := 'Z';
IO_B48_L3_AD13_A10_N	   : inout	std_logic       := 'Z';
IO_B48_L3_AD13_B10_P	   : inout	std_logic       := 'Z';
IO_B48_L4_AD12_C11_N	   : inout	std_logic       := 'Z';
IO_B48_L4_AD12_D11_P	   : inout	std_logic       := 'Z';
IO_B48_L5_HDGC_D12_N	   : inout	std_logic       := 'Z';
IO_B48_L5_HDGC_E12_P	   : inout	std_logic       := 'Z';
IO_B48_L6_HDGC_D10_N	   : inout	std_logic       := 'Z';
IO_B48_L6_HDGC_E10_P	   : inout	std_logic       := 'Z';
ADC2_FCLK_n				       : inout	std_logic       := 'Z';
ADC2_FCLK_p				       : inout	std_logic       := 'Z';
PEO_LVDS_TRIG_n				   : inout	std_logic       := 'Z';
PEO_LVDS_TRIG_p				   : inout	std_logic       := 'Z';
ADC2_DC0_n				       : inout	std_logic       := 'Z';
ADC2_DC0_p				       : inout	std_logic       := 'Z';

-- Bank 47
ADC2_DB0_n				       : inout	std_logic       := 'Z';
ADC2_DB0_p				       : inout	std_logic       := 'Z';
LVDS_SMA_RJ45_CLK1_N	   : inout	std_logic       := 'Z';
LVDS_SMA_RJ45_CLK1_P	   : inout	std_logic       := 'Z';
IO_B47_L12_AD0_H13_N	   : inout	std_logic       := 'Z';
IO_B47_L12_AD0_H14_P	   : inout	std_logic       := 'Z';
IO_B47_L1_AD11_A15_N	   : inout	std_logic       := 'Z';
IO_B47_L1_AD11_B15_P	   : inout	std_logic       := 'Z';
IO_B47_L2_AD10_A14_N	   : inout	std_logic       := 'Z';
IO_B47_L2_AD10_B14_P	   : inout	std_logic       := 'Z';
IO_B47_L3_AD9_A13_N		   : inout	std_logic       := 'Z';
IO_B47_L3_AD9_B13_P		   : inout	std_logic       := 'Z';
IO_B47_L4_AD8_C13_N		   : inout	std_logic       := 'Z';
IO_B47_L4_AD8_C14_P		   : inout	std_logic       := 'Z';
ADC2_DCLK_n              : inout	std_logic       := 'Z';
ADC2_DCLK_p              : inout	std_logic       := 'Z';
IO_B47_L6_HDGC_AD6_E13_N : inout	std_logic       := 'Z';
IO_B47_L6_HDGC_AD6_E14_P : inout	std_logic       := 'Z';
ADC2_DA0_n               : inout	std_logic       := 'Z';
ADC2_DA0_p               : inout	std_logic       := 'Z';
ADC2_DB1_n               : inout	std_logic       := 'Z';
ADC2_DB1_p               : inout	std_logic       := 'Z';
ADC2_DA1_n					     : inout	std_logic       := 'Z';
ADC2_DA1_p					     : inout	std_logic       := 'Z'

);
end system_top;

---------------------------------------------------------------------------------------------------
-- architecture declaration


architecture rtl of system_top is

    component MercuryXU1_wrapper is
    port (
    GPIO_tri_o : out STD_LOGIC_VECTOR ( 19 downto 0 );
    pl_clk1 : out STD_LOGIC;
    pl_resetn0 : out STD_LOGIC;
    ps_master_i2c_scl_io : inout STD_LOGIC;
    ps_master_i2c_sda_io : inout STD_LOGIC;
    ps_spi_0_io0_io : inout STD_LOGIC;
    ps_spi_0_io1_io : inout STD_LOGIC;
    ps_spi_0_sck_io : inout STD_LOGIC;
    emio_spi0_ss_in : in STD_LOGIC;
    emio_spi0_ss_tri : out STD_LOGIC;
    emio_spi0_ss_out : out STD_LOGIC;
    ps_spi_1_io0_io : inout STD_LOGIC;
    ps_spi_1_io1_io : inout STD_LOGIC;
    ps_spi_1_sck_io : inout STD_LOGIC;
    ps_spi_1_ss_io : inout STD_LOGIC
    );
    end component MercuryXU1_wrapper;

    component clk_wiz_0_b65_mmcm
    port
    (-- Clock in ports
    -- Clock out ports
    clk_out1_b65_mmcm_b64_375p0     : out    std_logic;
    clk_out2_b65_mmcm_b65_375p0     : out    std_logic;
    clk_out3_b65_mmcm_b66_375p0     : out    std_logic;
    clk_out4_b65_62p5               : out    std_logic;
    -- Status and control signals
    reset                           : in     std_logic;
    locked                          : out    std_logic;
    clk_in1_p                       : in     std_logic;
    clk_in1_n                       : in     std_logic
    );
    end component;

    component clk_wiz_1_b64_b66_pll
    port
    (-- Clock in ports
    -- Clock out ports
    clk_out1_pll_375p0          : out    std_logic;
    clk_out2_pll_62p5           : out    std_logic;
    -- Status and control signals
    reset                       : in     std_logic;
    locked                      : out    std_logic;
    clk_in1                     : in     std_logic
    );
    end component;

-----------------------------------------------------------------------------------------------
-- signals
-----------------------------------------------------------------------------------------------

    -- XU1 signals
    signal Rst_N 			: std_logic := '1';
    signal Rst            : std_logic := '0';
    signal Clk			: std_logic;
    signal RstCnt         : unsigned (15 downto 0) := (others => '0');
    signal LedCount       : unsigned (23 downto 0);

    -- ps
    signal Gpio                : std_logic_vector (19 downto 0);
    -- LVDS output signals
    signal RJ45_LVDS_TRIG : std_logic;


    -- serial
    signal adc_ss_in  : std_logic;
    signal adc_ss_tri : std_logic;
    signal adc_ss_out : std_logic;

    -- mark debug
    attribute mark_debug : string;
    attribute mark_debug of ADC_SDATA: signal is "true";
    attribute mark_debug of ADC_SDOUT: signal is "true";
    attribute mark_debug of ADC_SCLK: signal is "true";
    attribute mark_debug of ADC_PDN: signal is "true";
    attribute mark_debug of ADC_RST: signal is "true";
    attribute mark_debug of ADC0_SEN: signal is "true";
    attribute mark_debug of ADC1_SEN: signal is "true";
    attribute mark_debug of ADC2_SEN: signal is "true";
    attribute mark_debug of ADC3_SEN: signal is "true";
    attribute mark_debug of ADC4_SEN: signal is "true";



begin

-----------------------------------------------------------------------------------------------
-- processor system
-----------------------------------------------------------------------------------------------

  	 MercuryXU1_i: component MercuryXU1_wrapper
     port map (
     gpio_tri_o(19 downto 0) => Gpio(19 downto 0),
     pl_clk1                 => Clk,
     pl_resetn0              => Rst_N,
     ps_master_i2c_scl_io    => I2c_Scl,
     ps_master_i2c_sda_io    => I2c_Sda,
     ps_spi_0_io0_io         => ADC_SDATA, -- adc mosi
     ps_spi_0_io1_io         => ADC_SDOUT, -- adc miso
     ps_spi_0_sck_io         => ADC_SCLK, -- adc sclk
     emio_spi0_ss_in         => '0',  -- gpio ss enable
     emio_spi0_ss_tri        => open,       -- see AR# 56858
     emio_spi0_ss_out        => adc_ss_in,       -- see AR# 56858
     ps_spi_1_io0_io         => FPGA_SDATA, -- max10 mosi
     ps_spi_1_io1_io         => FPGA_SDOUT, -- max10 miso
     ps_spi_1_sck_io         => FPGA_SCLK, -- max10 sclk
     ps_spi_1_ss_io          => SEL0   -- use as enable for gpio ss
     );

    ------------------------------------------------------------------------------------------------
    -- serial
    ------------------------------------------------------------------------------------------------
    -- spi (must correctly set in ps)
    ADC_PDN  <= Gpio(6);
    ADC_RST  <= Gpio(5);
    ADC4_SEN <= (Gpio(4) or adc_ss_in);
    ADC3_SEN <= (Gpio(3) or adc_ss_in);
    ADC2_SEN <= (Gpio(2) or adc_ss_in);
    ADC1_SEN <= (Gpio(1) or adc_ss_in);
    ADC0_SEN <= (Gpio(0) or adc_ss_in);

    ------------------------------------------------------------------------------------------------
    --  RJ45 Trigger
    ------------------------------------------------------------------------------------------------

    ------------------------------------------------------------------------------------------------
    --  Clock and Reset
    ------------------------------------------------------------------------------------------------

    process (Clk)
    begin
        if rising_edge (Clk) then
            if (not RstCnt) = 0 then
                Rst         <= '0';
            else
                Rst         <= '1';
                RstCnt      <= RstCnt + 1;
            end if;
        end if;
    end process;

    ------------------------------------------------------------------------------------------------
    -- Blinking LED counter & LED assignment
    ------------------------------------------------------------------------------------------------

    process (Clk)
    begin
        if rising_edge (Clk) then
            if Rst = '1' then
                LedCount    <= (others => '0');
            else
                LedCount <= LedCount + 1;
            end if;
        end if;
    end process;

    Led2_N <= LedCount(23) xor Gpio(2);
--    Led2_N <= Gpio(2);

end rtl;


---------------------------------------------------------------------------------------------------
-- eof
---------------------------------------------------------------------------------------------------
