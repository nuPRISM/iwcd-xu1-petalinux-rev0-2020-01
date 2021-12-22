--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
--Date        : Fri Dec 10 12:29:21 2021
--Host        : hyperk running 64-bit Ubuntu 18.04.6 LTS
--Command     : generate_target MercuryXU1.bd
--Design      : MercuryXU1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_1N6O1RF is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m00_couplers_imp_1N6O1RF;

architecture STRUCTURE of m00_couplers_imp_1N6O1RF is
  signal m00_couplers_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m00_couplers_to_m00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m00_couplers_to_m00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(39 downto 0) <= m00_couplers_to_m00_couplers_ARADDR(39 downto 0);
  M_AXI_arvalid(0) <= m00_couplers_to_m00_couplers_ARVALID(0);
  M_AXI_awaddr(39 downto 0) <= m00_couplers_to_m00_couplers_AWADDR(39 downto 0);
  M_AXI_awvalid(0) <= m00_couplers_to_m00_couplers_AWVALID(0);
  M_AXI_bready(0) <= m00_couplers_to_m00_couplers_BREADY(0);
  M_AXI_rready(0) <= m00_couplers_to_m00_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m00_couplers_to_m00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m00_couplers_to_m00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m00_couplers_to_m00_couplers_WVALID(0);
  S_AXI_arready(0) <= m00_couplers_to_m00_couplers_ARREADY(0);
  S_AXI_awready(0) <= m00_couplers_to_m00_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m00_couplers_to_m00_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m00_couplers_to_m00_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m00_couplers_to_m00_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m00_couplers_to_m00_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m00_couplers_to_m00_couplers_RVALID(0);
  S_AXI_wready(0) <= m00_couplers_to_m00_couplers_WREADY(0);
  m00_couplers_to_m00_couplers_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  m00_couplers_to_m00_couplers_ARREADY(0) <= M_AXI_arready(0);
  m00_couplers_to_m00_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m00_couplers_to_m00_couplers_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  m00_couplers_to_m00_couplers_AWREADY(0) <= M_AXI_awready(0);
  m00_couplers_to_m00_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m00_couplers_to_m00_couplers_BREADY(0) <= S_AXI_bready(0);
  m00_couplers_to_m00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m00_couplers_to_m00_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m00_couplers_to_m00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m00_couplers_to_m00_couplers_RREADY(0) <= S_AXI_rready(0);
  m00_couplers_to_m00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m00_couplers_to_m00_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m00_couplers_to_m00_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m00_couplers_to_m00_couplers_WREADY(0) <= M_AXI_wready(0);
  m00_couplers_to_m00_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m00_couplers_to_m00_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_9JX1D6 is
  port (
    M_AXIS_ACLK : in STD_LOGIC;
    M_AXIS_ARESETN : in STD_LOGIC;
    M_AXIS_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXIS_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIS_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIS_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXIS_ACLK : in STD_LOGIC;
    S_AXIS_ARESETN : in STD_LOGIC;
    S_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXIS_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXIS_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXIS_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m00_couplers_imp_9JX1D6;

architecture STRUCTURE of m00_couplers_imp_9JX1D6 is
  signal m00_couplers_to_m00_couplers_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_m00_couplers_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXIS_tdata(31 downto 0) <= m00_couplers_to_m00_couplers_TDATA(31 downto 0);
  M_AXIS_tkeep(3 downto 0) <= m00_couplers_to_m00_couplers_TKEEP(3 downto 0);
  M_AXIS_tlast(0) <= m00_couplers_to_m00_couplers_TLAST(0);
  M_AXIS_tvalid(0) <= m00_couplers_to_m00_couplers_TVALID(0);
  S_AXIS_tready(0) <= m00_couplers_to_m00_couplers_TREADY(0);
  m00_couplers_to_m00_couplers_TDATA(31 downto 0) <= S_AXIS_tdata(31 downto 0);
  m00_couplers_to_m00_couplers_TKEEP(3 downto 0) <= S_AXIS_tkeep(3 downto 0);
  m00_couplers_to_m00_couplers_TLAST(0) <= S_AXIS_tlast(0);
  m00_couplers_to_m00_couplers_TREADY(0) <= M_AXIS_tready(0);
  m00_couplers_to_m00_couplers_TVALID(0) <= S_AXIS_tvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m01_couplers_imp_1CVMW8D is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m01_couplers_imp_1CVMW8D;

architecture STRUCTURE of m01_couplers_imp_1CVMW8D is
  signal m01_couplers_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m01_couplers_to_m01_couplers_ARREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_ARVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m01_couplers_to_m01_couplers_AWREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_AWVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_BREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_BVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_RREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_RVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_WREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(39 downto 0) <= m01_couplers_to_m01_couplers_ARADDR(39 downto 0);
  M_AXI_arvalid <= m01_couplers_to_m01_couplers_ARVALID;
  M_AXI_awaddr(39 downto 0) <= m01_couplers_to_m01_couplers_AWADDR(39 downto 0);
  M_AXI_awvalid <= m01_couplers_to_m01_couplers_AWVALID;
  M_AXI_bready <= m01_couplers_to_m01_couplers_BREADY;
  M_AXI_rready <= m01_couplers_to_m01_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m01_couplers_to_m01_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m01_couplers_to_m01_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m01_couplers_to_m01_couplers_WVALID;
  S_AXI_arready <= m01_couplers_to_m01_couplers_ARREADY;
  S_AXI_awready <= m01_couplers_to_m01_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m01_couplers_to_m01_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m01_couplers_to_m01_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m01_couplers_to_m01_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m01_couplers_to_m01_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m01_couplers_to_m01_couplers_RVALID;
  S_AXI_wready <= m01_couplers_to_m01_couplers_WREADY;
  m01_couplers_to_m01_couplers_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  m01_couplers_to_m01_couplers_ARREADY <= M_AXI_arready;
  m01_couplers_to_m01_couplers_ARVALID <= S_AXI_arvalid;
  m01_couplers_to_m01_couplers_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  m01_couplers_to_m01_couplers_AWREADY <= M_AXI_awready;
  m01_couplers_to_m01_couplers_AWVALID <= S_AXI_awvalid;
  m01_couplers_to_m01_couplers_BREADY <= S_AXI_bready;
  m01_couplers_to_m01_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m01_couplers_to_m01_couplers_BVALID <= M_AXI_bvalid;
  m01_couplers_to_m01_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m01_couplers_to_m01_couplers_RREADY <= S_AXI_rready;
  m01_couplers_to_m01_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m01_couplers_to_m01_couplers_RVALID <= M_AXI_rvalid;
  m01_couplers_to_m01_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m01_couplers_to_m01_couplers_WREADY <= M_AXI_wready;
  m01_couplers_to_m01_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m01_couplers_to_m01_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m02_couplers_imp_8QOAQV is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wvalid : in STD_LOGIC
  );
end m02_couplers_imp_8QOAQV;

architecture STRUCTURE of m02_couplers_imp_8QOAQV is
  signal m02_couplers_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m02_couplers_to_m02_couplers_ARREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_ARVALID : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m02_couplers_to_m02_couplers_AWREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_AWVALID : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_BREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_m02_couplers_BVALID : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_RREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_m02_couplers_RVALID : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_WREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(39 downto 0) <= m02_couplers_to_m02_couplers_ARADDR(39 downto 0);
  M_AXI_arvalid <= m02_couplers_to_m02_couplers_ARVALID;
  M_AXI_awaddr(39 downto 0) <= m02_couplers_to_m02_couplers_AWADDR(39 downto 0);
  M_AXI_awvalid <= m02_couplers_to_m02_couplers_AWVALID;
  M_AXI_bready <= m02_couplers_to_m02_couplers_BREADY;
  M_AXI_rready <= m02_couplers_to_m02_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m02_couplers_to_m02_couplers_WDATA(31 downto 0);
  M_AXI_wvalid <= m02_couplers_to_m02_couplers_WVALID;
  S_AXI_arready <= m02_couplers_to_m02_couplers_ARREADY;
  S_AXI_awready <= m02_couplers_to_m02_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m02_couplers_to_m02_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m02_couplers_to_m02_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m02_couplers_to_m02_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m02_couplers_to_m02_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m02_couplers_to_m02_couplers_RVALID;
  S_AXI_wready <= m02_couplers_to_m02_couplers_WREADY;
  m02_couplers_to_m02_couplers_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  m02_couplers_to_m02_couplers_ARREADY <= M_AXI_arready;
  m02_couplers_to_m02_couplers_ARVALID <= S_AXI_arvalid;
  m02_couplers_to_m02_couplers_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  m02_couplers_to_m02_couplers_AWREADY <= M_AXI_awready;
  m02_couplers_to_m02_couplers_AWVALID <= S_AXI_awvalid;
  m02_couplers_to_m02_couplers_BREADY <= S_AXI_bready;
  m02_couplers_to_m02_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m02_couplers_to_m02_couplers_BVALID <= M_AXI_bvalid;
  m02_couplers_to_m02_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m02_couplers_to_m02_couplers_RREADY <= S_AXI_rready;
  m02_couplers_to_m02_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m02_couplers_to_m02_couplers_RVALID <= M_AXI_rvalid;
  m02_couplers_to_m02_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m02_couplers_to_m02_couplers_WREADY <= M_AXI_wready;
  m02_couplers_to_m02_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m03_couplers_imp_Y3OBVL is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m03_couplers_imp_Y3OBVL;

architecture STRUCTURE of m03_couplers_imp_Y3OBVL is
  signal m03_couplers_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m03_couplers_to_m03_couplers_ARREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_ARVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m03_couplers_to_m03_couplers_AWREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_AWVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_BREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_m03_couplers_BVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_RREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_m03_couplers_RVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_WREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_m03_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(39 downto 0) <= m03_couplers_to_m03_couplers_ARADDR(39 downto 0);
  M_AXI_arvalid <= m03_couplers_to_m03_couplers_ARVALID;
  M_AXI_awaddr(39 downto 0) <= m03_couplers_to_m03_couplers_AWADDR(39 downto 0);
  M_AXI_awvalid <= m03_couplers_to_m03_couplers_AWVALID;
  M_AXI_bready <= m03_couplers_to_m03_couplers_BREADY;
  M_AXI_rready <= m03_couplers_to_m03_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m03_couplers_to_m03_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m03_couplers_to_m03_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m03_couplers_to_m03_couplers_WVALID;
  S_AXI_arready <= m03_couplers_to_m03_couplers_ARREADY;
  S_AXI_awready <= m03_couplers_to_m03_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m03_couplers_to_m03_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m03_couplers_to_m03_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m03_couplers_to_m03_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m03_couplers_to_m03_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m03_couplers_to_m03_couplers_RVALID;
  S_AXI_wready <= m03_couplers_to_m03_couplers_WREADY;
  m03_couplers_to_m03_couplers_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  m03_couplers_to_m03_couplers_ARREADY <= M_AXI_arready;
  m03_couplers_to_m03_couplers_ARVALID <= S_AXI_arvalid;
  m03_couplers_to_m03_couplers_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  m03_couplers_to_m03_couplers_AWREADY <= M_AXI_awready;
  m03_couplers_to_m03_couplers_AWVALID <= S_AXI_awvalid;
  m03_couplers_to_m03_couplers_BREADY <= S_AXI_bready;
  m03_couplers_to_m03_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m03_couplers_to_m03_couplers_BVALID <= M_AXI_bvalid;
  m03_couplers_to_m03_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m03_couplers_to_m03_couplers_RREADY <= S_AXI_rready;
  m03_couplers_to_m03_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m03_couplers_to_m03_couplers_RVALID <= M_AXI_rvalid;
  m03_couplers_to_m03_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m03_couplers_to_m03_couplers_WREADY <= M_AXI_wready;
  m03_couplers_to_m03_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m03_couplers_to_m03_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m04_couplers_imp_176MJ02 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m04_couplers_imp_176MJ02;

architecture STRUCTURE of m04_couplers_imp_176MJ02 is
  signal m04_couplers_to_m04_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m04_couplers_to_m04_couplers_ARREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_ARVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m04_couplers_to_m04_couplers_AWREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_AWVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_BREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_m04_couplers_BVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_RREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_m04_couplers_RVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_WREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_m04_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(39 downto 0) <= m04_couplers_to_m04_couplers_ARADDR(39 downto 0);
  M_AXI_arvalid <= m04_couplers_to_m04_couplers_ARVALID;
  M_AXI_awaddr(39 downto 0) <= m04_couplers_to_m04_couplers_AWADDR(39 downto 0);
  M_AXI_awvalid <= m04_couplers_to_m04_couplers_AWVALID;
  M_AXI_bready <= m04_couplers_to_m04_couplers_BREADY;
  M_AXI_rready <= m04_couplers_to_m04_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m04_couplers_to_m04_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m04_couplers_to_m04_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m04_couplers_to_m04_couplers_WVALID;
  S_AXI_arready <= m04_couplers_to_m04_couplers_ARREADY;
  S_AXI_awready <= m04_couplers_to_m04_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m04_couplers_to_m04_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m04_couplers_to_m04_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m04_couplers_to_m04_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m04_couplers_to_m04_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m04_couplers_to_m04_couplers_RVALID;
  S_AXI_wready <= m04_couplers_to_m04_couplers_WREADY;
  m04_couplers_to_m04_couplers_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  m04_couplers_to_m04_couplers_ARREADY <= M_AXI_arready;
  m04_couplers_to_m04_couplers_ARVALID <= S_AXI_arvalid;
  m04_couplers_to_m04_couplers_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  m04_couplers_to_m04_couplers_AWREADY <= M_AXI_awready;
  m04_couplers_to_m04_couplers_AWVALID <= S_AXI_awvalid;
  m04_couplers_to_m04_couplers_BREADY <= S_AXI_bready;
  m04_couplers_to_m04_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m04_couplers_to_m04_couplers_BVALID <= M_AXI_bvalid;
  m04_couplers_to_m04_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m04_couplers_to_m04_couplers_RREADY <= S_AXI_rready;
  m04_couplers_to_m04_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m04_couplers_to_m04_couplers_RVALID <= M_AXI_rvalid;
  m04_couplers_to_m04_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m04_couplers_to_m04_couplers_WREADY <= M_AXI_wready;
  m04_couplers_to_m04_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m04_couplers_to_m04_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m05_couplers_imp_1YOSPO4 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wvalid : in STD_LOGIC
  );
end m05_couplers_imp_1YOSPO4;

architecture STRUCTURE of m05_couplers_imp_1YOSPO4 is
  signal m05_couplers_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m05_couplers_to_m05_couplers_ARREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_ARVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m05_couplers_to_m05_couplers_AWREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_AWVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_BREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_m05_couplers_BVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_RREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_m05_couplers_RVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_WREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(39 downto 0) <= m05_couplers_to_m05_couplers_ARADDR(39 downto 0);
  M_AXI_arvalid <= m05_couplers_to_m05_couplers_ARVALID;
  M_AXI_awaddr(39 downto 0) <= m05_couplers_to_m05_couplers_AWADDR(39 downto 0);
  M_AXI_awvalid <= m05_couplers_to_m05_couplers_AWVALID;
  M_AXI_bready <= m05_couplers_to_m05_couplers_BREADY;
  M_AXI_rready <= m05_couplers_to_m05_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m05_couplers_to_m05_couplers_WDATA(31 downto 0);
  M_AXI_wvalid <= m05_couplers_to_m05_couplers_WVALID;
  S_AXI_arready <= m05_couplers_to_m05_couplers_ARREADY;
  S_AXI_awready <= m05_couplers_to_m05_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m05_couplers_to_m05_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m05_couplers_to_m05_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m05_couplers_to_m05_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m05_couplers_to_m05_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m05_couplers_to_m05_couplers_RVALID;
  S_AXI_wready <= m05_couplers_to_m05_couplers_WREADY;
  m05_couplers_to_m05_couplers_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  m05_couplers_to_m05_couplers_ARREADY <= M_AXI_arready;
  m05_couplers_to_m05_couplers_ARVALID <= S_AXI_arvalid;
  m05_couplers_to_m05_couplers_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  m05_couplers_to_m05_couplers_AWREADY <= M_AXI_awready;
  m05_couplers_to_m05_couplers_AWVALID <= S_AXI_awvalid;
  m05_couplers_to_m05_couplers_BREADY <= S_AXI_bready;
  m05_couplers_to_m05_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m05_couplers_to_m05_couplers_BVALID <= M_AXI_bvalid;
  m05_couplers_to_m05_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m05_couplers_to_m05_couplers_RREADY <= S_AXI_rready;
  m05_couplers_to_m05_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m05_couplers_to_m05_couplers_RVALID <= M_AXI_rvalid;
  m05_couplers_to_m05_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m05_couplers_to_m05_couplers_WREADY <= M_AXI_wready;
  m05_couplers_to_m05_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m06_couplers_imp_MLCGU6 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m06_couplers_imp_MLCGU6;

architecture STRUCTURE of m06_couplers_imp_MLCGU6 is
  signal m06_couplers_to_m06_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m06_couplers_to_m06_couplers_ARREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_ARVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m06_couplers_to_m06_couplers_AWREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_AWVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_BREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_m06_couplers_BVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_RREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_m06_couplers_RVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_WREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_m06_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(39 downto 0) <= m06_couplers_to_m06_couplers_ARADDR(39 downto 0);
  M_AXI_arvalid <= m06_couplers_to_m06_couplers_ARVALID;
  M_AXI_awaddr(39 downto 0) <= m06_couplers_to_m06_couplers_AWADDR(39 downto 0);
  M_AXI_awvalid <= m06_couplers_to_m06_couplers_AWVALID;
  M_AXI_bready <= m06_couplers_to_m06_couplers_BREADY;
  M_AXI_rready <= m06_couplers_to_m06_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m06_couplers_to_m06_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m06_couplers_to_m06_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m06_couplers_to_m06_couplers_WVALID;
  S_AXI_arready <= m06_couplers_to_m06_couplers_ARREADY;
  S_AXI_awready <= m06_couplers_to_m06_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m06_couplers_to_m06_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m06_couplers_to_m06_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m06_couplers_to_m06_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m06_couplers_to_m06_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m06_couplers_to_m06_couplers_RVALID;
  S_AXI_wready <= m06_couplers_to_m06_couplers_WREADY;
  m06_couplers_to_m06_couplers_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  m06_couplers_to_m06_couplers_ARREADY <= M_AXI_arready;
  m06_couplers_to_m06_couplers_ARVALID <= S_AXI_arvalid;
  m06_couplers_to_m06_couplers_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  m06_couplers_to_m06_couplers_AWREADY <= M_AXI_awready;
  m06_couplers_to_m06_couplers_AWVALID <= S_AXI_awvalid;
  m06_couplers_to_m06_couplers_BREADY <= S_AXI_bready;
  m06_couplers_to_m06_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m06_couplers_to_m06_couplers_BVALID <= M_AXI_bvalid;
  m06_couplers_to_m06_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m06_couplers_to_m06_couplers_RREADY <= S_AXI_rready;
  m06_couplers_to_m06_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m06_couplers_to_m06_couplers_RVALID <= M_AXI_rvalid;
  m06_couplers_to_m06_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m06_couplers_to_m06_couplers_WREADY <= M_AXI_wready;
  m06_couplers_to_m06_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m06_couplers_to_m06_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m07_couplers_imp_EFT20O is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m07_couplers_imp_EFT20O;

architecture STRUCTURE of m07_couplers_imp_EFT20O is
  signal m07_couplers_to_m07_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m07_couplers_to_m07_couplers_ARREADY : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_ARVALID : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m07_couplers_to_m07_couplers_AWREADY : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_AWVALID : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_BREADY : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_m07_couplers_BVALID : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_m07_couplers_RREADY : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_m07_couplers_RVALID : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_m07_couplers_WREADY : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m07_couplers_to_m07_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(39 downto 0) <= m07_couplers_to_m07_couplers_ARADDR(39 downto 0);
  M_AXI_arvalid <= m07_couplers_to_m07_couplers_ARVALID;
  M_AXI_awaddr(39 downto 0) <= m07_couplers_to_m07_couplers_AWADDR(39 downto 0);
  M_AXI_awvalid <= m07_couplers_to_m07_couplers_AWVALID;
  M_AXI_bready <= m07_couplers_to_m07_couplers_BREADY;
  M_AXI_rready <= m07_couplers_to_m07_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m07_couplers_to_m07_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m07_couplers_to_m07_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m07_couplers_to_m07_couplers_WVALID;
  S_AXI_arready <= m07_couplers_to_m07_couplers_ARREADY;
  S_AXI_awready <= m07_couplers_to_m07_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m07_couplers_to_m07_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m07_couplers_to_m07_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m07_couplers_to_m07_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m07_couplers_to_m07_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m07_couplers_to_m07_couplers_RVALID;
  S_AXI_wready <= m07_couplers_to_m07_couplers_WREADY;
  m07_couplers_to_m07_couplers_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  m07_couplers_to_m07_couplers_ARREADY <= M_AXI_arready;
  m07_couplers_to_m07_couplers_ARVALID <= S_AXI_arvalid;
  m07_couplers_to_m07_couplers_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  m07_couplers_to_m07_couplers_AWREADY <= M_AXI_awready;
  m07_couplers_to_m07_couplers_AWVALID <= S_AXI_awvalid;
  m07_couplers_to_m07_couplers_BREADY <= S_AXI_bready;
  m07_couplers_to_m07_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m07_couplers_to_m07_couplers_BVALID <= M_AXI_bvalid;
  m07_couplers_to_m07_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m07_couplers_to_m07_couplers_RREADY <= S_AXI_rready;
  m07_couplers_to_m07_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m07_couplers_to_m07_couplers_RVALID <= M_AXI_rvalid;
  m07_couplers_to_m07_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m07_couplers_to_m07_couplers_WREADY <= M_AXI_wready;
  m07_couplers_to_m07_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m07_couplers_to_m07_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_1ESDVSA is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s00_couplers_imp_1ESDVSA;

