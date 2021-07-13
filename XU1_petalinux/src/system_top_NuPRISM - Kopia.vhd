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
    GPIO_tri_o : out STD_LOGIC_VECTOR ( 19 downto 0 );
    emio_spi0_ss_out : out STD_LOGIC;
    pl_clk1 : out STD_LOGIC;
    pl_resetn0 : out STD_LOGIC;
    ps_master_i2c_scl_io : inout STD_LOGIC;
    ps_master_i2c_sda_io : inout STD_LOGIC;
    ps_spi_0_io0_io : inout STD_LOGIC;
    ps_spi_0_io1_io : inout STD_LOGIC;
    ps_spi_0_sck_io : inout STD_LOGIC;
    ps_spi_0_ss_t : out STD_LOGIC
    );
    end component MercuryXU1_wrapper;

    component mmcm_serdes
    port
    (-- Clock in ports
    -- Clock out ports
    clk_375p0                       : out    std_logic;
    clk_62p5                        : out    std_logic;
    -- Status and control signals
    reset                           : in     std_logic;
    locked                          : out    std_logic;
    clk_in1_p                       : in     std_logic;
    clk_in1_n                       : in     std_logic
    );
    end component;

    component pll_serdes
    port
    (-- Clock in ports
    -- Clock out ports
    clk_375p0                       : out    std_logic;
    clk_62p5                        : out    std_logic;
    -- Status and control signals
    reset                           : in     std_logic;
    locked                          : out    std_logic;
    clk_in1                         : in     std_logic
    );
    end component;

-----------------------------------------------------------------------------------------------
-- signals
-----------------------------------------------------------------------------------------------

    -- XU1 signals
    signal Rst_N 	           : std_logic := '1';
    signal Rst                 : std_logic := '0';
    signal Clk		           : std_logic;
    signal RstCnt              : unsigned (15 downto 0) := (others => '0');
    signal LedCount            : unsigned (23 downto 0);
    signal adc_dclk    	       : std_logic_vector(4 downto 0);
    signal adc_dclk_p  	       : std_logic_vector(4 downto 0);
    signal adc_dclk_n  	       : std_logic_vector(4 downto 0);
    signal adc_fclk_p  	       : std_logic_vector(4 downto 0);
    signal adc_fclk_n  	       : std_logic_vector(4 downto 0);
    signal adc_sample_clk      : std_logic_vector(4 downto 0);
    signal pll_dclk_p  	       : std_logic_vector(4 downto 0);
    signal pll_dclk_n  	       : std_logic_vector(4 downto 0);
    signal serdes_locked       : std_logic_vector(4 downto 0);
    signal adc_serdata_diff_p  : slv(39 downto 0);
    signal adc_serdata_diff_n  : slv(39 downto 0);
    signal adc_pardata         : slv12array(39 downto 0);
    signal adc_serdes_setDelay : Slv9Array(8 downto 0);

    -- ps
    signal Gpio                : std_logic_vector (19 downto 0);
    -- LVDS output signals
    signal RJ45_LVDS_TRIG : std_logic;


--    -- serial
--    signal adc_ss_in  : std_logic;
--    signal adc_ss_tri : std_logic;
--    signal adc_ss_out : std_logic;

--    -- mark debug
--    attribute mark_debug : string;
--    attribute mark_debug of ADC_SDATA: signal is "true";
--    attribute mark_debug of ADC_SDOUT: signal is "true";
--    attribute mark_debug of ADC_SCLK: signal is "true";
--    attribute mark_debug of ADC_PDN: signal is "true";
--    attribute mark_debug of ADC_RST: signal is "true";
--    attribute mark_debug of ADC0_SEN: signal is "true";
--    attribute mark_debug of ADC1_SEN: signal is "true";
--    attribute mark_debug of ADC2_SEN: signal is "true";
--    attribute mark_debug of ADC3_SEN: signal is "true";
--    attribute mark_debug of ADC4_SEN: signal is "true";

    -- b65 SERDES
--    constant B65_SERDES_WIDTH : integer := 16; -- ADC0 (All) {8}, ADC1 (!DD) {6}, ADC3 (DC) {2}, ADC4 (DA) {2}
--    signal adc_b65_serdes_locked        : sl;
--    signal adc_b65_serdes_setDelay      : Slv9Array(B65_SERDES_WIDTH downto 0);
--    signal adc_b65_serdata_diff_p       : slv(B65_SERDES_WIDTH-1 downto 0);
--    signal adc_b65_serdata_diff_n       : slv(B65_SERDES_WIDTH-1 downto 0);
--    signal adc_b65_par_data             : slv12array(B65_SERDES_WIDTH-1 downto 0);
--    signal adc_b65_sample_clock         : sl;
--    signal adc_b65_mmcm_dclk_p          : sl;
--    signal adc_b65_mmcm_dclk_n          : sl;

--    signal adc_b651_serdes_locked        : sl;
--    signal adc_b651_sample_clock         : sl;
--    signal adc_b651_mmcm_dclk_p          : sl;
--    signal adc_b651_mmcm_dclk_n          : sl;

