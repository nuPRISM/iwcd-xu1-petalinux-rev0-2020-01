// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1.1 (lin64) Build 2960000 Wed Aug  5 22:57:21 MDT 2020
// Date        : Wed Feb 10 15:30:48 2021
// Host        : edev running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/edev/Source/iwcd-xu1-petalinux-rev0-2020-01/Vivado_NuPRISM/NuPRISM/NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_ila_0_0/MercuryXU1_system_ila_0_0_stub.v
// Design      : MercuryXU1_system_ila_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu6eg-ffvc900-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "bd_6493,Vivado 2020.1.1" *)
module MercuryXU1_system_ila_0_0(clk, probe0, probe1, SLOT_0_SPI_ss_i, 
  SLOT_0_SPI_ss_o, SLOT_0_SPI_ss_t, SLOT_0_SPI_sck_i, SLOT_0_SPI_sck_o, SLOT_0_SPI_sck_t, 
  SLOT_0_SPI_io0_i, SLOT_0_SPI_io0_o, SLOT_0_SPI_io0_t, SLOT_0_SPI_io1_i, SLOT_0_SPI_io1_o, 
  SLOT_0_SPI_io1_t)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[0:0],probe1[0:0],SLOT_0_SPI_ss_i,SLOT_0_SPI_ss_o,SLOT_0_SPI_ss_t,SLOT_0_SPI_sck_i,SLOT_0_SPI_sck_o,SLOT_0_SPI_sck_t,SLOT_0_SPI_io0_i,SLOT_0_SPI_io0_o,SLOT_0_SPI_io0_t,SLOT_0_SPI_io1_i,SLOT_0_SPI_io1_o,SLOT_0_SPI_io1_t" */;
  input clk;
  input [0:0]probe0;
  input [0:0]probe1;
  input SLOT_0_SPI_ss_i;
  input SLOT_0_SPI_ss_o;
  input SLOT_0_SPI_ss_t;
  input SLOT_0_SPI_sck_i;
  input SLOT_0_SPI_sck_o;
  input SLOT_0_SPI_sck_t;
  input SLOT_0_SPI_io0_i;
  input SLOT_0_SPI_io0_o;
  input SLOT_0_SPI_io0_t;
  input SLOT_0_SPI_io1_i;
  input SLOT_0_SPI_io1_o;
  input SLOT_0_SPI_io1_t;
endmodule