architecture STRUCTURE of s00_couplers_imp_1ESDVSA is
  component MercuryXU1_auto_pc_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component MercuryXU1_auto_pc_0;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal auto_pc_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal auto_pc_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s00_couplers_WVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal s00_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal s00_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(39 downto 0) <= auto_pc_to_s00_couplers_ARADDR(39 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_pc_to_s00_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_pc_to_s00_couplers_ARVALID;
  M_AXI_awaddr(39 downto 0) <= auto_pc_to_s00_couplers_AWADDR(39 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_pc_to_s00_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_pc_to_s00_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_s00_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_s00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_s00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_s00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_s00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= s00_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= s00_couplers_to_auto_pc_AWREADY;
  S_AXI_bid(15 downto 0) <= s00_couplers_to_auto_pc_BID(15 downto 0);
  S_AXI_bresp(1 downto 0) <= s00_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= s00_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= s00_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rid(15 downto 0) <= s00_couplers_to_auto_pc_RID(15 downto 0);
  S_AXI_rlast <= s00_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= s00_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= s00_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= s00_couplers_to_auto_pc_WREADY;
  auto_pc_to_s00_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_s00_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_s00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_s00_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_s00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_s00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_s00_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_s00_couplers_WREADY <= M_AXI_wready;
  s00_couplers_to_auto_pc_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  s00_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  s00_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  s00_couplers_to_auto_pc_ARID(15 downto 0) <= S_AXI_arid(15 downto 0);
  s00_couplers_to_auto_pc_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  s00_couplers_to_auto_pc_ARLOCK(0) <= S_AXI_arlock(0);
  s00_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s00_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  s00_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  s00_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  s00_couplers_to_auto_pc_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  s00_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s00_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s00_couplers_to_auto_pc_AWID(15 downto 0) <= S_AXI_awid(15 downto 0);
  s00_couplers_to_auto_pc_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  s00_couplers_to_auto_pc_AWLOCK(0) <= S_AXI_awlock(0);
  s00_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s00_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  s00_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s00_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  s00_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  s00_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  s00_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s00_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  s00_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s00_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component MercuryXU1_auto_pc_0
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(39 downto 0) => auto_pc_to_s00_couplers_ARADDR(39 downto 0),
      m_axi_arprot(2 downto 0) => auto_pc_to_s00_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_pc_to_s00_couplers_ARREADY,
      m_axi_arvalid => auto_pc_to_s00_couplers_ARVALID,
      m_axi_awaddr(39 downto 0) => auto_pc_to_s00_couplers_AWADDR(39 downto 0),
      m_axi_awprot(2 downto 0) => auto_pc_to_s00_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_pc_to_s00_couplers_AWREADY,
      m_axi_awvalid => auto_pc_to_s00_couplers_AWVALID,
      m_axi_bready => auto_pc_to_s00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_s00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_s00_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_s00_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_pc_to_s00_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_s00_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_s00_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_s00_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_pc_to_s00_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_s00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_s00_couplers_WVALID,
      s_axi_araddr(39 downto 0) => s00_couplers_to_auto_pc_ARADDR(39 downto 0),
      s_axi_arburst(1 downto 0) => s00_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => s00_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arid(15 downto 0) => s00_couplers_to_auto_pc_ARID(15 downto 0),
      s_axi_arlen(7 downto 0) => s00_couplers_to_auto_pc_ARLEN(7 downto 0),
      s_axi_arlock(0) => s00_couplers_to_auto_pc_ARLOCK(0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => s00_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => s00_couplers_to_auto_pc_ARREADY,
      s_axi_arregion(3 downto 0) => B"0000",
      s_axi_arsize(2 downto 0) => s00_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => s00_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(39 downto 0) => s00_couplers_to_auto_pc_AWADDR(39 downto 0),
      s_axi_awburst(1 downto 0) => s00_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => s00_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awid(15 downto 0) => s00_couplers_to_auto_pc_AWID(15 downto 0),
      s_axi_awlen(7 downto 0) => s00_couplers_to_auto_pc_AWLEN(7 downto 0),
      s_axi_awlock(0) => s00_couplers_to_auto_pc_AWLOCK(0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => s00_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => s00_couplers_to_auto_pc_AWREADY,
      s_axi_awregion(3 downto 0) => B"0000",
      s_axi_awsize(2 downto 0) => s00_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => s00_couplers_to_auto_pc_AWVALID,
      s_axi_bid(15 downto 0) => s00_couplers_to_auto_pc_BID(15 downto 0),
      s_axi_bready => s00_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => s00_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => s00_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rid(15 downto 0) => s00_couplers_to_auto_pc_RID(15 downto 0),
      s_axi_rlast => s00_couplers_to_auto_pc_RLAST,
      s_axi_rready => s00_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => s00_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => s00_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => s00_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wlast => s00_couplers_to_auto_pc_WLAST,
      s_axi_wready => s00_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => s00_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => s00_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_HSYH2J is
  port (
    M_AXIS_ACLK : in STD_LOGIC;
    M_AXIS_ARESETN : in STD_LOGIC;
    M_AXIS_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXIS_tlast : out STD_LOGIC;
    M_AXIS_tready : in STD_LOGIC;
    M_AXIS_tvalid : out STD_LOGIC;
    S_AXIS_ACLK : in STD_LOGIC;
    S_AXIS_ARESETN : in STD_LOGIC;
    S_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXIS_tlast : in STD_LOGIC;
    S_AXIS_tready : out STD_LOGIC;
    S_AXIS_tvalid : in STD_LOGIC
  );
end s00_couplers_imp_HSYH2J;

architecture STRUCTURE of s00_couplers_imp_HSYH2J is
  component MercuryXU1_s00_regslice_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component MercuryXU1_s00_regslice_0;
  component MercuryXU1_s00_data_fifo_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component MercuryXU1_s00_data_fifo_0;
  signal AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_regslice_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_regslice_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_regslice_TLAST : STD_LOGIC;
  signal s00_couplers_to_s00_regslice_TREADY : STD_LOGIC;
  signal s00_couplers_to_s00_regslice_TVALID : STD_LOGIC;
  signal s00_data_fifo_to_s00_couplers_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_data_fifo_to_s00_couplers_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_data_fifo_to_s00_couplers_TLAST : STD_LOGIC;
  signal s00_data_fifo_to_s00_couplers_TREADY : STD_LOGIC;
  signal s00_data_fifo_to_s00_couplers_TVALID : STD_LOGIC;
  signal s00_regslice_to_s00_data_fifo_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_regslice_to_s00_data_fifo_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_regslice_to_s00_data_fifo_TLAST : STD_LOGIC;
  signal s00_regslice_to_s00_data_fifo_TREADY : STD_LOGIC;
  signal s00_regslice_to_s00_data_fifo_TVALID : STD_LOGIC;
begin
  M_AXIS_tdata(31 downto 0) <= s00_data_fifo_to_s00_couplers_TDATA(31 downto 0);
  M_AXIS_tkeep(3 downto 0) <= s00_data_fifo_to_s00_couplers_TKEEP(3 downto 0);
  M_AXIS_tlast <= s00_data_fifo_to_s00_couplers_TLAST;
  M_AXIS_tvalid <= s00_data_fifo_to_s00_couplers_TVALID;
  S_AXIS_tready <= s00_couplers_to_s00_regslice_TREADY;
  s00_couplers_to_s00_regslice_TDATA(31 downto 0) <= S_AXIS_tdata(31 downto 0);
  s00_couplers_to_s00_regslice_TKEEP(3 downto 0) <= S_AXIS_tkeep(3 downto 0);
  s00_couplers_to_s00_regslice_TLAST <= S_AXIS_tlast;
  s00_couplers_to_s00_regslice_TVALID <= S_AXIS_tvalid;
  s00_data_fifo_to_s00_couplers_TREADY <= M_AXIS_tready;
s00_data_fifo: component MercuryXU1_s00_data_fifo_0
     port map (
      axis_rd_data_count(31 downto 0) => AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT(31 downto 0),
      axis_wr_data_count(31 downto 0) => AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT(31 downto 0),
      m_axis_tdata(31 downto 0) => s00_data_fifo_to_s00_couplers_TDATA(31 downto 0),
      m_axis_tkeep(3 downto 0) => s00_data_fifo_to_s00_couplers_TKEEP(3 downto 0),
      m_axis_tlast => s00_data_fifo_to_s00_couplers_TLAST,
      m_axis_tready => s00_data_fifo_to_s00_couplers_TREADY,
      m_axis_tvalid => s00_data_fifo_to_s00_couplers_TVALID,
      s_axis_aclk => M_AXIS_ACLK,
      s_axis_aresetn => M_AXIS_ARESETN,
      s_axis_tdata(31 downto 0) => s00_regslice_to_s00_data_fifo_TDATA(31 downto 0),
      s_axis_tkeep(3 downto 0) => s00_regslice_to_s00_data_fifo_TKEEP(3 downto 0),
      s_axis_tlast => s00_regslice_to_s00_data_fifo_TLAST,
      s_axis_tready => s00_regslice_to_s00_data_fifo_TREADY,
      s_axis_tvalid => s00_regslice_to_s00_data_fifo_TVALID
    );
s00_regslice: component MercuryXU1_s00_regslice_0
     port map (
      aclk => S_AXIS_ACLK,
      aresetn => S_AXIS_ARESETN,
      m_axis_tdata(31 downto 0) => s00_regslice_to_s00_data_fifo_TDATA(31 downto 0),
      m_axis_tkeep(3 downto 0) => s00_regslice_to_s00_data_fifo_TKEEP(3 downto 0),
      m_axis_tlast => s00_regslice_to_s00_data_fifo_TLAST,
      m_axis_tready => s00_regslice_to_s00_data_fifo_TREADY,
      m_axis_tvalid => s00_regslice_to_s00_data_fifo_TVALID,
      s_axis_tdata(31 downto 0) => s00_couplers_to_s00_regslice_TDATA(31 downto 0),
      s_axis_tkeep(3 downto 0) => s00_couplers_to_s00_regslice_TKEEP(3 downto 0),
      s_axis_tlast => s00_couplers_to_s00_regslice_TLAST,
      s_axis_tready => s00_couplers_to_s00_regslice_TREADY,
      s_axis_tvalid => s00_couplers_to_s00_regslice_TVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s01_couplers_imp_ACK04T is
  port (
    M_AXIS_ACLK : in STD_LOGIC;
    M_AXIS_ARESETN : in STD_LOGIC;
    M_AXIS_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXIS_tlast : out STD_LOGIC;
    M_AXIS_tready : in STD_LOGIC;
    M_AXIS_tvalid : out STD_LOGIC;
    S_AXIS_ACLK : in STD_LOGIC;
    S_AXIS_ARESETN : in STD_LOGIC;
    S_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_tlast : in STD_LOGIC;
    S_AXIS_tready : out STD_LOGIC;
    S_AXIS_tvalid : in STD_LOGIC
  );
end s01_couplers_imp_ACK04T;

architecture STRUCTURE of s01_couplers_imp_ACK04T is
  component MercuryXU1_s01_regslice_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component MercuryXU1_s01_regslice_0;
  component MercuryXU1_auto_ss_k_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component MercuryXU1_auto_ss_k_0;
  signal auto_ss_k_to_s01_couplers_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_ss_k_to_s01_couplers_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_ss_k_to_s01_couplers_TLAST : STD_LOGIC;
  signal auto_ss_k_to_s01_couplers_TREADY : STD_LOGIC;
  signal auto_ss_k_to_s01_couplers_TVALID : STD_LOGIC;
  signal s01_couplers_to_s01_regslice_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_s01_regslice_TLAST : STD_LOGIC;
  signal s01_couplers_to_s01_regslice_TREADY : STD_LOGIC;
  signal s01_couplers_to_s01_regslice_TVALID : STD_LOGIC;
  signal s01_regslice_to_auto_ss_k_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_regslice_to_auto_ss_k_TLAST : STD_LOGIC;
  signal s01_regslice_to_auto_ss_k_TREADY : STD_LOGIC;
  signal s01_regslice_to_auto_ss_k_TVALID : STD_LOGIC;
begin
  M_AXIS_tdata(31 downto 0) <= auto_ss_k_to_s01_couplers_TDATA(31 downto 0);
  M_AXIS_tkeep(3 downto 0) <= auto_ss_k_to_s01_couplers_TKEEP(3 downto 0);
  M_AXIS_tlast <= auto_ss_k_to_s01_couplers_TLAST;
  M_AXIS_tvalid <= auto_ss_k_to_s01_couplers_TVALID;
  S_AXIS_tready <= s01_couplers_to_s01_regslice_TREADY;
  auto_ss_k_to_s01_couplers_TREADY <= M_AXIS_tready;
  s01_couplers_to_s01_regslice_TDATA(31 downto 0) <= S_AXIS_tdata(31 downto 0);
  s01_couplers_to_s01_regslice_TLAST <= S_AXIS_tlast;
  s01_couplers_to_s01_regslice_TVALID <= S_AXIS_tvalid;
auto_ss_k: component MercuryXU1_auto_ss_k_0
     port map (
      aclk => S_AXIS_ACLK,
      aresetn => S_AXIS_ARESETN,
      m_axis_tdata(31 downto 0) => auto_ss_k_to_s01_couplers_TDATA(31 downto 0),
      m_axis_tkeep(3 downto 0) => auto_ss_k_to_s01_couplers_TKEEP(3 downto 0),
      m_axis_tlast => auto_ss_k_to_s01_couplers_TLAST,
      m_axis_tready => auto_ss_k_to_s01_couplers_TREADY,
      m_axis_tvalid => auto_ss_k_to_s01_couplers_TVALID,
      s_axis_tdata(31 downto 0) => s01_regslice_to_auto_ss_k_TDATA(31 downto 0),
      s_axis_tlast => s01_regslice_to_auto_ss_k_TLAST,
      s_axis_tready => s01_regslice_to_auto_ss_k_TREADY,
      s_axis_tvalid => s01_regslice_to_auto_ss_k_TVALID
    );
s01_regslice: component MercuryXU1_s01_regslice_0
     port map (
      aclk => S_AXIS_ACLK,
      aresetn => S_AXIS_ARESETN,
      m_axis_tdata(31 downto 0) => s01_regslice_to_auto_ss_k_TDATA(31 downto 0),
      m_axis_tlast => s01_regslice_to_auto_ss_k_TLAST,
      m_axis_tready => s01_regslice_to_auto_ss_k_TREADY,
      m_axis_tvalid => s01_regslice_to_auto_ss_k_TVALID,
      s_axis_tdata(31 downto 0) => s01_couplers_to_s01_regslice_TDATA(31 downto 0),
      s_axis_tlast => s01_couplers_to_s01_regslice_TLAST,
      s_axis_tready => s01_couplers_to_s01_regslice_TREADY,
      s_axis_tvalid => s01_couplers_to_s01_regslice_TVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MercuryXU1_axis_interconnect_0_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_AXIS_ACLK : in STD_LOGIC;
    M00_AXIS_ARESETN : in STD_LOGIC;
    M00_AXIS_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXIS_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXIS_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXIS_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXIS_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_ARB_REQ_SUPPRESS : in STD_LOGIC;
    S00_AXIS_ACLK : in STD_LOGIC;
    S00_AXIS_ARESETN : in STD_LOGIC;
    S00_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXIS_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXIS_tlast : in STD_LOGIC;
    S00_AXIS_tready : out STD_LOGIC;
    S00_AXIS_tvalid : in STD_LOGIC;
    S01_ARB_REQ_SUPPRESS : in STD_LOGIC;
    S01_AXIS_ACLK : in STD_LOGIC;
    S01_AXIS_ARESETN : in STD_LOGIC;
    S01_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXIS_tlast : in STD_LOGIC;
    S01_AXIS_tready : out STD_LOGIC;
    S01_AXIS_tvalid : in STD_LOGIC
  );
end MercuryXU1_axis_interconnect_0_0;

architecture STRUCTURE of MercuryXU1_axis_interconnect_0_0 is
  component MercuryXU1_xbar_2 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_req_suppress : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_decode_err : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component MercuryXU1_xbar_2;
  component MercuryXU1_s_arb_req_suppress_concat_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component MercuryXU1_s_arb_req_suppress_concat_0;
  signal axis_interconnect_0_ACLK_net : STD_LOGIC;
  signal axis_interconnect_0_ARESETN_net : STD_LOGIC;
  signal axis_interconnect_0_to_s00_couplers_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axis_interconnect_0_to_s00_couplers_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axis_interconnect_0_to_s00_couplers_TLAST : STD_LOGIC;
  signal axis_interconnect_0_to_s00_couplers_TREADY : STD_LOGIC;
  signal axis_interconnect_0_to_s00_couplers_TVALID : STD_LOGIC;
  signal axis_interconnect_0_to_s01_couplers_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axis_interconnect_0_to_s01_couplers_TLAST : STD_LOGIC;
  signal axis_interconnect_0_to_s01_couplers_TREADY : STD_LOGIC;
  signal axis_interconnect_0_to_s01_couplers_TVALID : STD_LOGIC;
  signal m00_couplers_to_axis_interconnect_0_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_axis_interconnect_0_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axis_interconnect_0_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axis_interconnect_0_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axis_interconnect_0_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_arb_req_suppress_to_s_arb_req_suppress_concat : STD_LOGIC;
  signal s00_couplers_to_xbar_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_TLAST : STD_LOGIC;
  signal s00_couplers_to_xbar_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_TVALID : STD_LOGIC;
  signal s01_arb_req_suppress_to_s_arb_req_suppress_concat : STD_LOGIC;
  signal s01_couplers_to_xbar_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_xbar_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_xbar_TLAST : STD_LOGIC;
  signal s01_couplers_to_xbar_TREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_TVALID : STD_LOGIC;
  signal s_arb_req_suppress_concat_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_xbar_s_decode_err_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
  M00_AXIS_tdata(31 downto 0) <= m00_couplers_to_axis_interconnect_0_TDATA(31 downto 0);
  M00_AXIS_tkeep(3 downto 0) <= m00_couplers_to_axis_interconnect_0_TKEEP(3 downto 0);
  M00_AXIS_tlast(0) <= m00_couplers_to_axis_interconnect_0_TLAST(0);
  M00_AXIS_tvalid(0) <= m00_couplers_to_axis_interconnect_0_TVALID(0);
  S00_AXIS_tready <= axis_interconnect_0_to_s00_couplers_TREADY;
  S01_AXIS_tready <= axis_interconnect_0_to_s01_couplers_TREADY;
  axis_interconnect_0_ACLK_net <= ACLK;
  axis_interconnect_0_ARESETN_net <= ARESETN;
  axis_interconnect_0_to_s00_couplers_TDATA(31 downto 0) <= S00_AXIS_tdata(31 downto 0);
  axis_interconnect_0_to_s00_couplers_TKEEP(3 downto 0) <= S00_AXIS_tkeep(3 downto 0);
  axis_interconnect_0_to_s00_couplers_TLAST <= S00_AXIS_tlast;
  axis_interconnect_0_to_s00_couplers_TVALID <= S00_AXIS_tvalid;
  axis_interconnect_0_to_s01_couplers_TDATA(31 downto 0) <= S01_AXIS_tdata(31 downto 0);
  axis_interconnect_0_to_s01_couplers_TLAST <= S01_AXIS_tlast;
  axis_interconnect_0_to_s01_couplers_TVALID <= S01_AXIS_tvalid;
  m00_couplers_to_axis_interconnect_0_TREADY(0) <= M00_AXIS_tready(0);
  s00_arb_req_suppress_to_s_arb_req_suppress_concat <= S00_ARB_REQ_SUPPRESS;
  s01_arb_req_suppress_to_s_arb_req_suppress_concat <= S01_ARB_REQ_SUPPRESS;
m00_couplers: entity work.m00_couplers_imp_9JX1D6
     port map (
      M_AXIS_ACLK => axis_interconnect_0_ACLK_net,
      M_AXIS_ARESETN => axis_interconnect_0_ARESETN_net,
      M_AXIS_tdata(31 downto 0) => m00_couplers_to_axis_interconnect_0_TDATA(31 downto 0),
      M_AXIS_tkeep(3 downto 0) => m00_couplers_to_axis_interconnect_0_TKEEP(3 downto 0),
      M_AXIS_tlast(0) => m00_couplers_to_axis_interconnect_0_TLAST(0),
      M_AXIS_tready(0) => m00_couplers_to_axis_interconnect_0_TREADY(0),
      M_AXIS_tvalid(0) => m00_couplers_to_axis_interconnect_0_TVALID(0),
      S_AXIS_ACLK => axis_interconnect_0_ACLK_net,
      S_AXIS_ARESETN => axis_interconnect_0_ARESETN_net,
      S_AXIS_tdata(31 downto 0) => xbar_to_m00_couplers_TDATA(31 downto 0),
      S_AXIS_tkeep(3 downto 0) => xbar_to_m00_couplers_TKEEP(3 downto 0),
      S_AXIS_tlast(0) => xbar_to_m00_couplers_TLAST(0),
      S_AXIS_tready(0) => xbar_to_m00_couplers_TREADY(0),
      S_AXIS_tvalid(0) => xbar_to_m00_couplers_TVALID(0)
    );
s00_couplers: entity work.s00_couplers_imp_HSYH2J
     port map (
      M_AXIS_ACLK => axis_interconnect_0_ACLK_net,
      M_AXIS_ARESETN => axis_interconnect_0_ARESETN_net,
      M_AXIS_tdata(31 downto 0) => s00_couplers_to_xbar_TDATA(31 downto 0),
      M_AXIS_tkeep(3 downto 0) => s00_couplers_to_xbar_TKEEP(3 downto 0),
      M_AXIS_tlast => s00_couplers_to_xbar_TLAST,
      M_AXIS_tready => s00_couplers_to_xbar_TREADY(0),
      M_AXIS_tvalid => s00_couplers_to_xbar_TVALID,
      S_AXIS_ACLK => axis_interconnect_0_ACLK_net,
      S_AXIS_ARESETN => axis_interconnect_0_ARESETN_net,
      S_AXIS_tdata(31 downto 0) => axis_interconnect_0_to_s00_couplers_TDATA(31 downto 0),
      S_AXIS_tkeep(3 downto 0) => axis_interconnect_0_to_s00_couplers_TKEEP(3 downto 0),
      S_AXIS_tlast => axis_interconnect_0_to_s00_couplers_TLAST,
      S_AXIS_tready => axis_interconnect_0_to_s00_couplers_TREADY,
      S_AXIS_tvalid => axis_interconnect_0_to_s00_couplers_TVALID
    );
s01_couplers: entity work.s01_couplers_imp_ACK04T
     port map (
      M_AXIS_ACLK => axis_interconnect_0_ACLK_net,
      M_AXIS_ARESETN => axis_interconnect_0_ARESETN_net,
      M_AXIS_tdata(31 downto 0) => s01_couplers_to_xbar_TDATA(31 downto 0),
      M_AXIS_tkeep(3 downto 0) => s01_couplers_to_xbar_TKEEP(3 downto 0),
      M_AXIS_tlast => s01_couplers_to_xbar_TLAST,
      M_AXIS_tready => s01_couplers_to_xbar_TREADY(1),
      M_AXIS_tvalid => s01_couplers_to_xbar_TVALID,
      S_AXIS_ACLK => axis_interconnect_0_ACLK_net,
      S_AXIS_ARESETN => axis_interconnect_0_ARESETN_net,
      S_AXIS_tdata(31 downto 0) => axis_interconnect_0_to_s01_couplers_TDATA(31 downto 0),
      S_AXIS_tlast => axis_interconnect_0_to_s01_couplers_TLAST,
      S_AXIS_tready => axis_interconnect_0_to_s01_couplers_TREADY,
      S_AXIS_tvalid => axis_interconnect_0_to_s01_couplers_TVALID
    );
s_arb_req_suppress_concat: component MercuryXU1_s_arb_req_suppress_concat_0
     port map (
      In0(0) => s00_arb_req_suppress_to_s_arb_req_suppress_concat,
      In1(0) => s01_arb_req_suppress_to_s_arb_req_suppress_concat,
      dout(1 downto 0) => s_arb_req_suppress_concat_dout(1 downto 0)
    );
xbar: component MercuryXU1_xbar_2
     port map (
      aclk => axis_interconnect_0_ACLK_net,
      aresetn => axis_interconnect_0_ARESETN_net,
      m_axis_tdata(31 downto 0) => xbar_to_m00_couplers_TDATA(31 downto 0),
      m_axis_tkeep(3 downto 0) => xbar_to_m00_couplers_TKEEP(3 downto 0),
      m_axis_tlast(0) => xbar_to_m00_couplers_TLAST(0),
      m_axis_tready(0) => xbar_to_m00_couplers_TREADY(0),
      m_axis_tvalid(0) => xbar_to_m00_couplers_TVALID(0),
      s_axis_tdata(63 downto 32) => s01_couplers_to_xbar_TDATA(31 downto 0),
      s_axis_tdata(31 downto 0) => s00_couplers_to_xbar_TDATA(31 downto 0),
      s_axis_tkeep(7 downto 4) => s01_couplers_to_xbar_TKEEP(3 downto 0),
      s_axis_tkeep(3 downto 0) => s00_couplers_to_xbar_TKEEP(3 downto 0),
      s_axis_tlast(1) => s01_couplers_to_xbar_TLAST,
      s_axis_tlast(0) => s00_couplers_to_xbar_TLAST,
      s_axis_tready(1) => s01_couplers_to_xbar_TREADY(1),
      s_axis_tready(0) => s00_couplers_to_xbar_TREADY(0),
      s_axis_tvalid(1) => s01_couplers_to_xbar_TVALID,
      s_axis_tvalid(0) => s00_couplers_to_xbar_TVALID,
      s_decode_err(1 downto 0) => NLW_xbar_s_decode_err_UNCONNECTED(1 downto 0),
      s_req_suppress(1 downto 0) => s_arb_req_suppress_concat_dout(1 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MercuryXU1_ps8_0_axi_periph_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M00_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M00_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M01_ACLK : in STD_LOGIC;
    M01_ARESETN : in STD_LOGIC;
    M01_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M01_AXI_arready : in STD_LOGIC;
    M01_AXI_arvalid : out STD_LOGIC;
    M01_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M01_AXI_awready : in STD_LOGIC;
    M01_AXI_awvalid : out STD_LOGIC;
    M01_AXI_bready : out STD_LOGIC;
    M01_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_bvalid : in STD_LOGIC;
    M01_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_rready : out STD_LOGIC;
    M01_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_rvalid : in STD_LOGIC;
    M01_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_wready : in STD_LOGIC;
    M01_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_wvalid : out STD_LOGIC;
    M02_ACLK : in STD_LOGIC;
    M02_ARESETN : in STD_LOGIC;
    M02_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M02_AXI_arready : in STD_LOGIC;
    M02_AXI_arvalid : out STD_LOGIC;
    M02_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M02_AXI_awready : in STD_LOGIC;
    M02_AXI_awvalid : out STD_LOGIC;
    M02_AXI_bready : out STD_LOGIC;
    M02_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_bvalid : in STD_LOGIC;
    M02_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_rready : out STD_LOGIC;
    M02_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_rvalid : in STD_LOGIC;
    M02_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_wready : in STD_LOGIC;
    M02_AXI_wvalid : out STD_LOGIC;
    M03_ACLK : in STD_LOGIC;
    M03_ARESETN : in STD_LOGIC;
    M03_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M03_AXI_arready : in STD_LOGIC;
    M03_AXI_arvalid : out STD_LOGIC;
    M03_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M03_AXI_awready : in STD_LOGIC;
    M03_AXI_awvalid : out STD_LOGIC;
    M03_AXI_bready : out STD_LOGIC;
    M03_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_bvalid : in STD_LOGIC;
    M03_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_rready : out STD_LOGIC;
    M03_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_rvalid : in STD_LOGIC;
    M03_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_wready : in STD_LOGIC;
    M03_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M03_AXI_wvalid : out STD_LOGIC;
    M04_ACLK : in STD_LOGIC;
    M04_ARESETN : in STD_LOGIC;
    M04_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M04_AXI_arready : in STD_LOGIC;
    M04_AXI_arvalid : out STD_LOGIC;
    M04_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M04_AXI_awready : in STD_LOGIC;
    M04_AXI_awvalid : out STD_LOGIC;
    M04_AXI_bready : out STD_LOGIC;
    M04_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_bvalid : in STD_LOGIC;
    M04_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_rready : out STD_LOGIC;
    M04_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_rvalid : in STD_LOGIC;
    M04_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_wready : in STD_LOGIC;
    M04_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M04_AXI_wvalid : out STD_LOGIC;
    M05_ACLK : in STD_LOGIC;
    M05_ARESETN : in STD_LOGIC;
    M05_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M05_AXI_arready : in STD_LOGIC;
    M05_AXI_arvalid : out STD_LOGIC;
    M05_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M05_AXI_awready : in STD_LOGIC;
    M05_AXI_awvalid : out STD_LOGIC;
    M05_AXI_bready : out STD_LOGIC;
    M05_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_bvalid : in STD_LOGIC;
    M05_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_rready : out STD_LOGIC;
    M05_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_rvalid : in STD_LOGIC;
    M05_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_wready : in STD_LOGIC;
    M05_AXI_wvalid : out STD_LOGIC;
    M06_ACLK : in STD_LOGIC;
    M06_ARESETN : in STD_LOGIC;
    M06_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M06_AXI_arready : in STD_LOGIC;
    M06_AXI_arvalid : out STD_LOGIC;
    M06_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M06_AXI_awready : in STD_LOGIC;
    M06_AXI_awvalid : out STD_LOGIC;
    M06_AXI_bready : out STD_LOGIC;
    M06_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_bvalid : in STD_LOGIC;
    M06_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_rready : out STD_LOGIC;
    M06_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_rvalid : in STD_LOGIC;
    M06_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_wready : in STD_LOGIC;
    M06_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M06_AXI_wvalid : out STD_LOGIC;
    M07_ACLK : in STD_LOGIC;
    M07_ARESETN : in STD_LOGIC;
    M07_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M07_AXI_arready : in STD_LOGIC;
    M07_AXI_arvalid : out STD_LOGIC;
    M07_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M07_AXI_awready : in STD_LOGIC;
    M07_AXI_awvalid : out STD_LOGIC;
    M07_AXI_bready : out STD_LOGIC;
    M07_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_bvalid : in STD_LOGIC;
    M07_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_rready : out STD_LOGIC;
    M07_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_rvalid : in STD_LOGIC;
    M07_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_wready : in STD_LOGIC;
    M07_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M07_AXI_wvalid : out STD_LOGIC;
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_bid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC
  );
end MercuryXU1_ps8_0_axi_periph_0;

architecture STRUCTURE of MercuryXU1_ps8_0_axi_periph_0 is
  component MercuryXU1_xbar_1 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 319 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 319 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component MercuryXU1_xbar_1;
  signal M00_ACLK_1 : STD_LOGIC;
  signal M00_ARESETN_1 : STD_LOGIC;
  signal M01_ACLK_1 : STD_LOGIC;
  signal M01_ARESETN_1 : STD_LOGIC;
  signal M02_ACLK_1 : STD_LOGIC;
  signal M02_ARESETN_1 : STD_LOGIC;
  signal M03_ACLK_1 : STD_LOGIC;
  signal M03_ARESETN_1 : STD_LOGIC;
  signal M04_ACLK_1 : STD_LOGIC;
  signal M04_ARESETN_1 : STD_LOGIC;
  signal M05_ACLK_1 : STD_LOGIC;
  signal M05_ARESETN_1 : STD_LOGIC;
  signal M06_ACLK_1 : STD_LOGIC;
  signal M06_ARESETN_1 : STD_LOGIC;
  signal M07_ACLK_1 : STD_LOGIC;
  signal M07_ARESETN_1 : STD_LOGIC;
  signal S00_ACLK_1 : STD_LOGIC;
  signal S00_ARESETN_1 : STD_LOGIC;
  signal m00_couplers_to_ps8_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m00_couplers_to_ps8_0_axi_periph_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_ps8_0_axi_periph_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_ps8_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m00_couplers_to_ps8_0_axi_periph_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_ps8_0_axi_periph_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_ps8_0_axi_periph_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_ps8_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_ps8_0_axi_periph_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_ps8_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_ps8_0_axi_periph_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_ps8_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_ps8_0_axi_periph_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_ps8_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_ps8_0_axi_periph_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_ps8_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_ps8_0_axi_periph_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_ps8_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m01_couplers_to_ps8_0_axi_periph_ARREADY : STD_LOGIC;
  signal m01_couplers_to_ps8_0_axi_periph_ARVALID : STD_LOGIC;
  signal m01_couplers_to_ps8_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m01_couplers_to_ps8_0_axi_periph_AWREADY : STD_LOGIC;
  signal m01_couplers_to_ps8_0_axi_periph_AWVALID : STD_LOGIC;
  signal m01_couplers_to_ps8_0_axi_periph_BREADY : STD_LOGIC;
  signal m01_couplers_to_ps8_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_ps8_0_axi_periph_BVALID : STD_LOGIC;
  signal m01_couplers_to_ps8_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_ps8_0_axi_periph_RREADY : STD_LOGIC;
  signal m01_couplers_to_ps8_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_ps8_0_axi_periph_RVALID : STD_LOGIC;
  signal m01_couplers_to_ps8_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_ps8_0_axi_periph_WREADY : STD_LOGIC;
  signal m01_couplers_to_ps8_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_ps8_0_axi_periph_WVALID : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m02_couplers_to_ps8_0_axi_periph_ARREADY : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_ARVALID : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m02_couplers_to_ps8_0_axi_periph_AWREADY : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_AWVALID : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_BREADY : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_ps8_0_axi_periph_BVALID : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_ps8_0_axi_periph_RREADY : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_ps8_0_axi_periph_RVALID : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_ps8_0_axi_periph_WREADY : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_WVALID : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m03_couplers_to_ps8_0_axi_periph_ARREADY : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_ARVALID : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m03_couplers_to_ps8_0_axi_periph_AWREADY : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_AWVALID : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_BREADY : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_ps8_0_axi_periph_BVALID : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_ps8_0_axi_periph_RREADY : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_ps8_0_axi_periph_RVALID : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_ps8_0_axi_periph_WREADY : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_ps8_0_axi_periph_WVALID : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m04_couplers_to_ps8_0_axi_periph_ARREADY : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_ARVALID : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m04_couplers_to_ps8_0_axi_periph_AWREADY : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_AWVALID : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_BREADY : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_ps8_0_axi_periph_BVALID : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_ps8_0_axi_periph_RREADY : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_ps8_0_axi_periph_RVALID : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_ps8_0_axi_periph_WREADY : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_ps8_0_axi_periph_WVALID : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m05_couplers_to_ps8_0_axi_periph_ARREADY : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_ARVALID : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m05_couplers_to_ps8_0_axi_periph_AWREADY : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_AWVALID : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_BREADY : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_ps8_0_axi_periph_BVALID : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_ps8_0_axi_periph_RREADY : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_ps8_0_axi_periph_RVALID : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_ps8_0_axi_periph_WREADY : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_WVALID : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m06_couplers_to_ps8_0_axi_periph_ARREADY : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_ARVALID : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m06_couplers_to_ps8_0_axi_periph_AWREADY : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_AWVALID : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_BREADY : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_ps8_0_axi_periph_BVALID : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_ps8_0_axi_periph_RREADY : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_ps8_0_axi_periph_RVALID : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_ps8_0_axi_periph_WREADY : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_ps8_0_axi_periph_WVALID : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m07_couplers_to_ps8_0_axi_periph_ARREADY : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_ARVALID : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m07_couplers_to_ps8_0_axi_periph_AWREADY : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_AWVALID : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_BREADY : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_ps8_0_axi_periph_BVALID : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_ps8_0_axi_periph_RREADY : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_ps8_0_axi_periph_RVALID : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_ps8_0_axi_periph_WREADY : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m07_couplers_to_ps8_0_axi_periph_WVALID : STD_LOGIC;
  signal ps8_0_axi_periph_ACLK_net : STD_LOGIC;
  signal ps8_0_axi_periph_ARESETN_net : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_ARID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ps8_0_axi_periph_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_ARREADY : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_ARVALID : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_AWID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ps8_0_axi_periph_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_AWREADY : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_AWVALID : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_BREADY : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_BVALID : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_RLAST : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_RREADY : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_RVALID : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_WLAST : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_WREADY : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_WVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal s00_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal s00_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_BREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_RREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_WVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal xbar_to_m00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal xbar_to_m00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 79 downto 40 );
  signal xbar_to_m01_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_ARVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 79 downto 40 );
  signal xbar_to_m01_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_AWVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m01_couplers_RREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_WVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 119 downto 80 );
  signal xbar_to_m02_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_ARVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 119 downto 80 );
  signal xbar_to_m02_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_AWVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m02_couplers_RREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_WVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 159 downto 120 );
  signal xbar_to_m03_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_ARVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 159 downto 120 );
  signal xbar_to_m03_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_AWVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m03_couplers_RREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_WSTRB : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_WVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m04_couplers_ARADDR : STD_LOGIC_VECTOR ( 199 downto 160 );
  signal xbar_to_m04_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_ARVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_AWADDR : STD_LOGIC_VECTOR ( 199 downto 160 );
  signal xbar_to_m04_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_AWVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m04_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m04_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m04_couplers_RREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m04_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m04_couplers_WDATA : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_WSTRB : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_WVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 239 downto 200 );
  signal xbar_to_m05_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_ARVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 239 downto 200 );
  signal xbar_to_m05_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_AWVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m05_couplers_RREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_WVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m06_couplers_ARADDR : STD_LOGIC_VECTOR ( 279 downto 240 );
  signal xbar_to_m06_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m06_couplers_ARVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_AWADDR : STD_LOGIC_VECTOR ( 279 downto 240 );
  signal xbar_to_m06_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m06_couplers_AWVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_BREADY : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m06_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m06_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m06_couplers_RREADY : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m06_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m06_couplers_WDATA : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m06_couplers_WSTRB : STD_LOGIC_VECTOR ( 27 downto 24 );
  signal xbar_to_m06_couplers_WVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m07_couplers_ARADDR : STD_LOGIC_VECTOR ( 319 downto 280 );
  signal xbar_to_m07_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m07_couplers_ARVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_AWADDR : STD_LOGIC_VECTOR ( 319 downto 280 );
  signal xbar_to_m07_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m07_couplers_AWVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_BREADY : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m07_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m07_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m07_couplers_RREADY : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m07_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m07_couplers_WDATA : STD_LOGIC_VECTOR ( 255 downto 224 );
  signal xbar_to_m07_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m07_couplers_WSTRB : STD_LOGIC_VECTOR ( 31 downto 28 );
  signal xbar_to_m07_couplers_WVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal NLW_xbar_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal NLW_xbar_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal NLW_xbar_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 23 downto 8 );
begin
  M00_ACLK_1 <= M00_ACLK;
  M00_ARESETN_1 <= M00_ARESETN;
  M00_AXI_araddr(39 downto 0) <= m00_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0);
  M00_AXI_arvalid(0) <= m00_couplers_to_ps8_0_axi_periph_ARVALID(0);
  M00_AXI_awaddr(39 downto 0) <= m00_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0);
  M00_AXI_awvalid(0) <= m00_couplers_to_ps8_0_axi_periph_AWVALID(0);
  M00_AXI_bready(0) <= m00_couplers_to_ps8_0_axi_periph_BREADY(0);
  M00_AXI_rready(0) <= m00_couplers_to_ps8_0_axi_periph_RREADY(0);
  M00_AXI_wdata(31 downto 0) <= m00_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0);
  M00_AXI_wstrb(3 downto 0) <= m00_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0);
  M00_AXI_wvalid(0) <= m00_couplers_to_ps8_0_axi_periph_WVALID(0);
  M01_ACLK_1 <= M01_ACLK;
  M01_ARESETN_1 <= M01_ARESETN;
  M01_AXI_araddr(39 downto 0) <= m01_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0);
  M01_AXI_arvalid <= m01_couplers_to_ps8_0_axi_periph_ARVALID;
  M01_AXI_awaddr(39 downto 0) <= m01_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0);
  M01_AXI_awvalid <= m01_couplers_to_ps8_0_axi_periph_AWVALID;
  M01_AXI_bready <= m01_couplers_to_ps8_0_axi_periph_BREADY;
  M01_AXI_rready <= m01_couplers_to_ps8_0_axi_periph_RREADY;
  M01_AXI_wdata(31 downto 0) <= m01_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0);
  M01_AXI_wstrb(3 downto 0) <= m01_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0);
  M01_AXI_wvalid <= m01_couplers_to_ps8_0_axi_periph_WVALID;
  M02_ACLK_1 <= M02_ACLK;
  M02_ARESETN_1 <= M02_ARESETN;
  M02_AXI_araddr(39 downto 0) <= m02_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0);
  M02_AXI_arvalid <= m02_couplers_to_ps8_0_axi_periph_ARVALID;
  M02_AXI_awaddr(39 downto 0) <= m02_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0);
  M02_AXI_awvalid <= m02_couplers_to_ps8_0_axi_periph_AWVALID;
  M02_AXI_bready <= m02_couplers_to_ps8_0_axi_periph_BREADY;
  M02_AXI_rready <= m02_couplers_to_ps8_0_axi_periph_RREADY;
  M02_AXI_wdata(31 downto 0) <= m02_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0);
  M02_AXI_wvalid <= m02_couplers_to_ps8_0_axi_periph_WVALID;
  M03_ACLK_1 <= M03_ACLK;
  M03_ARESETN_1 <= M03_ARESETN;
  M03_AXI_araddr(39 downto 0) <= m03_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0);
  M03_AXI_arvalid <= m03_couplers_to_ps8_0_axi_periph_ARVALID;
  M03_AXI_awaddr(39 downto 0) <= m03_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0);
  M03_AXI_awvalid <= m03_couplers_to_ps8_0_axi_periph_AWVALID;
  M03_AXI_bready <= m03_couplers_to_ps8_0_axi_periph_BREADY;
  M03_AXI_rready <= m03_couplers_to_ps8_0_axi_periph_RREADY;
  M03_AXI_wdata(31 downto 0) <= m03_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0);
  M03_AXI_wstrb(3 downto 0) <= m03_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0);
  M03_AXI_wvalid <= m03_couplers_to_ps8_0_axi_periph_WVALID;
  M04_ACLK_1 <= M04_ACLK;
  M04_ARESETN_1 <= M04_ARESETN;
  M04_AXI_araddr(39 downto 0) <= m04_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0);
  M04_AXI_arvalid <= m04_couplers_to_ps8_0_axi_periph_ARVALID;
  M04_AXI_awaddr(39 downto 0) <= m04_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0);
  M04_AXI_awvalid <= m04_couplers_to_ps8_0_axi_periph_AWVALID;
  M04_AXI_bready <= m04_couplers_to_ps8_0_axi_periph_BREADY;
  M04_AXI_rready <= m04_couplers_to_ps8_0_axi_periph_RREADY;
  M04_AXI_wdata(31 downto 0) <= m04_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0);
  M04_AXI_wstrb(3 downto 0) <= m04_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0);
  M04_AXI_wvalid <= m04_couplers_to_ps8_0_axi_periph_WVALID;
  M05_ACLK_1 <= M05_ACLK;
  M05_ARESETN_1 <= M05_ARESETN;
  M05_AXI_araddr(39 downto 0) <= m05_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0);
  M05_AXI_arvalid <= m05_couplers_to_ps8_0_axi_periph_ARVALID;
  M05_AXI_awaddr(39 downto 0) <= m05_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0);
  M05_AXI_awvalid <= m05_couplers_to_ps8_0_axi_periph_AWVALID;
  M05_AXI_bready <= m05_couplers_to_ps8_0_axi_periph_BREADY;
  M05_AXI_rready <= m05_couplers_to_ps8_0_axi_periph_RREADY;
  M05_AXI_wdata(31 downto 0) <= m05_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0);
  M05_AXI_wvalid <= m05_couplers_to_ps8_0_axi_periph_WVALID;
  M06_ACLK_1 <= M06_ACLK;
  M06_ARESETN_1 <= M06_ARESETN;
  M06_AXI_araddr(39 downto 0) <= m06_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0);
  M06_AXI_arvalid <= m06_couplers_to_ps8_0_axi_periph_ARVALID;
  M06_AXI_awaddr(39 downto 0) <= m06_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0);
  M06_AXI_awvalid <= m06_couplers_to_ps8_0_axi_periph_AWVALID;
  M06_AXI_bready <= m06_couplers_to_ps8_0_axi_periph_BREADY;
  M06_AXI_rready <= m06_couplers_to_ps8_0_axi_periph_RREADY;
  M06_AXI_wdata(31 downto 0) <= m06_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0);
  M06_AXI_wstrb(3 downto 0) <= m06_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0);
  M06_AXI_wvalid <= m06_couplers_to_ps8_0_axi_periph_WVALID;
  M07_ACLK_1 <= M07_ACLK;
  M07_ARESETN_1 <= M07_ARESETN;
  M07_AXI_araddr(39 downto 0) <= m07_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0);
  M07_AXI_arvalid <= m07_couplers_to_ps8_0_axi_periph_ARVALID;
  M07_AXI_awaddr(39 downto 0) <= m07_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0);
  M07_AXI_awvalid <= m07_couplers_to_ps8_0_axi_periph_AWVALID;
  M07_AXI_bready <= m07_couplers_to_ps8_0_axi_periph_BREADY;
  M07_AXI_rready <= m07_couplers_to_ps8_0_axi_periph_RREADY;
  M07_AXI_wdata(31 downto 0) <= m07_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0);
  M07_AXI_wstrb(3 downto 0) <= m07_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0);
  M07_AXI_wvalid <= m07_couplers_to_ps8_0_axi_periph_WVALID;
  S00_ACLK_1 <= S00_ACLK;
  S00_ARESETN_1 <= S00_ARESETN;
  S00_AXI_arready <= ps8_0_axi_periph_to_s00_couplers_ARREADY;
  S00_AXI_awready <= ps8_0_axi_periph_to_s00_couplers_AWREADY;
  S00_AXI_bid(15 downto 0) <= ps8_0_axi_periph_to_s00_couplers_BID(15 downto 0);
  S00_AXI_bresp(1 downto 0) <= ps8_0_axi_periph_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid <= ps8_0_axi_periph_to_s00_couplers_BVALID;
  S00_AXI_rdata(31 downto 0) <= ps8_0_axi_periph_to_s00_couplers_RDATA(31 downto 0);
  S00_AXI_rid(15 downto 0) <= ps8_0_axi_periph_to_s00_couplers_RID(15 downto 0);
  S00_AXI_rlast <= ps8_0_axi_periph_to_s00_couplers_RLAST;
  S00_AXI_rresp(1 downto 0) <= ps8_0_axi_periph_to_s00_couplers_RRESP(1 downto 0);
  S00_AXI_rvalid <= ps8_0_axi_periph_to_s00_couplers_RVALID;
  S00_AXI_wready <= ps8_0_axi_periph_to_s00_couplers_WREADY;
  m00_couplers_to_ps8_0_axi_periph_ARREADY(0) <= M00_AXI_arready(0);
  m00_couplers_to_ps8_0_axi_periph_AWREADY(0) <= M00_AXI_awready(0);
  m00_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  m00_couplers_to_ps8_0_axi_periph_BVALID(0) <= M00_AXI_bvalid(0);
  m00_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0) <= M00_AXI_rdata(31 downto 0);
  m00_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  m00_couplers_to_ps8_0_axi_periph_RVALID(0) <= M00_AXI_rvalid(0);
  m00_couplers_to_ps8_0_axi_periph_WREADY(0) <= M00_AXI_wready(0);
  m01_couplers_to_ps8_0_axi_periph_ARREADY <= M01_AXI_arready;
  m01_couplers_to_ps8_0_axi_periph_AWREADY <= M01_AXI_awready;
  m01_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0) <= M01_AXI_bresp(1 downto 0);
  m01_couplers_to_ps8_0_axi_periph_BVALID <= M01_AXI_bvalid;
  m01_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0) <= M01_AXI_rdata(31 downto 0);
  m01_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0) <= M01_AXI_rresp(1 downto 0);
  m01_couplers_to_ps8_0_axi_periph_RVALID <= M01_AXI_rvalid;
  m01_couplers_to_ps8_0_axi_periph_WREADY <= M01_AXI_wready;
  m02_couplers_to_ps8_0_axi_periph_ARREADY <= M02_AXI_arready;
  m02_couplers_to_ps8_0_axi_periph_AWREADY <= M02_AXI_awready;
  m02_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0) <= M02_AXI_bresp(1 downto 0);
  m02_couplers_to_ps8_0_axi_periph_BVALID <= M02_AXI_bvalid;
  m02_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0) <= M02_AXI_rdata(31 downto 0);
  m02_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0) <= M02_AXI_rresp(1 downto 0);
  m02_couplers_to_ps8_0_axi_periph_RVALID <= M02_AXI_rvalid;
  m02_couplers_to_ps8_0_axi_periph_WREADY <= M02_AXI_wready;
  m03_couplers_to_ps8_0_axi_periph_ARREADY <= M03_AXI_arready;
  m03_couplers_to_ps8_0_axi_periph_AWREADY <= M03_AXI_awready;
  m03_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0) <= M03_AXI_bresp(1 downto 0);
  m03_couplers_to_ps8_0_axi_periph_BVALID <= M03_AXI_bvalid;
  m03_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0) <= M03_AXI_rdata(31 downto 0);
  m03_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0) <= M03_AXI_rresp(1 downto 0);
  m03_couplers_to_ps8_0_axi_periph_RVALID <= M03_AXI_rvalid;
  m03_couplers_to_ps8_0_axi_periph_WREADY <= M03_AXI_wready;
  m04_couplers_to_ps8_0_axi_periph_ARREADY <= M04_AXI_arready;
  m04_couplers_to_ps8_0_axi_periph_AWREADY <= M04_AXI_awready;
  m04_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0) <= M04_AXI_bresp(1 downto 0);
  m04_couplers_to_ps8_0_axi_periph_BVALID <= M04_AXI_bvalid;
  m04_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0) <= M04_AXI_rdata(31 downto 0);
  m04_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0) <= M04_AXI_rresp(1 downto 0);
  m04_couplers_to_ps8_0_axi_periph_RVALID <= M04_AXI_rvalid;
  m04_couplers_to_ps8_0_axi_periph_WREADY <= M04_AXI_wready;
  m05_couplers_to_ps8_0_axi_periph_ARREADY <= M05_AXI_arready;
  m05_couplers_to_ps8_0_axi_periph_AWREADY <= M05_AXI_awready;
  m05_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0) <= M05_AXI_bresp(1 downto 0);
  m05_couplers_to_ps8_0_axi_periph_BVALID <= M05_AXI_bvalid;
  m05_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0) <= M05_AXI_rdata(31 downto 0);
  m05_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0) <= M05_AXI_rresp(1 downto 0);
  m05_couplers_to_ps8_0_axi_periph_RVALID <= M05_AXI_rvalid;
  m05_couplers_to_ps8_0_axi_periph_WREADY <= M05_AXI_wready;
  m06_couplers_to_ps8_0_axi_periph_ARREADY <= M06_AXI_arready;
  m06_couplers_to_ps8_0_axi_periph_AWREADY <= M06_AXI_awready;
  m06_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0) <= M06_AXI_bresp(1 downto 0);
  m06_couplers_to_ps8_0_axi_periph_BVALID <= M06_AXI_bvalid;
  m06_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0) <= M06_AXI_rdata(31 downto 0);
  m06_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0) <= M06_AXI_rresp(1 downto 0);
  m06_couplers_to_ps8_0_axi_periph_RVALID <= M06_AXI_rvalid;
  m06_couplers_to_ps8_0_axi_periph_WREADY <= M06_AXI_wready;
  m07_couplers_to_ps8_0_axi_periph_ARREADY <= M07_AXI_arready;
  m07_couplers_to_ps8_0_axi_periph_AWREADY <= M07_AXI_awready;
  m07_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0) <= M07_AXI_bresp(1 downto 0);
  m07_couplers_to_ps8_0_axi_periph_BVALID <= M07_AXI_bvalid;
  m07_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0) <= M07_AXI_rdata(31 downto 0);
  m07_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0) <= M07_AXI_rresp(1 downto 0);
  m07_couplers_to_ps8_0_axi_periph_RVALID <= M07_AXI_rvalid;
  m07_couplers_to_ps8_0_axi_periph_WREADY <= M07_AXI_wready;
  ps8_0_axi_periph_ACLK_net <= ACLK;
  ps8_0_axi_periph_ARESETN_net <= ARESETN;
  ps8_0_axi_periph_to_s00_couplers_ARADDR(39 downto 0) <= S00_AXI_araddr(39 downto 0);
  ps8_0_axi_periph_to_s00_couplers_ARBURST(1 downto 0) <= S00_AXI_arburst(1 downto 0);
  ps8_0_axi_periph_to_s00_couplers_ARCACHE(3 downto 0) <= S00_AXI_arcache(3 downto 0);
  ps8_0_axi_periph_to_s00_couplers_ARID(15 downto 0) <= S00_AXI_arid(15 downto 0);
  ps8_0_axi_periph_to_s00_couplers_ARLEN(7 downto 0) <= S00_AXI_arlen(7 downto 0);
  ps8_0_axi_periph_to_s00_couplers_ARLOCK(0) <= S00_AXI_arlock(0);
  ps8_0_axi_periph_to_s00_couplers_ARPROT(2 downto 0) <= S00_AXI_arprot(2 downto 0);
  ps8_0_axi_periph_to_s00_couplers_ARQOS(3 downto 0) <= S00_AXI_arqos(3 downto 0);
  ps8_0_axi_periph_to_s00_couplers_ARSIZE(2 downto 0) <= S00_AXI_arsize(2 downto 0);
  ps8_0_axi_periph_to_s00_couplers_ARVALID <= S00_AXI_arvalid;
  ps8_0_axi_periph_to_s00_couplers_AWADDR(39 downto 0) <= S00_AXI_awaddr(39 downto 0);
  ps8_0_axi_periph_to_s00_couplers_AWBURST(1 downto 0) <= S00_AXI_awburst(1 downto 0);
  ps8_0_axi_periph_to_s00_couplers_AWCACHE(3 downto 0) <= S00_AXI_awcache(3 downto 0);
  ps8_0_axi_periph_to_s00_couplers_AWID(15 downto 0) <= S00_AXI_awid(15 downto 0);
  ps8_0_axi_periph_to_s00_couplers_AWLEN(7 downto 0) <= S00_AXI_awlen(7 downto 0);
  ps8_0_axi_periph_to_s00_couplers_AWLOCK(0) <= S00_AXI_awlock(0);
  ps8_0_axi_periph_to_s00_couplers_AWPROT(2 downto 0) <= S00_AXI_awprot(2 downto 0);
  ps8_0_axi_periph_to_s00_couplers_AWQOS(3 downto 0) <= S00_AXI_awqos(3 downto 0);
  ps8_0_axi_periph_to_s00_couplers_AWSIZE(2 downto 0) <= S00_AXI_awsize(2 downto 0);
  ps8_0_axi_periph_to_s00_couplers_AWVALID <= S00_AXI_awvalid;
  ps8_0_axi_periph_to_s00_couplers_BREADY <= S00_AXI_bready;
  ps8_0_axi_periph_to_s00_couplers_RREADY <= S00_AXI_rready;
  ps8_0_axi_periph_to_s00_couplers_WDATA(31 downto 0) <= S00_AXI_wdata(31 downto 0);
  ps8_0_axi_periph_to_s00_couplers_WLAST <= S00_AXI_wlast;
  ps8_0_axi_periph_to_s00_couplers_WSTRB(3 downto 0) <= S00_AXI_wstrb(3 downto 0);
  ps8_0_axi_periph_to_s00_couplers_WVALID <= S00_AXI_wvalid;