--    -- b66 SERDES
--    constant B66_SERDES_WIDTH : integer := 8; -- ADC0 (All) {8}, ADC1 (!DD) {6}, ADC3 (DC) {2}, ADC4 (DA) {2}
--    signal adc_b66_serdes_locked        : sl;
--    signal adc_b66_serdes_setDelay      : Slv9Array(B66_SERDES_WIDTH downto 0);
--    signal adc_b66_serdata_diff_p       : slv(B66_SERDES_WIDTH-1 downto 0);
--    signal adc_b66_serdata_diff_n       : slv(B66_SERDES_WIDTH-1 downto 0);
--    signal adc_b66_par_data             : slv12array(B66_SERDES_WIDTH-1 downto 0);
--    signal adc_b66_sample_clock         : sl;
--    signal adc_b66_mmcm_dclk_p          : sl;
--    signal adc_b66_mmcm_dclk_n          : sl;

--    -- b64 SERDES
--    constant B64_SERDES_WIDTH : integer := 16; -- ADC3 (DA,DB) {4}, ADC4 (!DA) {6}
--    signal adc_b64_serdes_locked        : sl;
--    signal adc_b64_serdes_setDelay      : Slv9Array(B64_SERDES_WIDTH downto 0);
--    signal adc_b64_serdata_diff_p       : slv(B64_SERDES_WIDTH-1 downto 0);
--    signal adc_b64_serdata_diff_n       : slv(B64_SERDES_WIDTH-1 downto 0);
--    signal adc_b64_par_data             : slv12array(B64_SERDES_WIDTH-1 downto 0);
--    signal adc_b64_sample_clock         : sl;
--    signal adc_b64_mmcm_dclk_p          : sl;
--    signal adc_b64_mmcm_dclk_n          : sl;


    -- SERDES parllel data
    signal adc0_da_pardata_j4    : slv12array(1 downto 0);
    signal adc0_db_pardata_j3    : slv12array(1 downto 0);
    signal adc0_dc_pardata_j2    : slv12array(1 downto 0);
    signal adc0_dd_pardata_j1    : slv12array(1 downto 0);
    
    signal adc1_da_pardata_j8    : slv12array(1 downto 0);
    signal adc1_db_pardata_j7    : slv12array(1 downto 0);
    signal adc1_dc_pardata_j6    : slv12array(1 downto 0);
    signal adc1_dd_pardata_j5    : slv12array(1 downto 0);

    signal adc2_da_pardata_j12   : slv12array(1 downto 0);
    signal adc2_db_pardata_j11   : slv12array(1 downto 0);
    signal adc2_dc_pardata_j10   : slv12array(1 downto 0);
    signal adc2_dd_pardata_j9    : slv12array(1 downto 0);

    -- signal adc1_dd_pardata    : slv12array(1 downto 0);
    signal adc3_da_pardata_j16   : slv12array(1 downto 0);
    signal adc3_db_pardata_j15   : slv12array(1 downto 0);
    signal adc3_dc_pardata_j14   : slv12array(1 downto 0);
    signal adc3_dd_pardata_j13   : slv12array(1 downto 0);
    
    signal adc4_da_pardata_j20   : slv12array(1 downto 0);
    signal adc4_db_pardata_j19   : slv12array(1 downto 0);
    signal adc4_dc_pardata_j18   : slv12array(1 downto 0);
    signal adc4_dd_pardata_j17   : slv12array(1 downto 0);

    -- serial
    signal adc_ss_in  : std_logic;
    signal adc_ss_tri : std_logic;
    signal adc_ss_out : std_logic;

    -- mark debug
    attribute mark_debug : string;

--    attribute mark_debug of adc_b64_par_data: signal is "true";
--    attribute mark_debug of adc_b65_par_data: signal is "true";
--    -- attribute mark_debug of adc_b66_par_data: signal is "true";
--    attribute mark_debug of adc_b65_serdes_locked: signal is "true";
--    attribute mark_debug of adc_b64_serdes_locked: signal is "true";

    attribute mark_debug of serdes_locked: signal is "true";

    attribute mark_debug of adc0_da_pardata_j4: signal is "true";
    attribute mark_debug of adc0_db_pardata_j3: signal is "true";
    attribute mark_debug of adc0_dc_pardata_j2: signal is "true";
    attribute mark_debug of adc0_dd_pardata_j1: signal is "true";

    attribute mark_debug of adc1_da_pardata_j8: signal is "true";
    attribute mark_debug of adc1_db_pardata_j7: signal is "true";
    attribute mark_debug of adc1_dc_pardata_j6: signal is "true";
    attribute mark_debug of adc1_dd_pardata_j5: signal is "true";

    attribute mark_debug of adc2_da_pardata_j12: signal is "true";
    attribute mark_debug of adc2_db_pardata_j11: signal is "true";
    attribute mark_debug of adc2_dc_pardata_j10: signal is "true";
    attribute mark_debug of adc2_dd_pardata_j9: signal is "true";

    attribute mark_debug of adc3_da_pardata_j16: signal is "true";
    attribute mark_debug of adc3_db_pardata_j15: signal is "true";
    attribute mark_debug of adc3_dc_pardata_j14: signal is "true";
    attribute mark_debug of adc3_dd_pardata_j13: signal is "true";

    attribute mark_debug of adc4_da_pardata_j20: signal is "true";
    attribute mark_debug of adc4_db_pardata_j19: signal is "true";
    attribute mark_debug of adc4_dc_pardata_j18: signal is "true";
    attribute mark_debug of adc4_dd_pardata_j17: signal is "true";


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
     emio_spi0_ss_out        => adc_ss_in  -- see AR# 56858
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

