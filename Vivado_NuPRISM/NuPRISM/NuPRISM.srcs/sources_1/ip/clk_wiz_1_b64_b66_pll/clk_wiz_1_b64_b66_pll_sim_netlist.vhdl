-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1.1 (lin64) Build 2960000 Wed Aug  5 22:57:21 MDT 2020
-- Date        : Mon Mar  1 15:07:10 2021
-- Host        : edev running 64-bit Ubuntu 18.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/edev/Source/iwcd-xu1-petalinux-rev0-2020-01/Vivado_NuPRISM/NuPRISM/NuPRISM.srcs/sources_1/ip/clk_wiz_1_b64_b66_pll/clk_wiz_1_b64_b66_pll_sim_netlist.vhdl
-- Design      : clk_wiz_1_b64_b66_pll
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu6eg-ffvc900-1-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_wiz_1_b64_b66_pll_clk_wiz_1_b64_b66_pll_clk_wiz is
  port (
    clk_out1_pll_375p0 : out STD_LOGIC;
    clk_out2_pll_62p5 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of clk_wiz_1_b64_b66_pll_clk_wiz_1_b64_b66_pll_clk_wiz : entity is "clk_wiz_1_b64_b66_pll_clk_wiz";
end clk_wiz_1_b64_b66_pll_clk_wiz_1_b64_b66_pll_clk_wiz;

architecture STRUCTURE of clk_wiz_1_b64_b66_pll_clk_wiz_1_b64_b66_pll_clk_wiz is
  signal clk_in1_clk_wiz_1_b64_b66_pll : STD_LOGIC;
  signal clk_out1_pll_375p0_clk_wiz_1_b64_b66_pll : STD_LOGIC;
  signal clk_out2_pll_62p5_clk_wiz_1_b64_b66_pll : STD_LOGIC;
  signal clkfbout_buf_clk_wiz_1_b64_b66_pll : STD_LOGIC;
  signal clkfbout_clk_wiz_1_b64_b66_pll : STD_LOGIC;
  signal NLW_mmcme4_adv_inst_CDDCDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcme4_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcme4_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcme4_adv_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcme4_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcme4_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcme4_adv_inst_CLKOUT2_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcme4_adv_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcme4_adv_inst_CLKOUT3_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcme4_adv_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcme4_adv_inst_CLKOUT4_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcme4_adv_inst_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcme4_adv_inst_CLKOUT6_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcme4_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcme4_adv_inst_PSDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcme4_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkf_buf : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of clkf_buf : label is "BUFG";
  attribute BOX_TYPE of clkin1_bufg : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of clkin1_bufg : label is "BUFG";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of clkout1_buf : label is "BUFG";
  attribute BOX_TYPE of clkout2_buf : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of clkout2_buf : label is "BUFG";
  attribute BOX_TYPE of mmcme4_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFGCE
    generic map(
      CE_TYPE => "ASYNC",
      SIM_DEVICE => "ULTRASCALE_PLUS"
    )
        port map (
      CE => '1',
      I => clkfbout_clk_wiz_1_b64_b66_pll,
      O => clkfbout_buf_clk_wiz_1_b64_b66_pll
    );
clkin1_bufg: unisim.vcomponents.BUFGCE
    generic map(
      CE_TYPE => "ASYNC",
      SIM_DEVICE => "ULTRASCALE_PLUS"
    )
        port map (
      CE => '1',
      I => clk_in1,
      O => clk_in1_clk_wiz_1_b64_b66_pll
    );
clkout1_buf: unisim.vcomponents.BUFGCE
    generic map(
      CE_TYPE => "ASYNC",
      SIM_DEVICE => "ULTRASCALE_PLUS"
    )
        port map (
      CE => '1',
      I => clk_out1_pll_375p0_clk_wiz_1_b64_b66_pll,
      O => clk_out1_pll_375p0
    );
clkout2_buf: unisim.vcomponents.BUFGCE
    generic map(
      CE_TYPE => "ASYNC",
      SIM_DEVICE => "ULTRASCALE_PLUS"
    )
        port map (
      CE => '1',
      I => clk_out2_pll_62p5_clk_wiz_1_b64_b66_pll,
      O => clk_out2_pll_62p5
    );
mmcme4_adv_inst: unisim.vcomponents.MMCME4_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 3.000000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => "FALSE",
      CLKIN1_PERIOD => 2.667000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE_F => 3.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => "FALSE",
      CLKOUT1_DIVIDE => 18,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_USE_FINE_PS => "FALSE",
      CLKOUT2_DIVIDE => 1,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => "FALSE",
      CLKOUT3_DIVIDE => 1,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT3_USE_FINE_PS => "FALSE",
      CLKOUT4_CASCADE => "FALSE",
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_USE_FINE_PS => "FALSE",
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT5_USE_FINE_PS => "FALSE",
      CLKOUT6_DIVIDE => 1,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 0.000000,
      CLKOUT6_USE_FINE_PS => "FALSE",
      COMPENSATION => "BUF_IN",
      DIVCLK_DIVIDE => 1,
      IS_CLKFBIN_INVERTED => '0',
      IS_CLKIN1_INVERTED => '0',
      IS_CLKIN2_INVERTED => '0',
      IS_CLKINSEL_INVERTED => '0',
      IS_PSEN_INVERTED => '0',
      IS_PSINCDEC_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 10000,
      STARTUP_WAIT => "FALSE"
    )
        port map (
      CDDCDONE => NLW_mmcme4_adv_inst_CDDCDONE_UNCONNECTED,
      CDDCREQ => '0',
      CLKFBIN => clkfbout_buf_clk_wiz_1_b64_b66_pll,
      CLKFBOUT => clkfbout_clk_wiz_1_b64_b66_pll,
      CLKFBOUTB => NLW_mmcme4_adv_inst_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_mmcme4_adv_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => clk_in1_clk_wiz_1_b64_b66_pll,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_mmcme4_adv_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => clk_out1_pll_375p0_clk_wiz_1_b64_b66_pll,
      CLKOUT0B => NLW_mmcme4_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => clk_out2_pll_62p5_clk_wiz_1_b64_b66_pll,
      CLKOUT1B => NLW_mmcme4_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => NLW_mmcme4_adv_inst_CLKOUT2_UNCONNECTED,
      CLKOUT2B => NLW_mmcme4_adv_inst_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => NLW_mmcme4_adv_inst_CLKOUT3_UNCONNECTED,
      CLKOUT3B => NLW_mmcme4_adv_inst_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => NLW_mmcme4_adv_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_mmcme4_adv_inst_CLKOUT5_UNCONNECTED,
      CLKOUT6 => NLW_mmcme4_adv_inst_CLKOUT6_UNCONNECTED,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_mmcme4_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_mmcme4_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => locked,
      PSCLK => '0',
      PSDONE => NLW_mmcme4_adv_inst_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_wiz_1_b64_b66_pll is
  port (
    clk_out1_pll_375p0 : out STD_LOGIC;
    clk_out2_pll_62p5 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of clk_wiz_1_b64_b66_pll : entity is true;
end clk_wiz_1_b64_b66_pll;

architecture STRUCTURE of clk_wiz_1_b64_b66_pll is
begin
inst: entity work.clk_wiz_1_b64_b66_pll_clk_wiz_1_b64_b66_pll_clk_wiz
     port map (
      clk_in1 => clk_in1,
      clk_out1_pll_375p0 => clk_out1_pll_375p0,
      clk_out2_pll_62p5 => clk_out2_pll_62p5,
      locked => locked,
      reset => reset
    );
end STRUCTURE;