m00_couplers: entity work.m00_couplers_imp_1N6O1RF
     port map (
      M_ACLK => M00_ACLK_1,
      M_ARESETN => M00_ARESETN_1,
      M_AXI_araddr(39 downto 0) => m00_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0),
      M_AXI_arready(0) => m00_couplers_to_ps8_0_axi_periph_ARREADY(0),
      M_AXI_arvalid(0) => m00_couplers_to_ps8_0_axi_periph_ARVALID(0),
      M_AXI_awaddr(39 downto 0) => m00_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0),
      M_AXI_awready(0) => m00_couplers_to_ps8_0_axi_periph_AWREADY(0),
      M_AXI_awvalid(0) => m00_couplers_to_ps8_0_axi_periph_AWVALID(0),
      M_AXI_bready(0) => m00_couplers_to_ps8_0_axi_periph_BREADY(0),
      M_AXI_bresp(1 downto 0) => m00_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m00_couplers_to_ps8_0_axi_periph_BVALID(0),
      M_AXI_rdata(31 downto 0) => m00_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready(0) => m00_couplers_to_ps8_0_axi_periph_RREADY(0),
      M_AXI_rresp(1 downto 0) => m00_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m00_couplers_to_ps8_0_axi_periph_RVALID(0),
      M_AXI_wdata(31 downto 0) => m00_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready(0) => m00_couplers_to_ps8_0_axi_periph_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m00_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m00_couplers_to_ps8_0_axi_periph_WVALID(0),
      S_ACLK => ps8_0_axi_periph_ACLK_net,
      S_ARESETN => ps8_0_axi_periph_ARESETN_net,
      S_AXI_araddr(39 downto 0) => xbar_to_m00_couplers_ARADDR(39 downto 0),
      S_AXI_arready(0) => xbar_to_m00_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      S_AXI_awaddr(39 downto 0) => xbar_to_m00_couplers_AWADDR(39 downto 0),
      S_AXI_awready(0) => xbar_to_m00_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      S_AXI_bready(0) => xbar_to_m00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m00_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m00_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      S_AXI_wready(0) => xbar_to_m00_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid(0) => xbar_to_m00_couplers_WVALID(0)
    );
m01_couplers: entity work.m01_couplers_imp_1CVMW8D
     port map (
      M_ACLK => M01_ACLK_1,
      M_ARESETN => M01_ARESETN_1,
      M_AXI_araddr(39 downto 0) => m01_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0),
      M_AXI_arready => m01_couplers_to_ps8_0_axi_periph_ARREADY,
      M_AXI_arvalid => m01_couplers_to_ps8_0_axi_periph_ARVALID,
      M_AXI_awaddr(39 downto 0) => m01_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0),
      M_AXI_awready => m01_couplers_to_ps8_0_axi_periph_AWREADY,
      M_AXI_awvalid => m01_couplers_to_ps8_0_axi_periph_AWVALID,
      M_AXI_bready => m01_couplers_to_ps8_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m01_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m01_couplers_to_ps8_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m01_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m01_couplers_to_ps8_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m01_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m01_couplers_to_ps8_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m01_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m01_couplers_to_ps8_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m01_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m01_couplers_to_ps8_0_axi_periph_WVALID,
      S_ACLK => ps8_0_axi_periph_ACLK_net,
      S_ARESETN => ps8_0_axi_periph_ARESETN_net,
      S_AXI_araddr(39 downto 0) => xbar_to_m01_couplers_ARADDR(79 downto 40),
      S_AXI_arready => xbar_to_m01_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m01_couplers_ARVALID(1),
      S_AXI_awaddr(39 downto 0) => xbar_to_m01_couplers_AWADDR(79 downto 40),
      S_AXI_awready => xbar_to_m01_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m01_couplers_AWVALID(1),
      S_AXI_bready => xbar_to_m01_couplers_BREADY(1),
      S_AXI_bresp(1 downto 0) => xbar_to_m01_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m01_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m01_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m01_couplers_RREADY(1),
      S_AXI_rresp(1 downto 0) => xbar_to_m01_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m01_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m01_couplers_WDATA(63 downto 32),
      S_AXI_wready => xbar_to_m01_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      S_AXI_wvalid => xbar_to_m01_couplers_WVALID(1)
    );
m02_couplers: entity work.m02_couplers_imp_8QOAQV
     port map (
      M_ACLK => M02_ACLK_1,
      M_ARESETN => M02_ARESETN_1,
      M_AXI_araddr(39 downto 0) => m02_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0),
      M_AXI_arready => m02_couplers_to_ps8_0_axi_periph_ARREADY,
      M_AXI_arvalid => m02_couplers_to_ps8_0_axi_periph_ARVALID,
      M_AXI_awaddr(39 downto 0) => m02_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0),
      M_AXI_awready => m02_couplers_to_ps8_0_axi_periph_AWREADY,
      M_AXI_awvalid => m02_couplers_to_ps8_0_axi_periph_AWVALID,
      M_AXI_bready => m02_couplers_to_ps8_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m02_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m02_couplers_to_ps8_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m02_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m02_couplers_to_ps8_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m02_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m02_couplers_to_ps8_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m02_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m02_couplers_to_ps8_0_axi_periph_WREADY,
      M_AXI_wvalid => m02_couplers_to_ps8_0_axi_periph_WVALID,
      S_ACLK => ps8_0_axi_periph_ACLK_net,
      S_ARESETN => ps8_0_axi_periph_ARESETN_net,
      S_AXI_araddr(39 downto 0) => xbar_to_m02_couplers_ARADDR(119 downto 80),
      S_AXI_arready => xbar_to_m02_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m02_couplers_ARVALID(2),
      S_AXI_awaddr(39 downto 0) => xbar_to_m02_couplers_AWADDR(119 downto 80),
      S_AXI_awready => xbar_to_m02_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m02_couplers_AWVALID(2),
      S_AXI_bready => xbar_to_m02_couplers_BREADY(2),
      S_AXI_bresp(1 downto 0) => xbar_to_m02_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m02_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m02_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m02_couplers_RREADY(2),
      S_AXI_rresp(1 downto 0) => xbar_to_m02_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m02_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m02_couplers_WDATA(95 downto 64),
      S_AXI_wready => xbar_to_m02_couplers_WREADY,
      S_AXI_wvalid => xbar_to_m02_couplers_WVALID(2)
    );
m03_couplers: entity work.m03_couplers_imp_Y3OBVL
     port map (
      M_ACLK => M03_ACLK_1,
      M_ARESETN => M03_ARESETN_1,
      M_AXI_araddr(39 downto 0) => m03_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0),
      M_AXI_arready => m03_couplers_to_ps8_0_axi_periph_ARREADY,
      M_AXI_arvalid => m03_couplers_to_ps8_0_axi_periph_ARVALID,
      M_AXI_awaddr(39 downto 0) => m03_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0),
      M_AXI_awready => m03_couplers_to_ps8_0_axi_periph_AWREADY,
      M_AXI_awvalid => m03_couplers_to_ps8_0_axi_periph_AWVALID,
      M_AXI_bready => m03_couplers_to_ps8_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m03_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m03_couplers_to_ps8_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m03_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m03_couplers_to_ps8_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m03_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m03_couplers_to_ps8_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m03_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m03_couplers_to_ps8_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m03_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m03_couplers_to_ps8_0_axi_periph_WVALID,
      S_ACLK => ps8_0_axi_periph_ACLK_net,
      S_ARESETN => ps8_0_axi_periph_ARESETN_net,
      S_AXI_araddr(39 downto 0) => xbar_to_m03_couplers_ARADDR(159 downto 120),
      S_AXI_arready => xbar_to_m03_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m03_couplers_ARVALID(3),
      S_AXI_awaddr(39 downto 0) => xbar_to_m03_couplers_AWADDR(159 downto 120),
      S_AXI_awready => xbar_to_m03_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m03_couplers_AWVALID(3),
      S_AXI_bready => xbar_to_m03_couplers_BREADY(3),
      S_AXI_bresp(1 downto 0) => xbar_to_m03_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m03_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m03_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m03_couplers_RREADY(3),
      S_AXI_rresp(1 downto 0) => xbar_to_m03_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m03_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m03_couplers_WDATA(127 downto 96),
      S_AXI_wready => xbar_to_m03_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m03_couplers_WSTRB(15 downto 12),
      S_AXI_wvalid => xbar_to_m03_couplers_WVALID(3)
    );
m04_couplers: entity work.m04_couplers_imp_176MJ02
     port map (
      M_ACLK => M04_ACLK_1,
      M_ARESETN => M04_ARESETN_1,
      M_AXI_araddr(39 downto 0) => m04_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0),
      M_AXI_arready => m04_couplers_to_ps8_0_axi_periph_ARREADY,
      M_AXI_arvalid => m04_couplers_to_ps8_0_axi_periph_ARVALID,
      M_AXI_awaddr(39 downto 0) => m04_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0),
      M_AXI_awready => m04_couplers_to_ps8_0_axi_periph_AWREADY,
      M_AXI_awvalid => m04_couplers_to_ps8_0_axi_periph_AWVALID,
      M_AXI_bready => m04_couplers_to_ps8_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m04_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m04_couplers_to_ps8_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m04_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m04_couplers_to_ps8_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m04_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m04_couplers_to_ps8_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m04_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m04_couplers_to_ps8_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m04_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m04_couplers_to_ps8_0_axi_periph_WVALID,
      S_ACLK => ps8_0_axi_periph_ACLK_net,
      S_ARESETN => ps8_0_axi_periph_ARESETN_net,
      S_AXI_araddr(39 downto 0) => xbar_to_m04_couplers_ARADDR(199 downto 160),
      S_AXI_arready => xbar_to_m04_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m04_couplers_ARVALID(4),
      S_AXI_awaddr(39 downto 0) => xbar_to_m04_couplers_AWADDR(199 downto 160),
      S_AXI_awready => xbar_to_m04_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m04_couplers_AWVALID(4),
      S_AXI_bready => xbar_to_m04_couplers_BREADY(4),
      S_AXI_bresp(1 downto 0) => xbar_to_m04_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m04_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m04_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m04_couplers_RREADY(4),
      S_AXI_rresp(1 downto 0) => xbar_to_m04_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m04_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m04_couplers_WDATA(159 downto 128),
      S_AXI_wready => xbar_to_m04_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m04_couplers_WSTRB(19 downto 16),
      S_AXI_wvalid => xbar_to_m04_couplers_WVALID(4)
    );
m05_couplers: entity work.m05_couplers_imp_1YOSPO4
     port map (
      M_ACLK => M05_ACLK_1,
      M_ARESETN => M05_ARESETN_1,
      M_AXI_araddr(39 downto 0) => m05_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0),
      M_AXI_arready => m05_couplers_to_ps8_0_axi_periph_ARREADY,
      M_AXI_arvalid => m05_couplers_to_ps8_0_axi_periph_ARVALID,
      M_AXI_awaddr(39 downto 0) => m05_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0),
      M_AXI_awready => m05_couplers_to_ps8_0_axi_periph_AWREADY,
      M_AXI_awvalid => m05_couplers_to_ps8_0_axi_periph_AWVALID,
      M_AXI_bready => m05_couplers_to_ps8_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m05_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m05_couplers_to_ps8_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m05_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m05_couplers_to_ps8_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m05_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m05_couplers_to_ps8_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m05_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m05_couplers_to_ps8_0_axi_periph_WREADY,
      M_AXI_wvalid => m05_couplers_to_ps8_0_axi_periph_WVALID,
      S_ACLK => ps8_0_axi_periph_ACLK_net,
      S_ARESETN => ps8_0_axi_periph_ARESETN_net,
      S_AXI_araddr(39 downto 0) => xbar_to_m05_couplers_ARADDR(239 downto 200),
      S_AXI_arready => xbar_to_m05_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m05_couplers_ARVALID(5),
      S_AXI_awaddr(39 downto 0) => xbar_to_m05_couplers_AWADDR(239 downto 200),
      S_AXI_awready => xbar_to_m05_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m05_couplers_AWVALID(5),
      S_AXI_bready => xbar_to_m05_couplers_BREADY(5),
      S_AXI_bresp(1 downto 0) => xbar_to_m05_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m05_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m05_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m05_couplers_RREADY(5),
      S_AXI_rresp(1 downto 0) => xbar_to_m05_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m05_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m05_couplers_WDATA(191 downto 160),
      S_AXI_wready => xbar_to_m05_couplers_WREADY,
      S_AXI_wvalid => xbar_to_m05_couplers_WVALID(5)
    );
m06_couplers: entity work.m06_couplers_imp_MLCGU6
     port map (
      M_ACLK => M06_ACLK_1,
      M_ARESETN => M06_ARESETN_1,
      M_AXI_araddr(39 downto 0) => m06_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0),
      M_AXI_arready => m06_couplers_to_ps8_0_axi_periph_ARREADY,
      M_AXI_arvalid => m06_couplers_to_ps8_0_axi_periph_ARVALID,
      M_AXI_awaddr(39 downto 0) => m06_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0),
      M_AXI_awready => m06_couplers_to_ps8_0_axi_periph_AWREADY,
      M_AXI_awvalid => m06_couplers_to_ps8_0_axi_periph_AWVALID,
      M_AXI_bready => m06_couplers_to_ps8_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m06_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m06_couplers_to_ps8_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m06_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m06_couplers_to_ps8_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m06_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m06_couplers_to_ps8_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m06_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m06_couplers_to_ps8_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m06_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m06_couplers_to_ps8_0_axi_periph_WVALID,
      S_ACLK => ps8_0_axi_periph_ACLK_net,
      S_ARESETN => ps8_0_axi_periph_ARESETN_net,
      S_AXI_araddr(39 downto 0) => xbar_to_m06_couplers_ARADDR(279 downto 240),
      S_AXI_arready => xbar_to_m06_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m06_couplers_ARVALID(6),
      S_AXI_awaddr(39 downto 0) => xbar_to_m06_couplers_AWADDR(279 downto 240),
      S_AXI_awready => xbar_to_m06_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m06_couplers_AWVALID(6),
      S_AXI_bready => xbar_to_m06_couplers_BREADY(6),
      S_AXI_bresp(1 downto 0) => xbar_to_m06_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m06_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m06_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m06_couplers_RREADY(6),
      S_AXI_rresp(1 downto 0) => xbar_to_m06_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m06_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m06_couplers_WDATA(223 downto 192),
      S_AXI_wready => xbar_to_m06_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m06_couplers_WSTRB(27 downto 24),
      S_AXI_wvalid => xbar_to_m06_couplers_WVALID(6)
    );
m07_couplers: entity work.m07_couplers_imp_EFT20O
     port map (
      M_ACLK => M07_ACLK_1,
      M_ARESETN => M07_ARESETN_1,
      M_AXI_araddr(39 downto 0) => m07_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0),
      M_AXI_arready => m07_couplers_to_ps8_0_axi_periph_ARREADY,
      M_AXI_arvalid => m07_couplers_to_ps8_0_axi_periph_ARVALID,
      M_AXI_awaddr(39 downto 0) => m07_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0),
      M_AXI_awready => m07_couplers_to_ps8_0_axi_periph_AWREADY,
      M_AXI_awvalid => m07_couplers_to_ps8_0_axi_periph_AWVALID,
      M_AXI_bready => m07_couplers_to_ps8_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m07_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m07_couplers_to_ps8_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m07_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m07_couplers_to_ps8_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m07_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m07_couplers_to_ps8_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m07_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m07_couplers_to_ps8_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m07_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m07_couplers_to_ps8_0_axi_periph_WVALID,
      S_ACLK => ps8_0_axi_periph_ACLK_net,
      S_ARESETN => ps8_0_axi_periph_ARESETN_net,
      S_AXI_araddr(39 downto 0) => xbar_to_m07_couplers_ARADDR(319 downto 280),
      S_AXI_arready => xbar_to_m07_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m07_couplers_ARVALID(7),
      S_AXI_awaddr(39 downto 0) => xbar_to_m07_couplers_AWADDR(319 downto 280),
      S_AXI_awready => xbar_to_m07_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m07_couplers_AWVALID(7),
      S_AXI_bready => xbar_to_m07_couplers_BREADY(7),
      S_AXI_bresp(1 downto 0) => xbar_to_m07_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m07_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m07_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m07_couplers_RREADY(7),
      S_AXI_rresp(1 downto 0) => xbar_to_m07_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m07_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m07_couplers_WDATA(255 downto 224),
      S_AXI_wready => xbar_to_m07_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m07_couplers_WSTRB(31 downto 28),
      S_AXI_wvalid => xbar_to_m07_couplers_WVALID(7)
    );
s00_couplers: entity work.s00_couplers_imp_1ESDVSA
     port map (
      M_ACLK => ps8_0_axi_periph_ACLK_net,
      M_ARESETN => ps8_0_axi_periph_ARESETN_net,
      M_AXI_araddr(39 downto 0) => s00_couplers_to_xbar_ARADDR(39 downto 0),
      M_AXI_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arready => s00_couplers_to_xbar_ARREADY(0),
      M_AXI_arvalid => s00_couplers_to_xbar_ARVALID,
      M_AXI_awaddr(39 downto 0) => s00_couplers_to_xbar_AWADDR(39 downto 0),
      M_AXI_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awready => s00_couplers_to_xbar_AWREADY(0),
      M_AXI_awvalid => s00_couplers_to_xbar_AWVALID,
      M_AXI_bready => s00_couplers_to_xbar_BREADY,
      M_AXI_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      M_AXI_bvalid => s00_couplers_to_xbar_BVALID(0),
      M_AXI_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      M_AXI_rready => s00_couplers_to_xbar_RREADY,
      M_AXI_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      M_AXI_rvalid => s00_couplers_to_xbar_RVALID(0),
      M_AXI_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      M_AXI_wready => s00_couplers_to_xbar_WREADY(0),
      M_AXI_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      M_AXI_wvalid => s00_couplers_to_xbar_WVALID,
      S_ACLK => S00_ACLK_1,
      S_ARESETN => S00_ARESETN_1,
      S_AXI_araddr(39 downto 0) => ps8_0_axi_periph_to_s00_couplers_ARADDR(39 downto 0),
      S_AXI_arburst(1 downto 0) => ps8_0_axi_periph_to_s00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => ps8_0_axi_periph_to_s00_couplers_ARCACHE(3 downto 0),
      S_AXI_arid(15 downto 0) => ps8_0_axi_periph_to_s00_couplers_ARID(15 downto 0),
      S_AXI_arlen(7 downto 0) => ps8_0_axi_periph_to_s00_couplers_ARLEN(7 downto 0),
      S_AXI_arlock(0) => ps8_0_axi_periph_to_s00_couplers_ARLOCK(0),
      S_AXI_arprot(2 downto 0) => ps8_0_axi_periph_to_s00_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => ps8_0_axi_periph_to_s00_couplers_ARQOS(3 downto 0),
      S_AXI_arready => ps8_0_axi_periph_to_s00_couplers_ARREADY,
      S_AXI_arsize(2 downto 0) => ps8_0_axi_periph_to_s00_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => ps8_0_axi_periph_to_s00_couplers_ARVALID,
      S_AXI_awaddr(39 downto 0) => ps8_0_axi_periph_to_s00_couplers_AWADDR(39 downto 0),
      S_AXI_awburst(1 downto 0) => ps8_0_axi_periph_to_s00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => ps8_0_axi_periph_to_s00_couplers_AWCACHE(3 downto 0),
      S_AXI_awid(15 downto 0) => ps8_0_axi_periph_to_s00_couplers_AWID(15 downto 0),
      S_AXI_awlen(7 downto 0) => ps8_0_axi_periph_to_s00_couplers_AWLEN(7 downto 0),
      S_AXI_awlock(0) => ps8_0_axi_periph_to_s00_couplers_AWLOCK(0),
      S_AXI_awprot(2 downto 0) => ps8_0_axi_periph_to_s00_couplers_AWPROT(2 downto 0),
      S_AXI_awqos(3 downto 0) => ps8_0_axi_periph_to_s00_couplers_AWQOS(3 downto 0),
      S_AXI_awready => ps8_0_axi_periph_to_s00_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => ps8_0_axi_periph_to_s00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => ps8_0_axi_periph_to_s00_couplers_AWVALID,
      S_AXI_bid(15 downto 0) => ps8_0_axi_periph_to_s00_couplers_BID(15 downto 0),
      S_AXI_bready => ps8_0_axi_periph_to_s00_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => ps8_0_axi_periph_to_s00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => ps8_0_axi_periph_to_s00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => ps8_0_axi_periph_to_s00_couplers_RDATA(31 downto 0),
      S_AXI_rid(15 downto 0) => ps8_0_axi_periph_to_s00_couplers_RID(15 downto 0),
      S_AXI_rlast => ps8_0_axi_periph_to_s00_couplers_RLAST,
      S_AXI_rready => ps8_0_axi_periph_to_s00_couplers_RREADY,
      S_AXI_rresp(1 downto 0) => ps8_0_axi_periph_to_s00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => ps8_0_axi_periph_to_s00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => ps8_0_axi_periph_to_s00_couplers_WDATA(31 downto 0),
      S_AXI_wlast => ps8_0_axi_periph_to_s00_couplers_WLAST,
      S_AXI_wready => ps8_0_axi_periph_to_s00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => ps8_0_axi_periph_to_s00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => ps8_0_axi_periph_to_s00_couplers_WVALID
    );
