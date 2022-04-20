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

-- IP VLNV: xilinx.com:module_ref:stream_multiplexer:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MercuryXU1_stream_multiplexer_0_0 IS
  PORT (
    clk_sample : IN STD_LOGIC;
    gpio : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
    adc0_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc1_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc2_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc3_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc4_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc5_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc6_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc7_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc8_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc9_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc10_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc11_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc12_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc13_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc14_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc15_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc16_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc17_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc18_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc19_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc_sample_selected_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc_sample_selected_1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    adc_sample_valid : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
    adc_sample_valid_selected_0 : OUT STD_LOGIC;
    adc_sample_valid_selected_1 : OUT STD_LOGIC
  );
END MercuryXU1_stream_multiplexer_0_0;

ARCHITECTURE MercuryXU1_stream_multiplexer_0_0_arch OF MercuryXU1_stream_multiplexer_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF MercuryXU1_stream_multiplexer_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT stream_multiplexer IS
    PORT (
      clk_sample : IN STD_LOGIC;
      gpio : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
      adc0_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc1_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc2_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc3_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc4_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc5_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc6_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc7_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc8_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc9_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc10_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc11_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc12_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc13_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc14_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc15_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc16_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc17_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc18_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc19_sample : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc_sample_selected_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc_sample_selected_1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      adc_sample_valid : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
      adc_sample_valid_selected_0 : OUT STD_LOGIC;
      adc_sample_valid_selected_1 : OUT STD_LOGIC
    );
  END COMPONENT stream_multiplexer;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF MercuryXU1_stream_multiplexer_0_0_arch: ARCHITECTURE IS "stream_multiplexer,Vivado 2020.1.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF MercuryXU1_stream_multiplexer_0_0_arch : ARCHITECTURE IS "MercuryXU1_stream_multiplexer_0_0,stream_multiplexer,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF MercuryXU1_stream_multiplexer_0_0_arch: ARCHITECTURE IS "MercuryXU1_stream_multiplexer_0_0,stream_multiplexer,{x_ipProduct=Vivado 2020.1.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=stream_multiplexer,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF MercuryXU1_stream_multiplexer_0_0_arch: ARCHITECTURE IS "module_ref";
BEGIN
  U0 : stream_multiplexer
    PORT MAP (
      clk_sample => clk_sample,
      gpio => gpio,
      adc0_sample => adc0_sample,
      adc1_sample => adc1_sample,
      adc2_sample => adc2_sample,
      adc3_sample => adc3_sample,
      adc4_sample => adc4_sample,
      adc5_sample => adc5_sample,
      adc6_sample => adc6_sample,
      adc7_sample => adc7_sample,
      adc8_sample => adc8_sample,
      adc9_sample => adc9_sample,
      adc10_sample => adc10_sample,
      adc11_sample => adc11_sample,
      adc12_sample => adc12_sample,
      adc13_sample => adc13_sample,
      adc14_sample => adc14_sample,
      adc15_sample => adc15_sample,
      adc16_sample => adc16_sample,
      adc17_sample => adc17_sample,
      adc18_sample => adc18_sample,
      adc19_sample => adc19_sample,
      adc_sample_selected_0 => adc_sample_selected_0,
      adc_sample_selected_1 => adc_sample_selected_1,
      adc_sample_valid => adc_sample_valid,
      adc_sample_valid_selected_0 => adc_sample_valid_selected_0,
      adc_sample_valid_selected_1 => adc_sample_valid_selected_1
    );
END MercuryXU1_stream_multiplexer_0_0_arch;
