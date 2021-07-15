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
use IEEE.std_logic_unsigned.all;

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
RJ45_LVDS_TRIG_p	     : in   	std_logic       := 'Z';
RJ45_LVDS_TRIG_n		 : in   	std_logic       := 'Z';
POE_LVDS_TRIG_n          : inout	std_logic       := 'Z';
POE_LVDS_TRIG_p			 : inout	std_logic       := 'Z';

B64_AG13AH13_p           : inout	std_logic       := 'Z';
B64_AG13AH13_n           : inout	std_logic       := 'Z';
B64_AF11AG11_p           : inout	std_logic       := 'Z';
B64_AF11AG11_n           : inout	std_logic       := 'Z';
B64_AG9_PMT_TXRX         : inout	std_logic       := 'Z';
B64_AH11_PMT_RX          : inout	std_logic       := 'Z';
PMT_BOOT              	 : inout	std_logic       := 'Z';

ADC3_DA0_n               : in   	std_logic       := 'Z';
ADC3_DA0_p               : in   	std_logic       := 'Z';
ADC3_DA1_n               : in   	std_logic       := 'Z';
ADC3_DA1_p               : in   	std_logic       := 'Z';
ADC3_DB0_n		    	 : in   	std_logic       := 'Z';
ADC3_DB0_p               : in   	std_logic       := 'Z';
ADC3_DB1_n			     : in   	std_logic       := 'Z';
ADC3_DB1_p			     : in   	std_logic       := 'Z';
ADC3_DC0_p				 : in   	std_logic       := 'Z';
ADC3_DC0_n				 : in   	std_logic       := 'Z';
ADC3_DC1_p				 : in   	std_logic       := 'Z';
ADC3_DC1_n			     : in   	std_logic       := 'Z';
ADC3_DD0_p               : in   	std_logic       := 'Z';
ADC3_DD0_n               : in   	std_logic       := 'Z';
ADC3_DD1_p               : in   	std_logic       := 'Z';
ADC3_DD1_n               : in   	std_logic       := 'Z';
ADC3_FCLK_p			     : in   	std_logic       := 'Z';
ADC3_FCLK_n			     : in   	std_logic       := 'Z';
ADC3_DCLK_p			     : in   	std_logic       := 'Z';
ADC3_DCLK_n			     : in   	std_logic       := 'Z';

ADC4_DA0_n               : in   	std_logic       := 'Z';
ADC4_DA0_p               : in   	std_logic       := 'Z';
ADC4_DA1_p               : in   	std_logic       := 'Z';
ADC4_DA1_n               : in   	std_logic       := 'Z';
ADC4_DB0_n			     : in   	std_logic       := 'Z';
ADC4_DB0_p			     : in   	std_logic       := 'Z';
ADC4_DB1_p               : in   	std_logic       := 'Z';
ADC4_DB1_n               : in   	std_logic       := 'Z';
ADC4_DC0_p               : in   	std_logic       := 'Z';
ADC4_DC0_n               : in   	std_logic       := 'Z';
ADC4_DC1_p			     : in   	std_logic       := 'Z';
ADC4_DC1_n			     : in   	std_logic       := 'Z';
ADC4_DD0_p               : in   	std_logic       := 'Z';
ADC4_DD0_n               : in   	std_logic       := 'Z';
ADC4_DD1_n               : in   	std_logic       := 'Z';
ADC4_DD1_p               : in   	std_logic       := 'Z';
ADC4_FCLK_p              : in   	std_logic       := 'Z';
ADC4_FCLK_n              : in   	std_logic       := 'Z';
ADC4_DCLK_p			     : in   	std_logic       := 'Z';
ADC4_DCLK_n			     : in   	std_logic       := 'Z';