xbar: component MercuryXU1_xbar_1
     port map (
      aclk => ps8_0_axi_periph_ACLK_net,
      aresetn => ps8_0_axi_periph_ARESETN_net,
      m_axi_araddr(319 downto 280) => xbar_to_m07_couplers_ARADDR(319 downto 280),
      m_axi_araddr(279 downto 240) => xbar_to_m06_couplers_ARADDR(279 downto 240),
      m_axi_araddr(239 downto 200) => xbar_to_m05_couplers_ARADDR(239 downto 200),
      m_axi_araddr(199 downto 160) => xbar_to_m04_couplers_ARADDR(199 downto 160),
      m_axi_araddr(159 downto 120) => xbar_to_m03_couplers_ARADDR(159 downto 120),
      m_axi_araddr(119 downto 80) => xbar_to_m02_couplers_ARADDR(119 downto 80),
      m_axi_araddr(79 downto 40) => xbar_to_m01_couplers_ARADDR(79 downto 40),
      m_axi_araddr(39 downto 0) => xbar_to_m00_couplers_ARADDR(39 downto 0),
      m_axi_arprot(23 downto 0) => NLW_xbar_m_axi_arprot_UNCONNECTED(23 downto 0),
      m_axi_arready(7) => xbar_to_m07_couplers_ARREADY,
      m_axi_arready(6) => xbar_to_m06_couplers_ARREADY,
      m_axi_arready(5) => xbar_to_m05_couplers_ARREADY,
      m_axi_arready(4) => xbar_to_m04_couplers_ARREADY,
      m_axi_arready(3) => xbar_to_m03_couplers_ARREADY,
      m_axi_arready(2) => xbar_to_m02_couplers_ARREADY,
      m_axi_arready(1) => xbar_to_m01_couplers_ARREADY,
      m_axi_arready(0) => xbar_to_m00_couplers_ARREADY(0),
      m_axi_arvalid(7) => xbar_to_m07_couplers_ARVALID(7),
      m_axi_arvalid(6) => xbar_to_m06_couplers_ARVALID(6),
      m_axi_arvalid(5) => xbar_to_m05_couplers_ARVALID(5),
      m_axi_arvalid(4) => xbar_to_m04_couplers_ARVALID(4),
      m_axi_arvalid(3) => xbar_to_m03_couplers_ARVALID(3),
      m_axi_arvalid(2) => xbar_to_m02_couplers_ARVALID(2),
      m_axi_arvalid(1) => xbar_to_m01_couplers_ARVALID(1),
      m_axi_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      m_axi_awaddr(319 downto 280) => xbar_to_m07_couplers_AWADDR(319 downto 280),
      m_axi_awaddr(279 downto 240) => xbar_to_m06_couplers_AWADDR(279 downto 240),
      m_axi_awaddr(239 downto 200) => xbar_to_m05_couplers_AWADDR(239 downto 200),
      m_axi_awaddr(199 downto 160) => xbar_to_m04_couplers_AWADDR(199 downto 160),
      m_axi_awaddr(159 downto 120) => xbar_to_m03_couplers_AWADDR(159 downto 120),
      m_axi_awaddr(119 downto 80) => xbar_to_m02_couplers_AWADDR(119 downto 80),
      m_axi_awaddr(79 downto 40) => xbar_to_m01_couplers_AWADDR(79 downto 40),
      m_axi_awaddr(39 downto 0) => xbar_to_m00_couplers_AWADDR(39 downto 0),
      m_axi_awprot(23 downto 0) => NLW_xbar_m_axi_awprot_UNCONNECTED(23 downto 0),
      m_axi_awready(7) => xbar_to_m07_couplers_AWREADY,
      m_axi_awready(6) => xbar_to_m06_couplers_AWREADY,
      m_axi_awready(5) => xbar_to_m05_couplers_AWREADY,
      m_axi_awready(4) => xbar_to_m04_couplers_AWREADY,
      m_axi_awready(3) => xbar_to_m03_couplers_AWREADY,
      m_axi_awready(2) => xbar_to_m02_couplers_AWREADY,
      m_axi_awready(1) => xbar_to_m01_couplers_AWREADY,
      m_axi_awready(0) => xbar_to_m00_couplers_AWREADY(0),
      m_axi_awvalid(7) => xbar_to_m07_couplers_AWVALID(7),
      m_axi_awvalid(6) => xbar_to_m06_couplers_AWVALID(6),
      m_axi_awvalid(5) => xbar_to_m05_couplers_AWVALID(5),
      m_axi_awvalid(4) => xbar_to_m04_couplers_AWVALID(4),
      m_axi_awvalid(3) => xbar_to_m03_couplers_AWVALID(3),
      m_axi_awvalid(2) => xbar_to_m02_couplers_AWVALID(2),
      m_axi_awvalid(1) => xbar_to_m01_couplers_AWVALID(1),
      m_axi_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      m_axi_bready(7) => xbar_to_m07_couplers_BREADY(7),
      m_axi_bready(6) => xbar_to_m06_couplers_BREADY(6),
      m_axi_bready(5) => xbar_to_m05_couplers_BREADY(5),
      m_axi_bready(4) => xbar_to_m04_couplers_BREADY(4),
      m_axi_bready(3) => xbar_to_m03_couplers_BREADY(3),
      m_axi_bready(2) => xbar_to_m02_couplers_BREADY(2),
      m_axi_bready(1) => xbar_to_m01_couplers_BREADY(1),
      m_axi_bready(0) => xbar_to_m00_couplers_BREADY(0),
      m_axi_bresp(15 downto 14) => xbar_to_m07_couplers_BRESP(1 downto 0),
      m_axi_bresp(13 downto 12) => xbar_to_m06_couplers_BRESP(1 downto 0),
      m_axi_bresp(11 downto 10) => xbar_to_m05_couplers_BRESP(1 downto 0),
      m_axi_bresp(9 downto 8) => xbar_to_m04_couplers_BRESP(1 downto 0),
      m_axi_bresp(7 downto 6) => xbar_to_m03_couplers_BRESP(1 downto 0),
      m_axi_bresp(5 downto 4) => xbar_to_m02_couplers_BRESP(1 downto 0),
      m_axi_bresp(3 downto 2) => xbar_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid(7) => xbar_to_m07_couplers_BVALID,
      m_axi_bvalid(6) => xbar_to_m06_couplers_BVALID,
      m_axi_bvalid(5) => xbar_to_m05_couplers_BVALID,
      m_axi_bvalid(4) => xbar_to_m04_couplers_BVALID,
      m_axi_bvalid(3) => xbar_to_m03_couplers_BVALID,
      m_axi_bvalid(2) => xbar_to_m02_couplers_BVALID,
      m_axi_bvalid(1) => xbar_to_m01_couplers_BVALID,
      m_axi_bvalid(0) => xbar_to_m00_couplers_BVALID(0),
      m_axi_rdata(255 downto 224) => xbar_to_m07_couplers_RDATA(31 downto 0),
      m_axi_rdata(223 downto 192) => xbar_to_m06_couplers_RDATA(31 downto 0),
      m_axi_rdata(191 downto 160) => xbar_to_m05_couplers_RDATA(31 downto 0),
      m_axi_rdata(159 downto 128) => xbar_to_m04_couplers_RDATA(31 downto 0),
      m_axi_rdata(127 downto 96) => xbar_to_m03_couplers_RDATA(31 downto 0),
      m_axi_rdata(95 downto 64) => xbar_to_m02_couplers_RDATA(31 downto 0),
      m_axi_rdata(63 downto 32) => xbar_to_m01_couplers_RDATA(31 downto 0),
      m_axi_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rready(7) => xbar_to_m07_couplers_RREADY(7),
      m_axi_rready(6) => xbar_to_m06_couplers_RREADY(6),
      m_axi_rready(5) => xbar_to_m05_couplers_RREADY(5),
      m_axi_rready(4) => xbar_to_m04_couplers_RREADY(4),
      m_axi_rready(3) => xbar_to_m03_couplers_RREADY(3),
      m_axi_rready(2) => xbar_to_m02_couplers_RREADY(2),
      m_axi_rready(1) => xbar_to_m01_couplers_RREADY(1),
      m_axi_rready(0) => xbar_to_m00_couplers_RREADY(0),
      m_axi_rresp(15 downto 14) => xbar_to_m07_couplers_RRESP(1 downto 0),
      m_axi_rresp(13 downto 12) => xbar_to_m06_couplers_RRESP(1 downto 0),
      m_axi_rresp(11 downto 10) => xbar_to_m05_couplers_RRESP(1 downto 0),
      m_axi_rresp(9 downto 8) => xbar_to_m04_couplers_RRESP(1 downto 0),
      m_axi_rresp(7 downto 6) => xbar_to_m03_couplers_RRESP(1 downto 0),
      m_axi_rresp(5 downto 4) => xbar_to_m02_couplers_RRESP(1 downto 0),
      m_axi_rresp(3 downto 2) => xbar_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid(7) => xbar_to_m07_couplers_RVALID,
      m_axi_rvalid(6) => xbar_to_m06_couplers_RVALID,
      m_axi_rvalid(5) => xbar_to_m05_couplers_RVALID,
      m_axi_rvalid(4) => xbar_to_m04_couplers_RVALID,
      m_axi_rvalid(3) => xbar_to_m03_couplers_RVALID,
      m_axi_rvalid(2) => xbar_to_m02_couplers_RVALID,
      m_axi_rvalid(1) => xbar_to_m01_couplers_RVALID,
      m_axi_rvalid(0) => xbar_to_m00_couplers_RVALID(0),
      m_axi_wdata(255 downto 224) => xbar_to_m07_couplers_WDATA(255 downto 224),
      m_axi_wdata(223 downto 192) => xbar_to_m06_couplers_WDATA(223 downto 192),
      m_axi_wdata(191 downto 160) => xbar_to_m05_couplers_WDATA(191 downto 160),
      m_axi_wdata(159 downto 128) => xbar_to_m04_couplers_WDATA(159 downto 128),
      m_axi_wdata(127 downto 96) => xbar_to_m03_couplers_WDATA(127 downto 96),
      m_axi_wdata(95 downto 64) => xbar_to_m02_couplers_WDATA(95 downto 64),
      m_axi_wdata(63 downto 32) => xbar_to_m01_couplers_WDATA(63 downto 32),
      m_axi_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wready(7) => xbar_to_m07_couplers_WREADY,
      m_axi_wready(6) => xbar_to_m06_couplers_WREADY,
      m_axi_wready(5) => xbar_to_m05_couplers_WREADY,
      m_axi_wready(4) => xbar_to_m04_couplers_WREADY,
      m_axi_wready(3) => xbar_to_m03_couplers_WREADY,
      m_axi_wready(2) => xbar_to_m02_couplers_WREADY,
      m_axi_wready(1) => xbar_to_m01_couplers_WREADY,
      m_axi_wready(0) => xbar_to_m00_couplers_WREADY(0),
      m_axi_wstrb(31 downto 28) => xbar_to_m07_couplers_WSTRB(31 downto 28),
      m_axi_wstrb(27 downto 24) => xbar_to_m06_couplers_WSTRB(27 downto 24),
      m_axi_wstrb(23 downto 20) => NLW_xbar_m_axi_wstrb_UNCONNECTED(23 downto 20),
      m_axi_wstrb(19 downto 16) => xbar_to_m04_couplers_WSTRB(19 downto 16),
      m_axi_wstrb(15 downto 12) => xbar_to_m03_couplers_WSTRB(15 downto 12),
      m_axi_wstrb(11 downto 8) => NLW_xbar_m_axi_wstrb_UNCONNECTED(11 downto 8),
      m_axi_wstrb(7 downto 4) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      m_axi_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid(7) => xbar_to_m07_couplers_WVALID(7),
      m_axi_wvalid(6) => xbar_to_m06_couplers_WVALID(6),
      m_axi_wvalid(5) => xbar_to_m05_couplers_WVALID(5),
      m_axi_wvalid(4) => xbar_to_m04_couplers_WVALID(4),
      m_axi_wvalid(3) => xbar_to_m03_couplers_WVALID(3),
      m_axi_wvalid(2) => xbar_to_m02_couplers_WVALID(2),
      m_axi_wvalid(1) => xbar_to_m01_couplers_WVALID(1),
      m_axi_wvalid(0) => xbar_to_m00_couplers_WVALID(0),
      s_axi_araddr(39 downto 0) => s00_couplers_to_xbar_ARADDR(39 downto 0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      s_axi_arvalid(0) => s00_couplers_to_xbar_ARVALID,
      s_axi_awaddr(39 downto 0) => s00_couplers_to_xbar_AWADDR(39 downto 0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      s_axi_awvalid(0) => s00_couplers_to_xbar_AWVALID,
      s_axi_bready(0) => s00_couplers_to_xbar_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      s_axi_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      s_axi_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      s_axi_rready(0) => s00_couplers_to_xbar_RREADY,
      s_axi_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      s_axi_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      s_axi_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      s_axi_wready(0) => s00_couplers_to_xbar_WREADY(0),
      s_axi_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      s_axi_wvalid(0) => s00_couplers_to_xbar_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MercuryXU1 is
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
    ps_master_i2c_scl_i : in STD_LOGIC;
    ps_master_i2c_scl_o : out STD_LOGIC;
    ps_master_i2c_scl_t : out STD_LOGIC;
    ps_master_i2c_sda_i : in STD_LOGIC;
    ps_master_i2c_sda_o : out STD_LOGIC;
    ps_master_i2c_sda_t : out STD_LOGIC;
    ps_spi_0_io0_i : in STD_LOGIC;
    ps_spi_0_io0_o : out STD_LOGIC;
    ps_spi_0_io0_t : out STD_LOGIC;
    ps_spi_0_io1_i : in STD_LOGIC;
    ps_spi_0_io1_o : out STD_LOGIC;
    ps_spi_0_io1_t : out STD_LOGIC;
    ps_spi_0_sck_i : in STD_LOGIC;
    ps_spi_0_sck_o : out STD_LOGIC;
    ps_spi_0_sck_t : out STD_LOGIC;
    ps_spi_0_ss_t : out STD_LOGIC;
    sample_clk : in STD_LOGIC;
    trigger_external : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of MercuryXU1 : entity is "MercuryXU1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=MercuryXU1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=55,numReposBlks=41,numNonXlnxBlks=0,numHierBlks=14,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=4,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=5,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of MercuryXU1 : entity is "MercuryXU1.hwdef";
end MercuryXU1;

architecture STRUCTURE of MercuryXU1 is
  component MercuryXU1_proc_sys_reset_0_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component MercuryXU1_proc_sys_reset_0_0;
  component MercuryXU1_axi_gpio_0_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    gpio_io_o : out STD_LOGIC_VECTOR ( 19 downto 0 )
  );
  end component MercuryXU1_axi_gpio_0_0;
  component MercuryXU1_zynq_ultra_ps_e_0_0 is
  port (
    maxihpm0_lpd_aclk : in STD_LOGIC;
    maxigp2_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp2_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    maxigp2_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    maxigp2_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp2_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp2_awlock : out STD_LOGIC;
    maxigp2_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp2_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp2_awvalid : out STD_LOGIC;
    maxigp2_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp2_awready : in STD_LOGIC;
    maxigp2_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    maxigp2_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp2_wlast : out STD_LOGIC;
    maxigp2_wvalid : out STD_LOGIC;
    maxigp2_wready : in STD_LOGIC;
    maxigp2_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp2_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp2_bvalid : in STD_LOGIC;
    maxigp2_bready : out STD_LOGIC;
    maxigp2_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp2_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    maxigp2_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    maxigp2_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp2_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp2_arlock : out STD_LOGIC;
    maxigp2_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp2_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp2_arvalid : out STD_LOGIC;
    maxigp2_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp2_arready : in STD_LOGIC;
    maxigp2_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp2_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    maxigp2_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp2_rlast : in STD_LOGIC;
    maxigp2_rvalid : in STD_LOGIC;
    maxigp2_rready : out STD_LOGIC;
    maxigp2_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp2_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    saxihpc0_fpd_aclk : in STD_LOGIC;
    saxigp0_aruser : in STD_LOGIC;
    saxigp0_awuser : in STD_LOGIC;
    saxigp0_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp0_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    saxigp0_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    saxigp0_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp0_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp0_awlock : in STD_LOGIC;
    saxigp0_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp0_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp0_awvalid : in STD_LOGIC;
    saxigp0_awready : out STD_LOGIC;
    saxigp0_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    saxigp0_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    saxigp0_wlast : in STD_LOGIC;
    saxigp0_wvalid : in STD_LOGIC;
    saxigp0_wready : out STD_LOGIC;
    saxigp0_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp0_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp0_bvalid : out STD_LOGIC;
    saxigp0_bready : in STD_LOGIC;
    saxigp0_arid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp0_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    saxigp0_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    saxigp0_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp0_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp0_arlock : in STD_LOGIC;
    saxigp0_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp0_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp0_arvalid : in STD_LOGIC;
    saxigp0_arready : out STD_LOGIC;
    saxigp0_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp0_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    saxigp0_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp0_rlast : out STD_LOGIC;
    saxigp0_rvalid : out STD_LOGIC;
    saxigp0_rready : in STD_LOGIC;
    saxigp0_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp0_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxihpc1_fpd_aclk : in STD_LOGIC;
    saxigp1_aruser : in STD_LOGIC;
    saxigp1_awuser : in STD_LOGIC;
    saxigp1_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp1_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    saxigp1_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    saxigp1_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp1_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp1_awlock : in STD_LOGIC;
    saxigp1_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp1_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp1_awvalid : in STD_LOGIC;
    saxigp1_awready : out STD_LOGIC;
    saxigp1_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    saxigp1_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    saxigp1_wlast : in STD_LOGIC;
    saxigp1_wvalid : in STD_LOGIC;
    saxigp1_wready : out STD_LOGIC;
    saxigp1_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp1_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp1_bvalid : out STD_LOGIC;
    saxigp1_bready : in STD_LOGIC;
    saxigp1_arid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp1_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    saxigp1_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    saxigp1_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp1_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp1_arlock : in STD_LOGIC;
    saxigp1_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp1_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp1_arvalid : in STD_LOGIC;
    saxigp1_arready : out STD_LOGIC;
    saxigp1_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp1_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    saxigp1_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp1_rlast : out STD_LOGIC;
    saxigp1_rvalid : out STD_LOGIC;
    saxigp1_rready : in STD_LOGIC;
    saxigp1_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp1_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    emio_enet0_enet_tsu_timer_cnt : out STD_LOGIC_VECTOR ( 93 downto 0 );
    emio_i2c0_scl_i : in STD_LOGIC;
    emio_i2c0_scl_o : out STD_LOGIC;
    emio_i2c0_scl_t : out STD_LOGIC;
    emio_i2c0_sda_i : in STD_LOGIC;
    emio_i2c0_sda_o : out STD_LOGIC;
    emio_i2c0_sda_t : out STD_LOGIC;
    emio_spi0_sclk_i : in STD_LOGIC;
    emio_spi0_sclk_o : out STD_LOGIC;
    emio_spi0_sclk_t : out STD_LOGIC;
    emio_spi0_m_i : in STD_LOGIC;
    emio_spi0_m_o : out STD_LOGIC;
    emio_spi0_mo_t : out STD_LOGIC;
    emio_spi0_s_i : in STD_LOGIC;
    emio_spi0_s_o : out STD_LOGIC;
    emio_spi0_so_t : out STD_LOGIC;
    emio_spi0_ss_i_n : in STD_LOGIC;
    emio_spi0_ss_o_n : out STD_LOGIC;
    emio_spi0_ss_n_t : out STD_LOGIC;
    pl_ps_irq0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    pl_resetn0 : out STD_LOGIC;
    pl_clk0 : out STD_LOGIC;
    pl_clk1 : out STD_LOGIC;
    pl_clk2 : out STD_LOGIC;
    pl_clk3 : out STD_LOGIC
  );
  end component MercuryXU1_zynq_ultra_ps_e_0_0;
  component MercuryXU1_system_management_wiz_0_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    ip2intc_irpt : out STD_LOGIC;
    user_temp_alarm_out : out STD_LOGIC;
    vccint_alarm_out : out STD_LOGIC;
    vccpsintlp_alarm_out : out STD_LOGIC;
    vccpsintfp_alarm_out : out STD_LOGIC;
    vccpsaux_alarm_out : out STD_LOGIC;
    vccaux_alarm_out : out STD_LOGIC;
    ot_out : out STD_LOGIC;
    channel_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    eoc_out : out STD_LOGIC;
    alarm_out : out STD_LOGIC;
    eos_out : out STD_LOGIC;
    busy_out : out STD_LOGIC
  );
  end component MercuryXU1_system_management_wiz_0_0;
  component MercuryXU1_xlconcat_0_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component MercuryXU1_xlconcat_0_0;
  component MercuryXU1_axi_dma_0_0 is
  port (
    s_axi_lite_aclk : in STD_LOGIC;
    m_axi_sg_aclk : in STD_LOGIC;
    m_axi_mm2s_aclk : in STD_LOGIC;
    m_axi_s2mm_aclk : in STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_sg_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_awvalid : out STD_LOGIC;
    m_axi_sg_awready : in STD_LOGIC;
    m_axi_sg_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_wlast : out STD_LOGIC;
    m_axi_sg_wvalid : out STD_LOGIC;
    m_axi_sg_wready : in STD_LOGIC;
    m_axi_sg_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_bvalid : in STD_LOGIC;
    m_axi_sg_bready : out STD_LOGIC;
    m_axi_sg_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_sg_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_arvalid : out STD_LOGIC;
    m_axi_sg_arready : in STD_LOGIC;
    m_axi_sg_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_rlast : in STD_LOGIC;
    m_axi_sg_rvalid : in STD_LOGIC;
    m_axi_sg_rready : out STD_LOGIC;
    m_axi_mm2s_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm2s_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_mm2s_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mm2s_arvalid : out STD_LOGIC;
    m_axi_mm2s_arready : in STD_LOGIC;
    m_axi_mm2s_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm2s_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_rlast : in STD_LOGIC;
    m_axi_mm2s_rvalid : in STD_LOGIC;
    m_axi_mm2s_rready : out STD_LOGIC;
    mm2s_prmry_reset_out_n : out STD_LOGIC;
    m_axis_mm2s_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_mm2s_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_mm2s_tvalid : out STD_LOGIC;
    m_axis_mm2s_tready : in STD_LOGIC;
    m_axis_mm2s_tlast : out STD_LOGIC;
    m_axi_s2mm_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_awvalid : out STD_LOGIC;
    m_axi_s2mm_awready : in STD_LOGIC;
    m_axi_s2mm_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_wlast : out STD_LOGIC;
    m_axi_s2mm_wvalid : out STD_LOGIC;
    m_axi_s2mm_wready : in STD_LOGIC;
    m_axi_s2mm_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_bvalid : in STD_LOGIC;
    m_axi_s2mm_bready : out STD_LOGIC;
    s2mm_prmry_reset_out_n : out STD_LOGIC;
    s_axis_s2mm_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_s2mm_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_s2mm_tvalid : in STD_LOGIC;
    s_axis_s2mm_tready : out STD_LOGIC;
    s_axis_s2mm_tlast : in STD_LOGIC;
    mm2s_introut : out STD_LOGIC;
    s2mm_introut : out STD_LOGIC
  );
  end component MercuryXU1_axi_dma_0_0;
  component MercuryXU1_smartconnect_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wvalid : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    S01_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S01_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S01_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_arvalid : in STD_LOGIC;
    S01_AXI_arready : out STD_LOGIC;
    S01_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_rlast : out STD_LOGIC;
    S01_AXI_rvalid : out STD_LOGIC;
    S01_AXI_rready : in STD_LOGIC;
    S02_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S02_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S02_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S02_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S02_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S02_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S02_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_awvalid : in STD_LOGIC;
    S02_AXI_awready : out STD_LOGIC;
    S02_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S02_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_wlast : in STD_LOGIC;
    S02_AXI_wvalid : in STD_LOGIC;
    S02_AXI_wready : out STD_LOGIC;
    S02_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S02_AXI_bvalid : out STD_LOGIC;
    S02_AXI_bready : in STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 48 downto 0 );
    M00_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M00_AXI_wlast : out STD_LOGIC;
    M00_AXI_wvalid : out STD_LOGIC;
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 48 downto 0 );
    M00_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rlast : in STD_LOGIC;
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_rready : out STD_LOGIC
  );
  end component MercuryXU1_smartconnect_0_0;
  component MercuryXU1_proc_sys_reset_100_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component MercuryXU1_proc_sys_reset_100_0;
  component MercuryXU1_axi_gpio_0_1 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    gpio_io_o : out STD_LOGIC_VECTOR ( 19 downto 0 )
  );
  end component MercuryXU1_axi_gpio_0_1;
  component MercuryXU1_xlslice_0_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 19 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component MercuryXU1_xlslice_0_0;
  component MercuryXU1_xlslice_0_1 is
  port (
    Din : in STD_LOGIC_VECTOR ( 19 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component MercuryXU1_xlslice_0_1;
  component MercuryXU1_proc_sys_reset_300_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component MercuryXU1_proc_sys_reset_300_0;
  component MercuryXU1_system_ila_0_0 is
  port (
    clk : in STD_LOGIC;
    SLOT_0_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_0_AXIS_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_0_AXIS_tlast : in STD_LOGIC;
    SLOT_0_AXIS_tvalid : in STD_LOGIC;
    SLOT_0_AXIS_tready : in STD_LOGIC;
    SLOT_1_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_1_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_1_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_1_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_1_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_1_AXI_awvalid : in STD_LOGIC;
    SLOT_1_AXI_awready : in STD_LOGIC;
    SLOT_1_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_1_AXI_wlast : in STD_LOGIC;
    SLOT_1_AXI_wvalid : in STD_LOGIC;
    SLOT_1_AXI_wready : in STD_LOGIC;
    SLOT_1_AXI_bvalid : in STD_LOGIC;
    SLOT_1_AXI_bready : in STD_LOGIC;
    SLOT_1_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_1_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_1_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_1_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_1_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_1_AXI_arvalid : in STD_LOGIC;
    SLOT_1_AXI_arready : in STD_LOGIC;
    SLOT_1_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_1_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_1_AXI_rlast : in STD_LOGIC;
    SLOT_1_AXI_rvalid : in STD_LOGIC;
    SLOT_1_AXI_rready : in STD_LOGIC;
    SLOT_2_AXI_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    SLOT_2_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_2_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_2_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_2_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_2_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_2_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_2_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_2_AXI_awvalid : in STD_LOGIC;
    SLOT_2_AXI_awready : in STD_LOGIC;
    SLOT_2_AXI_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    SLOT_2_AXI_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SLOT_2_AXI_wlast : in STD_LOGIC;
    SLOT_2_AXI_wvalid : in STD_LOGIC;
    SLOT_2_AXI_wready : in STD_LOGIC;
    SLOT_2_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_2_AXI_bvalid : in STD_LOGIC;
    SLOT_2_AXI_bready : in STD_LOGIC;
    SLOT_2_AXI_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    SLOT_2_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_2_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_2_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_2_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_2_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_2_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_2_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_2_AXI_arvalid : in STD_LOGIC;
    SLOT_2_AXI_arready : in STD_LOGIC;
    SLOT_2_AXI_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    SLOT_2_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_2_AXI_rlast : in STD_LOGIC;
    SLOT_2_AXI_rvalid : in STD_LOGIC;
    SLOT_2_AXI_rready : in STD_LOGIC;
    SLOT_3_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_3_AXIS_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_3_AXIS_tlast : in STD_LOGIC;
    SLOT_3_AXIS_tvalid : in STD_LOGIC;
    SLOT_3_AXIS_tready : in STD_LOGIC;
    SLOT_4_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_4_AXIS_tlast : in STD_LOGIC;
    SLOT_4_AXIS_tvalid : in STD_LOGIC;
    SLOT_4_AXIS_tready : in STD_LOGIC;
    SLOT_5_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_5_AXIS_tlast : in STD_LOGIC;
    SLOT_5_AXIS_tvalid : in STD_LOGIC;
    SLOT_5_AXIS_tready : in STD_LOGIC;
    SLOT_6_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_6_AXIS_tlast : in STD_LOGIC;
    SLOT_6_AXIS_tvalid : in STD_LOGIC;
    SLOT_6_AXIS_tready : in STD_LOGIC;
    SLOT_7_AXI_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    SLOT_7_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_7_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_7_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_7_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_7_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_7_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_7_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_7_AXI_awvalid : in STD_LOGIC;
    SLOT_7_AXI_awready : in STD_LOGIC;
    SLOT_7_AXI_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    SLOT_7_AXI_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SLOT_7_AXI_wlast : in STD_LOGIC;
    SLOT_7_AXI_wvalid : in STD_LOGIC;
    SLOT_7_AXI_wready : in STD_LOGIC;
    SLOT_7_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_7_AXI_bvalid : in STD_LOGIC;
    SLOT_7_AXI_bready : in STD_LOGIC;
    SLOT_7_AXI_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    SLOT_7_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_7_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_7_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_7_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_7_AXI_arcache : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_7_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_7_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_7_AXI_arvalid : in STD_LOGIC;
    SLOT_7_AXI_arready : in STD_LOGIC;
    SLOT_7_AXI_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    SLOT_7_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_7_AXI_rlast : in STD_LOGIC;
    SLOT_7_AXI_rvalid : in STD_LOGIC;
    SLOT_7_AXI_rready : in STD_LOGIC;
    SLOT_8_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_8_AXIS_tlast : in STD_LOGIC;
    SLOT_8_AXIS_tvalid : in STD_LOGIC;
    SLOT_8_AXIS_tready : in STD_LOGIC;
    resetn : in STD_LOGIC
  );
  end component MercuryXU1_system_ila_0_0;
  component MercuryXU1_system_ila_0_2 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 19 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 19 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe4 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe5 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component MercuryXU1_system_ila_0_2;
  component MercuryXU1_xlslice_1_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 19 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component MercuryXU1_xlslice_1_0;
  component MercuryXU1_system_ila_0_3 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe4 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe5 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    SLOT_0_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_0_AXIS_tlast : in STD_LOGIC;
    SLOT_0_AXIS_tvalid : in STD_LOGIC;
    SLOT_0_AXIS_tready : in STD_LOGIC;
    resetn : in STD_LOGIC
  );
  end component MercuryXU1_system_ila_0_3;
  component MercuryXU1_axi_gpio_0_2 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    gpio_io_o : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component MercuryXU1_axi_gpio_0_2;
  component MercuryXU1_xlslice_1_1 is
  port (
    Din : in STD_LOGIC_VECTOR ( 19 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component MercuryXU1_xlslice_1_1;
  component MercuryXU1_axis_clock_converter_0_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component MercuryXU1_axis_clock_converter_0_0;
  component MercuryXU1_smartconnect_0_1 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wvalid : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    S01_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S01_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S01_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_awvalid : in STD_LOGIC;
    S01_AXI_awready : out STD_LOGIC;
    S01_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_wlast : in STD_LOGIC;
    S01_AXI_wvalid : in STD_LOGIC;
    S01_AXI_wready : out STD_LOGIC;
    S01_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_bvalid : out STD_LOGIC;
    S01_AXI_bready : in STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 48 downto 0 );
    M00_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M00_AXI_wlast : out STD_LOGIC;
    M00_AXI_wvalid : out STD_LOGIC;
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 48 downto 0 );
    M00_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rlast : in STD_LOGIC;
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_rready : out STD_LOGIC
  );
  end component MercuryXU1_smartconnect_0_1;
  component MercuryXU1_axi_dma_0_1 is
  port (
    s_axi_lite_aclk : in STD_LOGIC;
    m_axi_sg_aclk : in STD_LOGIC;
    m_axi_s2mm_aclk : in STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_sg_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_awvalid : out STD_LOGIC;
    m_axi_sg_awready : in STD_LOGIC;
    m_axi_sg_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_wlast : out STD_LOGIC;
    m_axi_sg_wvalid : out STD_LOGIC;
    m_axi_sg_wready : in STD_LOGIC;
    m_axi_sg_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_bvalid : in STD_LOGIC;
    m_axi_sg_bready : out STD_LOGIC;
    m_axi_sg_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_sg_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_arvalid : out STD_LOGIC;
    m_axi_sg_arready : in STD_LOGIC;
    m_axi_sg_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_rlast : in STD_LOGIC;
    m_axi_sg_rvalid : in STD_LOGIC;
    m_axi_sg_rready : out STD_LOGIC;
    m_axi_s2mm_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_awvalid : out STD_LOGIC;
    m_axi_s2mm_awready : in STD_LOGIC;
    m_axi_s2mm_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_wlast : out STD_LOGIC;
    m_axi_s2mm_wvalid : out STD_LOGIC;
    m_axi_s2mm_wready : in STD_LOGIC;
    m_axi_s2mm_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_bvalid : in STD_LOGIC;
    m_axi_s2mm_bready : out STD_LOGIC;
    s2mm_prmry_reset_out_n : out STD_LOGIC;
    s_axis_s2mm_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_s2mm_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_s2mm_tvalid : in STD_LOGIC;
    s_axis_s2mm_tready : out STD_LOGIC;
    s_axis_s2mm_tlast : in STD_LOGIC;
    s2mm_introut : out STD_LOGIC
  );
  end component MercuryXU1_axi_dma_0_1;
  component MercuryXU1_axis_clock_converter_0_1 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component MercuryXU1_axis_clock_converter_0_1;
  component MercuryXU1_axis_data_fifo_0_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component MercuryXU1_axis_data_fifo_0_0;
  component MercuryXU1_xlslice_2_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 19 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component MercuryXU1_xlslice_2_0;
  component MercuryXU1_axi_gpio_sample_number_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    gpio_io_o : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component MercuryXU1_axi_gpio_sample_number_0;
  component MercuryXU1_axis_data_fifo_1_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component MercuryXU1_axis_data_fifo_1_0;
  component MercuryXU1_stream_multiplexer_0_0 is
  port (
    clk_sample : in STD_LOGIC;
    gpio : in STD_LOGIC_VECTOR ( 19 downto 0 );
    adc0_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc1_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc2_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc3_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc4_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc5_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc6_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc7_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc8_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
    adc9_sample : in STD_LOGIC_VECTOR ( 31 downto 0 );
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
    adc_sample_selected_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    adc_sample_selected_1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    adc_sample_valid : in STD_LOGIC_VECTOR ( 19 downto 0 );
    adc_sample_valid_selected_0 : out STD_LOGIC;
    adc_sample_valid_selected_1 : out STD_LOGIC
  );
  end component MercuryXU1_stream_multiplexer_0_0;
  component MercuryXU1_axi_gpio_delay_ctrl_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    gpio_io_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio2_io_i : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component MercuryXU1_axi_gpio_delay_ctrl_0;
  component MercuryXU1_xlconcat_0_1 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In7 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In9 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In10 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In11 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In12 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In13 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In14 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In15 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In16 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In17 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In18 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In19 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 19 downto 0 )
  );
  end component MercuryXU1_xlconcat_0_1;
  component MercuryXU1_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component MercuryXU1_xlconstant_0_0;
  component MercuryXU1_tlast_generator_0_0 is
  port (
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    num_samples_per_packet : in STD_LOGIC_VECTOR ( 31 downto 0 );
    trigger_mode : in STD_LOGIC_VECTOR ( 2 downto 0 );
    trigger_enable : in STD_LOGIC;
    trigger_ps : in STD_LOGIC;
    trigger_external : in STD_LOGIC;
    trigger_internal_in : in STD_LOGIC;
    trigger_internal_out : out STD_LOGIC;
    trigger_detected : out STD_LOGIC;
    data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    data_enable : in STD_LOGIC;
    counter : out STD_LOGIC_VECTOR ( 31 downto 0 );
    trigger_test : out STD_LOGIC_VECTOR ( 4 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tlast : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC
  );
  end component MercuryXU1_tlast_generator_0_0;
  component MercuryXU1_tlast_generator_0_1 is
  port (
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    num_samples_per_packet : in STD_LOGIC_VECTOR ( 31 downto 0 );
    trigger_mode : in STD_LOGIC_VECTOR ( 2 downto 0 );
    trigger_enable : in STD_LOGIC;
    trigger_ps : in STD_LOGIC;
    trigger_external : in STD_LOGIC;
    trigger_internal_in : in STD_LOGIC;
    trigger_internal_out : out STD_LOGIC;
    trigger_detected : out STD_LOGIC;
    data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    data_enable : in STD_LOGIC;
    counter : out STD_LOGIC_VECTOR ( 31 downto 0 );
    trigger_test : out STD_LOGIC_VECTOR ( 4 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tlast : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC
  );
  end component MercuryXU1_tlast_generator_0_1;
  component MercuryXU1_event_controller_0_1 is
  port (
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    num_packets_per_event : in STD_LOGIC_VECTOR ( 31 downto 0 );
    packet_counter : out STD_LOGIC_VECTOR ( 31 downto 0 );
    trigger_enable : out STD_LOGIC;
    trigger : in STD_LOGIC_VECTOR ( 19 downto 0 )
  );
  end component MercuryXU1_event_controller_0_1;
  signal aclk_0_1 : STD_LOGIC;
  signal adc0_sample_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc10_sample_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc11_sample_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc12_sample_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc13_sample_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc14_sample_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc15_sample_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc16_sample_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc17_sample_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc18_sample_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc19_sample_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc1_sample_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc2_sample_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc3_sample_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc4_sample_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc5_sample_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc6_sample_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc7_sample_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc8_sample_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc9_sample_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal adc_sample_valid_0_1 : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal aresetn_0_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_dma_0_M_AXIS_MM2S_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute CONN_BUS_INFO : string;
  attribute CONN_BUS_INFO of axi_dma_0_M_AXIS_MM2S_TDATA : signal is "axi_dma_0_M_AXIS_MM2S xilinx.com:interface:axis:1.0 None TDATA";
  attribute DEBUG : string;
  attribute DEBUG of axi_dma_0_M_AXIS_MM2S_TDATA : signal is "true";
  attribute MARK_DEBUG : boolean;
  attribute MARK_DEBUG of axi_dma_0_M_AXIS_MM2S_TDATA : signal is std.standard.true;
  signal axi_dma_0_M_AXIS_MM2S_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute CONN_BUS_INFO of axi_dma_0_M_AXIS_MM2S_TKEEP : signal is "axi_dma_0_M_AXIS_MM2S xilinx.com:interface:axis:1.0 None TKEEP";
  attribute DEBUG of axi_dma_0_M_AXIS_MM2S_TKEEP : signal is "true";
  attribute MARK_DEBUG of axi_dma_0_M_AXIS_MM2S_TKEEP : signal is std.standard.true;
  signal axi_dma_0_M_AXIS_MM2S_TLAST : STD_LOGIC;
  attribute CONN_BUS_INFO of axi_dma_0_M_AXIS_MM2S_TLAST : signal is "axi_dma_0_M_AXIS_MM2S xilinx.com:interface:axis:1.0 None TLAST";
  attribute DEBUG of axi_dma_0_M_AXIS_MM2S_TLAST : signal is "true";
  attribute MARK_DEBUG of axi_dma_0_M_AXIS_MM2S_TLAST : signal is std.standard.true;
  signal axi_dma_0_M_AXIS_MM2S_TREADY : STD_LOGIC;
  attribute CONN_BUS_INFO of axi_dma_0_M_AXIS_MM2S_TREADY : signal is "axi_dma_0_M_AXIS_MM2S xilinx.com:interface:axis:1.0 None TREADY";
  attribute DEBUG of axi_dma_0_M_AXIS_MM2S_TREADY : signal is "true";
  attribute MARK_DEBUG of axi_dma_0_M_AXIS_MM2S_TREADY : signal is std.standard.true;
  signal axi_dma_0_M_AXIS_MM2S_TVALID : STD_LOGIC;
  attribute CONN_BUS_INFO of axi_dma_0_M_AXIS_MM2S_TVALID : signal is "axi_dma_0_M_AXIS_MM2S xilinx.com:interface:axis:1.0 None TVALID";
  attribute DEBUG of axi_dma_0_M_AXIS_MM2S_TVALID : signal is "true";
  attribute MARK_DEBUG of axi_dma_0_M_AXIS_MM2S_TVALID : signal is std.standard.true;
  signal axi_dma_0_M_AXI_MM2S_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute CONN_BUS_INFO of axi_dma_0_M_AXI_MM2S_ARADDR : signal is "axi_dma_0_M_AXI_MM2S xilinx.com:interface:aximm:1.0 AXI4 ARADDR";
  attribute DEBUG of axi_dma_0_M_AXI_MM2S_ARADDR : signal is "true";
  attribute MARK_DEBUG of axi_dma_0_M_AXI_MM2S_ARADDR : signal is std.standard.true;
  signal axi_dma_0_M_AXI_MM2S_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute DEBUG of axi_dma_0_M_AXI_MM2S_ARBURST : signal is "true";
  attribute MARK_DEBUG of axi_dma_0_M_AXI_MM2S_ARBURST : signal is std.standard.true;
  signal axi_dma_0_M_AXI_MM2S_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute CONN_BUS_INFO of axi_dma_0_M_AXI_MM2S_ARCACHE : signal is "axi_dma_0_M_AXI_MM2S xilinx.com:interface:aximm:1.0 AXI4 ARCACHE";
  attribute DEBUG of axi_dma_0_M_AXI_MM2S_ARCACHE : signal is "true";
  attribute MARK_DEBUG of axi_dma_0_M_AXI_MM2S_ARCACHE : signal is std.standard.true;
  signal axi_dma_0_M_AXI_MM2S_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CONN_BUS_INFO of axi_dma_0_M_AXI_MM2S_ARLEN : signal is "axi_dma_0_M_AXI_MM2S xilinx.com:interface:aximm:1.0 AXI4 ARLEN";
  attribute DEBUG of axi_dma_0_M_AXI_MM2S_ARLEN : signal is "true";
  attribute MARK_DEBUG of axi_dma_0_M_AXI_MM2S_ARLEN : signal is std.standard.true;
  signal axi_dma_0_M_AXI_MM2S_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute CONN_BUS_INFO of axi_dma_0_M_AXI_MM2S_ARPROT : signal is "axi_dma_0_M_AXI_MM2S xilinx.com:interface:aximm:1.0 AXI4 ARPROT";
  attribute DEBUG of axi_dma_0_M_AXI_MM2S_ARPROT : signal is "true";
  attribute MARK_DEBUG of axi_dma_0_M_AXI_MM2S_ARPROT : signal is std.standard.true;
  signal axi_dma_0_M_AXI_MM2S_ARREADY : STD_LOGIC;
  attribute CONN_BUS_INFO of axi_dma_0_M_AXI_MM2S_ARREADY : signal is "axi_dma_0_M_AXI_MM2S xilinx.com:interface:aximm:1.0 AXI4 ARREADY";
  attribute DEBUG of axi_dma_0_M_AXI_MM2S_ARREADY : signal is "true";
  attribute MARK_DEBUG of axi_dma_0_M_AXI_MM2S_ARREADY : signal is std.standard.true;
  signal axi_dma_0_M_AXI_MM2S_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute CONN_BUS_INFO of axi_dma_0_M_AXI_MM2S_ARSIZE : signal is "axi_dma_0_M_AXI_MM2S xilinx.com:interface:aximm:1.0 AXI4 ARSIZE";
  attribute DEBUG of axi_dma_0_M_AXI_MM2S_ARSIZE : signal is "true";
  attribute MARK_DEBUG of axi_dma_0_M_AXI_MM2S_ARSIZE : signal is std.standard.true;
  signal axi_dma_0_M_AXI_MM2S_ARVALID : STD_LOGIC;
  attribute CONN_BUS_INFO of axi_dma_0_M_AXI_MM2S_ARVALID : signal is "axi_dma_0_M_AXI_MM2S xilinx.com:interface:aximm:1.0 AXI4 ARVALID";
  attribute DEBUG of axi_dma_0_M_AXI_MM2S_ARVALID : signal is "true";
  attribute MARK_DEBUG of axi_dma_0_M_AXI_MM2S_ARVALID : signal is std.standard.true;
  signal axi_dma_0_M_AXI_MM2S_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute CONN_BUS_INFO of axi_dma_0_M_AXI_MM2S_RDATA : signal is "axi_dma_0_M_AXI_MM2S xilinx.com:interface:aximm:1.0 AXI4 RDATA";
  attribute DEBUG of axi_dma_0_M_AXI_MM2S_RDATA : signal is "true";
  attribute MARK_DEBUG of axi_dma_0_M_AXI_MM2S_RDATA : signal is std.standard.true;
  signal axi_dma_0_M_AXI_MM2S_RLAST : STD_LOGIC;
  attribute CONN_BUS_INFO of axi_dma_0_M_AXI_MM2S_RLAST : signal is "axi_dma_0_M_AXI_MM2S xilinx.com:interface:aximm:1.0 AXI4 RLAST";
  attribute DEBUG of axi_dma_0_M_AXI_MM2S_RLAST : signal is "true";
  attribute MARK_DEBUG of axi_dma_0_M_AXI_MM2S_RLAST : signal is std.standard.true;
  signal axi_dma_0_M_AXI_MM2S_RREADY : STD_LOGIC;
  attribute CONN_BUS_INFO of axi_dma_0_M_AXI_MM2S_RREADY : signal is "axi_dma_0_M_AXI_MM2S xilinx.com:interface:aximm:1.0 AXI4 RREADY";
  attribute DEBUG of axi_dma_0_M_AXI_MM2S_RREADY : signal is "true";
  attribute MARK_DEBUG of axi_dma_0_M_AXI_MM2S_RREADY : signal is std.standard.true;
  signal axi_dma_0_M_AXI_MM2S_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute CONN_BUS_INFO of axi_dma_0_M_AXI_MM2S_RRESP : signal is "axi_dma_0_M_AXI_MM2S xilinx.com:interface:aximm:1.0 AXI4 RRESP";
  attribute DEBUG of axi_dma_0_M_AXI_MM2S_RRESP : signal is "true";
  attribute MARK_DEBUG of axi_dma_0_M_AXI_MM2S_RRESP : signal is std.standard.true;
  signal axi_dma_0_M_AXI_MM2S_RVALID : STD_LOGIC;
  attribute CONN_BUS_INFO of axi_dma_0_M_AXI_MM2S_RVALID : signal is "axi_dma_0_M_AXI_MM2S xilinx.com:interface:aximm:1.0 AXI4 RVALID";
  attribute DEBUG of axi_dma_0_M_AXI_MM2S_RVALID : signal is "true";
  attribute MARK_DEBUG of axi_dma_0_M_AXI_MM2S_RVALID : signal is std.standard.true;
  signal axi_dma_0_M_AXI_S2MM_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_BREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_BVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_WLAST : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_WREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_WVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_0_M_AXI_SG_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_0_M_AXI_SG_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_0_M_AXI_SG_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_0_M_AXI_SG_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_0_M_AXI_SG_ARREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_0_M_AXI_SG_ARVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_0_M_AXI_SG_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_0_M_AXI_SG_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_0_M_AXI_SG_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_0_M_AXI_SG_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_0_M_AXI_SG_AWREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_0_M_AXI_SG_AWVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_BREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_0_M_AXI_SG_BVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_0_M_AXI_SG_RLAST : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_RREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_0_M_AXI_SG_RVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_0_M_AXI_SG_WLAST : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_WREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_0_M_AXI_SG_WVALID : STD_LOGIC;
  signal axi_dma_0_mm2s_introut : STD_LOGIC;
  signal axi_dma_0_s2mm_introut : STD_LOGIC;
  signal axi_dma_1_M_AXI_S2MM_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_1_M_AXI_S2MM_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_1_M_AXI_S2MM_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_1_M_AXI_S2MM_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_1_M_AXI_S2MM_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_1_M_AXI_S2MM_AWREADY : STD_LOGIC;
  signal axi_dma_1_M_AXI_S2MM_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_1_M_AXI_S2MM_AWVALID : STD_LOGIC;
  signal axi_dma_1_M_AXI_S2MM_BREADY : STD_LOGIC;
  signal axi_dma_1_M_AXI_S2MM_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_1_M_AXI_S2MM_BVALID : STD_LOGIC;
  signal axi_dma_1_M_AXI_S2MM_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_1_M_AXI_S2MM_WLAST : STD_LOGIC;
  signal axi_dma_1_M_AXI_S2MM_WREADY : STD_LOGIC;
  signal axi_dma_1_M_AXI_S2MM_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_1_M_AXI_S2MM_WVALID : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_1_M_AXI_SG_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_1_M_AXI_SG_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_1_M_AXI_SG_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_1_M_AXI_SG_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_1_M_AXI_SG_ARREADY : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_1_M_AXI_SG_ARVALID : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_1_M_AXI_SG_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_1_M_AXI_SG_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_1_M_AXI_SG_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_1_M_AXI_SG_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_1_M_AXI_SG_AWREADY : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_1_M_AXI_SG_AWVALID : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_BREADY : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_1_M_AXI_SG_BVALID : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_1_M_AXI_SG_RLAST : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_RREADY : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_1_M_AXI_SG_RVALID : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_1_M_AXI_SG_WLAST : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_WREADY : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_1_M_AXI_SG_WVALID : STD_LOGIC;
  signal axi_dma_1_s2mm_introut : STD_LOGIC;
  signal axi_gpio_0_gpio_io_o : STD_LOGIC_VECTOR ( 19 downto 0 );
  attribute DEBUG of axi_gpio_0_gpio_io_o : signal is "true";
  attribute MARK_DEBUG of axi_gpio_0_gpio_io_o : signal is std.standard.true;
  signal axi_gpio_delay_ctrl_gpio_io_o : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_gpio_packet_number_gpio_io_o : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_gpio_sample_number_gpio_io_o : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute DEBUG of axi_gpio_sample_number_gpio_io_o : signal is "true";
  attribute MARK_DEBUG of axi_gpio_sample_number_gpio_io_o : signal is std.standard.true;
  signal axi_gpio_suppres_gpio_io_o : STD_LOGIC_VECTOR ( 19 downto 0 );
  attribute DEBUG of axi_gpio_suppres_gpio_io_o : signal is "true";
  attribute MARK_DEBUG of axi_gpio_suppres_gpio_io_o : signal is std.standard.true;
  signal axis_clock_converter_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute CONN_BUS_INFO of axis_clock_converter_0_M_AXIS_TDATA : signal is "axis_clock_converter_0_M_AXIS xilinx.com:interface:axis:1.0 None TDATA";
  attribute DEBUG of axis_clock_converter_0_M_AXIS_TDATA : signal is "true";
  attribute MARK_DEBUG of axis_clock_converter_0_M_AXIS_TDATA : signal is std.standard.true;
  signal axis_clock_converter_0_M_AXIS_TLAST : STD_LOGIC;
  attribute CONN_BUS_INFO of axis_clock_converter_0_M_AXIS_TLAST : signal is "axis_clock_converter_0_M_AXIS xilinx.com:interface:axis:1.0 None TLAST";
  attribute DEBUG of axis_clock_converter_0_M_AXIS_TLAST : signal is "true";
  attribute MARK_DEBUG of axis_clock_converter_0_M_AXIS_TLAST : signal is std.standard.true;
  signal axis_clock_converter_0_M_AXIS_TREADY : STD_LOGIC;
  attribute CONN_BUS_INFO of axis_clock_converter_0_M_AXIS_TREADY : signal is "axis_clock_converter_0_M_AXIS xilinx.com:interface:axis:1.0 None TREADY";
  attribute DEBUG of axis_clock_converter_0_M_AXIS_TREADY : signal is "true";
  attribute MARK_DEBUG of axis_clock_converter_0_M_AXIS_TREADY : signal is std.standard.true;
  signal axis_clock_converter_0_M_AXIS_TVALID : STD_LOGIC;
  attribute CONN_BUS_INFO of axis_clock_converter_0_M_AXIS_TVALID : signal is "axis_clock_converter_0_M_AXIS xilinx.com:interface:axis:1.0 None TVALID";
  attribute DEBUG of axis_clock_converter_0_M_AXIS_TVALID : signal is "true";
  attribute MARK_DEBUG of axis_clock_converter_0_M_AXIS_TVALID : signal is std.standard.true;
  signal axis_clock_converter_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute CONN_BUS_INFO of axis_clock_converter_1_M_AXIS_TDATA : signal is "axis_clock_converter_1_M_AXIS xilinx.com:interface:axis:1.0 None TDATA";
  attribute DEBUG of axis_clock_converter_1_M_AXIS_TDATA : signal is "true";
  attribute MARK_DEBUG of axis_clock_converter_1_M_AXIS_TDATA : signal is std.standard.true;
  signal axis_clock_converter_1_M_AXIS_TLAST : STD_LOGIC;
  attribute CONN_BUS_INFO of axis_clock_converter_1_M_AXIS_TLAST : signal is "axis_clock_converter_1_M_AXIS xilinx.com:interface:axis:1.0 None TLAST";
  attribute DEBUG of axis_clock_converter_1_M_AXIS_TLAST : signal is "true";
  attribute MARK_DEBUG of axis_clock_converter_1_M_AXIS_TLAST : signal is std.standard.true;
  signal axis_clock_converter_1_M_AXIS_TREADY : STD_LOGIC;
  attribute CONN_BUS_INFO of axis_clock_converter_1_M_AXIS_TREADY : signal is "axis_clock_converter_1_M_AXIS xilinx.com:interface:axis:1.0 None TREADY";
  attribute DEBUG of axis_clock_converter_1_M_AXIS_TREADY : signal is "true";
  attribute MARK_DEBUG of axis_clock_converter_1_M_AXIS_TREADY : signal is std.standard.true;
  signal axis_clock_converter_1_M_AXIS_TVALID : STD_LOGIC;
  attribute CONN_BUS_INFO of axis_clock_converter_1_M_AXIS_TVALID : signal is "axis_clock_converter_1_M_AXIS xilinx.com:interface:axis:1.0 None TVALID";
  attribute DEBUG of axis_clock_converter_1_M_AXIS_TVALID : signal is "true";
  attribute MARK_DEBUG of axis_clock_converter_1_M_AXIS_TVALID : signal is std.standard.true;
  signal axis_data_fifo_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute CONN_BUS_INFO of axis_data_fifo_0_M_AXIS_TDATA : signal is "axis_data_fifo_0_M_AXIS xilinx.com:interface:axis:1.0 None TDATA";
  attribute DEBUG of axis_data_fifo_0_M_AXIS_TDATA : signal is "true";
  attribute MARK_DEBUG of axis_data_fifo_0_M_AXIS_TDATA : signal is std.standard.true;
  signal axis_data_fifo_0_M_AXIS_TLAST : STD_LOGIC;
  attribute CONN_BUS_INFO of axis_data_fifo_0_M_AXIS_TLAST : signal is "axis_data_fifo_0_M_AXIS xilinx.com:interface:axis:1.0 None TLAST";
  attribute DEBUG of axis_data_fifo_0_M_AXIS_TLAST : signal is "true";
  attribute MARK_DEBUG of axis_data_fifo_0_M_AXIS_TLAST : signal is std.standard.true;
  signal axis_data_fifo_0_M_AXIS_TREADY : STD_LOGIC;
  attribute CONN_BUS_INFO of axis_data_fifo_0_M_AXIS_TREADY : signal is "axis_data_fifo_0_M_AXIS xilinx.com:interface:axis:1.0 None TREADY";
  attribute DEBUG of axis_data_fifo_0_M_AXIS_TREADY : signal is "true";
  attribute MARK_DEBUG of axis_data_fifo_0_M_AXIS_TREADY : signal is std.standard.true;
  signal axis_data_fifo_0_M_AXIS_TVALID : STD_LOGIC;
  attribute CONN_BUS_INFO of axis_data_fifo_0_M_AXIS_TVALID : signal is "axis_data_fifo_0_M_AXIS xilinx.com:interface:axis:1.0 None TVALID";
  attribute DEBUG of axis_data_fifo_0_M_AXIS_TVALID : signal is "true";
  attribute MARK_DEBUG of axis_data_fifo_0_M_AXIS_TVALID : signal is std.standard.true;
  signal axis_data_fifo_2_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute CONN_BUS_INFO of axis_data_fifo_2_M_AXIS_TDATA : signal is "axis_data_fifo_2_M_AXIS xilinx.com:interface:axis:1.0 None TDATA";
  attribute DEBUG of axis_data_fifo_2_M_AXIS_TDATA : signal is "true";
  attribute MARK_DEBUG of axis_data_fifo_2_M_AXIS_TDATA : signal is std.standard.true;
  signal axis_data_fifo_2_M_AXIS_TLAST : STD_LOGIC;
  attribute CONN_BUS_INFO of axis_data_fifo_2_M_AXIS_TLAST : signal is "axis_data_fifo_2_M_AXIS xilinx.com:interface:axis:1.0 None TLAST";
  attribute DEBUG of axis_data_fifo_2_M_AXIS_TLAST : signal is "true";
  attribute MARK_DEBUG of axis_data_fifo_2_M_AXIS_TLAST : signal is std.standard.true;
  signal axis_data_fifo_2_M_AXIS_TREADY : STD_LOGIC;
  attribute CONN_BUS_INFO of axis_data_fifo_2_M_AXIS_TREADY : signal is "axis_data_fifo_2_M_AXIS xilinx.com:interface:axis:1.0 None TREADY";
  attribute DEBUG of axis_data_fifo_2_M_AXIS_TREADY : signal is "true";
  attribute MARK_DEBUG of axis_data_fifo_2_M_AXIS_TREADY : signal is std.standard.true;
  signal axis_data_fifo_2_M_AXIS_TVALID : STD_LOGIC;
  attribute CONN_BUS_INFO of axis_data_fifo_2_M_AXIS_TVALID : signal is "axis_data_fifo_2_M_AXIS xilinx.com:interface:axis:1.0 None TVALID";
  attribute DEBUG of axis_data_fifo_2_M_AXIS_TVALID : signal is "true";
  attribute MARK_DEBUG of axis_data_fifo_2_M_AXIS_TVALID : signal is std.standard.true;
  signal axis_interconnect_0_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute CONN_BUS_INFO of axis_interconnect_0_M00_AXIS_TDATA : signal is "axis_interconnect_0_M00_AXIS xilinx.com:interface:axis:1.0 None TDATA";
  attribute DEBUG of axis_interconnect_0_M00_AXIS_TDATA : signal is "true";
  attribute MARK_DEBUG of axis_interconnect_0_M00_AXIS_TDATA : signal is std.standard.true;
  signal axis_interconnect_0_M00_AXIS_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute CONN_BUS_INFO of axis_interconnect_0_M00_AXIS_TKEEP : signal is "axis_interconnect_0_M00_AXIS xilinx.com:interface:axis:1.0 None TKEEP";
  attribute DEBUG of axis_interconnect_0_M00_AXIS_TKEEP : signal is "true";
  attribute MARK_DEBUG of axis_interconnect_0_M00_AXIS_TKEEP : signal is std.standard.true;
  signal axis_interconnect_0_M00_AXIS_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute CONN_BUS_INFO of axis_interconnect_0_M00_AXIS_TLAST : signal is "axis_interconnect_0_M00_AXIS xilinx.com:interface:axis:1.0 None TLAST";
  attribute DEBUG of axis_interconnect_0_M00_AXIS_TLAST : signal is "true";
  attribute MARK_DEBUG of axis_interconnect_0_M00_AXIS_TLAST : signal is std.standard.true;
  signal axis_interconnect_0_M00_AXIS_TREADY : STD_LOGIC;
  attribute CONN_BUS_INFO of axis_interconnect_0_M00_AXIS_TREADY : signal is "axis_interconnect_0_M00_AXIS xilinx.com:interface:axis:1.0 None TREADY";
  attribute DEBUG of axis_interconnect_0_M00_AXIS_TREADY : signal is "true";
  attribute MARK_DEBUG of axis_interconnect_0_M00_AXIS_TREADY : signal is std.standard.true;
  signal axis_interconnect_0_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute CONN_BUS_INFO of axis_interconnect_0_M00_AXIS_TVALID : signal is "axis_interconnect_0_M00_AXIS xilinx.com:interface:axis:1.0 None TVALID";
  attribute DEBUG of axis_interconnect_0_M00_AXIS_TVALID : signal is "true";
  attribute MARK_DEBUG of axis_interconnect_0_M00_AXIS_TVALID : signal is std.standard.true;
  signal axis_subset_converter_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute CONN_BUS_INFO of axis_subset_converter_0_M_AXIS_TDATA : signal is "axis_subset_converter_0_M_AXIS xilinx.com:interface:axis:1.0 None TDATA";
  attribute DEBUG of axis_subset_converter_0_M_AXIS_TDATA : signal is "true";
  attribute MARK_DEBUG of axis_subset_converter_0_M_AXIS_TDATA : signal is std.standard.true;
  signal axis_subset_converter_0_M_AXIS_TLAST : STD_LOGIC;
  attribute CONN_BUS_INFO of axis_subset_converter_0_M_AXIS_TLAST : signal is "axis_subset_converter_0_M_AXIS xilinx.com:interface:axis:1.0 None TLAST";
  attribute DEBUG of axis_subset_converter_0_M_AXIS_TLAST : signal is "true";
  attribute MARK_DEBUG of axis_subset_converter_0_M_AXIS_TLAST : signal is std.standard.true;
  signal axis_subset_converter_0_M_AXIS_TREADY : STD_LOGIC;
  attribute CONN_BUS_INFO of axis_subset_converter_0_M_AXIS_TREADY : signal is "axis_subset_converter_0_M_AXIS xilinx.com:interface:axis:1.0 None TREADY";
  attribute DEBUG of axis_subset_converter_0_M_AXIS_TREADY : signal is "true";
  attribute MARK_DEBUG of axis_subset_converter_0_M_AXIS_TREADY : signal is std.standard.true;
  signal axis_subset_converter_0_M_AXIS_TVALID : STD_LOGIC;
  attribute CONN_BUS_INFO of axis_subset_converter_0_M_AXIS_TVALID : signal is "axis_subset_converter_0_M_AXIS xilinx.com:interface:axis:1.0 None TVALID";
  attribute DEBUG of axis_subset_converter_0_M_AXIS_TVALID : signal is "true";
  attribute MARK_DEBUG of axis_subset_converter_0_M_AXIS_TVALID : signal is std.standard.true;
  signal event_controller_0_packet_counter : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal event_controller_0_triger_enable : STD_LOGIC;
  signal proc_sys_reset_0_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal proc_sys_reset_100_interconnect_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal proc_sys_reset_300_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ps8_0_axi_periph_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M00_AXI_ARREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M00_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ps8_0_axi_periph_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M00_AXI_AWREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M00_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ps8_0_axi_periph_M00_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ps8_0_axi_periph_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M00_AXI_BVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M00_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ps8_0_axi_periph_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M00_AXI_RVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M00_AXI_WREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_M00_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ps8_0_axi_periph_M01_AXI_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M01_AXI_ARREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M01_AXI_ARVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M01_AXI_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M01_AXI_AWREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M01_AXI_AWVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M01_AXI_BREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M01_AXI_BVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M01_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M01_AXI_RREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M01_AXI_RVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M01_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M01_AXI_WREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M01_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_M01_AXI_WVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M02_AXI_ARREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_ARVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M02_AXI_AWREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_AWVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_BREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M02_AXI_BVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M02_AXI_RREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M02_AXI_RVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M02_AXI_WREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_WVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M03_AXI_ARREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_ARVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M03_AXI_AWREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_AWVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_BREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M03_AXI_BVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M03_AXI_RREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M03_AXI_RVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M03_AXI_WREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_M03_AXI_WVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M04_AXI_ARREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_ARVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M04_AXI_AWREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_AWVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_BREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M04_AXI_BVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M04_AXI_RREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M04_AXI_RVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M04_AXI_WREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_M04_AXI_WVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M05_AXI_ARREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_ARVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M05_AXI_AWREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_AWVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_BREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M05_AXI_BVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M05_AXI_RREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M05_AXI_RVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M05_AXI_WREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_WVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M06_AXI_ARREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_ARVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M06_AXI_AWREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_AWVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_BREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M06_AXI_BVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M06_AXI_RREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M06_AXI_RVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M06_AXI_WREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_M06_AXI_WVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M07_AXI_ARREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_ARVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M07_AXI_AWREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_AWVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_BREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M07_AXI_BVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M07_AXI_RREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M07_AXI_RVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M07_AXI_WREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_M07_AXI_WVALID : STD_LOGIC;
  signal s_axis_tdata_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute DEBUG of s_axis_tdata_0_1 : signal is "true";
  attribute MARK_DEBUG of s_axis_tdata_0_1 : signal is std.standard.true;
  signal s_axis_tvalid_0_1 : STD_LOGIC;
  attribute DEBUG of s_axis_tvalid_0_1 : signal is "true";
  attribute MARK_DEBUG of s_axis_tvalid_0_1 : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 48 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_ARADDR : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARADDR";
  attribute DEBUG of smartconnect_0_M00_AXI_ARADDR : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_ARADDR : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_ARBURST : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARBURST";
  attribute DEBUG of smartconnect_0_M00_AXI_ARBURST : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_ARBURST : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_ARCACHE : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARCACHE";
  attribute DEBUG of smartconnect_0_M00_AXI_ARCACHE : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_ARCACHE : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_ARLEN : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARLEN";
  attribute DEBUG of smartconnect_0_M00_AXI_ARLEN : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_ARLEN : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_ARLOCK : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARLOCK";
  attribute DEBUG of smartconnect_0_M00_AXI_ARLOCK : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_ARLOCK : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_ARPROT : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARPROT";
  attribute DEBUG of smartconnect_0_M00_AXI_ARPROT : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_ARPROT : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_ARQOS : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARQOS";
  attribute DEBUG of smartconnect_0_M00_AXI_ARQOS : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_ARQOS : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_ARREADY : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_ARREADY : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARREADY";
  attribute DEBUG of smartconnect_0_M00_AXI_ARREADY : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_ARREADY : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_ARSIZE : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARSIZE";
  attribute DEBUG of smartconnect_0_M00_AXI_ARSIZE : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_ARSIZE : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_ARVALID : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_ARVALID : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARVALID";
  attribute DEBUG of smartconnect_0_M00_AXI_ARVALID : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_ARVALID : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 48 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_AWADDR : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWADDR";
  attribute DEBUG of smartconnect_0_M00_AXI_AWADDR : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_AWADDR : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_AWBURST : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWBURST";
  attribute DEBUG of smartconnect_0_M00_AXI_AWBURST : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_AWBURST : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_AWCACHE : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWCACHE";
  attribute DEBUG of smartconnect_0_M00_AXI_AWCACHE : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_AWCACHE : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_AWLEN : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWLEN";
  attribute DEBUG of smartconnect_0_M00_AXI_AWLEN : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_AWLEN : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_AWLOCK : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWLOCK";
  attribute DEBUG of smartconnect_0_M00_AXI_AWLOCK : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_AWLOCK : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_AWPROT : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWPROT";
  attribute DEBUG of smartconnect_0_M00_AXI_AWPROT : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_AWPROT : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_AWQOS : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWQOS";
  attribute DEBUG of smartconnect_0_M00_AXI_AWQOS : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_AWQOS : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_AWREADY : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_AWREADY : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWREADY";
  attribute DEBUG of smartconnect_0_M00_AXI_AWREADY : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_AWREADY : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_AWSIZE : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWSIZE";
  attribute DEBUG of smartconnect_0_M00_AXI_AWSIZE : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_AWSIZE : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_AWVALID : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_AWVALID : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWVALID";
  attribute DEBUG of smartconnect_0_M00_AXI_AWVALID : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_AWVALID : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_BREADY : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_BREADY : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 BREADY";
  attribute DEBUG of smartconnect_0_M00_AXI_BREADY : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_BREADY : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_BRESP : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 BRESP";
  attribute DEBUG of smartconnect_0_M00_AXI_BRESP : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_BRESP : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_BVALID : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_BVALID : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 BVALID";
  attribute DEBUG of smartconnect_0_M00_AXI_BVALID : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_BVALID : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_RDATA : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 RDATA";
  attribute DEBUG of smartconnect_0_M00_AXI_RDATA : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_RDATA : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_RLAST : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_RLAST : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 RLAST";
  attribute DEBUG of smartconnect_0_M00_AXI_RLAST : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_RLAST : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_RREADY : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_RREADY : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 RREADY";
  attribute DEBUG of smartconnect_0_M00_AXI_RREADY : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_RREADY : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_RRESP : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 RRESP";
  attribute DEBUG of smartconnect_0_M00_AXI_RRESP : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_RRESP : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_RVALID : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_RVALID : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 RVALID";
  attribute DEBUG of smartconnect_0_M00_AXI_RVALID : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_RVALID : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_WDATA : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 WDATA";
  attribute DEBUG of smartconnect_0_M00_AXI_WDATA : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_WDATA : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_WLAST : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_WLAST : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 WLAST";
  attribute DEBUG of smartconnect_0_M00_AXI_WLAST : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_WLAST : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_WREADY : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_WREADY : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 WREADY";
  attribute DEBUG of smartconnect_0_M00_AXI_WREADY : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_WREADY : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_WSTRB : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 WSTRB";
  attribute DEBUG of smartconnect_0_M00_AXI_WSTRB : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_WSTRB : signal is std.standard.true;
  signal smartconnect_0_M00_AXI_WVALID : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_0_M00_AXI_WVALID : signal is "smartconnect_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 WVALID";
  attribute DEBUG of smartconnect_0_M00_AXI_WVALID : signal is "true";
  attribute MARK_DEBUG of smartconnect_0_M00_AXI_WVALID : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 48 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_ARADDR : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARADDR";
  attribute DEBUG of smartconnect_1_M00_AXI_ARADDR : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_ARADDR : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_ARBURST : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARBURST";
  attribute DEBUG of smartconnect_1_M00_AXI_ARBURST : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_ARBURST : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_ARCACHE : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARCACHE";
  attribute DEBUG of smartconnect_1_M00_AXI_ARCACHE : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_ARCACHE : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_ARLEN : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARLEN";
  attribute DEBUG of smartconnect_1_M00_AXI_ARLEN : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_ARLEN : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_ARLOCK : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARLOCK";
  attribute DEBUG of smartconnect_1_M00_AXI_ARLOCK : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_ARLOCK : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_ARPROT : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARPROT";
  attribute DEBUG of smartconnect_1_M00_AXI_ARPROT : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_ARPROT : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_ARQOS : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARQOS";
  attribute DEBUG of smartconnect_1_M00_AXI_ARQOS : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_ARQOS : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_ARREADY : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_ARREADY : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARREADY";
  attribute DEBUG of smartconnect_1_M00_AXI_ARREADY : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_ARREADY : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_ARSIZE : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARSIZE";
  attribute DEBUG of smartconnect_1_M00_AXI_ARSIZE : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_ARSIZE : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_ARVALID : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_ARVALID : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARVALID";
  attribute DEBUG of smartconnect_1_M00_AXI_ARVALID : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_ARVALID : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 48 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_AWADDR : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWADDR";
  attribute DEBUG of smartconnect_1_M00_AXI_AWADDR : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_AWADDR : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_AWBURST : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWBURST";
  attribute DEBUG of smartconnect_1_M00_AXI_AWBURST : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_AWBURST : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_AWCACHE : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWCACHE";
  attribute DEBUG of smartconnect_1_M00_AXI_AWCACHE : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_AWCACHE : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_AWLEN : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWLEN";
  attribute DEBUG of smartconnect_1_M00_AXI_AWLEN : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_AWLEN : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_AWLOCK : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWLOCK";
  attribute DEBUG of smartconnect_1_M00_AXI_AWLOCK : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_AWLOCK : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_AWPROT : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWPROT";
  attribute DEBUG of smartconnect_1_M00_AXI_AWPROT : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_AWPROT : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_AWQOS : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWQOS";
  attribute DEBUG of smartconnect_1_M00_AXI_AWQOS : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_AWQOS : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_AWREADY : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_AWREADY : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWREADY";
  attribute DEBUG of smartconnect_1_M00_AXI_AWREADY : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_AWREADY : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_AWSIZE : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWSIZE";
  attribute DEBUG of smartconnect_1_M00_AXI_AWSIZE : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_AWSIZE : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_AWVALID : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_AWVALID : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWVALID";
  attribute DEBUG of smartconnect_1_M00_AXI_AWVALID : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_AWVALID : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_BREADY : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_BREADY : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 BREADY";
  attribute DEBUG of smartconnect_1_M00_AXI_BREADY : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_BREADY : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_BRESP : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 BRESP";
  attribute DEBUG of smartconnect_1_M00_AXI_BRESP : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_BRESP : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_BVALID : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_BVALID : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 BVALID";
  attribute DEBUG of smartconnect_1_M00_AXI_BVALID : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_BVALID : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_RDATA : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 RDATA";
  attribute DEBUG of smartconnect_1_M00_AXI_RDATA : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_RDATA : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_RLAST : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_RLAST : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 RLAST";
  attribute DEBUG of smartconnect_1_M00_AXI_RLAST : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_RLAST : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_RREADY : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_RREADY : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 RREADY";
  attribute DEBUG of smartconnect_1_M00_AXI_RREADY : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_RREADY : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_RRESP : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 RRESP";
  attribute DEBUG of smartconnect_1_M00_AXI_RRESP : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_RRESP : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_RVALID : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_RVALID : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 RVALID";
  attribute DEBUG of smartconnect_1_M00_AXI_RVALID : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_RVALID : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_WDATA : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 WDATA";
  attribute DEBUG of smartconnect_1_M00_AXI_WDATA : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_WDATA : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_WLAST : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_WLAST : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 WLAST";
  attribute DEBUG of smartconnect_1_M00_AXI_WLAST : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_WLAST : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_WREADY : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_WREADY : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 WREADY";
  attribute DEBUG of smartconnect_1_M00_AXI_WREADY : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_WREADY : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_WSTRB : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 WSTRB";
  attribute DEBUG of smartconnect_1_M00_AXI_WSTRB : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_WSTRB : signal is std.standard.true;
  signal smartconnect_1_M00_AXI_WVALID : STD_LOGIC;
  attribute CONN_BUS_INFO of smartconnect_1_M00_AXI_WVALID : signal is "smartconnect_1_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 WVALID";
  attribute DEBUG of smartconnect_1_M00_AXI_WVALID : signal is "true";
  attribute MARK_DEBUG of smartconnect_1_M00_AXI_WVALID : signal is std.standard.true;
  signal stream_multiplexer_0_adc_sample_selected_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute DEBUG of stream_multiplexer_0_adc_sample_selected_1 : signal is "true";
  attribute MARK_DEBUG of stream_multiplexer_0_adc_sample_selected_1 : signal is std.standard.true;
  signal stream_multiplexer_0_adc_sample_valid_selected_1 : STD_LOGIC;
  signal tlast_generator_0_counter : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal tlast_generator_0_triger_test : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal tlast_generator_0_trigger_detected : STD_LOGIC;
  signal tlast_generator_0_trigger_internal_out : STD_LOGIC;
  signal tlast_generator_1_counter : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal tlast_generator_1_m_axis_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal tlast_generator_1_m_axis_TLAST : STD_LOGIC;
  signal tlast_generator_1_m_axis_TREADY : STD_LOGIC;
  signal tlast_generator_1_m_axis_TVALID : STD_LOGIC;
  signal tlast_generator_1_triger_test : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal tlast_generator_1_trigger_detected : STD_LOGIC;
  signal tlast_generator_1_trigger_internal_out : STD_LOGIC;
  signal trigger_external_0_1 : STD_LOGIC;
  signal xlconcat_0_dout : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal xlconcat_irq_dout : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_0_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_1_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_2_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_2_Dout1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_3_5_Dout : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_0_IIC_0_SCL_I : STD_LOGIC;
  signal zynq_ultra_ps_e_0_IIC_0_SCL_O : STD_LOGIC;
  signal zynq_ultra_ps_e_0_IIC_0_SCL_T : STD_LOGIC;
  signal zynq_ultra_ps_e_0_IIC_0_SDA_I : STD_LOGIC;
  signal zynq_ultra_ps_e_0_IIC_0_SDA_O : STD_LOGIC;
  signal zynq_ultra_ps_e_0_IIC_0_SDA_T : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARLOCK : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWLOCK : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RLAST : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WLAST : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_0_SPI_0_IO0_I : STD_LOGIC;
  signal zynq_ultra_ps_e_0_SPI_0_IO0_O : STD_LOGIC;
  signal zynq_ultra_ps_e_0_SPI_0_IO0_T : STD_LOGIC;
  signal zynq_ultra_ps_e_0_SPI_0_IO1_I : STD_LOGIC;
  signal zynq_ultra_ps_e_0_SPI_0_IO1_O : STD_LOGIC;
  signal zynq_ultra_ps_e_0_SPI_0_IO1_T : STD_LOGIC;
  signal zynq_ultra_ps_e_0_SPI_0_SCK_I : STD_LOGIC;
  signal zynq_ultra_ps_e_0_SPI_0_SCK_O : STD_LOGIC;
  signal zynq_ultra_ps_e_0_SPI_0_SCK_T : STD_LOGIC;
  signal zynq_ultra_ps_e_0_SPI_0_SS_T : STD_LOGIC;
  signal zynq_ultra_ps_e_0_emio_spi0_ss_o_n : STD_LOGIC;
  signal zynq_ultra_ps_e_0_pl_clk0 : STD_LOGIC;
  signal zynq_ultra_ps_e_0_pl_clk1 : STD_LOGIC;
  signal zynq_ultra_ps_e_0_pl_clk3 : STD_LOGIC;
  signal zynq_ultra_ps_e_0_pl_resetn0 : STD_LOGIC;
  signal NLW_axi_dma_0_mm2s_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_0_s2mm_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_1_s2mm_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_proc_sys_reset_100_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_proc_sys_reset_100_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_100_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_300_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_proc_sys_reset_300_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_300_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_300_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_62p6_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_proc_sys_reset_62p6_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_62p6_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_62p6_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_system_management_wiz_0_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_0_busy_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_0_eoc_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_0_eos_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_0_ip2intc_irpt_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_0_ot_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_0_user_temp_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_0_vccaux_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_0_vccint_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_0_vccpsaux_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_0_vccpsintfp_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_0_vccpsintlp_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_0_channel_out_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_pl_clk2_UNCONNECTED : STD_LOGIC;
  signal NLW_zynq_ultra_ps_e_0_emio_enet0_enet_tsu_timer_cnt_UNCONNECTED : STD_LOGIC_VECTOR ( 93 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_maxigp2_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_maxigp2_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_saxigp0_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_saxigp0_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_saxigp1_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_saxigp1_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of pl_clk1 : signal is "xilinx.com:signal:clock:1.0 CLK.PL_CLK1 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of pl_clk1 : signal is "XIL_INTERFACENAME CLK.PL_CLK1, CLK_DOMAIN MercuryXU1_zynq_ultra_ps_e_0_0_pl_clk1, FREQ_HZ 49999500, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of pl_resetn0 : signal is "xilinx.com:signal:reset:1.0 RST.PL_RESETN0 RST";
  attribute X_INTERFACE_PARAMETER of pl_resetn0 : signal is "XIL_INTERFACENAME RST.PL_RESETN0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of ps_master_i2c_scl_i : signal is "xilinx.com:interface:iic:1.0 ps_master_i2c SCL_I";
  attribute X_INTERFACE_INFO of ps_master_i2c_scl_o : signal is "xilinx.com:interface:iic:1.0 ps_master_i2c SCL_O";
  attribute X_INTERFACE_INFO of ps_master_i2c_scl_t : signal is "xilinx.com:interface:iic:1.0 ps_master_i2c SCL_T";
  attribute X_INTERFACE_INFO of ps_master_i2c_sda_i : signal is "xilinx.com:interface:iic:1.0 ps_master_i2c SDA_I";
  attribute X_INTERFACE_INFO of ps_master_i2c_sda_o : signal is "xilinx.com:interface:iic:1.0 ps_master_i2c SDA_O";
  attribute X_INTERFACE_INFO of ps_master_i2c_sda_t : signal is "xilinx.com:interface:iic:1.0 ps_master_i2c SDA_T";
  attribute X_INTERFACE_INFO of ps_spi_0_io0_i : signal is "xilinx.com:interface:spi:1.0 ps_spi_0 IO0_I";
  attribute X_INTERFACE_INFO of ps_spi_0_io0_o : signal is "xilinx.com:interface:spi:1.0 ps_spi_0 IO0_O";
  attribute X_INTERFACE_INFO of ps_spi_0_io0_t : signal is "xilinx.com:interface:spi:1.0 ps_spi_0 IO0_T";
  attribute X_INTERFACE_INFO of ps_spi_0_io1_i : signal is "xilinx.com:interface:spi:1.0 ps_spi_0 IO1_I";
  attribute X_INTERFACE_INFO of ps_spi_0_io1_o : signal is "xilinx.com:interface:spi:1.0 ps_spi_0 IO1_O";
  attribute X_INTERFACE_INFO of ps_spi_0_io1_t : signal is "xilinx.com:interface:spi:1.0 ps_spi_0 IO1_T";
  attribute X_INTERFACE_INFO of ps_spi_0_sck_i : signal is "xilinx.com:interface:spi:1.0 ps_spi_0 SCK_I";
  attribute X_INTERFACE_INFO of ps_spi_0_sck_o : signal is "xilinx.com:interface:spi:1.0 ps_spi_0 SCK_O";
  attribute X_INTERFACE_INFO of ps_spi_0_sck_t : signal is "xilinx.com:interface:spi:1.0 ps_spi_0 SCK_T";
  attribute X_INTERFACE_INFO of ps_spi_0_ss_t : signal is "xilinx.com:interface:spi:1.0 ps_spi_0 SS_T";
  attribute X_INTERFACE_INFO of sample_clk : signal is "xilinx.com:signal:clock:1.0 CLK.SAMPLE_CLK CLK";
  attribute X_INTERFACE_PARAMETER of sample_clk : signal is "XIL_INTERFACENAME CLK.SAMPLE_CLK, CLK_DOMAIN MercuryXU1_sample_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
begin
  aclk_0_1 <= sample_clk;
  adc0_sample_0_1(31 downto 0) <= adc0_sample(31 downto 0);
  adc10_sample_0_1(31 downto 0) <= adc10_sample(31 downto 0);
  adc11_sample_0_1(31 downto 0) <= adc11_sample(31 downto 0);
  adc12_sample_0_1(31 downto 0) <= adc12_sample(31 downto 0);
  adc13_sample_0_1(31 downto 0) <= adc13_sample(31 downto 0);
  adc14_sample_0_1(31 downto 0) <= adc14_sample(31 downto 0);
  adc15_sample_0_1(31 downto 0) <= adc15_sample(31 downto 0);
  adc16_sample_0_1(31 downto 0) <= adc16_sample(31 downto 0);
  adc17_sample_0_1(31 downto 0) <= adc17_sample(31 downto 0);
  adc18_sample_0_1(31 downto 0) <= adc18_sample(31 downto 0);
  adc19_sample_0_1(31 downto 0) <= adc19_sample(31 downto 0);
  adc1_sample_1(31 downto 0) <= adc1_sample(31 downto 0);
  adc2_sample_1(31 downto 0) <= adc2_sample(31 downto 0);
  adc3_sample_0_1(31 downto 0) <= adc3_sample(31 downto 0);
  adc4_sample_0_1(31 downto 0) <= adc4_sample(31 downto 0);
  adc5_sample_0_1(31 downto 0) <= adc5_sample(31 downto 0);
  adc6_sample_0_1(31 downto 0) <= adc6_sample(31 downto 0);
  adc7_sample_0_1(31 downto 0) <= adc7_sample(31 downto 0);
  adc8_sample_0_1(31 downto 0) <= adc8_sample(31 downto 0);
  adc9_sample_0_1(31 downto 0) <= adc9_sample(31 downto 0);
  adc_sample_valid_0_1(19 downto 0) <= adc_sample_valid(19 downto 0);
  emio_spi0_ss_out <= zynq_ultra_ps_e_0_emio_spi0_ss_o_n;
  gpio(19 downto 0) <= axi_gpio_0_gpio_io_o(19 downto 0);
  gpio_delay_ctrl(31 downto 0) <= axi_gpio_delay_ctrl_gpio_io_o(31 downto 0);
  pl_clk1 <= zynq_ultra_ps_e_0_pl_clk1;
  pl_resetn0 <= zynq_ultra_ps_e_0_pl_resetn0;
  ps_master_i2c_scl_o <= zynq_ultra_ps_e_0_IIC_0_SCL_O;
  ps_master_i2c_scl_t <= zynq_ultra_ps_e_0_IIC_0_SCL_T;
  ps_master_i2c_sda_o <= zynq_ultra_ps_e_0_IIC_0_SDA_O;
  ps_master_i2c_sda_t <= zynq_ultra_ps_e_0_IIC_0_SDA_T;
  ps_spi_0_io0_o <= zynq_ultra_ps_e_0_SPI_0_IO0_O;
  ps_spi_0_io0_t <= zynq_ultra_ps_e_0_SPI_0_IO0_T;
  ps_spi_0_io1_o <= zynq_ultra_ps_e_0_SPI_0_IO1_O;
  ps_spi_0_io1_t <= zynq_ultra_ps_e_0_SPI_0_IO1_T;
  ps_spi_0_sck_o <= zynq_ultra_ps_e_0_SPI_0_SCK_O;
  ps_spi_0_sck_t <= zynq_ultra_ps_e_0_SPI_0_SCK_T;
  ps_spi_0_ss_t <= zynq_ultra_ps_e_0_SPI_0_SS_T;
  trigger_external_0_1 <= trigger_external;
  zynq_ultra_ps_e_0_IIC_0_SCL_I <= ps_master_i2c_scl_i;
  zynq_ultra_ps_e_0_IIC_0_SDA_I <= ps_master_i2c_sda_i;
  zynq_ultra_ps_e_0_SPI_0_IO0_I <= ps_spi_0_io0_i;
  zynq_ultra_ps_e_0_SPI_0_IO1_I <= ps_spi_0_io1_i;
  zynq_ultra_ps_e_0_SPI_0_SCK_I <= ps_spi_0_sck_i;
axi_dma_0: component MercuryXU1_axi_dma_0_0
     port map (
      axi_resetn => proc_sys_reset_0_peripheral_aresetn(0),
      m_axi_mm2s_aclk => zynq_ultra_ps_e_0_pl_clk3,
      m_axi_mm2s_araddr(31 downto 0) => axi_dma_0_M_AXI_MM2S_ARADDR(31 downto 0),
      m_axi_mm2s_arburst(1 downto 0) => axi_dma_0_M_AXI_MM2S_ARBURST(1 downto 0),
      m_axi_mm2s_arcache(3 downto 0) => axi_dma_0_M_AXI_MM2S_ARCACHE(3 downto 0),
      m_axi_mm2s_arlen(7 downto 0) => axi_dma_0_M_AXI_MM2S_ARLEN(7 downto 0),
      m_axi_mm2s_arprot(2 downto 0) => axi_dma_0_M_AXI_MM2S_ARPROT(2 downto 0),
      m_axi_mm2s_arready => axi_dma_0_M_AXI_MM2S_ARREADY,
      m_axi_mm2s_arsize(2 downto 0) => axi_dma_0_M_AXI_MM2S_ARSIZE(2 downto 0),
      m_axi_mm2s_arvalid => axi_dma_0_M_AXI_MM2S_ARVALID,
      m_axi_mm2s_rdata(31 downto 0) => axi_dma_0_M_AXI_MM2S_RDATA(31 downto 0),
      m_axi_mm2s_rlast => axi_dma_0_M_AXI_MM2S_RLAST,
      m_axi_mm2s_rready => axi_dma_0_M_AXI_MM2S_RREADY,
      m_axi_mm2s_rresp(1 downto 0) => axi_dma_0_M_AXI_MM2S_RRESP(1 downto 0),
      m_axi_mm2s_rvalid => axi_dma_0_M_AXI_MM2S_RVALID,
      m_axi_s2mm_aclk => zynq_ultra_ps_e_0_pl_clk3,
      m_axi_s2mm_awaddr(31 downto 0) => axi_dma_0_M_AXI_S2MM_AWADDR(31 downto 0),
      m_axi_s2mm_awburst(1 downto 0) => axi_dma_0_M_AXI_S2MM_AWBURST(1 downto 0),
      m_axi_s2mm_awcache(3 downto 0) => axi_dma_0_M_AXI_S2MM_AWCACHE(3 downto 0),
      m_axi_s2mm_awlen(7 downto 0) => axi_dma_0_M_AXI_S2MM_AWLEN(7 downto 0),
      m_axi_s2mm_awprot(2 downto 0) => axi_dma_0_M_AXI_S2MM_AWPROT(2 downto 0),
      m_axi_s2mm_awready => axi_dma_0_M_AXI_S2MM_AWREADY,
      m_axi_s2mm_awsize(2 downto 0) => axi_dma_0_M_AXI_S2MM_AWSIZE(2 downto 0),
      m_axi_s2mm_awvalid => axi_dma_0_M_AXI_S2MM_AWVALID,
      m_axi_s2mm_bready => axi_dma_0_M_AXI_S2MM_BREADY,
      m_axi_s2mm_bresp(1 downto 0) => axi_dma_0_M_AXI_S2MM_BRESP(1 downto 0),
      m_axi_s2mm_bvalid => axi_dma_0_M_AXI_S2MM_BVALID,
      m_axi_s2mm_wdata(31 downto 0) => axi_dma_0_M_AXI_S2MM_WDATA(31 downto 0),
      m_axi_s2mm_wlast => axi_dma_0_M_AXI_S2MM_WLAST,
      m_axi_s2mm_wready => axi_dma_0_M_AXI_S2MM_WREADY,
      m_axi_s2mm_wstrb(3 downto 0) => axi_dma_0_M_AXI_S2MM_WSTRB(3 downto 0),
      m_axi_s2mm_wvalid => axi_dma_0_M_AXI_S2MM_WVALID,
      m_axi_sg_aclk => zynq_ultra_ps_e_0_pl_clk3,
      m_axi_sg_araddr(31 downto 0) => axi_dma_0_M_AXI_SG_ARADDR(31 downto 0),
      m_axi_sg_arburst(1 downto 0) => axi_dma_0_M_AXI_SG_ARBURST(1 downto 0),
      m_axi_sg_arcache(3 downto 0) => axi_dma_0_M_AXI_SG_ARCACHE(3 downto 0),
      m_axi_sg_arlen(7 downto 0) => axi_dma_0_M_AXI_SG_ARLEN(7 downto 0),
      m_axi_sg_arprot(2 downto 0) => axi_dma_0_M_AXI_SG_ARPROT(2 downto 0),
      m_axi_sg_arready => axi_dma_0_M_AXI_SG_ARREADY,
      m_axi_sg_arsize(2 downto 0) => axi_dma_0_M_AXI_SG_ARSIZE(2 downto 0),
      m_axi_sg_arvalid => axi_dma_0_M_AXI_SG_ARVALID,
      m_axi_sg_awaddr(31 downto 0) => axi_dma_0_M_AXI_SG_AWADDR(31 downto 0),
      m_axi_sg_awburst(1 downto 0) => axi_dma_0_M_AXI_SG_AWBURST(1 downto 0),
      m_axi_sg_awcache(3 downto 0) => axi_dma_0_M_AXI_SG_AWCACHE(3 downto 0),
      m_axi_sg_awlen(7 downto 0) => axi_dma_0_M_AXI_SG_AWLEN(7 downto 0),
      m_axi_sg_awprot(2 downto 0) => axi_dma_0_M_AXI_SG_AWPROT(2 downto 0),
      m_axi_sg_awready => axi_dma_0_M_AXI_SG_AWREADY,
      m_axi_sg_awsize(2 downto 0) => axi_dma_0_M_AXI_SG_AWSIZE(2 downto 0),
      m_axi_sg_awvalid => axi_dma_0_M_AXI_SG_AWVALID,
      m_axi_sg_bready => axi_dma_0_M_AXI_SG_BREADY,
      m_axi_sg_bresp(1 downto 0) => axi_dma_0_M_AXI_SG_BRESP(1 downto 0),
      m_axi_sg_bvalid => axi_dma_0_M_AXI_SG_BVALID,
      m_axi_sg_rdata(31 downto 0) => axi_dma_0_M_AXI_SG_RDATA(31 downto 0),
      m_axi_sg_rlast => axi_dma_0_M_AXI_SG_RLAST,
      m_axi_sg_rready => axi_dma_0_M_AXI_SG_RREADY,
      m_axi_sg_rresp(1 downto 0) => axi_dma_0_M_AXI_SG_RRESP(1 downto 0),
      m_axi_sg_rvalid => axi_dma_0_M_AXI_SG_RVALID,
      m_axi_sg_wdata(31 downto 0) => axi_dma_0_M_AXI_SG_WDATA(31 downto 0),
      m_axi_sg_wlast => axi_dma_0_M_AXI_SG_WLAST,
      m_axi_sg_wready => axi_dma_0_M_AXI_SG_WREADY,
      m_axi_sg_wstrb(3 downto 0) => axi_dma_0_M_AXI_SG_WSTRB(3 downto 0),
      m_axi_sg_wvalid => axi_dma_0_M_AXI_SG_WVALID,
      m_axis_mm2s_tdata(31 downto 0) => axi_dma_0_M_AXIS_MM2S_TDATA(31 downto 0),
      m_axis_mm2s_tkeep(3 downto 0) => axi_dma_0_M_AXIS_MM2S_TKEEP(3 downto 0),
      m_axis_mm2s_tlast => axi_dma_0_M_AXIS_MM2S_TLAST,
      m_axis_mm2s_tready => axi_dma_0_M_AXIS_MM2S_TREADY,
      m_axis_mm2s_tvalid => axi_dma_0_M_AXIS_MM2S_TVALID,
      mm2s_introut => axi_dma_0_mm2s_introut,
      mm2s_prmry_reset_out_n => NLW_axi_dma_0_mm2s_prmry_reset_out_n_UNCONNECTED,
      s2mm_introut => axi_dma_0_s2mm_introut,
      s2mm_prmry_reset_out_n => NLW_axi_dma_0_s2mm_prmry_reset_out_n_UNCONNECTED,
      s_axi_lite_aclk => zynq_ultra_ps_e_0_pl_clk0,
      s_axi_lite_araddr(9 downto 0) => ps8_0_axi_periph_M02_AXI_ARADDR(9 downto 0),
      s_axi_lite_arready => ps8_0_axi_periph_M02_AXI_ARREADY,
      s_axi_lite_arvalid => ps8_0_axi_periph_M02_AXI_ARVALID,
      s_axi_lite_awaddr(9 downto 0) => ps8_0_axi_periph_M02_AXI_AWADDR(9 downto 0),
      s_axi_lite_awready => ps8_0_axi_periph_M02_AXI_AWREADY,
      s_axi_lite_awvalid => ps8_0_axi_periph_M02_AXI_AWVALID,
      s_axi_lite_bready => ps8_0_axi_periph_M02_AXI_BREADY,
      s_axi_lite_bresp(1 downto 0) => ps8_0_axi_periph_M02_AXI_BRESP(1 downto 0),
      s_axi_lite_bvalid => ps8_0_axi_periph_M02_AXI_BVALID,
      s_axi_lite_rdata(31 downto 0) => ps8_0_axi_periph_M02_AXI_RDATA(31 downto 0),
      s_axi_lite_rready => ps8_0_axi_periph_M02_AXI_RREADY,
      s_axi_lite_rresp(1 downto 0) => ps8_0_axi_periph_M02_AXI_RRESP(1 downto 0),
      s_axi_lite_rvalid => ps8_0_axi_periph_M02_AXI_RVALID,
      s_axi_lite_wdata(31 downto 0) => ps8_0_axi_periph_M02_AXI_WDATA(31 downto 0),
      s_axi_lite_wready => ps8_0_axi_periph_M02_AXI_WREADY,
      s_axi_lite_wvalid => ps8_0_axi_periph_M02_AXI_WVALID,
      s_axis_s2mm_tdata(31 downto 0) => axis_interconnect_0_M00_AXIS_TDATA(31 downto 0),
      s_axis_s2mm_tkeep(3 downto 0) => axis_interconnect_0_M00_AXIS_TKEEP(3 downto 0),
      s_axis_s2mm_tlast => axis_interconnect_0_M00_AXIS_TLAST(0),
      s_axis_s2mm_tready => axis_interconnect_0_M00_AXIS_TREADY,
      s_axis_s2mm_tvalid => axis_interconnect_0_M00_AXIS_TVALID(0)
    );
axi_dma_1: component MercuryXU1_axi_dma_0_1
     port map (
      axi_resetn => proc_sys_reset_0_peripheral_aresetn(0),
      m_axi_s2mm_aclk => zynq_ultra_ps_e_0_pl_clk3,
      m_axi_s2mm_awaddr(31 downto 0) => axi_dma_1_M_AXI_S2MM_AWADDR(31 downto 0),
      m_axi_s2mm_awburst(1 downto 0) => axi_dma_1_M_AXI_S2MM_AWBURST(1 downto 0),
      m_axi_s2mm_awcache(3 downto 0) => axi_dma_1_M_AXI_S2MM_AWCACHE(3 downto 0),
      m_axi_s2mm_awlen(7 downto 0) => axi_dma_1_M_AXI_S2MM_AWLEN(7 downto 0),
      m_axi_s2mm_awprot(2 downto 0) => axi_dma_1_M_AXI_S2MM_AWPROT(2 downto 0),
      m_axi_s2mm_awready => axi_dma_1_M_AXI_S2MM_AWREADY,
      m_axi_s2mm_awsize(2 downto 0) => axi_dma_1_M_AXI_S2MM_AWSIZE(2 downto 0),
      m_axi_s2mm_awvalid => axi_dma_1_M_AXI_S2MM_AWVALID,
      m_axi_s2mm_bready => axi_dma_1_M_AXI_S2MM_BREADY,
      m_axi_s2mm_bresp(1 downto 0) => axi_dma_1_M_AXI_S2MM_BRESP(1 downto 0),
      m_axi_s2mm_bvalid => axi_dma_1_M_AXI_S2MM_BVALID,
      m_axi_s2mm_wdata(31 downto 0) => axi_dma_1_M_AXI_S2MM_WDATA(31 downto 0),
      m_axi_s2mm_wlast => axi_dma_1_M_AXI_S2MM_WLAST,
      m_axi_s2mm_wready => axi_dma_1_M_AXI_S2MM_WREADY,
      m_axi_s2mm_wstrb(3 downto 0) => axi_dma_1_M_AXI_S2MM_WSTRB(3 downto 0),
      m_axi_s2mm_wvalid => axi_dma_1_M_AXI_S2MM_WVALID,
      m_axi_sg_aclk => zynq_ultra_ps_e_0_pl_clk3,
      m_axi_sg_araddr(31 downto 0) => axi_dma_1_M_AXI_SG_ARADDR(31 downto 0),
      m_axi_sg_arburst(1 downto 0) => axi_dma_1_M_AXI_SG_ARBURST(1 downto 0),
      m_axi_sg_arcache(3 downto 0) => axi_dma_1_M_AXI_SG_ARCACHE(3 downto 0),
      m_axi_sg_arlen(7 downto 0) => axi_dma_1_M_AXI_SG_ARLEN(7 downto 0),
      m_axi_sg_arprot(2 downto 0) => axi_dma_1_M_AXI_SG_ARPROT(2 downto 0),
      m_axi_sg_arready => axi_dma_1_M_AXI_SG_ARREADY,
      m_axi_sg_arsize(2 downto 0) => axi_dma_1_M_AXI_SG_ARSIZE(2 downto 0),
      m_axi_sg_arvalid => axi_dma_1_M_AXI_SG_ARVALID,
      m_axi_sg_awaddr(31 downto 0) => axi_dma_1_M_AXI_SG_AWADDR(31 downto 0),
      m_axi_sg_awburst(1 downto 0) => axi_dma_1_M_AXI_SG_AWBURST(1 downto 0),
      m_axi_sg_awcache(3 downto 0) => axi_dma_1_M_AXI_SG_AWCACHE(3 downto 0),
      m_axi_sg_awlen(7 downto 0) => axi_dma_1_M_AXI_SG_AWLEN(7 downto 0),
      m_axi_sg_awprot(2 downto 0) => axi_dma_1_M_AXI_SG_AWPROT(2 downto 0),
      m_axi_sg_awready => axi_dma_1_M_AXI_SG_AWREADY,
      m_axi_sg_awsize(2 downto 0) => axi_dma_1_M_AXI_SG_AWSIZE(2 downto 0),
      m_axi_sg_awvalid => axi_dma_1_M_AXI_SG_AWVALID,
      m_axi_sg_bready => axi_dma_1_M_AXI_SG_BREADY,
      m_axi_sg_bresp(1 downto 0) => axi_dma_1_M_AXI_SG_BRESP(1 downto 0),
      m_axi_sg_bvalid => axi_dma_1_M_AXI_SG_BVALID,
      m_axi_sg_rdata(31 downto 0) => axi_dma_1_M_AXI_SG_RDATA(31 downto 0),
      m_axi_sg_rlast => axi_dma_1_M_AXI_SG_RLAST,
      m_axi_sg_rready => axi_dma_1_M_AXI_SG_RREADY,
      m_axi_sg_rresp(1 downto 0) => axi_dma_1_M_AXI_SG_RRESP(1 downto 0),
      m_axi_sg_rvalid => axi_dma_1_M_AXI_SG_RVALID,
      m_axi_sg_wdata(31 downto 0) => axi_dma_1_M_AXI_SG_WDATA(31 downto 0),
      m_axi_sg_wlast => axi_dma_1_M_AXI_SG_WLAST,
      m_axi_sg_wready => axi_dma_1_M_AXI_SG_WREADY,
      m_axi_sg_wstrb(3 downto 0) => axi_dma_1_M_AXI_SG_WSTRB(3 downto 0),
      m_axi_sg_wvalid => axi_dma_1_M_AXI_SG_WVALID,
      s2mm_introut => axi_dma_1_s2mm_introut,
      s2mm_prmry_reset_out_n => NLW_axi_dma_1_s2mm_prmry_reset_out_n_UNCONNECTED,
      s_axi_lite_aclk => zynq_ultra_ps_e_0_pl_clk0,
      s_axi_lite_araddr(9 downto 0) => ps8_0_axi_periph_M05_AXI_ARADDR(9 downto 0),
      s_axi_lite_arready => ps8_0_axi_periph_M05_AXI_ARREADY,
      s_axi_lite_arvalid => ps8_0_axi_periph_M05_AXI_ARVALID,
      s_axi_lite_awaddr(9 downto 0) => ps8_0_axi_periph_M05_AXI_AWADDR(9 downto 0),
      s_axi_lite_awready => ps8_0_axi_periph_M05_AXI_AWREADY,
      s_axi_lite_awvalid => ps8_0_axi_periph_M05_AXI_AWVALID,
      s_axi_lite_bready => ps8_0_axi_periph_M05_AXI_BREADY,
      s_axi_lite_bresp(1 downto 0) => ps8_0_axi_periph_M05_AXI_BRESP(1 downto 0),
      s_axi_lite_bvalid => ps8_0_axi_periph_M05_AXI_BVALID,
      s_axi_lite_rdata(31 downto 0) => ps8_0_axi_periph_M05_AXI_RDATA(31 downto 0),
      s_axi_lite_rready => ps8_0_axi_periph_M05_AXI_RREADY,
      s_axi_lite_rresp(1 downto 0) => ps8_0_axi_periph_M05_AXI_RRESP(1 downto 0),
      s_axi_lite_rvalid => ps8_0_axi_periph_M05_AXI_RVALID,
      s_axi_lite_wdata(31 downto 0) => ps8_0_axi_periph_M05_AXI_WDATA(31 downto 0),
      s_axi_lite_wready => ps8_0_axi_periph_M05_AXI_WREADY,
      s_axi_lite_wvalid => ps8_0_axi_periph_M05_AXI_WVALID,
      s_axis_s2mm_tdata(31 downto 0) => axis_data_fifo_0_M_AXIS_TDATA(31 downto 0),
      s_axis_s2mm_tkeep(3 downto 0) => B"1111",
      s_axis_s2mm_tlast => axis_data_fifo_0_M_AXIS_TLAST,
      s_axis_s2mm_tready => axis_data_fifo_0_M_AXIS_TREADY,
      s_axis_s2mm_tvalid => axis_data_fifo_0_M_AXIS_TVALID
    );
axi_gpio_0: component MercuryXU1_axi_gpio_0_0
     port map (
      gpio_io_o(19 downto 0) => axi_gpio_0_gpio_io_o(19 downto 0),
      s_axi_aclk => zynq_ultra_ps_e_0_pl_clk0,
      s_axi_araddr(8 downto 0) => ps8_0_axi_periph_M00_AXI_ARADDR(8 downto 0),
      s_axi_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s_axi_arready => ps8_0_axi_periph_M00_AXI_ARREADY,
      s_axi_arvalid => ps8_0_axi_periph_M00_AXI_ARVALID(0),
      s_axi_awaddr(8 downto 0) => ps8_0_axi_periph_M00_AXI_AWADDR(8 downto 0),
      s_axi_awready => ps8_0_axi_periph_M00_AXI_AWREADY,
      s_axi_awvalid => ps8_0_axi_periph_M00_AXI_AWVALID(0),
      s_axi_bready => ps8_0_axi_periph_M00_AXI_BREADY(0),
      s_axi_bresp(1 downto 0) => ps8_0_axi_periph_M00_AXI_BRESP(1 downto 0),
      s_axi_bvalid => ps8_0_axi_periph_M00_AXI_BVALID,
      s_axi_rdata(31 downto 0) => ps8_0_axi_periph_M00_AXI_RDATA(31 downto 0),
      s_axi_rready => ps8_0_axi_periph_M00_AXI_RREADY(0),
      s_axi_rresp(1 downto 0) => ps8_0_axi_periph_M00_AXI_RRESP(1 downto 0),
      s_axi_rvalid => ps8_0_axi_periph_M00_AXI_RVALID,
      s_axi_wdata(31 downto 0) => ps8_0_axi_periph_M00_AXI_WDATA(31 downto 0),
      s_axi_wready => ps8_0_axi_periph_M00_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => ps8_0_axi_periph_M00_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => ps8_0_axi_periph_M00_AXI_WVALID(0)
    );
axi_gpio_delay_ctrl: component MercuryXU1_axi_gpio_sample_number_0
     port map (
      gpio_io_o(31 downto 0) => axi_gpio_delay_ctrl_gpio_io_o(31 downto 0),
      s_axi_aclk => zynq_ultra_ps_e_0_pl_clk0,
      s_axi_araddr(8 downto 0) => ps8_0_axi_periph_M06_AXI_ARADDR(8 downto 0),
      s_axi_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s_axi_arready => ps8_0_axi_periph_M06_AXI_ARREADY,
      s_axi_arvalid => ps8_0_axi_periph_M06_AXI_ARVALID,
      s_axi_awaddr(8 downto 0) => ps8_0_axi_periph_M06_AXI_AWADDR(8 downto 0),
      s_axi_awready => ps8_0_axi_periph_M06_AXI_AWREADY,
      s_axi_awvalid => ps8_0_axi_periph_M06_AXI_AWVALID,
      s_axi_bready => ps8_0_axi_periph_M06_AXI_BREADY,
      s_axi_bresp(1 downto 0) => ps8_0_axi_periph_M06_AXI_BRESP(1 downto 0),
      s_axi_bvalid => ps8_0_axi_periph_M06_AXI_BVALID,
      s_axi_rdata(31 downto 0) => ps8_0_axi_periph_M06_AXI_RDATA(31 downto 0),
      s_axi_rready => ps8_0_axi_periph_M06_AXI_RREADY,
      s_axi_rresp(1 downto 0) => ps8_0_axi_periph_M06_AXI_RRESP(1 downto 0),
      s_axi_rvalid => ps8_0_axi_periph_M06_AXI_RVALID,
      s_axi_wdata(31 downto 0) => ps8_0_axi_periph_M06_AXI_WDATA(31 downto 0),
      s_axi_wready => ps8_0_axi_periph_M06_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => ps8_0_axi_periph_M06_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => ps8_0_axi_periph_M06_AXI_WVALID
    );
axi_gpio_packet_number: component MercuryXU1_axi_gpio_delay_ctrl_0
     port map (
      gpio2_io_i(31 downto 0) => event_controller_0_packet_counter(31 downto 0),
      gpio_io_o(31 downto 0) => axi_gpio_packet_number_gpio_io_o(31 downto 0),
      s_axi_aclk => zynq_ultra_ps_e_0_pl_clk0,
      s_axi_araddr(8 downto 0) => ps8_0_axi_periph_M07_AXI_ARADDR(8 downto 0),
      s_axi_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s_axi_arready => ps8_0_axi_periph_M07_AXI_ARREADY,
      s_axi_arvalid => ps8_0_axi_periph_M07_AXI_ARVALID,
      s_axi_awaddr(8 downto 0) => ps8_0_axi_periph_M07_AXI_AWADDR(8 downto 0),
      s_axi_awready => ps8_0_axi_periph_M07_AXI_AWREADY,
      s_axi_awvalid => ps8_0_axi_periph_M07_AXI_AWVALID,
      s_axi_bready => ps8_0_axi_periph_M07_AXI_BREADY,
      s_axi_bresp(1 downto 0) => ps8_0_axi_periph_M07_AXI_BRESP(1 downto 0),
      s_axi_bvalid => ps8_0_axi_periph_M07_AXI_BVALID,
      s_axi_rdata(31 downto 0) => ps8_0_axi_periph_M07_AXI_RDATA(31 downto 0),
      s_axi_rready => ps8_0_axi_periph_M07_AXI_RREADY,
      s_axi_rresp(1 downto 0) => ps8_0_axi_periph_M07_AXI_RRESP(1 downto 0),
      s_axi_rvalid => ps8_0_axi_periph_M07_AXI_RVALID,
      s_axi_wdata(31 downto 0) => ps8_0_axi_periph_M07_AXI_WDATA(31 downto 0),
      s_axi_wready => ps8_0_axi_periph_M07_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => ps8_0_axi_periph_M07_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => ps8_0_axi_periph_M07_AXI_WVALID
    );
axi_gpio_sample_number: component MercuryXU1_axi_gpio_0_2
     port map (
      gpio_io_o(31 downto 0) => axi_gpio_sample_number_gpio_io_o(31 downto 0),
      s_axi_aclk => zynq_ultra_ps_e_0_pl_clk0,
      s_axi_araddr(8 downto 0) => ps8_0_axi_periph_M04_AXI_ARADDR(8 downto 0),
      s_axi_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s_axi_arready => ps8_0_axi_periph_M04_AXI_ARREADY,
      s_axi_arvalid => ps8_0_axi_periph_M04_AXI_ARVALID,
      s_axi_awaddr(8 downto 0) => ps8_0_axi_periph_M04_AXI_AWADDR(8 downto 0),
      s_axi_awready => ps8_0_axi_periph_M04_AXI_AWREADY,
      s_axi_awvalid => ps8_0_axi_periph_M04_AXI_AWVALID,
      s_axi_bready => ps8_0_axi_periph_M04_AXI_BREADY,
      s_axi_bresp(1 downto 0) => ps8_0_axi_periph_M04_AXI_BRESP(1 downto 0),
      s_axi_bvalid => ps8_0_axi_periph_M04_AXI_BVALID,
      s_axi_rdata(31 downto 0) => ps8_0_axi_periph_M04_AXI_RDATA(31 downto 0),
      s_axi_rready => ps8_0_axi_periph_M04_AXI_RREADY,
      s_axi_rresp(1 downto 0) => ps8_0_axi_periph_M04_AXI_RRESP(1 downto 0),
      s_axi_rvalid => ps8_0_axi_periph_M04_AXI_RVALID,
      s_axi_wdata(31 downto 0) => ps8_0_axi_periph_M04_AXI_WDATA(31 downto 0),
      s_axi_wready => ps8_0_axi_periph_M04_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => ps8_0_axi_periph_M04_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => ps8_0_axi_periph_M04_AXI_WVALID
    );
axi_gpio_suppres: component MercuryXU1_axi_gpio_0_1
     port map (
      gpio_io_o(19 downto 0) => axi_gpio_suppres_gpio_io_o(19 downto 0),
      s_axi_aclk => zynq_ultra_ps_e_0_pl_clk0,
      s_axi_araddr(8 downto 0) => ps8_0_axi_periph_M03_AXI_ARADDR(8 downto 0),
      s_axi_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s_axi_arready => ps8_0_axi_periph_M03_AXI_ARREADY,
      s_axi_arvalid => ps8_0_axi_periph_M03_AXI_ARVALID,
      s_axi_awaddr(8 downto 0) => ps8_0_axi_periph_M03_AXI_AWADDR(8 downto 0),
      s_axi_awready => ps8_0_axi_periph_M03_AXI_AWREADY,
      s_axi_awvalid => ps8_0_axi_periph_M03_AXI_AWVALID,
      s_axi_bready => ps8_0_axi_periph_M03_AXI_BREADY,
      s_axi_bresp(1 downto 0) => ps8_0_axi_periph_M03_AXI_BRESP(1 downto 0),
      s_axi_bvalid => ps8_0_axi_periph_M03_AXI_BVALID,
      s_axi_rdata(31 downto 0) => ps8_0_axi_periph_M03_AXI_RDATA(31 downto 0),
      s_axi_rready => ps8_0_axi_periph_M03_AXI_RREADY,
      s_axi_rresp(1 downto 0) => ps8_0_axi_periph_M03_AXI_RRESP(1 downto 0),
      s_axi_rvalid => ps8_0_axi_periph_M03_AXI_RVALID,
      s_axi_wdata(31 downto 0) => ps8_0_axi_periph_M03_AXI_WDATA(31 downto 0),
      s_axi_wready => ps8_0_axi_periph_M03_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => ps8_0_axi_periph_M03_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => ps8_0_axi_periph_M03_AXI_WVALID
    );
axis_clock_converter_0: component MercuryXU1_axis_clock_converter_0_0
     port map (
      m_axis_aclk => zynq_ultra_ps_e_0_pl_clk3,
      m_axis_aresetn => proc_sys_reset_300_peripheral_aresetn(0),
      m_axis_tdata(31 downto 0) => axis_clock_converter_0_M_AXIS_TDATA(31 downto 0),
      m_axis_tlast => axis_clock_converter_0_M_AXIS_TLAST,
      m_axis_tready => axis_clock_converter_0_M_AXIS_TREADY,
      m_axis_tvalid => axis_clock_converter_0_M_AXIS_TVALID,
      s_axis_aclk => aclk_0_1,
      s_axis_aresetn => aresetn_0_1(0),
      s_axis_tdata(31 downto 0) => axis_subset_converter_0_M_AXIS_TDATA(31 downto 0),
      s_axis_tlast => axis_subset_converter_0_M_AXIS_TLAST,
      s_axis_tready => axis_subset_converter_0_M_AXIS_TREADY,
      s_axis_tvalid => axis_subset_converter_0_M_AXIS_TVALID
    );
axis_clock_converter_1: component MercuryXU1_axis_clock_converter_0_1
     port map (
      m_axis_aclk => zynq_ultra_ps_e_0_pl_clk3,
      m_axis_aresetn => proc_sys_reset_300_peripheral_aresetn(0),
      m_axis_tdata(31 downto 0) => axis_clock_converter_1_M_AXIS_TDATA(31 downto 0),
      m_axis_tlast => axis_clock_converter_1_M_AXIS_TLAST,
      m_axis_tready => axis_clock_converter_1_M_AXIS_TREADY,
      m_axis_tvalid => axis_clock_converter_1_M_AXIS_TVALID,
      s_axis_aclk => aclk_0_1,
      s_axis_aresetn => aresetn_0_1(0),
      s_axis_tdata(31 downto 0) => tlast_generator_1_m_axis_TDATA(31 downto 0),
      s_axis_tlast => tlast_generator_1_m_axis_TLAST,
      s_axis_tready => tlast_generator_1_m_axis_TREADY,
      s_axis_tvalid => tlast_generator_1_m_axis_TVALID
    );
axis_data_fifo_0: component MercuryXU1_axis_data_fifo_1_0
     port map (
      m_axis_tdata(31 downto 0) => axis_data_fifo_2_M_AXIS_TDATA(31 downto 0),
      m_axis_tlast => axis_data_fifo_2_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_2_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_2_M_AXIS_TVALID,
      s_axis_aclk => zynq_ultra_ps_e_0_pl_clk3,
      s_axis_aresetn => proc_sys_reset_300_peripheral_aresetn(0),
      s_axis_tdata(31 downto 0) => axis_clock_converter_0_M_AXIS_TDATA(31 downto 0),
      s_axis_tlast => axis_clock_converter_0_M_AXIS_TLAST,
      s_axis_tready => axis_clock_converter_0_M_AXIS_TREADY,
      s_axis_tvalid => axis_clock_converter_0_M_AXIS_TVALID
    );
axis_data_fifo_1: component MercuryXU1_axis_data_fifo_0_0
     port map (
      m_axis_tdata(31 downto 0) => axis_data_fifo_0_M_AXIS_TDATA(31 downto 0),
      m_axis_tlast => axis_data_fifo_0_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_0_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_0_M_AXIS_TVALID,
      s_axis_aclk => zynq_ultra_ps_e_0_pl_clk3,
      s_axis_aresetn => proc_sys_reset_300_peripheral_aresetn(0),
      s_axis_tdata(31 downto 0) => axis_clock_converter_1_M_AXIS_TDATA(31 downto 0),
      s_axis_tlast => axis_clock_converter_1_M_AXIS_TLAST,
      s_axis_tready => axis_clock_converter_1_M_AXIS_TREADY,
      s_axis_tvalid => axis_clock_converter_1_M_AXIS_TVALID
    );
axis_interconnect_0: entity work.MercuryXU1_axis_interconnect_0_0
     port map (
      ACLK => zynq_ultra_ps_e_0_pl_clk3,
      ARESETN => proc_sys_reset_300_peripheral_aresetn(0),
      M00_AXIS_ACLK => zynq_ultra_ps_e_0_pl_clk3,
      M00_AXIS_ARESETN => proc_sys_reset_300_peripheral_aresetn(0),
      M00_AXIS_tdata(31 downto 0) => axis_interconnect_0_M00_AXIS_TDATA(31 downto 0),
      M00_AXIS_tkeep(3 downto 0) => axis_interconnect_0_M00_AXIS_TKEEP(3 downto 0),
      M00_AXIS_tlast(0) => axis_interconnect_0_M00_AXIS_TLAST(0),
      M00_AXIS_tready(0) => axis_interconnect_0_M00_AXIS_TREADY,
      M00_AXIS_tvalid(0) => axis_interconnect_0_M00_AXIS_TVALID(0),
      S00_ARB_REQ_SUPPRESS => xlslice_0_Dout(0),
      S00_AXIS_ACLK => zynq_ultra_ps_e_0_pl_clk3,
      S00_AXIS_ARESETN => proc_sys_reset_300_peripheral_aresetn(0),
      S00_AXIS_tdata(31 downto 0) => axi_dma_0_M_AXIS_MM2S_TDATA(31 downto 0),
      S00_AXIS_tkeep(3 downto 0) => axi_dma_0_M_AXIS_MM2S_TKEEP(3 downto 0),
      S00_AXIS_tlast => axi_dma_0_M_AXIS_MM2S_TLAST,
      S00_AXIS_tready => axi_dma_0_M_AXIS_MM2S_TREADY,
      S00_AXIS_tvalid => axi_dma_0_M_AXIS_MM2S_TVALID,
      S01_ARB_REQ_SUPPRESS => xlslice_1_Dout(0),
      S01_AXIS_ACLK => zynq_ultra_ps_e_0_pl_clk3,
      S01_AXIS_ARESETN => proc_sys_reset_300_peripheral_aresetn(0),
      S01_AXIS_tdata(31 downto 0) => axis_data_fifo_2_M_AXIS_TDATA(31 downto 0),
      S01_AXIS_tlast => axis_data_fifo_2_M_AXIS_TLAST,
      S01_AXIS_tready => axis_data_fifo_2_M_AXIS_TREADY,
      S01_AXIS_tvalid => axis_data_fifo_2_M_AXIS_TVALID
    );
concat_trigger: component MercuryXU1_xlconcat_0_1
     port map (
      In0(0) => tlast_generator_0_trigger_detected,
      In1(0) => tlast_generator_1_trigger_detected,
      In10(0) => xlconstant_0_dout(0),
      In11(0) => xlconstant_0_dout(0),
      In12(0) => xlconstant_0_dout(0),
      In13(0) => xlconstant_0_dout(0),
      In14(0) => xlconstant_0_dout(0),
      In15(0) => xlconstant_0_dout(0),
      In16(0) => xlconstant_0_dout(0),
      In17(0) => xlconstant_0_dout(0),
      In18(0) => xlconstant_0_dout(0),
      In19(0) => xlconstant_0_dout(0),
      In2(0) => xlconstant_0_dout(0),
      In3(0) => xlconstant_0_dout(0),
      In4(0) => xlconstant_0_dout(0),
      In5(0) => xlconstant_0_dout(0),
      In6(0) => xlconstant_0_dout(0),
      In7(0) => xlconstant_0_dout(0),
      In8(0) => xlconstant_0_dout(0),
      In9(0) => xlconstant_0_dout(0),
      dout(19 downto 0) => xlconcat_0_dout(19 downto 0)
    );
event_controller_0: component MercuryXU1_event_controller_0_1
     port map (
      clk => zynq_ultra_ps_e_0_pl_clk0,
      num_packets_per_event(31 downto 0) => axi_gpio_packet_number_gpio_io_o(31 downto 0),
      packet_counter(31 downto 0) => event_controller_0_packet_counter(31 downto 0),
      rst_n => proc_sys_reset_0_peripheral_aresetn(0),
      trigger(19 downto 0) => xlconcat_0_dout(19 downto 0),
      trigger_enable => event_controller_0_triger_enable
    );
proc_sys_reset_100: component MercuryXU1_proc_sys_reset_0_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_proc_sys_reset_100_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => zynq_ultra_ps_e_0_pl_resetn0,
      interconnect_aresetn(0) => proc_sys_reset_100_interconnect_aresetn(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_proc_sys_reset_100_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => proc_sys_reset_0_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_proc_sys_reset_100_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => zynq_ultra_ps_e_0_pl_clk0
    );
proc_sys_reset_300: component MercuryXU1_proc_sys_reset_100_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_proc_sys_reset_300_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => zynq_ultra_ps_e_0_pl_resetn0,
      interconnect_aresetn(0) => NLW_proc_sys_reset_300_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_proc_sys_reset_300_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => proc_sys_reset_300_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_proc_sys_reset_300_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => zynq_ultra_ps_e_0_pl_clk3
    );
proc_sys_reset_62p6: component MercuryXU1_proc_sys_reset_300_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_proc_sys_reset_62p6_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => xlslice_2_Dout(0),
      interconnect_aresetn(0) => NLW_proc_sys_reset_62p6_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_proc_sys_reset_62p6_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => aresetn_0_1(0),
      peripheral_reset(0) => NLW_proc_sys_reset_62p6_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => aclk_0_1
    );
ps8_0_axi_periph: entity work.MercuryXU1_ps8_0_axi_periph_0
     port map (
      ACLK => zynq_ultra_ps_e_0_pl_clk0,
      ARESETN => proc_sys_reset_100_interconnect_aresetn(0),
      M00_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      M00_ARESETN => proc_sys_reset_0_peripheral_aresetn(0),
      M00_AXI_araddr(39 downto 0) => ps8_0_axi_periph_M00_AXI_ARADDR(39 downto 0),
      M00_AXI_arready(0) => ps8_0_axi_periph_M00_AXI_ARREADY,
      M00_AXI_arvalid(0) => ps8_0_axi_periph_M00_AXI_ARVALID(0),
      M00_AXI_awaddr(39 downto 0) => ps8_0_axi_periph_M00_AXI_AWADDR(39 downto 0),
      M00_AXI_awready(0) => ps8_0_axi_periph_M00_AXI_AWREADY,
      M00_AXI_awvalid(0) => ps8_0_axi_periph_M00_AXI_AWVALID(0),
      M00_AXI_bready(0) => ps8_0_axi_periph_M00_AXI_BREADY(0),
      M00_AXI_bresp(1 downto 0) => ps8_0_axi_periph_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid(0) => ps8_0_axi_periph_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => ps8_0_axi_periph_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rready(0) => ps8_0_axi_periph_M00_AXI_RREADY(0),
      M00_AXI_rresp(1 downto 0) => ps8_0_axi_periph_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid(0) => ps8_0_axi_periph_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => ps8_0_axi_periph_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wready(0) => ps8_0_axi_periph_M00_AXI_WREADY,
      M00_AXI_wstrb(3 downto 0) => ps8_0_axi_periph_M00_AXI_WSTRB(3 downto 0),
      M00_AXI_wvalid(0) => ps8_0_axi_periph_M00_AXI_WVALID(0),
      M01_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      M01_ARESETN => proc_sys_reset_0_peripheral_aresetn(0),
      M01_AXI_araddr(39 downto 0) => ps8_0_axi_periph_M01_AXI_ARADDR(39 downto 0),
      M01_AXI_arready => ps8_0_axi_periph_M01_AXI_ARREADY,
      M01_AXI_arvalid => ps8_0_axi_periph_M01_AXI_ARVALID,
      M01_AXI_awaddr(39 downto 0) => ps8_0_axi_periph_M01_AXI_AWADDR(39 downto 0),
      M01_AXI_awready => ps8_0_axi_periph_M01_AXI_AWREADY,
      M01_AXI_awvalid => ps8_0_axi_periph_M01_AXI_AWVALID,
      M01_AXI_bready => ps8_0_axi_periph_M01_AXI_BREADY,
      M01_AXI_bresp(1 downto 0) => ps8_0_axi_periph_M01_AXI_BRESP(1 downto 0),
      M01_AXI_bvalid => ps8_0_axi_periph_M01_AXI_BVALID,
      M01_AXI_rdata(31 downto 0) => ps8_0_axi_periph_M01_AXI_RDATA(31 downto 0),
      M01_AXI_rready => ps8_0_axi_periph_M01_AXI_RREADY,
      M01_AXI_rresp(1 downto 0) => ps8_0_axi_periph_M01_AXI_RRESP(1 downto 0),
      M01_AXI_rvalid => ps8_0_axi_periph_M01_AXI_RVALID,
      M01_AXI_wdata(31 downto 0) => ps8_0_axi_periph_M01_AXI_WDATA(31 downto 0),
      M01_AXI_wready => ps8_0_axi_periph_M01_AXI_WREADY,
      M01_AXI_wstrb(3 downto 0) => ps8_0_axi_periph_M01_AXI_WSTRB(3 downto 0),
      M01_AXI_wvalid => ps8_0_axi_periph_M01_AXI_WVALID,
      M02_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      M02_ARESETN => proc_sys_reset_0_peripheral_aresetn(0),
      M02_AXI_araddr(39 downto 0) => ps8_0_axi_periph_M02_AXI_ARADDR(39 downto 0),
      M02_AXI_arready => ps8_0_axi_periph_M02_AXI_ARREADY,
      M02_AXI_arvalid => ps8_0_axi_periph_M02_AXI_ARVALID,
      M02_AXI_awaddr(39 downto 0) => ps8_0_axi_periph_M02_AXI_AWADDR(39 downto 0),
      M02_AXI_awready => ps8_0_axi_periph_M02_AXI_AWREADY,
      M02_AXI_awvalid => ps8_0_axi_periph_M02_AXI_AWVALID,
      M02_AXI_bready => ps8_0_axi_periph_M02_AXI_BREADY,
      M02_AXI_bresp(1 downto 0) => ps8_0_axi_periph_M02_AXI_BRESP(1 downto 0),
      M02_AXI_bvalid => ps8_0_axi_periph_M02_AXI_BVALID,
      M02_AXI_rdata(31 downto 0) => ps8_0_axi_periph_M02_AXI_RDATA(31 downto 0),
      M02_AXI_rready => ps8_0_axi_periph_M02_AXI_RREADY,
      M02_AXI_rresp(1 downto 0) => ps8_0_axi_periph_M02_AXI_RRESP(1 downto 0),
      M02_AXI_rvalid => ps8_0_axi_periph_M02_AXI_RVALID,
      M02_AXI_wdata(31 downto 0) => ps8_0_axi_periph_M02_AXI_WDATA(31 downto 0),
      M02_AXI_wready => ps8_0_axi_periph_M02_AXI_WREADY,
      M02_AXI_wvalid => ps8_0_axi_periph_M02_AXI_WVALID,
      M03_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      M03_ARESETN => proc_sys_reset_0_peripheral_aresetn(0),
      M03_AXI_araddr(39 downto 0) => ps8_0_axi_periph_M03_AXI_ARADDR(39 downto 0),
      M03_AXI_arready => ps8_0_axi_periph_M03_AXI_ARREADY,
      M03_AXI_arvalid => ps8_0_axi_periph_M03_AXI_ARVALID,
      M03_AXI_awaddr(39 downto 0) => ps8_0_axi_periph_M03_AXI_AWADDR(39 downto 0),
      M03_AXI_awready => ps8_0_axi_periph_M03_AXI_AWREADY,
      M03_AXI_awvalid => ps8_0_axi_periph_M03_AXI_AWVALID,
      M03_AXI_bready => ps8_0_axi_periph_M03_AXI_BREADY,
      M03_AXI_bresp(1 downto 0) => ps8_0_axi_periph_M03_AXI_BRESP(1 downto 0),
      M03_AXI_bvalid => ps8_0_axi_periph_M03_AXI_BVALID,
      M03_AXI_rdata(31 downto 0) => ps8_0_axi_periph_M03_AXI_RDATA(31 downto 0),
      M03_AXI_rready => ps8_0_axi_periph_M03_AXI_RREADY,
      M03_AXI_rresp(1 downto 0) => ps8_0_axi_periph_M03_AXI_RRESP(1 downto 0),
      M03_AXI_rvalid => ps8_0_axi_periph_M03_AXI_RVALID,
      M03_AXI_wdata(31 downto 0) => ps8_0_axi_periph_M03_AXI_WDATA(31 downto 0),
      M03_AXI_wready => ps8_0_axi_periph_M03_AXI_WREADY,
      M03_AXI_wstrb(3 downto 0) => ps8_0_axi_periph_M03_AXI_WSTRB(3 downto 0),
      M03_AXI_wvalid => ps8_0_axi_periph_M03_AXI_WVALID,
      M04_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      M04_ARESETN => proc_sys_reset_0_peripheral_aresetn(0),
      M04_AXI_araddr(39 downto 0) => ps8_0_axi_periph_M04_AXI_ARADDR(39 downto 0),
      M04_AXI_arready => ps8_0_axi_periph_M04_AXI_ARREADY,
      M04_AXI_arvalid => ps8_0_axi_periph_M04_AXI_ARVALID,
      M04_AXI_awaddr(39 downto 0) => ps8_0_axi_periph_M04_AXI_AWADDR(39 downto 0),
      M04_AXI_awready => ps8_0_axi_periph_M04_AXI_AWREADY,
      M04_AXI_awvalid => ps8_0_axi_periph_M04_AXI_AWVALID,
      M04_AXI_bready => ps8_0_axi_periph_M04_AXI_BREADY,
      M04_AXI_bresp(1 downto 0) => ps8_0_axi_periph_M04_AXI_BRESP(1 downto 0),
      M04_AXI_bvalid => ps8_0_axi_periph_M04_AXI_BVALID,
      M04_AXI_rdata(31 downto 0) => ps8_0_axi_periph_M04_AXI_RDATA(31 downto 0),
      M04_AXI_rready => ps8_0_axi_periph_M04_AXI_RREADY,
      M04_AXI_rresp(1 downto 0) => ps8_0_axi_periph_M04_AXI_RRESP(1 downto 0),
      M04_AXI_rvalid => ps8_0_axi_periph_M04_AXI_RVALID,
      M04_AXI_wdata(31 downto 0) => ps8_0_axi_periph_M04_AXI_WDATA(31 downto 0),
      M04_AXI_wready => ps8_0_axi_periph_M04_AXI_WREADY,
      M04_AXI_wstrb(3 downto 0) => ps8_0_axi_periph_M04_AXI_WSTRB(3 downto 0),
      M04_AXI_wvalid => ps8_0_axi_periph_M04_AXI_WVALID,
      M05_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      M05_ARESETN => proc_sys_reset_0_peripheral_aresetn(0),
      M05_AXI_araddr(39 downto 0) => ps8_0_axi_periph_M05_AXI_ARADDR(39 downto 0),
      M05_AXI_arready => ps8_0_axi_periph_M05_AXI_ARREADY,
      M05_AXI_arvalid => ps8_0_axi_periph_M05_AXI_ARVALID,
      M05_AXI_awaddr(39 downto 0) => ps8_0_axi_periph_M05_AXI_AWADDR(39 downto 0),
      M05_AXI_awready => ps8_0_axi_periph_M05_AXI_AWREADY,
      M05_AXI_awvalid => ps8_0_axi_periph_M05_AXI_AWVALID,
      M05_AXI_bready => ps8_0_axi_periph_M05_AXI_BREADY,
      M05_AXI_bresp(1 downto 0) => ps8_0_axi_periph_M05_AXI_BRESP(1 downto 0),
      M05_AXI_bvalid => ps8_0_axi_periph_M05_AXI_BVALID,
      M05_AXI_rdata(31 downto 0) => ps8_0_axi_periph_M05_AXI_RDATA(31 downto 0),
      M05_AXI_rready => ps8_0_axi_periph_M05_AXI_RREADY,
      M05_AXI_rresp(1 downto 0) => ps8_0_axi_periph_M05_AXI_RRESP(1 downto 0),
      M05_AXI_rvalid => ps8_0_axi_periph_M05_AXI_RVALID,
      M05_AXI_wdata(31 downto 0) => ps8_0_axi_periph_M05_AXI_WDATA(31 downto 0),
      M05_AXI_wready => ps8_0_axi_periph_M05_AXI_WREADY,
      M05_AXI_wvalid => ps8_0_axi_periph_M05_AXI_WVALID,
      M06_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      M06_ARESETN => proc_sys_reset_0_peripheral_aresetn(0),
      M06_AXI_araddr(39 downto 0) => ps8_0_axi_periph_M06_AXI_ARADDR(39 downto 0),
      M06_AXI_arready => ps8_0_axi_periph_M06_AXI_ARREADY,
      M06_AXI_arvalid => ps8_0_axi_periph_M06_AXI_ARVALID,
      M06_AXI_awaddr(39 downto 0) => ps8_0_axi_periph_M06_AXI_AWADDR(39 downto 0),
      M06_AXI_awready => ps8_0_axi_periph_M06_AXI_AWREADY,
      M06_AXI_awvalid => ps8_0_axi_periph_M06_AXI_AWVALID,
      M06_AXI_bready => ps8_0_axi_periph_M06_AXI_BREADY,
      M06_AXI_bresp(1 downto 0) => ps8_0_axi_periph_M06_AXI_BRESP(1 downto 0),
      M06_AXI_bvalid => ps8_0_axi_periph_M06_AXI_BVALID,
      M06_AXI_rdata(31 downto 0) => ps8_0_axi_periph_M06_AXI_RDATA(31 downto 0),
      M06_AXI_rready => ps8_0_axi_periph_M06_AXI_RREADY,
      M06_AXI_rresp(1 downto 0) => ps8_0_axi_periph_M06_AXI_RRESP(1 downto 0),
      M06_AXI_rvalid => ps8_0_axi_periph_M06_AXI_RVALID,
      M06_AXI_wdata(31 downto 0) => ps8_0_axi_periph_M06_AXI_WDATA(31 downto 0),
      M06_AXI_wready => ps8_0_axi_periph_M06_AXI_WREADY,
      M06_AXI_wstrb(3 downto 0) => ps8_0_axi_periph_M06_AXI_WSTRB(3 downto 0),
      M06_AXI_wvalid => ps8_0_axi_periph_M06_AXI_WVALID,
      M07_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      M07_ARESETN => proc_sys_reset_0_peripheral_aresetn(0),
      M07_AXI_araddr(39 downto 0) => ps8_0_axi_periph_M07_AXI_ARADDR(39 downto 0),
      M07_AXI_arready => ps8_0_axi_periph_M07_AXI_ARREADY,
      M07_AXI_arvalid => ps8_0_axi_periph_M07_AXI_ARVALID,
      M07_AXI_awaddr(39 downto 0) => ps8_0_axi_periph_M07_AXI_AWADDR(39 downto 0),
      M07_AXI_awready => ps8_0_axi_periph_M07_AXI_AWREADY,
      M07_AXI_awvalid => ps8_0_axi_periph_M07_AXI_AWVALID,
      M07_AXI_bready => ps8_0_axi_periph_M07_AXI_BREADY,
      M07_AXI_bresp(1 downto 0) => ps8_0_axi_periph_M07_AXI_BRESP(1 downto 0),
      M07_AXI_bvalid => ps8_0_axi_periph_M07_AXI_BVALID,
      M07_AXI_rdata(31 downto 0) => ps8_0_axi_periph_M07_AXI_RDATA(31 downto 0),
      M07_AXI_rready => ps8_0_axi_periph_M07_AXI_RREADY,
      M07_AXI_rresp(1 downto 0) => ps8_0_axi_periph_M07_AXI_RRESP(1 downto 0),
      M07_AXI_rvalid => ps8_0_axi_periph_M07_AXI_RVALID,
      M07_AXI_wdata(31 downto 0) => ps8_0_axi_periph_M07_AXI_WDATA(31 downto 0),
      M07_AXI_wready => ps8_0_axi_periph_M07_AXI_WREADY,
      M07_AXI_wstrb(3 downto 0) => ps8_0_axi_periph_M07_AXI_WSTRB(3 downto 0),
      M07_AXI_wvalid => ps8_0_axi_periph_M07_AXI_WVALID,
      S00_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      S00_ARESETN => proc_sys_reset_0_peripheral_aresetn(0),
      S00_AXI_araddr(39 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARADDR(39 downto 0),
      S00_AXI_arburst(1 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARCACHE(3 downto 0),
      S00_AXI_arid(15 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARID(15 downto 0),
      S00_AXI_arlen(7 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARLEN(7 downto 0),
      S00_AXI_arlock(0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARLOCK,
      S00_AXI_arprot(2 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARQOS(3 downto 0),
      S00_AXI_arready => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARREADY,
      S00_AXI_arsize(2 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARSIZE(2 downto 0),
      S00_AXI_arvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARVALID,
      S00_AXI_awaddr(39 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWADDR(39 downto 0),
      S00_AXI_awburst(1 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWCACHE(3 downto 0),
      S00_AXI_awid(15 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWID(15 downto 0),
      S00_AXI_awlen(7 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWLEN(7 downto 0),
      S00_AXI_awlock(0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWLOCK,
      S00_AXI_awprot(2 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWQOS(3 downto 0),
      S00_AXI_awready => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWREADY,
      S00_AXI_awsize(2 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWSIZE(2 downto 0),
      S00_AXI_awvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWVALID,
      S00_AXI_bid(15 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BID(15 downto 0),
      S00_AXI_bready => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BREADY,
      S00_AXI_bresp(1 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BRESP(1 downto 0),
      S00_AXI_bvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BVALID,
      S00_AXI_rdata(31 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RDATA(31 downto 0),
      S00_AXI_rid(15 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RID(15 downto 0),
      S00_AXI_rlast => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RLAST,
      S00_AXI_rready => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RREADY,
      S00_AXI_rresp(1 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RRESP(1 downto 0),
      S00_AXI_rvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RVALID,
      S00_AXI_wdata(31 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WDATA(31 downto 0),
      S00_AXI_wlast => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WLAST,
      S00_AXI_wready => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WREADY,
      S00_AXI_wstrb(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WSTRB(3 downto 0),
      S00_AXI_wvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WVALID
    );
smartconnect_0: component MercuryXU1_smartconnect_0_0
     port map (
      M00_AXI_araddr(48 downto 0) => smartconnect_0_M00_AXI_ARADDR(48 downto 0),
      M00_AXI_arburst(1 downto 0) => smartconnect_0_M00_AXI_ARBURST(1 downto 0),
      M00_AXI_arcache(3 downto 0) => smartconnect_0_M00_AXI_ARCACHE(3 downto 0),
      M00_AXI_arlen(7 downto 0) => smartconnect_0_M00_AXI_ARLEN(7 downto 0),
      M00_AXI_arlock(0) => smartconnect_0_M00_AXI_ARLOCK(0),
      M00_AXI_arprot(2 downto 0) => smartconnect_0_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arqos(3 downto 0) => smartconnect_0_M00_AXI_ARQOS(3 downto 0),
      M00_AXI_arready => smartconnect_0_M00_AXI_ARREADY,
      M00_AXI_arsize(2 downto 0) => smartconnect_0_M00_AXI_ARSIZE(2 downto 0),
      M00_AXI_arvalid => smartconnect_0_M00_AXI_ARVALID,
      M00_AXI_awaddr(48 downto 0) => smartconnect_0_M00_AXI_AWADDR(48 downto 0),
      M00_AXI_awburst(1 downto 0) => smartconnect_0_M00_AXI_AWBURST(1 downto 0),
      M00_AXI_awcache(3 downto 0) => smartconnect_0_M00_AXI_AWCACHE(3 downto 0),
      M00_AXI_awlen(7 downto 0) => smartconnect_0_M00_AXI_AWLEN(7 downto 0),
      M00_AXI_awlock(0) => smartconnect_0_M00_AXI_AWLOCK(0),
      M00_AXI_awprot(2 downto 0) => smartconnect_0_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awqos(3 downto 0) => smartconnect_0_M00_AXI_AWQOS(3 downto 0),
      M00_AXI_awready => smartconnect_0_M00_AXI_AWREADY,
      M00_AXI_awsize(2 downto 0) => smartconnect_0_M00_AXI_AWSIZE(2 downto 0),
      M00_AXI_awvalid => smartconnect_0_M00_AXI_AWVALID,
      M00_AXI_bready => smartconnect_0_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => smartconnect_0_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => smartconnect_0_M00_AXI_BVALID,
      M00_AXI_rdata(127 downto 0) => smartconnect_0_M00_AXI_RDATA(127 downto 0),
      M00_AXI_rlast => smartconnect_0_M00_AXI_RLAST,
      M00_AXI_rready => smartconnect_0_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => smartconnect_0_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => smartconnect_0_M00_AXI_RVALID,
      M00_AXI_wdata(127 downto 0) => smartconnect_0_M00_AXI_WDATA(127 downto 0),
      M00_AXI_wlast => smartconnect_0_M00_AXI_WLAST,
      M00_AXI_wready => smartconnect_0_M00_AXI_WREADY,
      M00_AXI_wstrb(15 downto 0) => smartconnect_0_M00_AXI_WSTRB(15 downto 0),
      M00_AXI_wvalid => smartconnect_0_M00_AXI_WVALID,
      S00_AXI_araddr(31 downto 0) => axi_dma_0_M_AXI_SG_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => axi_dma_0_M_AXI_SG_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => axi_dma_0_M_AXI_SG_ARCACHE(3 downto 0),
      S00_AXI_arlen(7 downto 0) => axi_dma_0_M_AXI_SG_ARLEN(7 downto 0),
      S00_AXI_arlock(0) => '0',
      S00_AXI_arprot(2 downto 0) => axi_dma_0_M_AXI_SG_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => B"0000",
      S00_AXI_arready => axi_dma_0_M_AXI_SG_ARREADY,
      S00_AXI_arsize(2 downto 0) => axi_dma_0_M_AXI_SG_ARSIZE(2 downto 0),
      S00_AXI_arvalid => axi_dma_0_M_AXI_SG_ARVALID,
      S00_AXI_awaddr(31 downto 0) => axi_dma_0_M_AXI_SG_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => axi_dma_0_M_AXI_SG_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => axi_dma_0_M_AXI_SG_AWCACHE(3 downto 0),
      S00_AXI_awlen(7 downto 0) => axi_dma_0_M_AXI_SG_AWLEN(7 downto 0),
      S00_AXI_awlock(0) => '0',
      S00_AXI_awprot(2 downto 0) => axi_dma_0_M_AXI_SG_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => B"0000",
      S00_AXI_awready => axi_dma_0_M_AXI_SG_AWREADY,
      S00_AXI_awsize(2 downto 0) => axi_dma_0_M_AXI_SG_AWSIZE(2 downto 0),
      S00_AXI_awvalid => axi_dma_0_M_AXI_SG_AWVALID,
      S00_AXI_bready => axi_dma_0_M_AXI_SG_BREADY,
      S00_AXI_bresp(1 downto 0) => axi_dma_0_M_AXI_SG_BRESP(1 downto 0),
      S00_AXI_bvalid => axi_dma_0_M_AXI_SG_BVALID,
      S00_AXI_rdata(31 downto 0) => axi_dma_0_M_AXI_SG_RDATA(31 downto 0),
      S00_AXI_rlast => axi_dma_0_M_AXI_SG_RLAST,
      S00_AXI_rready => axi_dma_0_M_AXI_SG_RREADY,
      S00_AXI_rresp(1 downto 0) => axi_dma_0_M_AXI_SG_RRESP(1 downto 0),
      S00_AXI_rvalid => axi_dma_0_M_AXI_SG_RVALID,
      S00_AXI_wdata(31 downto 0) => axi_dma_0_M_AXI_SG_WDATA(31 downto 0),
      S00_AXI_wlast => axi_dma_0_M_AXI_SG_WLAST,
      S00_AXI_wready => axi_dma_0_M_AXI_SG_WREADY,
      S00_AXI_wstrb(3 downto 0) => axi_dma_0_M_AXI_SG_WSTRB(3 downto 0),
      S00_AXI_wvalid => axi_dma_0_M_AXI_SG_WVALID,
      S01_AXI_araddr(31 downto 0) => axi_dma_0_M_AXI_MM2S_ARADDR(31 downto 0),
      S01_AXI_arburst(1 downto 0) => axi_dma_0_M_AXI_MM2S_ARBURST(1 downto 0),
      S01_AXI_arcache(3 downto 0) => axi_dma_0_M_AXI_MM2S_ARCACHE(3 downto 0),
      S01_AXI_arlen(7 downto 0) => axi_dma_0_M_AXI_MM2S_ARLEN(7 downto 0),
      S01_AXI_arlock(0) => '0',
      S01_AXI_arprot(2 downto 0) => axi_dma_0_M_AXI_MM2S_ARPROT(2 downto 0),
      S01_AXI_arqos(3 downto 0) => B"0000",
      S01_AXI_arready => axi_dma_0_M_AXI_MM2S_ARREADY,
      S01_AXI_arsize(2 downto 0) => axi_dma_0_M_AXI_MM2S_ARSIZE(2 downto 0),
      S01_AXI_arvalid => axi_dma_0_M_AXI_MM2S_ARVALID,
      S01_AXI_rdata(31 downto 0) => axi_dma_0_M_AXI_MM2S_RDATA(31 downto 0),
      S01_AXI_rlast => axi_dma_0_M_AXI_MM2S_RLAST,
      S01_AXI_rready => axi_dma_0_M_AXI_MM2S_RREADY,
      S01_AXI_rresp(1 downto 0) => axi_dma_0_M_AXI_MM2S_RRESP(1 downto 0),
      S01_AXI_rvalid => axi_dma_0_M_AXI_MM2S_RVALID,
      S02_AXI_awaddr(31 downto 0) => axi_dma_0_M_AXI_S2MM_AWADDR(31 downto 0),
      S02_AXI_awburst(1 downto 0) => axi_dma_0_M_AXI_S2MM_AWBURST(1 downto 0),
      S02_AXI_awcache(3 downto 0) => axi_dma_0_M_AXI_S2MM_AWCACHE(3 downto 0),
      S02_AXI_awlen(7 downto 0) => axi_dma_0_M_AXI_S2MM_AWLEN(7 downto 0),
      S02_AXI_awlock(0) => '0',
      S02_AXI_awprot(2 downto 0) => axi_dma_0_M_AXI_S2MM_AWPROT(2 downto 0),
      S02_AXI_awqos(3 downto 0) => B"0000",
      S02_AXI_awready => axi_dma_0_M_AXI_S2MM_AWREADY,
      S02_AXI_awsize(2 downto 0) => axi_dma_0_M_AXI_S2MM_AWSIZE(2 downto 0),
      S02_AXI_awvalid => axi_dma_0_M_AXI_S2MM_AWVALID,
      S02_AXI_bready => axi_dma_0_M_AXI_S2MM_BREADY,
      S02_AXI_bresp(1 downto 0) => axi_dma_0_M_AXI_S2MM_BRESP(1 downto 0),
      S02_AXI_bvalid => axi_dma_0_M_AXI_S2MM_BVALID,
      S02_AXI_wdata(31 downto 0) => axi_dma_0_M_AXI_S2MM_WDATA(31 downto 0),
      S02_AXI_wlast => axi_dma_0_M_AXI_S2MM_WLAST,
      S02_AXI_wready => axi_dma_0_M_AXI_S2MM_WREADY,
      S02_AXI_wstrb(3 downto 0) => axi_dma_0_M_AXI_S2MM_WSTRB(3 downto 0),
      S02_AXI_wvalid => axi_dma_0_M_AXI_S2MM_WVALID,
      aclk => zynq_ultra_ps_e_0_pl_clk3,
      aresetn => proc_sys_reset_300_peripheral_aresetn(0)
    );
smartconnect_1: component MercuryXU1_smartconnect_0_1
     port map (
      M00_AXI_araddr(48 downto 0) => smartconnect_1_M00_AXI_ARADDR(48 downto 0),
      M00_AXI_arburst(1 downto 0) => smartconnect_1_M00_AXI_ARBURST(1 downto 0),
      M00_AXI_arcache(3 downto 0) => smartconnect_1_M00_AXI_ARCACHE(3 downto 0),
      M00_AXI_arlen(7 downto 0) => smartconnect_1_M00_AXI_ARLEN(7 downto 0),
      M00_AXI_arlock(0) => smartconnect_1_M00_AXI_ARLOCK(0),
      M00_AXI_arprot(2 downto 0) => smartconnect_1_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arqos(3 downto 0) => smartconnect_1_M00_AXI_ARQOS(3 downto 0),
      M00_AXI_arready => smartconnect_1_M00_AXI_ARREADY,
      M00_AXI_arsize(2 downto 0) => smartconnect_1_M00_AXI_ARSIZE(2 downto 0),
      M00_AXI_arvalid => smartconnect_1_M00_AXI_ARVALID,
      M00_AXI_awaddr(48 downto 0) => smartconnect_1_M00_AXI_AWADDR(48 downto 0),
      M00_AXI_awburst(1 downto 0) => smartconnect_1_M00_AXI_AWBURST(1 downto 0),
      M00_AXI_awcache(3 downto 0) => smartconnect_1_M00_AXI_AWCACHE(3 downto 0),
      M00_AXI_awlen(7 downto 0) => smartconnect_1_M00_AXI_AWLEN(7 downto 0),
      M00_AXI_awlock(0) => smartconnect_1_M00_AXI_AWLOCK(0),
      M00_AXI_awprot(2 downto 0) => smartconnect_1_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awqos(3 downto 0) => smartconnect_1_M00_AXI_AWQOS(3 downto 0),
      M00_AXI_awready => smartconnect_1_M00_AXI_AWREADY,
      M00_AXI_awsize(2 downto 0) => smartconnect_1_M00_AXI_AWSIZE(2 downto 0),
      M00_AXI_awvalid => smartconnect_1_M00_AXI_AWVALID,
      M00_AXI_bready => smartconnect_1_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => smartconnect_1_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => smartconnect_1_M00_AXI_BVALID,
      M00_AXI_rdata(127 downto 0) => smartconnect_1_M00_AXI_RDATA(127 downto 0),
      M00_AXI_rlast => smartconnect_1_M00_AXI_RLAST,
      M00_AXI_rready => smartconnect_1_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => smartconnect_1_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => smartconnect_1_M00_AXI_RVALID,
      M00_AXI_wdata(127 downto 0) => smartconnect_1_M00_AXI_WDATA(127 downto 0),
      M00_AXI_wlast => smartconnect_1_M00_AXI_WLAST,
      M00_AXI_wready => smartconnect_1_M00_AXI_WREADY,
      M00_AXI_wstrb(15 downto 0) => smartconnect_1_M00_AXI_WSTRB(15 downto 0),
      M00_AXI_wvalid => smartconnect_1_M00_AXI_WVALID,
      S00_AXI_araddr(31 downto 0) => axi_dma_1_M_AXI_SG_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => axi_dma_1_M_AXI_SG_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => axi_dma_1_M_AXI_SG_ARCACHE(3 downto 0),
      S00_AXI_arlen(7 downto 0) => axi_dma_1_M_AXI_SG_ARLEN(7 downto 0),
      S00_AXI_arlock(0) => '0',
      S00_AXI_arprot(2 downto 0) => axi_dma_1_M_AXI_SG_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => B"0000",
      S00_AXI_arready => axi_dma_1_M_AXI_SG_ARREADY,
      S00_AXI_arsize(2 downto 0) => axi_dma_1_M_AXI_SG_ARSIZE(2 downto 0),
      S00_AXI_arvalid => axi_dma_1_M_AXI_SG_ARVALID,
      S00_AXI_awaddr(31 downto 0) => axi_dma_1_M_AXI_SG_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => axi_dma_1_M_AXI_SG_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => axi_dma_1_M_AXI_SG_AWCACHE(3 downto 0),
      S00_AXI_awlen(7 downto 0) => axi_dma_1_M_AXI_SG_AWLEN(7 downto 0),
      S00_AXI_awlock(0) => '0',
      S00_AXI_awprot(2 downto 0) => axi_dma_1_M_AXI_SG_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => B"0000",
      S00_AXI_awready => axi_dma_1_M_AXI_SG_AWREADY,
      S00_AXI_awsize(2 downto 0) => axi_dma_1_M_AXI_SG_AWSIZE(2 downto 0),
      S00_AXI_awvalid => axi_dma_1_M_AXI_SG_AWVALID,
      S00_AXI_bready => axi_dma_1_M_AXI_SG_BREADY,
      S00_AXI_bresp(1 downto 0) => axi_dma_1_M_AXI_SG_BRESP(1 downto 0),
      S00_AXI_bvalid => axi_dma_1_M_AXI_SG_BVALID,
      S00_AXI_rdata(31 downto 0) => axi_dma_1_M_AXI_SG_RDATA(31 downto 0),
      S00_AXI_rlast => axi_dma_1_M_AXI_SG_RLAST,
      S00_AXI_rready => axi_dma_1_M_AXI_SG_RREADY,
      S00_AXI_rresp(1 downto 0) => axi_dma_1_M_AXI_SG_RRESP(1 downto 0),
      S00_AXI_rvalid => axi_dma_1_M_AXI_SG_RVALID,
      S00_AXI_wdata(31 downto 0) => axi_dma_1_M_AXI_SG_WDATA(31 downto 0),
      S00_AXI_wlast => axi_dma_1_M_AXI_SG_WLAST,
      S00_AXI_wready => axi_dma_1_M_AXI_SG_WREADY,
      S00_AXI_wstrb(3 downto 0) => axi_dma_1_M_AXI_SG_WSTRB(3 downto 0),
      S00_AXI_wvalid => axi_dma_1_M_AXI_SG_WVALID,
      S01_AXI_awaddr(31 downto 0) => axi_dma_1_M_AXI_S2MM_AWADDR(31 downto 0),
      S01_AXI_awburst(1 downto 0) => axi_dma_1_M_AXI_S2MM_AWBURST(1 downto 0),
      S01_AXI_awcache(3 downto 0) => axi_dma_1_M_AXI_S2MM_AWCACHE(3 downto 0),
      S01_AXI_awlen(7 downto 0) => axi_dma_1_M_AXI_S2MM_AWLEN(7 downto 0),
      S01_AXI_awlock(0) => '0',
      S01_AXI_awprot(2 downto 0) => axi_dma_1_M_AXI_S2MM_AWPROT(2 downto 0),
      S01_AXI_awqos(3 downto 0) => B"0000",
      S01_AXI_awready => axi_dma_1_M_AXI_S2MM_AWREADY,
      S01_AXI_awsize(2 downto 0) => axi_dma_1_M_AXI_S2MM_AWSIZE(2 downto 0),
      S01_AXI_awvalid => axi_dma_1_M_AXI_S2MM_AWVALID,
      S01_AXI_bready => axi_dma_1_M_AXI_S2MM_BREADY,
      S01_AXI_bresp(1 downto 0) => axi_dma_1_M_AXI_S2MM_BRESP(1 downto 0),
      S01_AXI_bvalid => axi_dma_1_M_AXI_S2MM_BVALID,
      S01_AXI_wdata(31 downto 0) => axi_dma_1_M_AXI_S2MM_WDATA(31 downto 0),
      S01_AXI_wlast => axi_dma_1_M_AXI_S2MM_WLAST,
      S01_AXI_wready => axi_dma_1_M_AXI_S2MM_WREADY,
      S01_AXI_wstrb(3 downto 0) => axi_dma_1_M_AXI_S2MM_WSTRB(3 downto 0),
      S01_AXI_wvalid => axi_dma_1_M_AXI_S2MM_WVALID,
      aclk => zynq_ultra_ps_e_0_pl_clk3,
      aresetn => proc_sys_reset_300_peripheral_aresetn(0)
    );
stream_multiplexer_0: component MercuryXU1_stream_multiplexer_0_0
     port map (
      adc0_sample(31 downto 0) => adc0_sample_0_1(31 downto 0),
      adc10_sample(31 downto 0) => adc10_sample_0_1(31 downto 0),
      adc11_sample(31 downto 0) => adc11_sample_0_1(31 downto 0),
      adc12_sample(31 downto 0) => adc12_sample_0_1(31 downto 0),
      adc13_sample(31 downto 0) => adc13_sample_0_1(31 downto 0),
      adc14_sample(31 downto 0) => adc14_sample_0_1(31 downto 0),
      adc15_sample(31 downto 0) => adc15_sample_0_1(31 downto 0),
      adc16_sample(31 downto 0) => adc16_sample_0_1(31 downto 0),
      adc17_sample(31 downto 0) => adc17_sample_0_1(31 downto 0),
      adc18_sample(31 downto 0) => adc18_sample_0_1(31 downto 0),
      adc19_sample(31 downto 0) => adc19_sample_0_1(31 downto 0),
      adc1_sample(31 downto 0) => adc1_sample_1(31 downto 0),
      adc2_sample(31 downto 0) => adc2_sample_1(31 downto 0),
      adc3_sample(31 downto 0) => adc3_sample_0_1(31 downto 0),
      adc4_sample(31 downto 0) => adc4_sample_0_1(31 downto 0),
      adc5_sample(31 downto 0) => adc5_sample_0_1(31 downto 0),
      adc6_sample(31 downto 0) => adc6_sample_0_1(31 downto 0),
      adc7_sample(31 downto 0) => adc7_sample_0_1(31 downto 0),
      adc8_sample(31 downto 0) => adc8_sample_0_1(31 downto 0),
      adc9_sample(31 downto 0) => adc9_sample_0_1(31 downto 0),
      adc_sample_selected_0(31 downto 0) => s_axis_tdata_0_1(31 downto 0),
      adc_sample_selected_1(31 downto 0) => stream_multiplexer_0_adc_sample_selected_1(31 downto 0),
      adc_sample_valid(19 downto 0) => adc_sample_valid_0_1(19 downto 0),
      adc_sample_valid_selected_0 => s_axis_tvalid_0_1,
      adc_sample_valid_selected_1 => stream_multiplexer_0_adc_sample_valid_selected_1,
      clk_sample => aclk_0_1,
      gpio(19 downto 0) => axi_gpio_suppres_gpio_io_o(19 downto 0)
    );
system_ila_50: component MercuryXU1_system_ila_0_0
     port map (
      SLOT_0_AXIS_tdata(31 downto 0) => axis_interconnect_0_M00_AXIS_TDATA(31 downto 0),
      SLOT_0_AXIS_tkeep(3 downto 0) => axis_interconnect_0_M00_AXIS_TKEEP(3 downto 0),
      SLOT_0_AXIS_tlast => axis_interconnect_0_M00_AXIS_TLAST(0),
      SLOT_0_AXIS_tready => axis_interconnect_0_M00_AXIS_TREADY,
      SLOT_0_AXIS_tvalid => axis_interconnect_0_M00_AXIS_TVALID(0),
      SLOT_1_AXI_araddr(31 downto 0) => axi_dma_0_M_AXI_MM2S_ARADDR(31 downto 0),
      SLOT_1_AXI_arcache(3 downto 0) => axi_dma_0_M_AXI_MM2S_ARCACHE(3 downto 0),
      SLOT_1_AXI_arlen(7 downto 0) => axi_dma_0_M_AXI_MM2S_ARLEN(7 downto 0),
      SLOT_1_AXI_arprot(2 downto 0) => axi_dma_0_M_AXI_MM2S_ARPROT(2 downto 0),
      SLOT_1_AXI_arready => axi_dma_0_M_AXI_MM2S_ARREADY,
      SLOT_1_AXI_arsize(2 downto 0) => axi_dma_0_M_AXI_MM2S_ARSIZE(2 downto 0),
      SLOT_1_AXI_arvalid => axi_dma_0_M_AXI_MM2S_ARVALID,
      SLOT_1_AXI_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      SLOT_1_AXI_awcache(3 downto 0) => B"0011",
      SLOT_1_AXI_awlen(7 downto 0) => B"00000000",
      SLOT_1_AXI_awprot(2 downto 0) => B"000",
      SLOT_1_AXI_awready => '0',
      SLOT_1_AXI_awsize(2 downto 0) => B"010",
      SLOT_1_AXI_awvalid => '0',
      SLOT_1_AXI_bready => '0',
      SLOT_1_AXI_bvalid => '0',
      SLOT_1_AXI_rdata(31 downto 0) => axi_dma_0_M_AXI_MM2S_RDATA(31 downto 0),
      SLOT_1_AXI_rlast => axi_dma_0_M_AXI_MM2S_RLAST,
      SLOT_1_AXI_rready => axi_dma_0_M_AXI_MM2S_RREADY,
      SLOT_1_AXI_rresp(1 downto 0) => axi_dma_0_M_AXI_MM2S_RRESP(1 downto 0),
      SLOT_1_AXI_rvalid => axi_dma_0_M_AXI_MM2S_RVALID,
      SLOT_1_AXI_wdata(31 downto 0) => B"00000000000000000000000000000000",
      SLOT_1_AXI_wlast => '0',
      SLOT_1_AXI_wready => '0',
      SLOT_1_AXI_wvalid => '0',
      SLOT_2_AXI_araddr(48 downto 0) => smartconnect_0_M00_AXI_ARADDR(48 downto 0),
      SLOT_2_AXI_arburst(1 downto 0) => smartconnect_0_M00_AXI_ARBURST(1 downto 0),
      SLOT_2_AXI_arcache(3 downto 0) => smartconnect_0_M00_AXI_ARCACHE(3 downto 0),
      SLOT_2_AXI_arlen(7 downto 0) => smartconnect_0_M00_AXI_ARLEN(7 downto 0),
      SLOT_2_AXI_arlock(0) => smartconnect_0_M00_AXI_ARLOCK(0),
      SLOT_2_AXI_arprot(2 downto 0) => smartconnect_0_M00_AXI_ARPROT(2 downto 0),
      SLOT_2_AXI_arqos(3 downto 0) => smartconnect_0_M00_AXI_ARQOS(3 downto 0),
      SLOT_2_AXI_arready => smartconnect_0_M00_AXI_ARREADY,
      SLOT_2_AXI_arsize(2 downto 0) => smartconnect_0_M00_AXI_ARSIZE(2 downto 0),
      SLOT_2_AXI_arvalid => smartconnect_0_M00_AXI_ARVALID,
      SLOT_2_AXI_awaddr(48 downto 0) => smartconnect_0_M00_AXI_AWADDR(48 downto 0),
      SLOT_2_AXI_awburst(1 downto 0) => smartconnect_0_M00_AXI_AWBURST(1 downto 0),
      SLOT_2_AXI_awcache(3 downto 0) => smartconnect_0_M00_AXI_AWCACHE(3 downto 0),
      SLOT_2_AXI_awlen(7 downto 0) => smartconnect_0_M00_AXI_AWLEN(7 downto 0),
      SLOT_2_AXI_awlock(0) => smartconnect_0_M00_AXI_AWLOCK(0),
      SLOT_2_AXI_awprot(2 downto 0) => smartconnect_0_M00_AXI_AWPROT(2 downto 0),
      SLOT_2_AXI_awqos(3 downto 0) => smartconnect_0_M00_AXI_AWQOS(3 downto 0),
      SLOT_2_AXI_awready => smartconnect_0_M00_AXI_AWREADY,
      SLOT_2_AXI_awsize(2 downto 0) => smartconnect_0_M00_AXI_AWSIZE(2 downto 0),
      SLOT_2_AXI_awvalid => smartconnect_0_M00_AXI_AWVALID,
      SLOT_2_AXI_bready => smartconnect_0_M00_AXI_BREADY,
      SLOT_2_AXI_bresp(1 downto 0) => smartconnect_0_M00_AXI_BRESP(1 downto 0),
      SLOT_2_AXI_bvalid => smartconnect_0_M00_AXI_BVALID,
      SLOT_2_AXI_rdata(127 downto 0) => smartconnect_0_M00_AXI_RDATA(127 downto 0),
      SLOT_2_AXI_rlast => smartconnect_0_M00_AXI_RLAST,
      SLOT_2_AXI_rready => smartconnect_0_M00_AXI_RREADY,
      SLOT_2_AXI_rresp(1 downto 0) => smartconnect_0_M00_AXI_RRESP(1 downto 0),
      SLOT_2_AXI_rvalid => smartconnect_0_M00_AXI_RVALID,
      SLOT_2_AXI_wdata(127 downto 0) => smartconnect_0_M00_AXI_WDATA(127 downto 0),
      SLOT_2_AXI_wlast => smartconnect_0_M00_AXI_WLAST,
      SLOT_2_AXI_wready => smartconnect_0_M00_AXI_WREADY,
      SLOT_2_AXI_wstrb(15 downto 0) => smartconnect_0_M00_AXI_WSTRB(15 downto 0),
      SLOT_2_AXI_wvalid => smartconnect_0_M00_AXI_WVALID,
      SLOT_3_AXIS_tdata(31 downto 0) => axi_dma_0_M_AXIS_MM2S_TDATA(31 downto 0),
      SLOT_3_AXIS_tkeep(3 downto 0) => axi_dma_0_M_AXIS_MM2S_TKEEP(3 downto 0),
      SLOT_3_AXIS_tlast => axi_dma_0_M_AXIS_MM2S_TLAST,
      SLOT_3_AXIS_tready => axi_dma_0_M_AXIS_MM2S_TREADY,
      SLOT_3_AXIS_tvalid => axi_dma_0_M_AXIS_MM2S_TVALID,
      SLOT_4_AXIS_tdata(31 downto 0) => axis_clock_converter_0_M_AXIS_TDATA(31 downto 0),
      SLOT_4_AXIS_tlast => axis_clock_converter_0_M_AXIS_TLAST,
      SLOT_4_AXIS_tready => axis_clock_converter_0_M_AXIS_TREADY,
      SLOT_4_AXIS_tvalid => axis_clock_converter_0_M_AXIS_TVALID,
      SLOT_5_AXIS_tdata(31 downto 0) => axis_clock_converter_1_M_AXIS_TDATA(31 downto 0),
      SLOT_5_AXIS_tlast => axis_clock_converter_1_M_AXIS_TLAST,
      SLOT_5_AXIS_tready => axis_clock_converter_1_M_AXIS_TREADY,
      SLOT_5_AXIS_tvalid => axis_clock_converter_1_M_AXIS_TVALID,
      SLOT_6_AXIS_tdata(31 downto 0) => axis_data_fifo_0_M_AXIS_TDATA(31 downto 0),
      SLOT_6_AXIS_tlast => axis_data_fifo_0_M_AXIS_TLAST,
      SLOT_6_AXIS_tready => axis_data_fifo_0_M_AXIS_TREADY,
      SLOT_6_AXIS_tvalid => axis_data_fifo_0_M_AXIS_TVALID,
      SLOT_7_AXI_araddr(48 downto 0) => smartconnect_1_M00_AXI_ARADDR(48 downto 0),
      SLOT_7_AXI_arburst(1 downto 0) => smartconnect_1_M00_AXI_ARBURST(1 downto 0),
      SLOT_7_AXI_arcache(1 downto 0) => smartconnect_1_M00_AXI_ARCACHE(1 downto 0),
      SLOT_7_AXI_arlen(7 downto 0) => smartconnect_1_M00_AXI_ARLEN(7 downto 0),
      SLOT_7_AXI_arlock(0) => smartconnect_1_M00_AXI_ARLOCK(0),
      SLOT_7_AXI_arprot(2 downto 0) => smartconnect_1_M00_AXI_ARPROT(2 downto 0),
      SLOT_7_AXI_arqos(3 downto 0) => smartconnect_1_M00_AXI_ARQOS(3 downto 0),
      SLOT_7_AXI_arready => smartconnect_1_M00_AXI_ARREADY,
      SLOT_7_AXI_arsize(2 downto 0) => smartconnect_1_M00_AXI_ARSIZE(2 downto 0),
      SLOT_7_AXI_arvalid => smartconnect_1_M00_AXI_ARVALID,
      SLOT_7_AXI_awaddr(48 downto 0) => smartconnect_1_M00_AXI_AWADDR(48 downto 0),
      SLOT_7_AXI_awburst(1 downto 0) => smartconnect_1_M00_AXI_AWBURST(1 downto 0),
      SLOT_7_AXI_awcache(3 downto 0) => smartconnect_1_M00_AXI_AWCACHE(3 downto 0),
      SLOT_7_AXI_awlen(7 downto 0) => smartconnect_1_M00_AXI_AWLEN(7 downto 0),
      SLOT_7_AXI_awlock(0) => smartconnect_1_M00_AXI_AWLOCK(0),
      SLOT_7_AXI_awprot(2 downto 0) => smartconnect_1_M00_AXI_AWPROT(2 downto 0),
      SLOT_7_AXI_awqos(3 downto 0) => smartconnect_1_M00_AXI_AWQOS(3 downto 0),
      SLOT_7_AXI_awready => smartconnect_1_M00_AXI_AWREADY,
      SLOT_7_AXI_awsize(2 downto 0) => smartconnect_1_M00_AXI_AWSIZE(2 downto 0),
      SLOT_7_AXI_awvalid => smartconnect_1_M00_AXI_AWVALID,
      SLOT_7_AXI_bready => smartconnect_1_M00_AXI_BREADY,
      SLOT_7_AXI_bresp(1 downto 0) => smartconnect_1_M00_AXI_BRESP(1 downto 0),
      SLOT_7_AXI_bvalid => smartconnect_1_M00_AXI_BVALID,
      SLOT_7_AXI_rdata(127 downto 0) => smartconnect_1_M00_AXI_RDATA(127 downto 0),
      SLOT_7_AXI_rlast => smartconnect_1_M00_AXI_RLAST,
      SLOT_7_AXI_rready => smartconnect_1_M00_AXI_RREADY,
      SLOT_7_AXI_rresp(1 downto 0) => smartconnect_1_M00_AXI_RRESP(1 downto 0),
      SLOT_7_AXI_rvalid => smartconnect_1_M00_AXI_RVALID,
      SLOT_7_AXI_wdata(127 downto 0) => smartconnect_1_M00_AXI_WDATA(127 downto 0),
      SLOT_7_AXI_wlast => smartconnect_1_M00_AXI_WLAST,
      SLOT_7_AXI_wready => smartconnect_1_M00_AXI_WREADY,
      SLOT_7_AXI_wstrb(15 downto 0) => smartconnect_1_M00_AXI_WSTRB(15 downto 0),
      SLOT_7_AXI_wvalid => smartconnect_1_M00_AXI_WVALID,
      SLOT_8_AXIS_tdata(31 downto 0) => axis_data_fifo_2_M_AXIS_TDATA(31 downto 0),
      SLOT_8_AXIS_tlast => axis_data_fifo_2_M_AXIS_TLAST,
      SLOT_8_AXIS_tready => axis_data_fifo_2_M_AXIS_TREADY,
      SLOT_8_AXIS_tvalid => axis_data_fifo_2_M_AXIS_TVALID,
      clk => zynq_ultra_ps_e_0_pl_clk3,
      resetn => proc_sys_reset_300_peripheral_aresetn(0)
    );
system_ila_51: component MercuryXU1_system_ila_0_3
     port map (
      SLOT_0_AXIS_tdata(31 downto 0) => axis_subset_converter_0_M_AXIS_TDATA(31 downto 0),
      SLOT_0_AXIS_tlast => axis_subset_converter_0_M_AXIS_TLAST,
      SLOT_0_AXIS_tready => axis_subset_converter_0_M_AXIS_TREADY,
      SLOT_0_AXIS_tvalid => axis_subset_converter_0_M_AXIS_TVALID,
      clk => aclk_0_1,
      probe0(0) => s_axis_tvalid_0_1,
      probe1(31 downto 0) => s_axis_tdata_0_1(31 downto 0),
      probe2(31 downto 0) => stream_multiplexer_0_adc_sample_selected_1(31 downto 0),
      probe3(31 downto 0) => tlast_generator_0_counter(31 downto 0),
      probe4(31 downto 0) => tlast_generator_1_counter(31 downto 0),
      probe5(4 downto 0) => tlast_generator_0_triger_test(4 downto 0),
      probe6(4 downto 0) => tlast_generator_1_triger_test(4 downto 0),
      resetn => aresetn_0_1(0)
    );
system_ila_60: component MercuryXU1_system_ila_0_2
     port map (
      clk => zynq_ultra_ps_e_0_pl_clk0,
      probe0(19 downto 0) => axi_gpio_suppres_gpio_io_o(19 downto 0),
      probe1(19 downto 0) => axi_gpio_0_gpio_io_o(19 downto 0),
      probe2(31 downto 0) => axi_gpio_sample_number_gpio_io_o(31 downto 0),
      probe3(31 downto 0) => axi_gpio_delay_ctrl_gpio_io_o(31 downto 0),
      probe4(31 downto 0) => axi_gpio_packet_number_gpio_io_o(31 downto 0),
      probe5(31 downto 0) => event_controller_0_packet_counter(31 downto 0),
      probe6(0) => event_controller_0_triger_enable
    );
system_management_wiz_0: component MercuryXU1_system_management_wiz_0_0
     port map (
      alarm_out => NLW_system_management_wiz_0_alarm_out_UNCONNECTED,
      busy_out => NLW_system_management_wiz_0_busy_out_UNCONNECTED,
      channel_out(5 downto 0) => NLW_system_management_wiz_0_channel_out_UNCONNECTED(5 downto 0),
      eoc_out => NLW_system_management_wiz_0_eoc_out_UNCONNECTED,
      eos_out => NLW_system_management_wiz_0_eos_out_UNCONNECTED,
      ip2intc_irpt => NLW_system_management_wiz_0_ip2intc_irpt_UNCONNECTED,
      ot_out => NLW_system_management_wiz_0_ot_out_UNCONNECTED,
      s_axi_aclk => zynq_ultra_ps_e_0_pl_clk0,
      s_axi_araddr(12 downto 0) => ps8_0_axi_periph_M01_AXI_ARADDR(12 downto 0),
      s_axi_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s_axi_arready => ps8_0_axi_periph_M01_AXI_ARREADY,
      s_axi_arvalid => ps8_0_axi_periph_M01_AXI_ARVALID,
      s_axi_awaddr(12 downto 0) => ps8_0_axi_periph_M01_AXI_AWADDR(12 downto 0),
      s_axi_awready => ps8_0_axi_periph_M01_AXI_AWREADY,
      s_axi_awvalid => ps8_0_axi_periph_M01_AXI_AWVALID,
      s_axi_bready => ps8_0_axi_periph_M01_AXI_BREADY,
      s_axi_bresp(1 downto 0) => ps8_0_axi_periph_M01_AXI_BRESP(1 downto 0),
      s_axi_bvalid => ps8_0_axi_periph_M01_AXI_BVALID,
      s_axi_rdata(31 downto 0) => ps8_0_axi_periph_M01_AXI_RDATA(31 downto 0),
      s_axi_rready => ps8_0_axi_periph_M01_AXI_RREADY,
      s_axi_rresp(1 downto 0) => ps8_0_axi_periph_M01_AXI_RRESP(1 downto 0),
      s_axi_rvalid => ps8_0_axi_periph_M01_AXI_RVALID,
      s_axi_wdata(31 downto 0) => ps8_0_axi_periph_M01_AXI_WDATA(31 downto 0),
      s_axi_wready => ps8_0_axi_periph_M01_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => ps8_0_axi_periph_M01_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => ps8_0_axi_periph_M01_AXI_WVALID,
      user_temp_alarm_out => NLW_system_management_wiz_0_user_temp_alarm_out_UNCONNECTED,
      vccaux_alarm_out => NLW_system_management_wiz_0_vccaux_alarm_out_UNCONNECTED,
      vccint_alarm_out => NLW_system_management_wiz_0_vccint_alarm_out_UNCONNECTED,
      vccpsaux_alarm_out => NLW_system_management_wiz_0_vccpsaux_alarm_out_UNCONNECTED,
      vccpsintfp_alarm_out => NLW_system_management_wiz_0_vccpsintfp_alarm_out_UNCONNECTED,
      vccpsintlp_alarm_out => NLW_system_management_wiz_0_vccpsintlp_alarm_out_UNCONNECTED
    );
tlast_generator_0: component MercuryXU1_tlast_generator_0_0
     port map (
      clk => aclk_0_1,
      counter(31 downto 0) => tlast_generator_0_counter(31 downto 0),
      data(31 downto 0) => s_axis_tdata_0_1(31 downto 0),
      data_enable => s_axis_tvalid_0_1,
      m_axis_tdata(31 downto 0) => axis_subset_converter_0_M_AXIS_TDATA(31 downto 0),
      m_axis_tlast => axis_subset_converter_0_M_AXIS_TLAST,
      m_axis_tready => axis_subset_converter_0_M_AXIS_TREADY,
      m_axis_tvalid => axis_subset_converter_0_M_AXIS_TVALID,
      num_samples_per_packet(31 downto 0) => axi_gpio_sample_number_gpio_io_o(31 downto 0),
      rst_n => aresetn_0_1(0),
      trigger_detected => tlast_generator_0_trigger_detected,
      trigger_enable => event_controller_0_triger_enable,
      trigger_external => trigger_external_0_1,
      trigger_internal_in => tlast_generator_1_trigger_internal_out,
      trigger_internal_out => tlast_generator_0_trigger_internal_out,
      trigger_mode(2 downto 0) => xlslice_3_5_Dout(2 downto 0),
      trigger_ps => xlslice_2_Dout1(0),
      trigger_test(4 downto 0) => tlast_generator_0_triger_test(4 downto 0)
    );
tlast_generator_1: component MercuryXU1_tlast_generator_0_1
     port map (
      clk => aclk_0_1,
      counter(31 downto 0) => tlast_generator_1_counter(31 downto 0),
      data(31 downto 0) => stream_multiplexer_0_adc_sample_selected_1(31 downto 0),
      data_enable => stream_multiplexer_0_adc_sample_valid_selected_1,
      m_axis_tdata(31 downto 0) => tlast_generator_1_m_axis_TDATA(31 downto 0),
      m_axis_tlast => tlast_generator_1_m_axis_TLAST,
      m_axis_tready => tlast_generator_1_m_axis_TREADY,
      m_axis_tvalid => tlast_generator_1_m_axis_TVALID,
      num_samples_per_packet(31 downto 0) => axi_gpio_sample_number_gpio_io_o(31 downto 0),
      rst_n => aresetn_0_1(0),
      trigger_detected => tlast_generator_1_trigger_detected,
      trigger_enable => event_controller_0_triger_enable,
      trigger_external => trigger_external_0_1,
      trigger_internal_in => tlast_generator_0_trigger_internal_out,
      trigger_internal_out => tlast_generator_1_trigger_internal_out,
      trigger_mode(2 downto 0) => xlslice_3_5_Dout(2 downto 0),
      trigger_ps => xlslice_2_Dout1(0),
      trigger_test(4 downto 0) => tlast_generator_1_triger_test(4 downto 0)
    );
xlconcat_irq: component MercuryXU1_xlconcat_0_0
     port map (
      In0(0) => axi_dma_0_mm2s_introut,
      In1(0) => axi_dma_0_s2mm_introut,
      In2(0) => axi_dma_1_s2mm_introut,
      dout(2 downto 0) => xlconcat_irq_dout(2 downto 0)
    );
xlconstant_0: component MercuryXU1_xlconstant_0_0
     port map (
      dout(0) => xlconstant_0_dout(0)
    );
xlslice_0: component MercuryXU1_xlslice_0_0
     port map (
      Din(19 downto 0) => axi_gpio_suppres_gpio_io_o(19 downto 0),
      Dout(0) => xlslice_0_Dout(0)
    );
xlslice_07: component MercuryXU1_xlslice_1_0
     port map (
      Din(19 downto 0) => axi_gpio_0_gpio_io_o(19 downto 0),
      Dout(0) => xlslice_2_Dout(0)
    );
xlslice_1: component MercuryXU1_xlslice_0_1
     port map (
      Din(19 downto 0) => axi_gpio_suppres_gpio_io_o(19 downto 0),
      Dout(0) => xlslice_1_Dout(0)
    );
xlslice_2: component MercuryXU1_xlslice_1_1
     port map (
      Din(19 downto 0) => axi_gpio_suppres_gpio_io_o(19 downto 0),
      Dout(0) => xlslice_2_Dout1(0)
    );
xlslice_3_5: component MercuryXU1_xlslice_2_0
     port map (
      Din(19 downto 0) => axi_gpio_suppres_gpio_io_o(19 downto 0),
      Dout(2 downto 0) => xlslice_3_5_Dout(2 downto 0)
    );
zynq_ultra_ps_e_0: component MercuryXU1_zynq_ultra_ps_e_0_0
     port map (
      emio_enet0_enet_tsu_timer_cnt(93 downto 0) => NLW_zynq_ultra_ps_e_0_emio_enet0_enet_tsu_timer_cnt_UNCONNECTED(93 downto 0),
      emio_i2c0_scl_i => zynq_ultra_ps_e_0_IIC_0_SCL_I,
      emio_i2c0_scl_o => zynq_ultra_ps_e_0_IIC_0_SCL_O,
      emio_i2c0_scl_t => zynq_ultra_ps_e_0_IIC_0_SCL_T,
      emio_i2c0_sda_i => zynq_ultra_ps_e_0_IIC_0_SDA_I,
      emio_i2c0_sda_o => zynq_ultra_ps_e_0_IIC_0_SDA_O,
      emio_i2c0_sda_t => zynq_ultra_ps_e_0_IIC_0_SDA_T,
      emio_spi0_m_i => zynq_ultra_ps_e_0_SPI_0_IO1_I,
      emio_spi0_m_o => zynq_ultra_ps_e_0_SPI_0_IO0_O,
      emio_spi0_mo_t => zynq_ultra_ps_e_0_SPI_0_IO0_T,
      emio_spi0_s_i => zynq_ultra_ps_e_0_SPI_0_IO0_I,
      emio_spi0_s_o => zynq_ultra_ps_e_0_SPI_0_IO1_O,
      emio_spi0_sclk_i => zynq_ultra_ps_e_0_SPI_0_SCK_I,
      emio_spi0_sclk_o => zynq_ultra_ps_e_0_SPI_0_SCK_O,
      emio_spi0_sclk_t => zynq_ultra_ps_e_0_SPI_0_SCK_T,
      emio_spi0_so_t => zynq_ultra_ps_e_0_SPI_0_IO1_T,
      emio_spi0_ss_i_n => zynq_ultra_ps_e_0_emio_spi0_ss_o_n,
      emio_spi0_ss_n_t => zynq_ultra_ps_e_0_SPI_0_SS_T,
      emio_spi0_ss_o_n => zynq_ultra_ps_e_0_emio_spi0_ss_o_n,
      maxigp2_araddr(39 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARADDR(39 downto 0),
      maxigp2_arburst(1 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARBURST(1 downto 0),
      maxigp2_arcache(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARCACHE(3 downto 0),
      maxigp2_arid(15 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARID(15 downto 0),
      maxigp2_arlen(7 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARLEN(7 downto 0),
      maxigp2_arlock => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARLOCK,
      maxigp2_arprot(2 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARPROT(2 downto 0),
      maxigp2_arqos(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARQOS(3 downto 0),
      maxigp2_arready => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARREADY,
      maxigp2_arsize(2 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARSIZE(2 downto 0),
      maxigp2_aruser(15 downto 0) => NLW_zynq_ultra_ps_e_0_maxigp2_aruser_UNCONNECTED(15 downto 0),
      maxigp2_arvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARVALID,
      maxigp2_awaddr(39 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWADDR(39 downto 0),
      maxigp2_awburst(1 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWBURST(1 downto 0),
      maxigp2_awcache(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWCACHE(3 downto 0),
      maxigp2_awid(15 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWID(15 downto 0),
      maxigp2_awlen(7 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWLEN(7 downto 0),
      maxigp2_awlock => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWLOCK,
      maxigp2_awprot(2 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWPROT(2 downto 0),
      maxigp2_awqos(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWQOS(3 downto 0),
      maxigp2_awready => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWREADY,
      maxigp2_awsize(2 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWSIZE(2 downto 0),
      maxigp2_awuser(15 downto 0) => NLW_zynq_ultra_ps_e_0_maxigp2_awuser_UNCONNECTED(15 downto 0),
      maxigp2_awvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWVALID,
      maxigp2_bid(15 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BID(15 downto 0),
      maxigp2_bready => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BREADY,
      maxigp2_bresp(1 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BRESP(1 downto 0),
      maxigp2_bvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BVALID,
      maxigp2_rdata(31 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RDATA(31 downto 0),
      maxigp2_rid(15 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RID(15 downto 0),
      maxigp2_rlast => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RLAST,
      maxigp2_rready => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RREADY,
      maxigp2_rresp(1 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RRESP(1 downto 0),
      maxigp2_rvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RVALID,
      maxigp2_wdata(31 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WDATA(31 downto 0),
      maxigp2_wlast => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WLAST,
      maxigp2_wready => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WREADY,
      maxigp2_wstrb(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WSTRB(3 downto 0),
      maxigp2_wvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WVALID,
      maxihpm0_lpd_aclk => zynq_ultra_ps_e_0_pl_clk0,
      pl_clk0 => zynq_ultra_ps_e_0_pl_clk0,
      pl_clk1 => zynq_ultra_ps_e_0_pl_clk1,
      pl_clk2 => NLW_zynq_ultra_ps_e_0_pl_clk2_UNCONNECTED,
      pl_clk3 => zynq_ultra_ps_e_0_pl_clk3,
      pl_ps_irq0(2 downto 0) => xlconcat_irq_dout(2 downto 0),
      pl_resetn0 => zynq_ultra_ps_e_0_pl_resetn0,
      saxigp0_araddr(48 downto 0) => smartconnect_0_M00_AXI_ARADDR(48 downto 0),
      saxigp0_arburst(1 downto 0) => smartconnect_0_M00_AXI_ARBURST(1 downto 0),
      saxigp0_arcache(3 downto 0) => smartconnect_0_M00_AXI_ARCACHE(3 downto 0),
      saxigp0_arid(5 downto 0) => B"000000",
      saxigp0_arlen(7 downto 0) => smartconnect_0_M00_AXI_ARLEN(7 downto 0),
      saxigp0_arlock => smartconnect_0_M00_AXI_ARLOCK(0),
      saxigp0_arprot(2 downto 0) => smartconnect_0_M00_AXI_ARPROT(2 downto 0),
      saxigp0_arqos(3 downto 0) => smartconnect_0_M00_AXI_ARQOS(3 downto 0),
      saxigp0_arready => smartconnect_0_M00_AXI_ARREADY,
      saxigp0_arsize(2 downto 0) => smartconnect_0_M00_AXI_ARSIZE(2 downto 0),
      saxigp0_aruser => '0',
      saxigp0_arvalid => smartconnect_0_M00_AXI_ARVALID,
      saxigp0_awaddr(48 downto 0) => smartconnect_0_M00_AXI_AWADDR(48 downto 0),
      saxigp0_awburst(1 downto 0) => smartconnect_0_M00_AXI_AWBURST(1 downto 0),
      saxigp0_awcache(3 downto 0) => smartconnect_0_M00_AXI_AWCACHE(3 downto 0),
      saxigp0_awid(5 downto 0) => B"000000",
      saxigp0_awlen(7 downto 0) => smartconnect_0_M00_AXI_AWLEN(7 downto 0),
      saxigp0_awlock => smartconnect_0_M00_AXI_AWLOCK(0),
      saxigp0_awprot(2 downto 0) => smartconnect_0_M00_AXI_AWPROT(2 downto 0),
      saxigp0_awqos(3 downto 0) => smartconnect_0_M00_AXI_AWQOS(3 downto 0),
      saxigp0_awready => smartconnect_0_M00_AXI_AWREADY,
      saxigp0_awsize(2 downto 0) => smartconnect_0_M00_AXI_AWSIZE(2 downto 0),
      saxigp0_awuser => '0',
      saxigp0_awvalid => smartconnect_0_M00_AXI_AWVALID,
      saxigp0_bid(5 downto 0) => NLW_zynq_ultra_ps_e_0_saxigp0_bid_UNCONNECTED(5 downto 0),
      saxigp0_bready => smartconnect_0_M00_AXI_BREADY,
      saxigp0_bresp(1 downto 0) => smartconnect_0_M00_AXI_BRESP(1 downto 0),
      saxigp0_bvalid => smartconnect_0_M00_AXI_BVALID,
      saxigp0_rdata(127 downto 0) => smartconnect_0_M00_AXI_RDATA(127 downto 0),
      saxigp0_rid(5 downto 0) => NLW_zynq_ultra_ps_e_0_saxigp0_rid_UNCONNECTED(5 downto 0),
      saxigp0_rlast => smartconnect_0_M00_AXI_RLAST,
      saxigp0_rready => smartconnect_0_M00_AXI_RREADY,
      saxigp0_rresp(1 downto 0) => smartconnect_0_M00_AXI_RRESP(1 downto 0),
      saxigp0_rvalid => smartconnect_0_M00_AXI_RVALID,
      saxigp0_wdata(127 downto 0) => smartconnect_0_M00_AXI_WDATA(127 downto 0),
      saxigp0_wlast => smartconnect_0_M00_AXI_WLAST,
      saxigp0_wready => smartconnect_0_M00_AXI_WREADY,
      saxigp0_wstrb(15 downto 0) => smartconnect_0_M00_AXI_WSTRB(15 downto 0),
      saxigp0_wvalid => smartconnect_0_M00_AXI_WVALID,
      saxigp1_araddr(48 downto 0) => smartconnect_1_M00_AXI_ARADDR(48 downto 0),
      saxigp1_arburst(1 downto 0) => smartconnect_1_M00_AXI_ARBURST(1 downto 0),
      saxigp1_arcache(3 downto 0) => smartconnect_1_M00_AXI_ARCACHE(3 downto 0),
      saxigp1_arid(5 downto 0) => B"000000",
      saxigp1_arlen(7 downto 0) => smartconnect_1_M00_AXI_ARLEN(7 downto 0),
      saxigp1_arlock => smartconnect_1_M00_AXI_ARLOCK(0),
      saxigp1_arprot(2 downto 0) => smartconnect_1_M00_AXI_ARPROT(2 downto 0),
      saxigp1_arqos(3 downto 0) => smartconnect_1_M00_AXI_ARQOS(3 downto 0),
      saxigp1_arready => smartconnect_1_M00_AXI_ARREADY,
      saxigp1_arsize(2 downto 0) => smartconnect_1_M00_AXI_ARSIZE(2 downto 0),
      saxigp1_aruser => '0',
      saxigp1_arvalid => smartconnect_1_M00_AXI_ARVALID,
      saxigp1_awaddr(48 downto 0) => smartconnect_1_M00_AXI_AWADDR(48 downto 0),
      saxigp1_awburst(1 downto 0) => smartconnect_1_M00_AXI_AWBURST(1 downto 0),
      saxigp1_awcache(3 downto 0) => smartconnect_1_M00_AXI_AWCACHE(3 downto 0),
      saxigp1_awid(5 downto 0) => B"000000",
      saxigp1_awlen(7 downto 0) => smartconnect_1_M00_AXI_AWLEN(7 downto 0),
      saxigp1_awlock => smartconnect_1_M00_AXI_AWLOCK(0),
      saxigp1_awprot(2 downto 0) => smartconnect_1_M00_AXI_AWPROT(2 downto 0),
      saxigp1_awqos(3 downto 0) => smartconnect_1_M00_AXI_AWQOS(3 downto 0),
      saxigp1_awready => smartconnect_1_M00_AXI_AWREADY,
      saxigp1_awsize(2 downto 0) => smartconnect_1_M00_AXI_AWSIZE(2 downto 0),
      saxigp1_awuser => '0',
      saxigp1_awvalid => smartconnect_1_M00_AXI_AWVALID,
      saxigp1_bid(5 downto 0) => NLW_zynq_ultra_ps_e_0_saxigp1_bid_UNCONNECTED(5 downto 0),
      saxigp1_bready => smartconnect_1_M00_AXI_BREADY,
      saxigp1_bresp(1 downto 0) => smartconnect_1_M00_AXI_BRESP(1 downto 0),
      saxigp1_bvalid => smartconnect_1_M00_AXI_BVALID,
      saxigp1_rdata(127 downto 0) => smartconnect_1_M00_AXI_RDATA(127 downto 0),
      saxigp1_rid(5 downto 0) => NLW_zynq_ultra_ps_e_0_saxigp1_rid_UNCONNECTED(5 downto 0),
      saxigp1_rlast => smartconnect_1_M00_AXI_RLAST,
      saxigp1_rready => smartconnect_1_M00_AXI_RREADY,
      saxigp1_rresp(1 downto 0) => smartconnect_1_M00_AXI_RRESP(1 downto 0),
      saxigp1_rvalid => smartconnect_1_M00_AXI_RVALID,
      saxigp1_wdata(127 downto 0) => smartconnect_1_M00_AXI_WDATA(127 downto 0),
      saxigp1_wlast => smartconnect_1_M00_AXI_WLAST,
      saxigp1_wready => smartconnect_1_M00_AXI_WREADY,
      saxigp1_wstrb(15 downto 0) => smartconnect_1_M00_AXI_WSTRB(15 downto 0),
      saxigp1_wvalid => smartconnect_1_M00_AXI_WVALID,
      saxihpc0_fpd_aclk => zynq_ultra_ps_e_0_pl_clk3,
      saxihpc1_fpd_aclk => zynq_ultra_ps_e_0_pl_clk3
    );
end STRUCTURE;