--end rtl;

    -- -----------------------------------------------------------------------------------------------
    -- -- Clock Management & PLLs
    -- -----------------------------------------------------------------------------------------------
    adc_dclk_p <= ADC4_DCLK_p & ADC3_DCLK_p & ADC2_DCLK_p & ADC1_DCLK_p & ADC0_DCLK_p;
    adc_dclk_n <= ADC4_DCLK_n & ADC3_DCLK_n & ADC2_DCLK_n & ADC1_DCLK_n & ADC0_DCLK_n;
    adc_fclk_p <= ADC4_FCLK_p & ADC3_FCLK_p & ADC2_FCLK_p & ADC1_FCLK_p & ADC0_FCLK_p;
    adc_fclk_n <= ADC4_FCLK_n & ADC3_FCLK_n & ADC2_FCLK_n & ADC1_FCLK_n & ADC0_FCLK_n;
    
    adc_serdata_diff_p  <= ADC4_DA1_p & ADC4_DA0_p & ADC4_DB1_p & ADC4_DB0_p & ADC4_DC1_p & ADC4_DC0_p & ADC4_DD1_p & ADC4_DD0_p &
                           ADC3_DA1_p & ADC3_DA0_p & ADC3_DB1_p & ADC3_DB0_p & ADC3_DC1_p & ADC3_DC0_p & ADC3_DD1_p & ADC3_DD0_p &
                           ADC2_DA1_p & ADC2_DA0_p & ADC2_DB1_p & ADC2_DB0_p & ADC2_DC1_p & ADC2_DC0_p & ADC2_DD1_p & ADC2_DD0_p &
                           ADC1_DA1_p & ADC1_DA0_p & ADC1_DB1_p & ADC1_DB0_p & ADC1_DC1_p & ADC1_DC0_p & ADC1_DD1_p & ADC1_DD0_p &
                           ADC0_DA1_p & ADC0_DA0_p & ADC0_DB1_p & ADC0_DB0_p & ADC0_DC1_p & ADC0_DC0_p & ADC0_DD1_p & ADC0_DD0_p;
    adc_serdata_diff_n  <= ADC4_DA1_n & ADC4_DA0_n & ADC4_DB1_n & ADC4_DB0_n & ADC4_DC1_n & ADC4_DC0_n & ADC4_DD1_n & ADC4_DD0_n &
                           ADC3_DA1_n & ADC3_DA0_n & ADC3_DB1_n & ADC3_DB0_n & ADC3_DC1_n & ADC3_DC0_n & ADC3_DD1_n & ADC3_DD0_n &
                           ADC2_DA1_n & ADC2_DA0_n & ADC2_DB1_n & ADC2_DB0_n & ADC2_DC1_n & ADC2_DC0_n & ADC2_DD1_n & ADC2_DD0_n &
                           ADC1_DA1_n & ADC1_DA0_n & ADC1_DB1_n & ADC1_DB0_n & ADC1_DC1_n & ADC1_DC0_n & ADC1_DD1_n & ADC1_DD0_n &
                           ADC0_DA1_n & ADC0_DA0_n & ADC0_DB1_n & ADC0_DB0_n & ADC0_DC1_n & ADC0_DC0_n & ADC0_DD1_n & ADC0_DD0_n;

    CMT: for i in 0 to 4 generate
      DSA: IBUFDS 
      port map(
        O => adc_dclk(i),
        I => adc_dclk_p(i),
        IB => adc_dclk_n(i)
      );
      PLLA : pll_serdes
      port map (
        clk_375p0 => pll_dclk_p(i),
        clk_62p5 => adc_sample_clk(i),
        locked => open,
        reset => '0',
        clk_in1 => adc_dclk(i)
      );
      pll_dclk_n(i) <= not(pll_dclk_p(i));
     
      Ad9229Core: entity amc_carrier_core.Ad9229Core
      generic map (
        TPD_G             => open,
        IODELAY_GROUP_G   => open,
        N_CHANNELS_G      => 8     -- DA1, DA0, DB1, DB0, DC1, DC0, DD1, DD0
      )
       port map (
         -- Desired sample clock
        sampleClk       => adc_sample_clk(i),     -- MMCM 62.5MHz clock, derived from DCLK
        sampleRst       => '0',                  -- Reset, internally sync'd
        -- Direct To the Chip Interface IO
        fadcClkP_o      => open,                -- Clock generated for ADC, unused for NuPRISM
        fadcClkN_o      => open,                -- Clock generated for ADC, unused for NuPRISM
        fadcFrameClkP_i => adc_fclk_p(i),    -- ADC Frame Clock, frame pattern is internal
        fadcFrameClkN_i => adc_fclk_n(i),    -- ADC Frame Clock
        fadcDataClkP_i  => pll_dclk_p(i), -- ADC DCLK, from MMCM
        fadcDataClkN_i  => pll_dclk_n(i), -- ADC DCLK, from MMCM
        serDataP_i      => adc_serdata_diff_p(7+8*i downto 8*i),       -- ADC serial data array
        serDataN_i      => adc_serdata_diff_n(7+8*i downto 8*i),       -- ADC serial data array
        -- Parallel data out
        parData_o       => adc_pardata(7+8*i downto 8*i),        -- ADC parallel data vector array
        locked_o        => serdes_locked(i),          -- ADC parallel data vector array
        -- IDelay control
        curDelay_o      => open,                -- Current delay for delay buffers
        setDelay_i      => adc_serdes_setDelay(8 downto 0),       -- Delay update vector array
        setValid_i      => '0'                  -- Set delay signal
      );
    
    
    end generate;
    
    adc_serdes_setDelay <= (others => "000000000");

    -- ADC0
    adc0_da_pardata_j4(1) <= adc_pardata(7)(11 downto 6) & adc_pardata(6)(11 downto 6);
    adc0_da_pardata_j4(0) <= adc_pardata(7)(5  downto 0) & adc_pardata(6)(5  downto 0);

    adc0_db_pardata_j3(1) <= adc_pardata(5)(11 downto 6) & adc_pardata(4)(11 downto 6);
    adc0_db_pardata_j3(0) <= adc_pardata(5)(5  downto 0) & adc_pardata(4)(5  downto 0);

    adc0_dc_pardata_j2(1) <= adc_pardata(3)(11 downto 6) & adc_pardata(2)(11 downto 6);
    adc0_dc_pardata_j2(0) <= adc_pardata(3)(5  downto 0) & adc_pardata(2)(5  downto 0);

    adc0_dd_pardata_j1(1) <= adc_pardata(1)(11 downto 6) & adc_pardata(0)(11 downto 6);
    adc0_dd_pardata_j1(0) <= adc_pardata(1)(5  downto 0) & adc_pardata(0)(5  downto 0);
    
    -- ADC1
    adc1_da_pardata_j8(1) <= adc_pardata(15)(11 downto 6) & adc_pardata(14)(11 downto 6);
    adc1_da_pardata_j8(0) <= adc_pardata(15)(5  downto 0) & adc_pardata(14)(5  downto 0);

    adc1_db_pardata_j7(1) <= adc_pardata(13)(11 downto 6) & adc_pardata(12)(11 downto 6);
    adc1_db_pardata_j7(0) <= adc_pardata(13)(5  downto 0) & adc_pardata(12)(5  downto 0);

    adc1_dc_pardata_j6(1) <= adc_pardata(11)(11 downto 6) & adc_pardata(10)(11 downto 6);
    adc1_dc_pardata_j6(0) <= adc_pardata(11)(5  downto 0) & adc_pardata(10)(5  downto 0);

    adc1_dd_pardata_j5(1) <= adc_pardata(9)(11 downto 6) & adc_pardata(8)(11 downto 6);
    adc1_dd_pardata_j5(0) <= adc_pardata(9)(5  downto 0) & adc_pardata(8)(5  downto 0);

   -- ADC2
    adc2_da_pardata_j12(1) <= adc_pardata(23)(11 downto 6) & adc_pardata(22)(11 downto 6);
    adc2_da_pardata_j12(0) <= adc_pardata(23)(5  downto 0) & adc_pardata(22)(5  downto 0);

    adc2_db_pardata_j11(1) <= adc_pardata(21)(11 downto 6) & adc_pardata(20)(11 downto 6);
    adc2_db_pardata_j11(0) <= adc_pardata(21)(5  downto 0) & adc_pardata(20)(5  downto 0);

    adc2_dc_pardata_j10(1) <= adc_pardata(19)(11 downto 6) & adc_pardata(18)(11 downto 6);
    adc2_dc_pardata_j10(0) <= adc_pardata(19)(5  downto 0) & adc_pardata(18)(5  downto 0);

    adc2_dd_pardata_j9(1) <= adc_pardata(17)(11 downto 6) & adc_pardata(16)(11 downto 6);
    adc2_dd_pardata_j9(0) <= adc_pardata(17)(5  downto 0) & adc_pardata(16)(5  downto 0);

    -- ADC3
    adc3_da_pardata_j16(1) <= adc_pardata(31)(11 downto 6) & adc_pardata(30)(11 downto 6);
    adc3_da_pardata_j16(0) <= adc_pardata(31)(5  downto 0) & adc_pardata(30)(5  downto 0);

    adc3_db_pardata_j15(1) <= adc_pardata(29)(11 downto 6) & adc_pardata(28)(11 downto 6);
    adc3_db_pardata_j15(0) <= adc_pardata(29)(5  downto 0) & adc_pardata(28)(5  downto 0);

    adc3_dc_pardata_j14(1) <= adc_pardata(27)(11 downto 6) & adc_pardata(26)(11 downto 6);
    adc3_dc_pardata_j14(0) <= adc_pardata(27)(5  downto 0) & adc_pardata(26)(5  downto 0);

    adc3_dd_pardata_j13(1) <= adc_pardata(25)(11 downto 6) & adc_pardata(24)(11 downto 6);
    adc3_dd_pardata_j13(0) <= adc_pardata(25)(5  downto 0) & adc_pardata(24)(5  downto 0);

    -- ADC4
    adc4_da_pardata_j20(1) <= adc_pardata(39)(11 downto 6) & adc_pardata(38)(11 downto 6);
    adc4_da_pardata_j20(0) <= adc_pardata(39)(5  downto 0) & adc_pardata(38)(5  downto 0);

    adc4_db_pardata_j19(1) <= adc_pardata(37)(11 downto 6) & adc_pardata(36)(11 downto 6);
    adc4_db_pardata_j19(0) <= adc_pardata(37)(5  downto 0) & adc_pardata(36)(5  downto 0);

    adc4_dc_pardata_j18(1) <= adc_pardata(35)(11 downto 6) & adc_pardata(34)(11 downto 6);
    adc4_dc_pardata_j18(0) <= adc_pardata(35)(5  downto 0) & adc_pardata(34)(5  downto 0);

    adc4_dd_pardata_j17(1) <= adc_pardata(33)(11 downto 6) & adc_pardata(32)(11 downto 6);
    adc4_dd_pardata_j17(0) <= adc_pardata(33)(5  downto 0) & adc_pardata(32)(5  downto 0);


