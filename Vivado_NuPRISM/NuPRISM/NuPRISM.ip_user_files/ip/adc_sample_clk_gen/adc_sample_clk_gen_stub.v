// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1.1 (lin64) Build 2960000 Wed Aug  5 22:57:21 MDT 2020
// Date        : Thu Apr 22 15:16:48 2021
// Host        : edev running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/edev/Source/iwcd-xu1-petalinux-rev0-2020-01/Vivado_NuPRISM/NuPRISM/NuPRISM.srcs/sources_1/ip/adc_sample_clk_gen/adc_sample_clk_gen_stub.v
// Design      : adc_sample_clk_gen
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu6eg-ffvc900-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module adc_sample_clk_gen(clk_out1_62p5, clk_out2_62p5, reset, locked, 
  clk_in1_p, clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="clk_out1_62p5,clk_out2_62p5,reset,locked,clk_in1_p,clk_in1_n" */;
  output clk_out1_62p5;
  output clk_out2_62p5;
  input reset;
  output locked;
  input clk_in1_p;
  input clk_in1_n;
endmodule
