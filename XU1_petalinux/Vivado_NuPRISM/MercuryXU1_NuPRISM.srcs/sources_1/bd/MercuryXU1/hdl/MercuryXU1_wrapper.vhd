--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
--Date        : Wed Jan 12 10:38:15 2022
--Host        : hyperk running 64-bit Ubuntu 18.04.6 LTS
--Command     : generate_target MercuryXU1_wrapper.bd
--Design      : MercuryXU1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MercuryXU1_wrapper is
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
    sample_clk : in STD_LOGIC;
    trigger_external : in STD_LOGIC
  );
end MercuryXU1_wrapper;

architecture STRUCTURE of MercuryXU1_wrapper is
  component MercuryXU1 is
  port (
    pl_clk1 : out STD_LOGIC;
    pl_resetn0 : out STD_LOGIC;
    emio_spi0_ss_out : out STD_LOGIC;
    sample_clk : in STD_LOGIC;
    adc1_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio : out STD_LOGIC_VECTOR ( 19 downto 0 );
    adc2_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc_sample_valid : in STD_LOGIC_VECTOR ( 19 downto 0 );
    adc19_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc16_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc18_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc17_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc10_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc5_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc9_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc12_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc11_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc14_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc13_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc0_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc4_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc8_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc3_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc6_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc7_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc15_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_delay_ctrl : out STD_LOGIC_VECTOR ( 31 downto 0 );
    trigger_external : in STD_LOGIC;
    ps_spi_0_sck_i : in STD_LOGIC;
    ps_spi_0_sck_o : out STD_LOGIC;
    ps_spi_0_sck_t : out STD_LOGIC;
    ps_spi_0_io1_i : in STD_LOGIC;
    ps_spi_0_io0_o : out STD_LOGIC;
    ps_spi_0_io0_t : out STD_LOGIC;
    ps_spi_0_io0_i : in STD_LOGIC;
    ps_spi_0_io1_o : out STD_LOGIC;
    ps_spi_0_io1_t : out STD_LOGIC;
    ps_spi_0_ss_t : out STD_LOGIC;
    ps_master_i2c_scl_i : in STD_LOGIC;
    ps_master_i2c_scl_o : out STD_LOGIC;
    ps_master_i2c_scl_t : out STD_LOGIC;
    ps_master_i2c_sda_i : in STD_LOGIC;
    ps_master_i2c_sda_o : out STD_LOGIC;
    ps_master_i2c_sda_t : out STD_LOGIC
  );
  end component MercuryXU1;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal ps_master_i2c_scl_i : STD_LOGIC;
  signal ps_master_i2c_scl_o : STD_LOGIC;
  signal ps_master_i2c_scl_t : STD_LOGIC;
  signal ps_master_i2c_sda_i : STD_LOGIC;
  signal ps_master_i2c_sda_o : STD_LOGIC;
  signal ps_master_i2c_sda_t : STD_LOGIC;
  signal ps_spi_0_io0_i : STD_LOGIC;
  signal ps_spi_0_io0_o : STD_LOGIC;
  signal ps_spi_0_io0_t : STD_LOGIC;
  signal ps_spi_0_io1_i : STD_LOGIC;
  signal ps_spi_0_io1_o : STD_LOGIC;
  signal ps_spi_0_io1_t : STD_LOGIC;
  signal ps_spi_0_sck_i : STD_LOGIC;
  signal ps_spi_0_sck_o : STD_LOGIC;
  signal ps_spi_0_sck_t : STD_LOGIC;
