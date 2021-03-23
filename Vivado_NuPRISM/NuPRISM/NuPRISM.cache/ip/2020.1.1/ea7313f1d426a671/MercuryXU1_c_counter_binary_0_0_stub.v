// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1.1 (lin64) Build 2960000 Wed Aug  5 22:57:21 MDT 2020
// Date        : Thu Mar 11 15:40:09 2021
// Host        : edev running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ MercuryXU1_c_counter_binary_0_0_stub.v
// Design      : MercuryXU1_c_counter_binary_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu6eg-ffvc900-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_counter_binary_v12_0_14,Vivado 2020.1.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(CLK, Q)
/* synthesis syn_black_box black_box_pad_pin="CLK,Q[15:0]" */;
  input CLK;
  output [15:0]Q;
endmodule