--    serdes_clock_b65 : mmcm_serdes
--    port map (
--    -- Clock out ports
--    clk_375p0 => adc_b65_mmcm_dclk_p,
--    clk_62p5 => adc_b65_sample_clock,
--    -- Status and control signals
--    reset => '0',
--    locked => open,
--    -- Clock in ports
--    clk_in1_p => ADC0_DCLK_p,
--    clk_in1_n => ADC0_DCLK_n
--    );
--    adc_b65_mmcm_dclk_n <= not(adc_b65_mmcm_dclk_p);

--    serdes_ibufds_b651: IBUFDS port map(
--    O => adc_dclk(1),
--    I => ADC1_DCLK_p,
--    IB => ADC1_DCLK_n);

--    serdes_clock_b651 : mmcm_serdes_1
--    port map (
--    -- Clock out ports
--    clk_375p0 => adc_b651_mmcm_dclk_p,
--    clk_62p5 => adc_b651_sample_clock,
--    -- Status and control signals
--    reset => '0',
--    --locked => open,
--    -- Clock in ports
--    clk_in1 => adc_dclk(1)
--    --clk_in1_p => ADC1_DCLK_p,
--    --clk_in1_n => ADC1_DCLK_n
--    );
--    adc_b651_mmcm_dclk_n <= not(adc_b651_mmcm_dclk_p);

