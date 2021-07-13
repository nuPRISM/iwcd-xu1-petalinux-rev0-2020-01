// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Wed Oct 14 11:28:54 2020
// Host        : aurochs running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               d:/My_Designs/FPGA/xilinx/Fizyka/XU1_petalinux_rev0/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/ip/clk_wiz_0_b65_mmcm/clk_wiz_0_b65_mmcm_stub.v
// Design      : clk_wiz_0_b65_mmcm
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu6eg-ffvc900-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0_b65_mmcm(clk_out1_b65_mmcm_b64_375p0, 
  clk_out2_b65_mmcm_b65_375p0, clk_out3_b65_mmcm_b66_375p0, clk_out4_b65_62p5, reset, 
  locked, clk_in1_p, clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="clk_out1_b65_mmcm_b64_375p0,clk_out2_b65_mmcm_b65_375p0,clk_out3_b65_mmcm_b66_375p0,clk_out4_b65_62p5,reset,locked,clk_in1_p,clk_in1_n" */;
  output clk_out1_b65_mmcm_b64_375p0;
  output clk_out2_b65_mmcm_b65_375p0;
  output clk_out3_b65_mmcm_b66_375p0;
  output clk_out4_b65_62p5;
  input reset;
  output locked;
  input clk_in1_p;
  input clk_in1_n;
endmodule
