-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1.1 (lin64) Build 2960000 Wed Aug  5 22:57:21 MDT 2020
-- Date        : Wed Mar  3 11:10:43 2021
-- Host        : edev running 64-bit Ubuntu 18.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/edev/Source/iwcd-xu1-petalinux-rev0-2020-01/Vivado_NuPRISM/NuPRISM/NuPRISM.srcs/sources_1/ip/clk_wiz_1_b64_b66_pll/clk_wiz_1_b64_b66_pll_stub.vhdl
-- Design      : clk_wiz_1_b64_b66_pll
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu6eg-ffvc900-1-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_1_b64_b66_pll is
  Port ( 
    clk_out1_pll_375p0 : out STD_LOGIC;
    clk_out2_pll_62p5 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end clk_wiz_1_b64_b66_pll;

architecture stub of clk_wiz_1_b64_b66_pll is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1_pll_375p0,clk_out2_pll_62p5,reset,locked,clk_in1";
begin
end;