--    serdes_clock_b66 : mmcm_serdes
--    port map (
--    -- Clock out ports
--    clk_375p0 => adc_b66_mmcm_dclk_p,
--    clk_62p5 => adc_b66_sample_clock,
--    -- Status and control signals
--    reset => '0',
--    locked => open,
--    -- Clock in ports
--    clk_in1_p => ADC2_DCLK_p,
--    clk_in1_n => ADC2_DCLK_n
--    );
--    adc_b66_mmcm_dclk_n <= not(adc_b66_mmcm_dclk_p);

--      serdes_clock_b64 : mmcm_serdes -- clk_wiz_1_b64_b66_pll
--    port map (
--    -- Clock out ports
--    clk_375p0 => adc_b64_mmcm_dclk_p,
--    clk_62p5 => adc_b64_sample_clock,
--    -- Status and control signals
--    reset => '0',
--    locked => open,
--    -- Clock in ports
--    --clk_in1 => adc_b65_b64_mmcm_dclk
--    clk_in1_p => ADC4_DCLK_p,
--    clk_in1_n => ADC4_DCLK_n    
--    );
--    adc_b64_mmcm_dclk_n <= not(adc_b64_mmcm_dclk_p);

  -- -----------------------------------------------------------------------------------------------
    -- b65 Serdes inst
    -- -----------------------------------------------------------------------------------------------

    -- ADC0 (All) {8}, ADC1 (!DD) {6}, ADC3 (DC) {2}, ADC4 (DA) {2}

--    adc_b65_serdes_setDelay <= (others => "000000000");

--    adc_b65_serdata_diff_p  <= ADC0_DA1_p & ADC0_DA0_p & ADC0_DB1_p & ADC0_DB0_p & ADC0_DC1_p & ADC0_DC0_p & ADC0_DD1_p & ADC0_DD0_p &
--                               ADC1_DA1_p & ADC1_DA0_p & ADC1_DB1_p & ADC1_DB0_p & ADC1_DC1_p & ADC1_DC0_p & ADC1_DD1_p & ADC1_DD0_p;

--    adc_b65_serdata_diff_n  <= ADC0_DA1_n & ADC0_DA0_n & ADC0_DB1_n & ADC0_DB0_n & ADC0_DC1_n & ADC0_DC0_n & ADC0_DD1_n & ADC0_DD0_n &
--                               ADC1_DA1_n & ADC1_DA0_n & ADC1_DB1_n & ADC1_DB0_n & ADC1_DC1_n & ADC1_DC0_n & ADC1_DD1_n & ADC1_DD0_n;