begin
MercuryXU1_i: component MercuryXU1
     port map (
      adc0_sample(31 downto 0) => adc0_sample(31 downto 0),
      adc10_sample(31 downto 0) => adc10_sample(31 downto 0),
      adc11_sample(31 downto 0) => adc11_sample(31 downto 0),
      adc12_sample(31 downto 0) => adc12_sample(31 downto 0),
      adc13_sample(31 downto 0) => adc13_sample(31 downto 0),
      adc14_sample(31 downto 0) => adc14_sample(31 downto 0),
      adc15_sample(31 downto 0) => adc15_sample(31 downto 0),
      adc16_sample(31 downto 0) => adc16_sample(31 downto 0),
      adc17_sample(31 downto 0) => adc17_sample(31 downto 0),
      adc18_sample(31 downto 0) => adc18_sample(31 downto 0),
      adc19_sample(31 downto 0) => adc19_sample(31 downto 0),
      adc1_sample(31 downto 0) => adc1_sample(31 downto 0),
      adc2_sample(31 downto 0) => adc2_sample(31 downto 0),
      adc3_sample(31 downto 0) => adc3_sample(31 downto 0),
      adc4_sample(31 downto 0) => adc4_sample(31 downto 0),
      adc5_sample(31 downto 0) => adc5_sample(31 downto 0),
      adc6_sample(31 downto 0) => adc6_sample(31 downto 0),
      adc7_sample(31 downto 0) => adc7_sample(31 downto 0),
      adc8_sample(31 downto 0) => adc8_sample(31 downto 0),
      adc9_sample(31 downto 0) => adc9_sample(31 downto 0),
      adc_sample_valid(19 downto 0) => adc_sample_valid(19 downto 0),
      emio_spi0_ss_out => emio_spi0_ss_out,
      gpio(19 downto 0) => gpio(19 downto 0),
      gpio_delay_ctrl(31 downto 0) => gpio_delay_ctrl(31 downto 0),
      pl_clk1 => pl_clk1,
      pl_resetn0 => pl_resetn0,
      ps_master_i2c_scl_i => ps_master_i2c_scl_i,
      ps_master_i2c_scl_o => ps_master_i2c_scl_o,
      ps_master_i2c_scl_t => ps_master_i2c_scl_t,
      ps_master_i2c_sda_i => ps_master_i2c_sda_i,
      ps_master_i2c_sda_o => ps_master_i2c_sda_o,
      ps_master_i2c_sda_t => ps_master_i2c_sda_t,
      ps_spi_0_io0_i => ps_spi_0_io0_i,
      ps_spi_0_io0_o => ps_spi_0_io0_o,
      ps_spi_0_io0_t => ps_spi_0_io0_t,
      ps_spi_0_io1_i => ps_spi_0_io1_i,
      ps_spi_0_io1_o => ps_spi_0_io1_o,
      ps_spi_0_io1_t => ps_spi_0_io1_t,
      ps_spi_0_sck_i => ps_spi_0_sck_i,
      ps_spi_0_sck_o => ps_spi_0_sck_o,
      ps_spi_0_sck_t => ps_spi_0_sck_t,
      ps_spi_0_ss_t => ps_spi_0_ss_t,
      sample_clk => sample_clk,
      trigger_external => trigger_external
    );
ps_master_i2c_scl_iobuf: component IOBUF
     port map (
      I => ps_master_i2c_scl_o,
      IO => ps_master_i2c_scl_io,
      O => ps_master_i2c_scl_i,
      T => ps_master_i2c_scl_t
    );
ps_master_i2c_sda_iobuf: component IOBUF
     port map (
      I => ps_master_i2c_sda_o,
      IO => ps_master_i2c_sda_io,
      O => ps_master_i2c_sda_i,
      T => ps_master_i2c_sda_t
    );
ps_spi_0_io0_iobuf: component IOBUF
     port map (
      I => ps_spi_0_io0_o,
      IO => ps_spi_0_io0_io,
      O => ps_spi_0_io0_i,
      T => ps_spi_0_io0_t
    );
ps_spi_0_io1_iobuf: component IOBUF
     port map (
      I => ps_spi_0_io1_o,
      IO => ps_spi_0_io1_io,
      O => ps_spi_0_io1_i,
      T => ps_spi_0_io1_t
    );
ps_spi_0_sck_iobuf: component IOBUF
     port map (
      I => ps_spi_0_sck_o,
      IO => ps_spi_0_sck_io,
      O => ps_spi_0_sck_i,
      T => ps_spi_0_sck_t
    );
end STRUCTURE;
