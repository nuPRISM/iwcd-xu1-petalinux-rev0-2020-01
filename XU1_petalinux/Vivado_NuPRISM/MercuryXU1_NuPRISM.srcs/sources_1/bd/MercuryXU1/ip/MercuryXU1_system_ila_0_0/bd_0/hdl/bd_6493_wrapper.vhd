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
    SLOT_0_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_0_AXIS_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_0_AXIS_tlast : in STD_LOGIC;
    SLOT_0_AXIS_tready : in STD_LOGIC;
    SLOT_0_AXIS_tvalid : in STD_LOGIC;
    SLOT_1_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_1_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_1_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_1_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_1_AXI_arready : in STD_LOGIC;
    SLOT_1_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_1_AXI_arvalid : in STD_LOGIC;
    SLOT_1_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_1_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_1_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_1_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_1_AXI_awready : in STD_LOGIC;
    SLOT_1_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_1_AXI_awvalid : in STD_LOGIC;
    SLOT_1_AXI_bready : in STD_LOGIC;
    SLOT_1_AXI_bvalid : in STD_LOGIC;
    SLOT_1_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_1_AXI_rlast : in STD_LOGIC;
    SLOT_1_AXI_rready : in STD_LOGIC;
    SLOT_1_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_1_AXI_rvalid : in STD_LOGIC;
    SLOT_1_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_1_AXI_wlast : in STD_LOGIC;
    SLOT_1_AXI_wready : in STD_LOGIC;
    SLOT_1_AXI_wvalid : in STD_LOGIC;
    SLOT_2_AXI_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    SLOT_2_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_2_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_2_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_2_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_2_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_2_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_2_AXI_arready : in STD_LOGIC;
    SLOT_2_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_2_AXI_arvalid : in STD_LOGIC;
    SLOT_2_AXI_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    SLOT_2_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_2_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_2_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_2_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_2_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_2_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_2_AXI_awready : in STD_LOGIC;
    SLOT_2_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_2_AXI_awvalid : in STD_LOGIC;
    SLOT_2_AXI_bready : in STD_LOGIC;
    SLOT_2_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_2_AXI_bvalid : in STD_LOGIC;
    SLOT_2_AXI_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    SLOT_2_AXI_rlast : in STD_LOGIC;
    SLOT_2_AXI_rready : in STD_LOGIC;
    SLOT_2_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_2_AXI_rvalid : in STD_LOGIC;
    SLOT_2_AXI_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    SLOT_2_AXI_wlast : in STD_LOGIC;
    SLOT_2_AXI_wready : in STD_LOGIC;
    SLOT_2_AXI_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SLOT_2_AXI_wvalid : in STD_LOGIC;
    SLOT_3_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_3_AXIS_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_3_AXIS_tlast : in STD_LOGIC;
    SLOT_3_AXIS_tready : in STD_LOGIC;
    SLOT_3_AXIS_tvalid : in STD_LOGIC;
    SLOT_4_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_4_AXIS_tlast : in STD_LOGIC;
    SLOT_4_AXIS_tready : in STD_LOGIC;
    SLOT_4_AXIS_tvalid : in STD_LOGIC;
    SLOT_5_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_5_AXIS_tlast : in STD_LOGIC;
    SLOT_5_AXIS_tready : in STD_LOGIC;
    SLOT_5_AXIS_tvalid : in STD_LOGIC;
    SLOT_6_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_6_AXIS_tlast : in STD_LOGIC;
    SLOT_6_AXIS_tready : in STD_LOGIC;
    SLOT_6_AXIS_tvalid : in STD_LOGIC;
    SLOT_7_AXI_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    SLOT_7_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_7_AXI_arcache : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_7_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_7_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_7_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_7_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_7_AXI_arready : in STD_LOGIC;
    SLOT_7_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_7_AXI_arvalid : in STD_LOGIC;
    SLOT_7_AXI_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    SLOT_7_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_7_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_7_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_7_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_7_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_7_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_7_AXI_awready : in STD_LOGIC;
    SLOT_7_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_7_AXI_awvalid : in STD_LOGIC;
    SLOT_7_AXI_bready : in STD_LOGIC;
    SLOT_7_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_7_AXI_bvalid : in STD_LOGIC;
    SLOT_7_AXI_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    SLOT_7_AXI_rlast : in STD_LOGIC;
    SLOT_7_AXI_rready : in STD_LOGIC;
    SLOT_7_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_7_AXI_rvalid : in STD_LOGIC;
    SLOT_7_AXI_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    SLOT_7_AXI_wlast : in STD_LOGIC;
    SLOT_7_AXI_wready : in STD_LOGIC;
    SLOT_7_AXI_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SLOT_7_AXI_wvalid : in STD_LOGIC;
    SLOT_8_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_8_AXIS_tlast : in STD_LOGIC;
    SLOT_8_AXIS_tready : in STD_LOGIC;
    SLOT_8_AXIS_tvalid : in STD_LOGIC;
    clk : in STD_LOGIC;
    resetn : in STD_LOGIC
  );