-- Bank 65
ADC0_DA0_n				 : in   	std_logic       := 'Z';
ADC0_DA0_p               : in   	std_logic       := 'Z';
ADC0_DA1_n	         	 : in   	std_logic       := 'Z';
ADC0_DA1_p		      	 : in   	std_logic       := 'Z';
ADC0_DB0_p				 : in   	std_logic       := 'Z';
ADC0_DB0_n				 : in   	std_logic       := 'Z';
ADC0_DB1_p               : in   	std_logic       := 'Z';
ADC0_DB1_n               : in   	std_logic       := 'Z';
ADC0_DC0_p               : in   	std_logic       := 'Z';
ADC0_DC0_n               : in   	std_logic       := 'Z';
ADC0_DC1_n				 : in   	std_logic       := 'Z';
ADC0_DC1_p				 : in   	std_logic       := 'Z';
ADC0_DD0_n               : in   	std_logic       := 'Z';
ADC0_DD0_p               : in   	std_logic       := 'Z';
ADC0_DD1_n               : in   	std_logic       := 'Z';
ADC0_DD1_p               : in   	std_logic       := 'Z';
ADC0_FCLK_p              : in   	std_logic       := 'Z';
ADC0_FCLK_n              : in   	std_logic       := 'Z';
ADC0_DCLK_p				 : in   	std_logic       := 'Z';
ADC0_DCLK_n				 : in   	std_logic       := 'Z';

ADC1_DA0_p               : in   	std_logic       := 'Z';
ADC1_DA0_n               : in   	std_logic       := 'Z';
ADC1_DA1_p               : in   	std_logic       := 'Z';
ADC1_DA1_n               : in   	std_logic       := 'Z';
ADC1_DB0_p               : in   	std_logic       := 'Z';
ADC1_DB0_n               : in   	std_logic       := 'Z';
ADC1_DB1_p               : in   	std_logic       := 'Z';
ADC1_DB1_n               : in   	std_logic       := 'Z';
ADC1_DC0_p               : in   	std_logic       := 'Z';
ADC1_DC0_n               : in   	std_logic       := 'Z';
ADC1_DC1_n               : in   	std_logic       := 'Z';
ADC1_DC1_p               : in   	std_logic       := 'Z';
ADC1_DD0_n               : in   	std_logic       := 'Z';
ADC1_DD0_p               : in   	std_logic       := 'Z';
ADC1_DD1_n		         : in   	std_logic       := 'Z';
ADC1_DD1_p			     : in   	std_logic       := 'Z';
ADC1_FCLK_p              : in   	std_logic       := 'Z';
ADC1_FCLK_n              : in   	std_logic       := 'Z';
ADC1_DCLK_p				 : in   	std_logic       := 'Z';
ADC1_DCLK_n				 : in   	std_logic       := 'Z';

LVDS_MEZZ_RJ45_CLK1_p    : inout    std_logic       := 'Z';
LVDS_MEZZ_RJ45_CLK1_n    : inout    std_logic       := 'Z';

-- Bank 66
ADC2_DA0_n               : in   	std_logic       := 'Z';
ADC2_DA0_p               : in   	std_logic       := 'Z';
ADC2_DA1_n			     : in   	std_logic       := 'Z';
ADC2_DA1_p			     : in   	std_logic       := 'Z';
ADC2_DB0_n			     : in   	std_logic       := 'Z';
ADC2_DB0_p			     : in   	std_logic       := 'Z';
ADC2_DB1_n               : in   	std_logic       := 'Z';
ADC2_DB1_p               : in   	std_logic       := 'Z';
ADC2_DC0_n			     : in   	std_logic       := 'Z';
ADC2_DC0_p			     : in   	std_logic       := 'Z';
ADC2_DC1_n				 : in   	std_logic       := 'Z';
ADC2_DC1_p				 : in   	std_logic       := 'Z';
ADC2_DD0_n				 : in   	std_logic       := 'Z';
ADC2_DD0_p				 : in   	std_logic       := 'Z';
ADC2_DD1_n				 : in   	std_logic       := 'Z';
ADC2_DD1_p				 : in   	std_logic       := 'Z';
ADC2_FCLK_n				 : in   	std_logic       := 'Z';
ADC2_FCLK_p				 : in   	std_logic       := 'Z';
ADC2_DCLK_n              : in   	std_logic       := 'Z';
ADC2_DCLK_p              : in   	std_logic       := 'Z';

