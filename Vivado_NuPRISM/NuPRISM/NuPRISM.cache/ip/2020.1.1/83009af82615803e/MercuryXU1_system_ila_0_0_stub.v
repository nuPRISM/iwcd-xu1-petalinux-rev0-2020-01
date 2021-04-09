// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1.1 (lin64) Build 2960000 Wed Aug  5 22:57:21 MDT 2020
// Date        : Wed Mar 24 14:46:29 2021
// Host        : edev running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ MercuryXU1_system_ila_0_0_stub.v
// Design      : MercuryXU1_system_ila_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu6eg-ffvc900-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bd_6493,Vivado 2020.1.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, SLOT_0_IIC_scl_i, SLOT_0_IIC_scl_o, 
  SLOT_0_IIC_scl_t, SLOT_0_IIC_sda_i, SLOT_0_IIC_sda_o, SLOT_0_IIC_sda_t)
/* synthesis syn_black_box black_box_pad_pin="clk,SLOT_0_IIC_scl_i,SLOT_0_IIC_scl_o,SLOT_0_IIC_scl_t,SLOT_0_IIC_sda_i,SLOT_0_IIC_sda_o,SLOT_0_IIC_sda_t" */;
  input clk;
  input SLOT_0_IIC_scl_i;
  input SLOT_0_IIC_scl_o;
  input SLOT_0_IIC_scl_t;
  input SLOT_0_IIC_sda_i;
  input SLOT_0_IIC_sda_o;
  input SLOT_0_IIC_sda_t;
endmodule
