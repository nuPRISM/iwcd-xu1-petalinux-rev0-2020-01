-- (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:system_ila:1.1
-- IP Revision: 7

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MercuryXU1_system_ila_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    SLOT_0_SPI_ss_i : IN STD_LOGIC;
    SLOT_0_SPI_ss_o : IN STD_LOGIC;
    SLOT_0_SPI_ss_t : IN STD_LOGIC;
    SLOT_0_SPI_sck_i : IN STD_LOGIC;
    SLOT_0_SPI_sck_o : IN STD_LOGIC;
    SLOT_0_SPI_sck_t : IN STD_LOGIC;
    SLOT_0_SPI_io0_i : IN STD_LOGIC;
    SLOT_0_SPI_io0_o : IN STD_LOGIC;
    SLOT_0_SPI_io0_t : IN STD_LOGIC;
    SLOT_0_SPI_io1_i : IN STD_LOGIC;
    SLOT_0_SPI_io1_o : IN STD_LOGIC;
    SLOT_0_SPI_io1_t : IN STD_LOGIC
  );
END MercuryXU1_system_ila_0_0;

ARCHITECTURE MercuryXU1_system_ila_0_0_arch OF MercuryXU1_system_ila_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF MercuryXU1_system_ila_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT bd_6493 IS
    PORT (
      clk : IN STD_LOGIC;
      probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      SLOT_0_SPI_ss_i : IN STD_LOGIC;
      SLOT_0_SPI_ss_o : IN STD_LOGIC;
      SLOT_0_SPI_ss_t : IN STD_LOGIC;
      SLOT_0_SPI_sck_i : IN STD_LOGIC;
      SLOT_0_SPI_sck_o : IN STD_LOGIC;
      SLOT_0_SPI_sck_t : IN STD_LOGIC;
      SLOT_0_SPI_io0_i : IN STD_LOGIC;
      SLOT_0_SPI_io0_o : IN STD_LOGIC;
      SLOT_0_SPI_io0_t : IN STD_LOGIC;
      SLOT_0_SPI_io1_i : IN STD_LOGIC;
      SLOT_0_SPI_io1_o : IN STD_LOGIC;
      SLOT_0_SPI_io1_t : IN STD_LOGIC
    );
  END COMPONENT bd_6493;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF SLOT_0_SPI_io1_t: SIGNAL IS "xilinx.com:interface:spi:1.0 SLOT_0_SPI IO1_T";
  ATTRIBUTE X_INTERFACE_INFO OF SLOT_0_SPI_io1_o: SIGNAL IS "xilinx.com:interface:spi:1.0 SLOT_0_SPI IO1_O";
  ATTRIBUTE X_INTERFACE_INFO OF SLOT_0_SPI_io1_i: SIGNAL IS "xilinx.com:interface:spi:1.0 SLOT_0_SPI IO1_I";
  ATTRIBUTE X_INTERFACE_INFO OF SLOT_0_SPI_io0_t: SIGNAL IS "xilinx.com:interface:spi:1.0 SLOT_0_SPI IO0_T";
  ATTRIBUTE X_INTERFACE_INFO OF SLOT_0_SPI_io0_o: SIGNAL IS "xilinx.com:interface:spi:1.0 SLOT_0_SPI IO0_O";
  ATTRIBUTE X_INTERFACE_INFO OF SLOT_0_SPI_io0_i: SIGNAL IS "xilinx.com:interface:spi:1.0 SLOT_0_SPI IO0_I";
  ATTRIBUTE X_INTERFACE_INFO OF SLOT_0_SPI_sck_t: SIGNAL IS "xilinx.com:interface:spi:1.0 SLOT_0_SPI SCK_T";
  ATTRIBUTE X_INTERFACE_INFO OF SLOT_0_SPI_sck_o: SIGNAL IS "xilinx.com:interface:spi:1.0 SLOT_0_SPI SCK_O";
  ATTRIBUTE X_INTERFACE_INFO OF SLOT_0_SPI_sck_i: SIGNAL IS "xilinx.com:interface:spi:1.0 SLOT_0_SPI SCK_I";
  ATTRIBUTE X_INTERFACE_INFO OF SLOT_0_SPI_ss_t: SIGNAL IS "xilinx.com:interface:spi:1.0 SLOT_0_SPI SS_T";
  ATTRIBUTE X_INTERFACE_INFO OF SLOT_0_SPI_ss_o: SIGNAL IS "xilinx.com:interface:spi:1.0 SLOT_0_SPI SS_O";
  ATTRIBUTE X_INTERFACE_INFO OF SLOT_0_SPI_ss_i: SIGNAL IS "xilinx.com:interface:spi:1.0 SLOT_0_SPI SS_I";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME CLK.clk, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN MercuryXU1_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 CLK.clk CLK";
BEGIN
  U0 : bd_6493
    PORT MAP (
      clk => clk,
      probe0 => probe0,
      probe1 => probe1,
      SLOT_0_SPI_ss_i => SLOT_0_SPI_ss_i,
      SLOT_0_SPI_ss_o => SLOT_0_SPI_ss_o,
      SLOT_0_SPI_ss_t => SLOT_0_SPI_ss_t,
      SLOT_0_SPI_sck_i => SLOT_0_SPI_sck_i,
      SLOT_0_SPI_sck_o => SLOT_0_SPI_sck_o,
      SLOT_0_SPI_sck_t => SLOT_0_SPI_sck_t,
      SLOT_0_SPI_io0_i => SLOT_0_SPI_io0_i,
      SLOT_0_SPI_io0_o => SLOT_0_SPI_io0_o,
      SLOT_0_SPI_io0_t => SLOT_0_SPI_io0_t,
      SLOT_0_SPI_io1_i => SLOT_0_SPI_io1_i,
      SLOT_0_SPI_io1_o => SLOT_0_SPI_io1_o,
      SLOT_0_SPI_io1_t => SLOT_0_SPI_io1_t
    );
END MercuryXU1_system_ila_0_0_arch;
