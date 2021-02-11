--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Command: generate_target bd_6493_wrapper.bd
--Design : bd_6493_wrapper
--Purpose: IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_6493_wrapper is
  port (
    SLOT_0_SPI_io0_i : in STD_LOGIC;
    SLOT_0_SPI_io0_o : in STD_LOGIC;
    SLOT_0_SPI_io0_t : in STD_LOGIC;
    SLOT_0_SPI_io1_i : in STD_LOGIC;
    SLOT_0_SPI_io1_o : in STD_LOGIC;
    SLOT_0_SPI_io1_t : in STD_LOGIC;
    SLOT_0_SPI_sck_i : in STD_LOGIC;
    SLOT_0_SPI_sck_o : in STD_LOGIC;
    SLOT_0_SPI_sck_t : in STD_LOGIC;
    SLOT_0_SPI_ss_i : in STD_LOGIC;
    SLOT_0_SPI_ss_o : in STD_LOGIC;
    SLOT_0_SPI_ss_t : in STD_LOGIC;
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end bd_6493_wrapper;

architecture STRUCTURE of bd_6493_wrapper is
  component bd_6493 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_0_SPI_sck_i : in STD_LOGIC;
    SLOT_0_SPI_sck_o : in STD_LOGIC;
    SLOT_0_SPI_sck_t : in STD_LOGIC;
    SLOT_0_SPI_io1_i : in STD_LOGIC;
    SLOT_0_SPI_io0_o : in STD_LOGIC;
    SLOT_0_SPI_io0_t : in STD_LOGIC;
    SLOT_0_SPI_io0_i : in STD_LOGIC;
    SLOT_0_SPI_io1_o : in STD_LOGIC;
    SLOT_0_SPI_io1_t : in STD_LOGIC;
    SLOT_0_SPI_ss_i : in STD_LOGIC;
    SLOT_0_SPI_ss_o : in STD_LOGIC;
    SLOT_0_SPI_ss_t : in STD_LOGIC
  );
  end component bd_6493;
begin
bd_6493_i: component bd_6493
     port map (
      SLOT_0_SPI_io0_i => SLOT_0_SPI_io0_i,
      SLOT_0_SPI_io0_o => SLOT_0_SPI_io0_o,
      SLOT_0_SPI_io0_t => SLOT_0_SPI_io0_t,
      SLOT_0_SPI_io1_i => SLOT_0_SPI_io1_i,
      SLOT_0_SPI_io1_o => SLOT_0_SPI_io1_o,
      SLOT_0_SPI_io1_t => SLOT_0_SPI_io1_t,
      SLOT_0_SPI_sck_i => SLOT_0_SPI_sck_i,
      SLOT_0_SPI_sck_o => SLOT_0_SPI_sck_o,
      SLOT_0_SPI_sck_t => SLOT_0_SPI_sck_t,
      SLOT_0_SPI_ss_i => SLOT_0_SPI_ss_i,
      SLOT_0_SPI_ss_o => SLOT_0_SPI_ss_o,
      SLOT_0_SPI_ss_t => SLOT_0_SPI_ss_t,
      clk => clk,
      probe0(0) => probe0(0),
      probe1(0) => probe1(0)
    );
end STRUCTURE;