--    Ad9229Core_b65: entity amc_carrier_core.Ad9229Core
--    generic map (
--    TPD_G             => open,
--    IODELAY_GROUP_G   => open,
--    N_CHANNELS_G      => B65_SERDES_WIDTH/2     -- DA1, DA0, DB1, DB0, DC1, DC0, DD1, DD0
--    )
--    port map (
--    -- Desired sample clock
--    sampleClk       => adc_b65_sample_clock,     -- MMCM 62.5MHz clock, derived from DCLK
--    sampleRst       => '0',                  -- Reset, internally sync'd
--    -- Direct To the Chip Interface IO
--    fadcClkP_o      => open,                -- Clock generated for ADC, unused for NuPRISM
--    fadcClkN_o      => open,                -- Clock generated for ADC, unused for NuPRISM
--    fadcFrameClkP_i => ADC0_FCLK_p,    -- ADC Frame Clock, frame pattern is internal
--    fadcFrameClkN_i => ADC0_FCLK_n,    -- ADC Frame Clock
--    fadcDataClkP_i  => adc_b65_mmcm_dclk_p, -- ADC DCLK, from MMCM
--    fadcDataClkN_i  => adc_b65_mmcm_dclk_n, -- ADC DCLK, from MMCM
--    serDataP_i      => adc_b65_serdata_diff_p(15 downto 8),       -- ADC serial data array
--    serDataN_i      => adc_b65_serdata_diff_n(15 downto 8),       -- ADC serial data array
--    -- Parallel data out
--    parData_o       => adc_b65_par_data(15 downto 8),        -- ADC parallel data vector array
--    locked_o        => adc_b65_serdes_locked,          -- ADC parallel data vector array
--    -- IDelay control
--    curDelay_o      => open,                -- Current delay for delay buffers
--    setDelay_i      => adc_b65_serdes_setDelay(8 downto 0),       -- Delay update vector array
--    setValid_i      => '0'                  -- Set delay signal
--    );

--    adc0_da_pardata_j4(1) <= adc_b65_par_data(15)(11 downto 6) & adc_b65_par_data(14)(11 downto 6);
--    adc0_da_pardata_j4(0) <= adc_b65_par_data(15)(5  downto 0) & adc_b65_par_data(14)(5  downto 0);

--    adc0_db_pardata_j3(1) <= adc_b65_par_data(13)(11 downto 6) & adc_b65_par_data(12)(11 downto 6);
--    adc0_db_pardata_j3(0) <= adc_b65_par_data(13)(5  downto 0) & adc_b65_par_data(12)(5  downto 0);

--    adc0_dc_pardata_j2(1) <= adc_b65_par_data(11)(11 downto 6) & adc_b65_par_data(10)(11 downto 6);
--    adc0_dc_pardata_j2(0) <= adc_b65_par_data(11)(5  downto 0) & adc_b65_par_data(10)(5  downto 0);

--    adc0_dd_pardata_j1(1) <= adc_b65_par_data(9)(11 downto 6) & adc_b65_par_data(8)(11 downto 6);
--    adc0_dd_pardata_j1(0) <= adc_b65_par_data(9)(5  downto 0) & adc_b65_par_data(8)(5  downto 0);

--    Ad9229Core_b651: entity amc_carrier_core.Ad9229Core
--    generic map (
--    TPD_G             => open,
--    IODELAY_GROUP_G   => open,
--    N_CHANNELS_G      => B65_SERDES_WIDTH/2     -- DA1, DA0, DB1, DB0, DC1, DC0, DD1, DD0
--    )
--    port map (
--    -- Desired sample clock
--    sampleClk       => adc_b651_sample_clock,     -- MMCM 62.5MHz clock, derived from DCLK
--    sampleRst       => '0',                  -- Reset, internally sync'd
--    -- Direct To the Chip Interface IO
--    fadcClkP_o      => open,                -- Clock generated for ADC, unused for NuPRISM
--    fadcClkN_o      => open,                -- Clock generated for ADC, unused for NuPRISM
--    fadcFrameClkP_i => ADC1_FCLK_p,    -- ADC Frame Clock, frame pattern is internal
--    fadcFrameClkN_i => ADC1_FCLK_n,    -- ADC Frame Clock
--    fadcDataClkP_i  => adc_b651_mmcm_dclk_p, -- ADC DCLK, from MMCM
--    fadcDataClkN_i  => adc_b651_mmcm_dclk_n, -- ADC DCLK, from MMCM
--    serDataP_i      => adc_b65_serdata_diff_p(7 downto 0),       -- ADC serial data array
--    serDataN_i      => adc_b65_serdata_diff_n(7 downto 0),       -- ADC serial data array
--    -- Parallel data out
--    parData_o       => adc_b65_par_data(7 downto 0),        -- ADC parallel data vector array
--    locked_o        => adc_b651_serdes_locked,          -- ADC parallel data vector array
--    -- IDelay control
--    curDelay_o      => open,                -- Current delay for delay buffers
--    setDelay_i      => adc_b65_serdes_setDelay(8 downto 0),       -- Delay update vector array
--    setValid_i      => '0'                  -- Set delay signal
--    );

--    adc1_da_pardata_j8(1) <= adc_b65_par_data(7)(11 downto 6) & adc_b65_par_data(6)(11 downto 6);
--    adc1_da_pardata_j8(0) <= adc_b65_par_data(7)(5  downto 0) & adc_b65_par_data(6)(5  downto 0);