ADC0_SEN	              : out 	std_logic       := 'Z';
ADC1_SEN	              : out     std_logic       := 'Z';
ADC2_SEN	              : out 	std_logic       := 'Z';
ADC3_SEN	              : out 	std_logic       := 'Z';
ADC4_SEN	              : out 	std_logic       := 'Z';
ADC_PDN	                  : out 	std_logic       := 'Z';
ADC_RST	                  : out 	std_logic       := 'Z';
ADC_SDOUT	              : inout	std_logic       := 'Z';
ADC_SDATA	              : inout  	std_logic       := 'Z';
ADC_SCLK	              : inout	std_logic       := 'Z';

-- Bank 48
IO_B48_L1_AD15_B11_N	  : inout	std_logic       := 'Z';
IO_B48_L1_AD15_C12_P	  : inout	std_logic       := 'Z';
IO_B48_L2_AD14_A11_N	  : inout	std_logic       := 'Z';
IO_B48_L2_AD14_A12_P	  : inout	std_logic       := 'Z';
IO_B48_L3_AD13_A10_N	  : inout	std_logic       := 'Z';
IO_B48_L3_AD13_B10_P	  : inout	std_logic       := 'Z';
IO_B48_L4_AD12_C11_N	  : inout	std_logic       := 'Z';
IO_B48_L4_AD12_D11_P	  : inout	std_logic       := 'Z';
IO_B48_L5_HDGC_D12_N	  : inout	std_logic       := 'Z';
IO_B48_L5_HDGC_E12_P	  : inout	std_logic       := 'Z';
IO_B48_L6_HDGC_D10_N	  : inout	std_logic       := 'Z';
IO_B48_L6_HDGC_E10_P	  : inout	std_logic       := 'Z';

-- Bank 47
FPGA_UART_RX        	  : inout	std_logic       := 'Z';
FPGA_UART_TX        	  : inout	std_logic       := 'Z';
MEZZ_RJ45_CLK_SEL   	  : inout	std_logic       := 'Z';
CLNR_GPIO                 : inout	std_logic_vector(3 downto 0) := (others => 'Z');
CLNR_nRST                 : inout	std_logic       := 'Z';
CLNR_nINT                 : inout	std_logic       := 'Z';

B47_GC_E14_p              : inout	std_logic       := 'Z';
B47_GC_E14_n              : inout	std_logic       := 'Z';

SFP_TX_Fault              : inout	std_logic       := 'Z';
SFP_ModDet                : inout	std_logic       := 'Z';
SFP_LOS                   : inout	std_logic       := 'Z'
);
end system_top;

---------------------------------------------------------------------------------------------------
-- architecture declaration