end bd_6493_wrapper;

architecture STRUCTURE of bd_6493_wrapper is
  component bd_6493 is
  port (
    clk : in STD_LOGIC;
    resetn : in STD_LOGIC;
    SLOT_0_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_0_AXIS_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_0_AXIS_tlast : in STD_LOGIC;
    SLOT_0_AXIS_tready : in STD_LOGIC;
    SLOT_0_AXIS_tvalid : in STD_LOGIC;
    SLOT_1_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_1_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_1_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_1_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_1_AXI_arready : in STD_LOGIC;
    SLOT_1_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_1_AXI_arvalid : in STD_LOGIC;
    SLOT_1_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_1_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_1_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_1_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_1_AXI_awready : in STD_LOGIC;
    SLOT_1_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_1_AXI_awvalid : in STD_LOGIC;
    SLOT_1_AXI_bready : in STD_LOGIC;
    SLOT_1_AXI_bvalid : in STD_LOGIC;
    SLOT_1_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_1_AXI_rlast : in STD_LOGIC;
    SLOT_1_AXI_rready : in STD_LOGIC;
    SLOT_1_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_1_AXI_rvalid : in STD_LOGIC;
    SLOT_1_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_1_AXI_wlast : in STD_LOGIC;
    SLOT_1_AXI_wready : in STD_LOGIC;
    SLOT_1_AXI_wvalid : in STD_LOGIC;
    SLOT_2_AXI_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    SLOT_2_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_2_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_2_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_2_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_2_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_2_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_2_AXI_arready : in STD_LOGIC;
    SLOT_2_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_2_AXI_arvalid : in STD_LOGIC;
    SLOT_2_AXI_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    SLOT_2_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_2_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_2_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_2_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_2_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_2_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_2_AXI_awready : in STD_LOGIC;
    SLOT_2_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_2_AXI_awvalid : in STD_LOGIC;
    SLOT_2_AXI_bready : in STD_LOGIC;
    SLOT_2_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_2_AXI_bvalid : in STD_LOGIC;
    SLOT_2_AXI_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    SLOT_2_AXI_rlast : in STD_LOGIC;
    SLOT_2_AXI_rready : in STD_LOGIC;
    SLOT_2_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_2_AXI_rvalid : in STD_LOGIC;
    SLOT_2_AXI_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    SLOT_2_AXI_wlast : in STD_LOGIC;
    SLOT_2_AXI_wready : in STD_LOGIC;
    SLOT_2_AXI_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SLOT_2_AXI_wvalid : in STD_LOGIC;
    SLOT_3_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_3_AXIS_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_3_AXIS_tlast : in STD_LOGIC;
    SLOT_3_AXIS_tready : in STD_LOGIC;
    SLOT_3_AXIS_tvalid : in STD_LOGIC;
    SLOT_4_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_4_AXIS_tlast : in STD_LOGIC;
    SLOT_4_AXIS_tready : in STD_LOGIC;
    SLOT_4_AXIS_tvalid : in STD_LOGIC;
    SLOT_5_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_5_AXIS_tlast : in STD_LOGIC;
    SLOT_5_AXIS_tready : in STD_LOGIC;
    SLOT_5_AXIS_tvalid : in STD_LOGIC;
    SLOT_6_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_6_AXIS_tlast : in STD_LOGIC;
    SLOT_6_AXIS_tready : in STD_LOGIC;
    SLOT_6_AXIS_tvalid : in STD_LOGIC;
    SLOT_7_AXI_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    SLOT_7_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_7_AXI_arcache : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_7_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_7_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_7_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_7_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_7_AXI_arready : in STD_LOGIC;
    SLOT_7_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_7_AXI_arvalid : in STD_LOGIC;
    SLOT_7_AXI_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    SLOT_7_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_7_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_7_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_7_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_7_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_7_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_7_AXI_awready : in STD_LOGIC;
    SLOT_7_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_7_AXI_awvalid : in STD_LOGIC;
    SLOT_7_AXI_bready : in STD_LOGIC;
    SLOT_7_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_7_AXI_bvalid : in STD_LOGIC;
    SLOT_7_AXI_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    SLOT_7_AXI_rlast : in STD_LOGIC;
    SLOT_7_AXI_rready : in STD_LOGIC;
    SLOT_7_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_7_AXI_rvalid : in STD_LOGIC;
    SLOT_7_AXI_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    SLOT_7_AXI_wlast : in STD_LOGIC;
    SLOT_7_AXI_wready : in STD_LOGIC;
    SLOT_7_AXI_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SLOT_7_AXI_wvalid : in STD_LOGIC;
    SLOT_8_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_8_AXIS_tlast : in STD_LOGIC;
    SLOT_8_AXIS_tready : in STD_LOGIC;
    SLOT_8_AXIS_tvalid : in STD_LOGIC
  );
  end component bd_6493;