--    adc1_db_pardata_j7(1) <= adc_b65_par_data(5)(11 downto 6) & adc_b65_par_data(4)(11 downto 6);
--    adc1_db_pardata_j7(0) <= adc_b65_par_data(5)(5  downto 0) & adc_b65_par_data(4)(5  downto 0);

--    adc1_dc_pardata_j6(1) <= adc_b65_par_data(3)(11 downto 6) & adc_b65_par_data(2)(11 downto 6);
--    adc1_dc_pardata_j6(0) <= adc_b65_par_data(3)(5  downto 0) & adc_b65_par_data(2)(5  downto 0);

--    adc1_dd_pardata_j5(1) <= adc_b65_par_data(1)(11 downto 6) & adc_b65_par_data(0)(11 downto 6);
--    adc1_dd_pardata_j5(0) <= adc_b65_par_data(1)(5  downto 0) & adc_b65_par_data(0)(5  downto 0);

    -- -------------------------------    -- -----------------------------------------------------------------------------------------------
    -- b66 Serdes inst
    -- -----------------------------------------------------------------------------------------------

--    adc_b66_serdes_setDelay <= (others => "000000000");
--    adc_b66_serdata_diff_p  <= ADC2_DA1_p & ADC2_DA0_p & ADC2_DB1_p & ADC2_DB0_p & ADC2_DC1_p & ADC2_DC0_p & ADC2_DD1_p & ADC2_DD0_p;
--    adc_b66_serdata_diff_n  <= ADC2_DA1_n & ADC2_DA0_n & ADC2_DB1_n & ADC2_DB0_n & ADC2_DC1_n & ADC2_DC0_n & ADC2_DD1_n & ADC2_DD0_n;
    
--    Ad9229Core_b66: entity amc_carrier_core.Ad9229Core
--    generic map (
--    TPD_G             => open,
--    IODELAY_GROUP_G   => open,
--    N_CHANNELS_G      => B66_SERDES_WIDTH     -- DA1, DA0, DB1, DB0, DC1, DC0, DD1, DD0
--    )
--    port map (
--    -- Desired sample clock
--    sampleClk       => adc_b66_sample_clock,     -- MMCM 62.5MHz clock, derived from DCLK
--    sampleRst       => '0',                  -- Reset, internally sync'd
--    -- Direct To the Chip Interface IO
--    fadcClkP_o      => open,                -- Clock generated for ADC, unused for NuPRISM
--    fadcClkN_o      => open,                -- Clock generated for ADC, unused for NuPRISM
--    fadcFrameClkP_i => ADC2_FCLK_p,    -- ADC Frame Clock, frame pattern is internal
--    fadcFrameClkN_i => ADC2_FCLK_n,    -- ADC Frame Clock
--    fadcDataClkP_i  => adc_b66_mmcm_dclk_p, -- ADC DCLK, from MMCM
--    fadcDataClkN_i  => adc_b66_mmcm_dclk_n, -- ADC DCLK, from MMCM
--    serDataP_i      => adc_b66_serdata_diff_p,       -- ADC serial data array
--    serDataN_i      => adc_b66_serdata_diff_n,       -- ADC serial data array
--    -- Parallel data out
--    parData_o       => adc_b66_par_data,        -- ADC parallel data vector array
--    locked_o        => adc_b66_serdes_locked,          -- ADC parallel data vector array
--    -- IDelay control
--    curDelay_o      => open,                -- Current delay for delay buffers
--    setDelay_i      => adc_b66_serdes_setDelay,       -- Delay update vector array
--    setValid_i      => '0'                  -- Set delay signal
--    );

--    adc2_da_pardata_j12(1) <= adc_b66_par_data(7)(11 downto 6) & adc_b66_par_data(6)(11 downto 6);
--    adc2_da_pardata_j12(0) <= adc_b66_par_data(7)(5  downto 0) & adc_b66_par_data(6)(5  downto 0);

--    adc2_db_pardata_j11(1) <= adc_b66_par_data(5)(11 downto 6) & adc_b66_par_data(4)(11 downto 6);
--    adc2_db_pardata_j11(0) <= adc_b66_par_data(5)(5  downto 0) & adc_b66_par_data(4)(5  downto 0);

--    adc2_dc_pardata_j10(1) <= adc_b66_par_data(3)(11 downto 6) & adc_b66_par_data(2)(11 downto 6);
--    adc2_dc_pardata_j10(0) <= adc_b66_par_data(3)(5  downto 0) & adc_b66_par_data(2)(5  downto 0);

--    adc2_dd_pardata_j9(1) <= adc_b66_par_data(1)(11 downto 6) & adc_b66_par_data(0)(11 downto 6);
--    adc2_dd_pardata_j9(0) <= adc_b66_par_data(1)(5  downto 0) & adc_b66_par_data(0)(5  downto 0);

----------------------------------------------------------------
    -- b64 Serdes inst
    -- -----------------------------------------------------------------------------------------------
    -- ADC3 (DA,DB) {4}, ADC4 (!DA) {6}

--    adc_b64_serdes_setDelay <= (others => "000000000");

