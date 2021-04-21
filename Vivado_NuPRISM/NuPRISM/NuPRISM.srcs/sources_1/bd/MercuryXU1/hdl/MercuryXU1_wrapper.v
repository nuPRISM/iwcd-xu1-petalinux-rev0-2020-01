//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1.1 (lin64) Build 2960000 Wed Aug  5 22:57:21 MDT 2020
//Date        : Tue Apr 20 10:56:36 2021
//Host        : edev running 64-bit Ubuntu 18.04.5 LTS
//Command     : generate_target MercuryXU1_wrapper.bd
//Design      : MercuryXU1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module MercuryXU1_wrapper
   (GPIO_tri_o,
    emio_spi0_ss_in,
    emio_spi0_ss_out,
    emio_spi0_ss_tri,
    pl_clk1,
    pl_resetn0,
    ps_master_i2c_scl_io,
    ps_master_i2c_sda_io,
    ps_spi_0_io0_io,
    ps_spi_0_io1_io,
    ps_spi_0_sck_io);
  output [19:0]GPIO_tri_o;
  input emio_spi0_ss_in;
  output emio_spi0_ss_out;
  output emio_spi0_ss_tri;
  output pl_clk1;
  output pl_resetn0;
  inout ps_master_i2c_scl_io;
  inout ps_master_i2c_sda_io;
  inout ps_spi_0_io0_io;
  inout ps_spi_0_io1_io;
  inout ps_spi_0_sck_io;

  wire [19:0]GPIO_tri_o;
  wire emio_spi0_ss_in;
  wire emio_spi0_ss_out;
  wire emio_spi0_ss_tri;
  wire pl_clk1;
  wire pl_resetn0;
  wire ps_master_i2c_scl_i;
  wire ps_master_i2c_scl_io;
  wire ps_master_i2c_scl_o;
  wire ps_master_i2c_scl_t;
  wire ps_master_i2c_sda_i;
  wire ps_master_i2c_sda_io;
  wire ps_master_i2c_sda_o;
  wire ps_master_i2c_sda_t;
  wire ps_spi_0_io0_i;
  wire ps_spi_0_io0_io;
  wire ps_spi_0_io0_o;
  wire ps_spi_0_io0_t;
  wire ps_spi_0_io1_i;
  wire ps_spi_0_io1_io;
  wire ps_spi_0_io1_o;
  wire ps_spi_0_io1_t;
  wire ps_spi_0_sck_i;
  wire ps_spi_0_sck_io;
  wire ps_spi_0_sck_o;
  wire ps_spi_0_sck_t;

  MercuryXU1 MercuryXU1_i
       (.GPIO_tri_o(GPIO_tri_o),
        .emio_spi0_ss_in(emio_spi0_ss_in),
        .emio_spi0_ss_out(emio_spi0_ss_out),
        .emio_spi0_ss_tri(emio_spi0_ss_tri),
        .pl_clk1(pl_clk1),
        .pl_resetn0(pl_resetn0),
        .ps_master_i2c_scl_i(ps_master_i2c_scl_i),
        .ps_master_i2c_scl_o(ps_master_i2c_scl_o),
        .ps_master_i2c_scl_t(ps_master_i2c_scl_t),
        .ps_master_i2c_sda_i(ps_master_i2c_sda_i),
        .ps_master_i2c_sda_o(ps_master_i2c_sda_o),
        .ps_master_i2c_sda_t(ps_master_i2c_sda_t),
        .ps_spi_0_io0_i(ps_spi_0_io0_i),
        .ps_spi_0_io0_o(ps_spi_0_io0_o),
        .ps_spi_0_io0_t(ps_spi_0_io0_t),
        .ps_spi_0_io1_i(ps_spi_0_io1_i),
        .ps_spi_0_io1_o(ps_spi_0_io1_o),
        .ps_spi_0_io1_t(ps_spi_0_io1_t),
        .ps_spi_0_sck_i(ps_spi_0_sck_i),
        .ps_spi_0_sck_o(ps_spi_0_sck_o),
        .ps_spi_0_sck_t(ps_spi_0_sck_t));
  IOBUF ps_master_i2c_scl_iobuf
       (.I(ps_master_i2c_scl_o),
        .IO(ps_master_i2c_scl_io),
        .O(ps_master_i2c_scl_i),
        .T(ps_master_i2c_scl_t));
  IOBUF ps_master_i2c_sda_iobuf
       (.I(ps_master_i2c_sda_o),
        .IO(ps_master_i2c_sda_io),
        .O(ps_master_i2c_sda_i),
        .T(ps_master_i2c_sda_t));
  IOBUF ps_spi_0_io0_iobuf
       (.I(ps_spi_0_io0_o),
        .IO(ps_spi_0_io0_io),
        .O(ps_spi_0_io0_i),
        .T(ps_spi_0_io0_t));
  IOBUF ps_spi_0_io1_iobuf
       (.I(ps_spi_0_io1_o),
        .IO(ps_spi_0_io1_io),
        .O(ps_spi_0_io1_i),
        .T(ps_spi_0_io1_t));
  IOBUF ps_spi_0_sck_iobuf
       (.I(ps_spi_0_sck_o),
        .IO(ps_spi_0_sck_io),
        .O(ps_spi_0_sck_i),
        .T(ps_spi_0_sck_t));
endmodule