begin
bd_6493_i: component bd_6493
     port map (
      SLOT_0_AXIS_tdata(31 downto 0) => SLOT_0_AXIS_tdata(31 downto 0),
      SLOT_0_AXIS_tkeep(3 downto 0) => SLOT_0_AXIS_tkeep(3 downto 0),
      SLOT_0_AXIS_tlast => SLOT_0_AXIS_tlast,
      SLOT_0_AXIS_tready => SLOT_0_AXIS_tready,
      SLOT_0_AXIS_tvalid => SLOT_0_AXIS_tvalid,
      SLOT_1_AXI_araddr(31 downto 0) => SLOT_1_AXI_araddr(31 downto 0),
      SLOT_1_AXI_arcache(3 downto 0) => SLOT_1_AXI_arcache(3 downto 0),
      SLOT_1_AXI_arlen(7 downto 0) => SLOT_1_AXI_arlen(7 downto 0),
      SLOT_1_AXI_arprot(2 downto 0) => SLOT_1_AXI_arprot(2 downto 0),
      SLOT_1_AXI_arready => SLOT_1_AXI_arready,
      SLOT_1_AXI_arsize(2 downto 0) => SLOT_1_AXI_arsize(2 downto 0),
      SLOT_1_AXI_arvalid => SLOT_1_AXI_arvalid,
      SLOT_1_AXI_awaddr(31 downto 0) => SLOT_1_AXI_awaddr(31 downto 0),
      SLOT_1_AXI_awcache(3 downto 0) => SLOT_1_AXI_awcache(3 downto 0),
      SLOT_1_AXI_awlen(7 downto 0) => SLOT_1_AXI_awlen(7 downto 0),
      SLOT_1_AXI_awprot(2 downto 0) => SLOT_1_AXI_awprot(2 downto 0),
      SLOT_1_AXI_awready => SLOT_1_AXI_awready,
      SLOT_1_AXI_awsize(2 downto 0) => SLOT_1_AXI_awsize(2 downto 0),
      SLOT_1_AXI_awvalid => SLOT_1_AXI_awvalid,
      SLOT_1_AXI_bready => SLOT_1_AXI_bready,
      SLOT_1_AXI_bvalid => SLOT_1_AXI_bvalid,
      SLOT_1_AXI_rdata(31 downto 0) => SLOT_1_AXI_rdata(31 downto 0),
      SLOT_1_AXI_rlast => SLOT_1_AXI_rlast,
      SLOT_1_AXI_rready => SLOT_1_AXI_rready,
      SLOT_1_AXI_rresp(1 downto 0) => SLOT_1_AXI_rresp(1 downto 0),
      SLOT_1_AXI_rvalid => SLOT_1_AXI_rvalid,
      SLOT_1_AXI_wdata(31 downto 0) => SLOT_1_AXI_wdata(31 downto 0),
      SLOT_1_AXI_wlast => SLOT_1_AXI_wlast,
      SLOT_1_AXI_wready => SLOT_1_AXI_wready,
      SLOT_1_AXI_wvalid => SLOT_1_AXI_wvalid,
      SLOT_2_AXI_araddr(48 downto 0) => SLOT_2_AXI_araddr(48 downto 0),
      SLOT_2_AXI_arburst(1 downto 0) => SLOT_2_AXI_arburst(1 downto 0),
      SLOT_2_AXI_arcache(3 downto 0) => SLOT_2_AXI_arcache(3 downto 0),
      SLOT_2_AXI_arlen(7 downto 0) => SLOT_2_AXI_arlen(7 downto 0),
      SLOT_2_AXI_arlock(0) => SLOT_2_AXI_arlock(0),
      SLOT_2_AXI_arprot(2 downto 0) => SLOT_2_AXI_arprot(2 downto 0),
      SLOT_2_AXI_arqos(3 downto 0) => SLOT_2_AXI_arqos(3 downto 0),
      SLOT_2_AXI_arready => SLOT_2_AXI_arready,
      SLOT_2_AXI_arsize(2 downto 0) => SLOT_2_AXI_arsize(2 downto 0),
      SLOT_2_AXI_arvalid => SLOT_2_AXI_arvalid,
      SLOT_2_AXI_awaddr(48 downto 0) => SLOT_2_AXI_awaddr(48 downto 0),
      SLOT_2_AXI_awburst(1 downto 0) => SLOT_2_AXI_awburst(1 downto 0),
      SLOT_2_AXI_awcache(3 downto 0) => SLOT_2_AXI_awcache(3 downto 0),
      SLOT_2_AXI_awlen(7 downto 0) => SLOT_2_AXI_awlen(7 downto 0),
      SLOT_2_AXI_awlock(0) => SLOT_2_AXI_awlock(0),
      SLOT_2_AXI_awprot(2 downto 0) => SLOT_2_AXI_awprot(2 downto 0),
      SLOT_2_AXI_awqos(3 downto 0) => SLOT_2_AXI_awqos(3 downto 0),
      SLOT_2_AXI_awready => SLOT_2_AXI_awready,
      SLOT_2_AXI_awsize(2 downto 0) => SLOT_2_AXI_awsize(2 downto 0),
      SLOT_2_AXI_awvalid => SLOT_2_AXI_awvalid,
      SLOT_2_AXI_bready => SLOT_2_AXI_bready,
      SLOT_2_AXI_bresp(1 downto 0) => SLOT_2_AXI_bresp(1 downto 0),
      SLOT_2_AXI_bvalid => SLOT_2_AXI_bvalid,
      SLOT_2_AXI_rdata(127 downto 0) => SLOT_2_AXI_rdata(127 downto 0),
      SLOT_2_AXI_rlast => SLOT_2_AXI_rlast,
      SLOT_2_AXI_rready => SLOT_2_AXI_rready,
      SLOT_2_AXI_rresp(1 downto 0) => SLOT_2_AXI_rresp(1 downto 0),
      SLOT_2_AXI_rvalid => SLOT_2_AXI_rvalid,
      SLOT_2_AXI_wdata(127 downto 0) => SLOT_2_AXI_wdata(127 downto 0),
      SLOT_2_AXI_wlast => SLOT_2_AXI_wlast,
      SLOT_2_AXI_wready => SLOT_2_AXI_wready,
      SLOT_2_AXI_wstrb(15 downto 0) => SLOT_2_AXI_wstrb(15 downto 0),
      SLOT_2_AXI_wvalid => SLOT_2_AXI_wvalid,
      SLOT_3_AXIS_tdata(31 downto 0) => SLOT_3_AXIS_tdata(31 downto 0),
      SLOT_3_AXIS_tkeep(3 downto 0) => SLOT_3_AXIS_tkeep(3 downto 0),
      SLOT_3_AXIS_tlast => SLOT_3_AXIS_tlast,
      SLOT_3_AXIS_tready => SLOT_3_AXIS_tready,
      SLOT_3_AXIS_tvalid => SLOT_3_AXIS_tvalid,
      SLOT_4_AXIS_tdata(31 downto 0) => SLOT_4_AXIS_tdata(31 downto 0),
      SLOT_4_AXIS_tlast => SLOT_4_AXIS_tlast,
      SLOT_4_AXIS_tready => SLOT_4_AXIS_tready,
      SLOT_4_AXIS_tvalid => SLOT_4_AXIS_tvalid,
      SLOT_5_AXIS_tdata(31 downto 0) => SLOT_5_AXIS_tdata(31 downto 0),
      SLOT_5_AXIS_tlast => SLOT_5_AXIS_tlast,
      SLOT_5_AXIS_tready => SLOT_5_AXIS_tready,
      SLOT_5_AXIS_tvalid => SLOT_5_AXIS_tvalid,
      SLOT_6_AXIS_tdata(31 downto 0) => SLOT_6_AXIS_tdata(31 downto 0),
      SLOT_6_AXIS_tlast => SLOT_6_AXIS_tlast,
      SLOT_6_AXIS_tready => SLOT_6_AXIS_tready,
      SLOT_6_AXIS_tvalid => SLOT_6_AXIS_tvalid,
      SLOT_7_AXI_araddr(48 downto 0) => SLOT_7_AXI_araddr(48 downto 0),
      SLOT_7_AXI_arburst(1 downto 0) => SLOT_7_AXI_arburst(1 downto 0),
      SLOT_7_AXI_arcache(1 downto 0) => SLOT_7_AXI_arcache(1 downto 0),
      SLOT_7_AXI_arlen(7 downto 0) => SLOT_7_AXI_arlen(7 downto 0),
      SLOT_7_AXI_arlock(0) => SLOT_7_AXI_arlock(0),
      SLOT_7_AXI_arprot(2 downto 0) => SLOT_7_AXI_arprot(2 downto 0),
      SLOT_7_AXI_arqos(3 downto 0) => SLOT_7_AXI_arqos(3 downto 0),
      SLOT_7_AXI_arready => SLOT_7_AXI_arready,
      SLOT_7_AXI_arsize(2 downto 0) => SLOT_7_AXI_arsize(2 downto 0),
      SLOT_7_AXI_arvalid => SLOT_7_AXI_arvalid,
      SLOT_7_AXI_awaddr(48 downto 0) => SLOT_7_AXI_awaddr(48 downto 0),
      SLOT_7_AXI_awburst(1 downto 0) => SLOT_7_AXI_awburst(1 downto 0),
      SLOT_7_AXI_awcache(3 downto 0) => SLOT_7_AXI_awcache(3 downto 0),
      SLOT_7_AXI_awlen(7 downto 0) => SLOT_7_AXI_awlen(7 downto 0),
      SLOT_7_AXI_awlock(0) => SLOT_7_AXI_awlock(0),
      SLOT_7_AXI_awprot(2 downto 0) => SLOT_7_AXI_awprot(2 downto 0),
      SLOT_7_AXI_awqos(3 downto 0) => SLOT_7_AXI_awqos(3 downto 0),
      SLOT_7_AXI_awready => SLOT_7_AXI_awready,
      SLOT_7_AXI_awsize(2 downto 0) => SLOT_7_AXI_awsize(2 downto 0),
      SLOT_7_AXI_awvalid => SLOT_7_AXI_awvalid,
      SLOT_7_AXI_bready => SLOT_7_AXI_bready,
      SLOT_7_AXI_bresp(1 downto 0) => SLOT_7_AXI_bresp(1 downto 0),
      SLOT_7_AXI_bvalid => SLOT_7_AXI_bvalid,
      SLOT_7_AXI_rdata(127 downto 0) => SLOT_7_AXI_rdata(127 downto 0),
      SLOT_7_AXI_rlast => SLOT_7_AXI_rlast,
      SLOT_7_AXI_rready => SLOT_7_AXI_rready,
      SLOT_7_AXI_rresp(1 downto 0) => SLOT_7_AXI_rresp(1 downto 0),
      SLOT_7_AXI_rvalid => SLOT_7_AXI_rvalid,
      SLOT_7_AXI_wdata(127 downto 0) => SLOT_7_AXI_wdata(127 downto 0),
      SLOT_7_AXI_wlast => SLOT_7_AXI_wlast,
      SLOT_7_AXI_wready => SLOT_7_AXI_wready,
      SLOT_7_AXI_wstrb(15 downto 0) => SLOT_7_AXI_wstrb(15 downto 0),
      SLOT_7_AXI_wvalid => SLOT_7_AXI_wvalid,
      SLOT_8_AXIS_tdata(31 downto 0) => SLOT_8_AXIS_tdata(31 downto 0),
      SLOT_8_AXIS_tlast => SLOT_8_AXIS_tlast,
      SLOT_8_AXIS_tready => SLOT_8_AXIS_tready,
      SLOT_8_AXIS_tvalid => SLOT_8_AXIS_tvalid,
      clk => clk,
      resetn => resetn
    );
end STRUCTURE;