--    adc_b64_serdata_diff_p  <=  ADC3_DA1_p & ADC3_DA0_p & ADC3_DB1_p & ADC3_DB0_p & ADC3_DC1_p & ADC3_DC0_p & ADC3_DD1_p & ADC3_DD0_p &
--                                ADC4_DA1_p & ADC4_DA0_p & ADC4_DB1_p & ADC4_DB0_p & ADC4_DC1_p & ADC4_DC0_p & ADC4_DD1_p & ADC4_DD0_p;

--    adc_b64_serdata_diff_n  <=  ADC3_DA1_n & ADC3_DA0_n & ADC3_DB1_n & ADC3_DB0_n & ADC3_DC1_n & ADC3_DC0_n & ADC3_DD1_n & ADC3_DD0_n &
--                                ADC4_DA1_n & ADC4_DA0_n & ADC4_DB1_n & ADC4_DB0_n & ADC4_DC1_n & ADC4_DC0_n & ADC4_DD1_n & ADC4_DD0_n;

--    Ad9229Core_b64: entity amc_carrier_core.Ad9229Core
--    generic map (
--    TPD_G             => open,
--    IODELAY_GROUP_G   => open,
--    N_CHANNELS_G      => B64_SERDES_WIDTH     -- DA1, DA0, DB1, DB0, DC1, DC0, DD1, DD0
--    )
--    port map (
--    -- Desired sample clock
--    sampleClk       => adc_b64_sample_clock,     -- MMCM 62.5MHz clock, derived from DCLK
--    sampleRst       => '0',                  -- Reset, internally sync'd
--    -- Direct To the Chip Interface IO
--    fadcClkP_o      => open,                -- Clock generated for ADC, unused for NuPRISM
--    fadcClkN_o      => open,                -- Clock generated for ADC, unused for NuPRISM
--    fadcFrameClkP_i => ADC4_FCLK_p,    -- ADC Frame Clock, frame pattern is internal
--    fadcFrameClkN_i => ADC4_FCLK_n,    -- ADC Frame Clock
--    fadcDataClkP_i  => adc_b64_mmcm_dclk_p, -- ADC DCLK, from MMCM
--    fadcDataClkN_i  => adc_b64_mmcm_dclk_n, -- ADC DCLK, from MMCM
--    serDataP_i      => adc_b64_serdata_diff_p,       -- ADC serial data array
--    serDataN_i      => adc_b64_serdata_diff_n,       -- ADC serial data array
--    -- Parallel data out
--    parData_o       => adc_b64_par_data,        -- ADC parallel data vector array
--    locked_o        => adc_b64_serdes_locked,          -- ADC parallel data vector array
--    -- IDelay control
--    curDelay_o      => open,                -- Current delay for delay buffers
--    setDelay_i      => adc_b64_serdes_setDelay,       -- Delay update vector array
--    setValid_i      => '0'                  -- Set delay signal
--    );

--    adc3_da_pardata_j16(1) <= adc_b64_par_data(15)(11 downto 6) & adc_b64_par_data(14)(11 downto 6);
--    adc3_da_pardata_j16(0) <= adc_b64_par_data(15)(5  downto 0) & adc_b64_par_data(14)(5  downto 0);

--    adc3_db_pardata_j15(1) <= adc_b64_par_data(13)(11 downto 6) & adc_b64_par_data(12)(11 downto 6);
--    adc3_db_pardata_j15(0) <= adc_b64_par_data(13)(5  downto 0) & adc_b64_par_data(12)(5  downto 0);

--    adc3_dc_pardata_j14(1) <= adc_b64_par_data(11)(11 downto 6) & adc_b64_par_data(10)(11 downto 6);
--    adc3_dc_pardata_j14(0) <= adc_b64_par_data(11)(5  downto 0) & adc_b64_par_data(10)(5  downto 0);

--    adc3_dd_pardata_j13(1) <= adc_b64_par_data(9)(11 downto 6) & adc_b64_par_data(8)(11 downto 6);
--    adc3_dd_pardata_j13(0) <= adc_b64_par_data(9)(5  downto 0) & adc_b64_par_data(8)(5  downto 0);

--    adc4_da_pardata_j20(1) <= adc_b64_par_data(7)(11 downto 6) & adc_b64_par_data(6)(11 downto 6);
--    adc4_da_pardata_j20(0) <= adc_b64_par_data(7)(5  downto 0) & adc_b64_par_data(6)(5  downto 0);

--    adc4_db_pardata_j19(1) <= adc_b64_par_data(5)(11 downto 6) & adc_b64_par_data(4)(11 downto 6);
--    adc4_db_pardata_j19(0) <= adc_b64_par_data(5)(5  downto 0) & adc_b64_par_data(4)(5  downto 0);

--    adc4_dc_pardata_j18(1) <= adc_b64_par_data(3)(11 downto 6) & adc_b64_par_data(2)(11 downto 6);
--    adc4_dc_pardata_j18(0) <= adc_b64_par_data(3)(5  downto 0) & adc_b64_par_data(2)(5  downto 0);

--    adc4_dd_pardata_j17(1) <= adc_b64_par_data(1)(11 downto 6) & adc_b64_par_data(0)(11 downto 6);
--    adc4_dd_pardata_j17(0) <= adc_b64_par_data(1)(5  downto 0) & adc_b64_par_data(0)(5  downto 0);

end rtl;



---------------------------------------------------------------------------------------------------
-- eof
---------------------------------------------------------------------------------------------------