architecture rtl of system_top is

    component MercuryXU1_wrapper is
    port (
    adc0_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc10_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc11_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc12_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc13_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc14_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc15_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc16_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc17_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc18_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc19_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc1_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc2_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc3_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc4_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc5_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc6_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc7_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc8_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc9_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc_sample_valid : in STD_LOGIC_VECTOR ( 19 downto 0 );
    emio_spi0_ss_out : out STD_LOGIC;
    gpio : out STD_LOGIC_VECTOR ( 19 downto 0 );
    gpio_delay_ctrl : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pl_clk1 : out STD_LOGIC;
    pl_resetn0 : out STD_LOGIC;
    ps_master_i2c_scl_io : inout STD_LOGIC;
    ps_master_i2c_sda_io : inout STD_LOGIC;
    ps_spi_0_io0_io : inout STD_LOGIC;
    ps_spi_0_io1_io : inout STD_LOGIC;
    ps_spi_0_sck_io : inout STD_LOGIC;
    ps_spi_0_ss_t : out STD_LOGIC;
    sample_clk : in STD_LOGIC
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
    signal gpio_delay_ctrl     : std_logic_vector (31 downto 0);
    -- LVDS output signals
    signal RJ45_LVDS_TRIG : std_logic;

--    signal adc_b65_mmcm_dclk_p          : sl;
--    signal adc_b65_mmcm_dclk_n          : sl;
--    signal adc_b65_b64_mmcm_dclk        : sl;
--    signal adc_b65_b66_mmcm_dclk        : sl;
--    signal adc_b65_sample_clock         : sl;
    
    signal adc_mmcm_dclk_p              : slv(4 downto 0);
    signal adc_mmcm_dclk_n              : slv(4 downto 0);
    signal adc_sample_clock             : slv(4 downto 0);
    signal adc_dclk_diff_p              : slv(4 downto 0);
    signal adc_dclk_diff_n              : slv(4 downto 0);

    -- b64 SERDES
    constant B64_SERDES_WIDTH : integer := 16; -- ADC3 (DA,DB) {4}, ADC4 (!DA) {6}
--    signal adc_b64_sample_clock         : sl;
--    signal adc_b64_pll_dclk_p           : sl;
--    signal adc_b64_pll_dclk_n           : sl;
    signal adc_serdes_locked              : slv(4 downto 0);
    --signal adc_serdes_setDelay            : Slv9Array(8 downto 0);
    signal adc_serdes_loadDelay           : slv(44 downto 0);
    signal adc_serdata_diff_p             : slv(39 downto 0);
    signal adc_serdata_diff_n             : slv(39 downto 0);
    signal adc_par_data                   : slv12array(39 downto 0);
    signal adc_frame_diff_p               : slv(4 downto 0);
    signal adc_frame_diff_n               : slv(4 downto 0);
    --
    signal adc_sample_array      : Slv32Array(19 downto 0);
    signal sample_valid          : std_logic_vector(19 downto 0);

    -- serial
    signal adc_ss_in  : std_logic;
    signal adc_ss_tri : std_logic;
    signal adc_ss_out : std_logic;

    -- mark debug
    attribute mark_debug : string;

    attribute mark_debug of adc_par_data: signal is "true";
    -- attribute mark_debug of adc_b66_par_data: signal is "true";
    attribute mark_debug of adc_serdes_locked: signal is "true";


    attribute mark_debug of ADC0_SEN  : signal is "true";
    attribute mark_debug of ADC1_SEN  : signal is "true";
    attribute mark_debug of ADC2_SEN  : signal is "true";
    attribute mark_debug of ADC3_SEN  : signal is "true";
    attribute mark_debug of ADC4_SEN  : signal is "true";

    attribute mark_debug of Gpio      : signal is "true";
    attribute mark_debug of ADC_RST   : signal is "true";
    attribute mark_debug of ADC_PDN   : signal is "true";

begin

-----------------------------------------------------------------------------------------------
-- processor system
-----------------------------------------------------------------------------------------------

  	 MercuryXU1_i: component MercuryXU1_wrapper
     port map (
     gpio(19 downto 0) => Gpio(19 downto 0),
     gpio_delay_ctrl => gpio_delay_ctrl,
     pl_clk1                 => Clk,
     pl_resetn0              => Rst_N,
     ps_master_i2c_scl_io    => I2c_Scl,
     ps_master_i2c_sda_io    => I2c_Sda,
     ps_spi_0_io0_io         => ADC_SDATA, -- adc mosi
     ps_spi_0_io1_io         => ADC_SDOUT, -- adc miso
     ps_spi_0_sck_io         => ADC_SCLK, -- adc sclk
     emio_spi0_ss_out        => adc_ss_in,       -- see AR# 56858

     adc0_sample => adc_sample_array(0),
     adc1_sample => adc_sample_array(1),
     adc2_sample => adc_sample_array(2),
     adc3_sample => adc_sample_array(3),
     adc4_sample => adc_sample_array(4),
     adc5_sample => adc_sample_array(5),
     adc6_sample => adc_sample_array(6),
     adc7_sample => adc_sample_array(7),
     adc8_sample => adc_sample_array(8),
     adc9_sample => adc_sample_array(9),
     adc10_sample => adc_sample_array(10),
     adc11_sample => adc_sample_array(11),
     adc12_sample => adc_sample_array(12),
     adc13_sample => adc_sample_array(13),
     adc14_sample => adc_sample_array(14),
     adc15_sample => adc_sample_array(15),
     adc16_sample => adc_sample_array(16),
     adc17_sample => adc_sample_array(17),
     adc18_sample => adc_sample_array(18),
     adc19_sample => adc_sample_array(19),

    adc_sample_valid => sample_valid,
    sample_clk => adc_sample_clock(0)
   );

    ------------------------------------------------------------------------------------------------
    -- serial
    ------------------------------------------------------------------------------------------------
    -- spi (must correctly set in ps)
    ADC_PDN  <= Gpio(6);
    ADC_RST  <= Gpio(5);
    ADC4_SEN <= not (Gpio(4) and adc_ss_in);
    ADC3_SEN <= not (Gpio(3) and adc_ss_in);
    ADC2_SEN <= not (Gpio(2) and adc_ss_in);
    ADC1_SEN <= not (Gpio(1) and adc_ss_in);
    ADC0_SEN <= not (Gpio(0) and adc_ss_in);

    ------------------------------------------------------------------------------------------------
    --  RJ45 Trigger
    ------------------------------------------------------------------------------------------------
    RJ45_LVDS_TRIG_i : IBUFDS
    port map (
  	O  => RJ45_LVDS_TRIG,
  	I  => RJ45_LVDS_TRIG_p,
  	IB => RJ45_LVDS_TRIG_n
    );
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

    Led2_N <= LedCount(23);
--    Led2_N <= Gpio(2);

    -- -----------------------------------------------------------------------------------------------
    -- -- Clock Management & PLLs
    -- -----------------------------------------------------------------------------------------------
--    serdes_clock_b65 : clk_wiz_0_b65_mmcm
--    port map (
--    -- Clock out ports
--    clk_out1_b65_mmcm_b64_375p0 => adc_b65_b64_mmcm_dclk,
--    clk_out2_b65_mmcm_b65_375p0 => adc_b65_mmcm_dclk_p,
--    clk_out3_b65_mmcm_b66_375p0 => adc_b65_b66_mmcm_dclk,
--    clk_out4_b65_62p5           => adc_b65_sample_clock,
--    -- Status and control signals
--    reset => '0',
--    locked => open,
--    -- Clock in ports
--    clk_in1_p => ADC1_DCLK_p,
--    clk_in1_n => ADC1_DCLK_n
--    );
--    adc_b65_mmcm_dclk_n <= not(adc_b65_mmcm_dclk_p);

--    serdes_clock_b64 : clk_wiz_1_b64_b66_pll
--    port map (
--    -- Clock out ports
--    clk_out1_pll_375p0 => adc_b64_pll_dclk_p,
--    clk_out2_pll_62p5 => adc_b64_sample_clock,
--    -- Status and control signals
--    reset => '0',
--    locked => open,
--    -- Clock in ports
--    clk_in1 => adc_b65_b64_mmcm_dclk
--    );
--    adc_b64_pll_dclk_n <= not(adc_b64_pll_dclk_p);

    -- -----------------------------------------------------------------------------------------------
    -- b64 Serdes inst
    -- -----------------------------------------------------------------------------------------------
    -- ADC3 (DA,DB) {4}, ADC4 (!DA) {6}

    --adc_serdes_setDelay(0) <= gpio_delay_ctrl(8 downto 0) ;  -- (others => "000000000");

    adc_serdata_diff_p  <=  ADC4_DD1_p & ADC4_DD0_p & ADC4_DC1_p & ADC4_DC0_p & ADC4_DB1_p & ADC4_DB0_p & ADC4_DA1_p & ADC4_DA0_p
                          & ADC3_DD1_p & ADC3_DD0_p & ADC3_DC1_p & ADC3_DC0_p & ADC3_DB1_p & ADC3_DB0_p & ADC3_DA1_p & ADC3_DA0_p
                          & ADC2_DD1_p & ADC2_DD0_p & ADC2_DC1_p & ADC2_DC0_p & ADC2_DB1_p & ADC2_DB0_p & ADC2_DA1_p & ADC2_DA0_p
                          & ADC1_DD1_p & ADC1_DD0_p & ADC1_DC1_p & ADC1_DC0_p & ADC1_DB1_p & ADC1_DB0_p & ADC1_DA1_p & ADC1_DA0_p
                          & ADC0_DD1_p & ADC0_DD0_p & ADC0_DC1_p & ADC0_DC0_p & ADC0_DB1_p & ADC0_DB0_p & ADC0_DA1_p & ADC0_DA0_p;

    adc_serdata_diff_n  <=  ADC4_DD1_n & ADC4_DD0_n & ADC4_DC1_n & ADC4_DC0_n & ADC4_DB1_n & ADC4_DB0_n & ADC4_DA1_n & ADC4_DA0_n
                          & ADC3_DD1_n & ADC3_DD0_n & ADC3_DC1_n & ADC3_DC0_n & ADC3_DB1_n & ADC3_DB0_n & ADC3_DA1_n & ADC3_DA0_n
                          & ADC2_DD1_n & ADC2_DD0_n & ADC2_DC1_n & ADC2_DC0_n & ADC2_DB1_n & ADC2_DB0_n & ADC2_DA1_n & ADC2_DA0_n
                          & ADC1_DD1_n & ADC1_DD0_n & ADC1_DC1_n & ADC1_DC0_n & ADC1_DB1_n & ADC1_DB0_n & ADC1_DA1_n & ADC1_DA0_n
                          & ADC0_DD1_n & ADC0_DD0_n & ADC0_DC1_n & ADC0_DC0_n & ADC0_DB1_n & ADC0_DB0_n & ADC0_DA1_n & ADC0_DA0_n;

    adc_frame_diff_p <= ADC4_FCLK_p & ADC3_FCLK_p & ADC2_FCLK_p & ADC1_FCLK_p & ADC0_FCLK_p;
    adc_frame_diff_n <= ADC4_FCLK_n & ADC3_FCLK_n & ADC2_FCLK_n & ADC1_FCLK_n & ADC0_FCLK_n;
    
    adc_dclk_diff_p <= ADC4_DCLK_p & ADC3_DCLK_p & ADC2_DCLK_p & ADC1_DCLK_p & ADC0_DCLK_p;
    adc_dclk_diff_n <= ADC4_DCLK_n & ADC3_DCLK_n & ADC2_DCLK_n & ADC1_DCLK_n & ADC0_DCLK_n;
    
    adc_mmcm_dclk_n <= not(adc_mmcm_dclk_p);

    B64_C: for adc in 1 to 3 generate -- on ADC channels
        serdes_clock : clk_wiz_0_b65_mmcm
        port map (
        -- Clock out ports
        clk_out1_b65_mmcm_b64_375p0 => open,
        clk_out2_b65_mmcm_b65_375p0 => adc_mmcm_dclk_p(adc),
        clk_out3_b65_mmcm_b66_375p0 => open,
        clk_out4_b65_62p5           => adc_sample_clock(adc),
        -- Status and control signals
        reset => '0',
        locked => open,
        -- Clock in ports
        clk_in1_p => adc_dclk_diff_p(adc),--ADC1_DCLK_p,
        clk_in1_n => adc_dclk_diff_n(adc) --ADC1_DCLK_n
        );
    end generate;
    adc_mmcm_dclk_p(4) <= adc_mmcm_dclk_p(3);
    adc_sample_clock(4) <= adc_sample_clock(3);
    adc_mmcm_dclk_p(0) <= adc_mmcm_dclk_p(1);
    adc_sample_clock(0) <= adc_sample_clock(1);
        
    B64_S: for adc in 0 to 4 generate -- on ADC channels
         Ad9229Core_b: entity amc_carrier_core.Ad9229Core
        generic map (
            TPD_G             => open,
            IODELAY_GROUP_G   => open,
            N_CHANNELS_G      => 8     -- DA1, DA0, DB1, DB0, DC1, DC0, DD1, DD0
        )
        port map (
            -- Desired sample clock
            sampleClk       => adc_sample_clock(adc),     -- MMCM 62.5MHz clock, derived from DCLK
            sampleRst       => Gpio(5),--'0',                  -- Reset, internally sync'd
            -- Direct To the Chip Interface IO
            fadcClkP_o      => open,                -- Clock generated for ADC, unused for NuPRISM
            fadcClkN_o      => open,                -- Clock generated for ADC, unused for NuPRISM
            fadcFrameClkP_i => adc_frame_diff_p(adc),--ADC4_FCLK_p,    -- ADC Frame Clock, frame pattern is internal
            fadcFrameClkN_i => adc_frame_diff_n(adc),--ADC4_FCLK_n,    -- ADC Frame Clock
            fadcDataClkP_i  => adc_mmcm_dclk_p(adc), -- ADC DCLK, from MMCM
            fadcDataClkN_i  => adc_mmcm_dclk_n(adc), -- ADC DCLK, from MMCM
            serDataP_i      => adc_serdata_diff_p(8*adc+7 downto 8*adc),       -- ADC serial data array
            serDataN_i      => adc_serdata_diff_n(8*adc+7 downto 8*adc),       -- ADC serial data array
            -- Parallel data out
            parData_o       => adc_par_data(8*adc+7 downto 8*adc),        -- ADC parallel data vector array
            locked_o        => adc_serdes_locked(adc),          -- ADC parallel data vector array
            -- IDelay control
            curDelay_o      => open,                -- Current delay for delay buffers
            setDelay_i      => gpio_delay_ctrl(8 downto 0),--adc_serdes_setDelay,       -- Delay update vector array
            setValid_i      => adc_serdes_loadDelay(8+9*adc downto 9*adc) --'0'                  -- Set delay signal
        );
        
        adc_serdes_loadDelay(8+9*adc downto 9*adc) <= "000000000" when gpio_delay_ctrl(9) = '0' or gpio_delay_ctrl(16 downto 14) /= adc else
                                                      "000000001" when gpio_delay_ctrl(13 downto 10) = 0 else
                                                      "000000010" when gpio_delay_ctrl(13 downto 10) = 1 else
                                                      "000000100" when gpio_delay_ctrl(13 downto 10) = 2 else
                                                      "000001000" when gpio_delay_ctrl(13 downto 10) = 3 else
                                                      "000010000" when gpio_delay_ctrl(13 downto 10) = 4 else
                                                      "000100000" when gpio_delay_ctrl(13 downto 10) = 5 else
                                                      "001000000" when gpio_delay_ctrl(13 downto 10) = 6 else
                                                      "010000000" when gpio_delay_ctrl(13 downto 10) = 7 else
                                                      "100000000" when gpio_delay_ctrl(13 downto 10) = 8 else
                                                      "000000000";
        
        B64_A: for channel in 0 to 3 generate -- on ADC channels
          adc_sample_array(4*adc+channel)(27 downto 16) <= adc_par_data(8*adc+2*channel+1)(11 downto 6) & adc_par_data(8*adc+2*channel)(11 downto 6);
          adc_sample_array(4*adc+channel)(31 downto 28) <= adc_par_data(8*adc+2*channel+1)(11) & adc_par_data(8*adc+2*channel+1)(11) & adc_par_data(8*adc+2*channel+1)(11) & adc_par_data(8*adc+2*channel+1)(11);
          adc_sample_array(4*adc+channel)(11 downto 0) <= adc_par_data(8*adc+2*channel+1)(5  downto 0) & adc_par_data(8*adc+2*channel)(5  downto 0);
          adc_sample_array(4*adc+channel)(15 downto 12) <= adc_par_data(8*adc+2*channel+1)(5) & adc_par_data(8*adc+2*channel+1)(5) & adc_par_data(8*adc+2*channel+1)(5) & adc_par_data(8*adc+2*channel+1)(5);
          sample_valid(4*adc+channel) <= adc_serdes_locked(adc);
        end generate;
      end generate;
    

end rtl;


---------------------------------------------------------------------------------------------------
-- eof
---------------------------------------------------------------------------------------------------
