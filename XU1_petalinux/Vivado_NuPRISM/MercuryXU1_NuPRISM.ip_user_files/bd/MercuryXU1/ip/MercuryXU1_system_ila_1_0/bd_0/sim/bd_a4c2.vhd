--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Command: generate_target bd_a4c2.bd
--Design : bd_a4c2
--Purpose: IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_a4c2 is
  port (
    SLOT_0_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_0_AXIS_tdest : in STD_LOGIC_VECTOR ( 4 downto 0 );
    SLOT_0_AXIS_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_0_AXIS_tlast : in STD_LOGIC;
    SLOT_0_AXIS_tvalid : in STD_LOGIC;
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    resetn : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of bd_a4c2 : entity is "bd_a4c2,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_a4c2,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of bd_a4c2 : entity is "MercuryXU1_system_ila_1_0.hwdef";
end bd_a4c2;

architecture STRUCTURE of bd_a4c2 is
  component bd_a4c2_ila_lib_0 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    probe4 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe6 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component bd_a4c2_ila_lib_0;
  component bd_a4c2_g_inst_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    slot_0_axis_tvalid : in STD_LOGIC;
    slot_0_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    slot_0_axis_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    slot_0_axis_tlast : in STD_LOGIC;
    slot_0_axis_tdest : in STD_LOGIC_VECTOR ( 4 downto 0 );
    m_slot_0_axis_tvalid : out STD_LOGIC;
    m_slot_0_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_slot_0_axis_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_slot_0_axis_tlast : out STD_LOGIC;
    m_slot_0_axis_tdest : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component bd_a4c2_g_inst_0;
  signal Conn_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn_TDEST : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal Conn_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn_TLAST : STD_LOGIC;
  signal Conn_TVALID : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal net_slot_0_axis_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal net_slot_0_axis_tdest : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal net_slot_0_axis_tkeep : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal net_slot_0_axis_tlast : STD_LOGIC;
  signal net_slot_0_axis_tvalid : STD_LOGIC;
  signal probe0_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal probe1_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal resetn_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of SLOT_0_AXIS_tlast : signal is "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TLAST";
  attribute X_INTERFACE_INFO of SLOT_0_AXIS_tvalid : signal is "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TVALID";
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF SLOT_0_AXIS, ASSOCIATED_RESET resetn, CLK_DOMAIN MercuryXU1_sample_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of resetn : signal is "xilinx.com:signal:reset:1.0 RST.RESETN RST";
  attribute X_INTERFACE_PARAMETER of resetn : signal is "XIL_INTERFACENAME RST.RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of SLOT_0_AXIS_tdata : signal is "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TDATA";
  attribute X_INTERFACE_PARAMETER of SLOT_0_AXIS_tdata : signal is "XIL_INTERFACENAME SLOT_0_AXIS, CLK_DOMAIN MercuryXU1_sample_clk, FREQ_HZ 100000000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 0, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 5, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of SLOT_0_AXIS_tdest : signal is "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TDEST";
  attribute X_INTERFACE_INFO of SLOT_0_AXIS_tkeep : signal is "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TKEEP";
begin
  Conn_TDATA(31 downto 0) <= SLOT_0_AXIS_tdata(31 downto 0);
  Conn_TDEST(4 downto 0) <= SLOT_0_AXIS_tdest(4 downto 0);
  Conn_TKEEP(3 downto 0) <= SLOT_0_AXIS_tkeep(3 downto 0);
  Conn_TLAST <= SLOT_0_AXIS_tlast;
  Conn_TVALID <= SLOT_0_AXIS_tvalid;
  clk_1 <= clk;
  probe0_1(0) <= probe0(0);
  probe1_1(31 downto 0) <= probe1(31 downto 0);
  resetn_1 <= resetn;
g_inst: component bd_a4c2_g_inst_0
     port map (
      aclk => clk_1,
      aresetn => resetn_1,
      m_slot_0_axis_tdata(31 downto 0) => net_slot_0_axis_tdata(31 downto 0),
      m_slot_0_axis_tdest(4 downto 0) => net_slot_0_axis_tdest(4 downto 0),
      m_slot_0_axis_tkeep(3 downto 0) => net_slot_0_axis_tkeep(3 downto 0),
      m_slot_0_axis_tlast => net_slot_0_axis_tlast,
      m_slot_0_axis_tvalid => net_slot_0_axis_tvalid,
      slot_0_axis_tdata(31 downto 0) => Conn_TDATA(31 downto 0),
      slot_0_axis_tdest(4 downto 0) => Conn_TDEST(4 downto 0),
      slot_0_axis_tkeep(3 downto 0) => Conn_TKEEP(3 downto 0),
      slot_0_axis_tlast => Conn_TLAST,
      slot_0_axis_tvalid => Conn_TVALID
    );
ila_lib: component bd_a4c2_ila_lib_0
     port map (
      clk => clk_1,
      probe0(0) => probe0_1(0),
      probe1(31 downto 0) => probe1_1(31 downto 0),
      probe2(31 downto 0) => net_slot_0_axis_tdata(31 downto 0),
      probe3(4 downto 0) => net_slot_0_axis_tdest(4 downto 0),
      probe4(3 downto 0) => net_slot_0_axis_tkeep(3 downto 0),
      probe5(0) => net_slot_0_axis_tvalid,
      probe6(0) => net_slot_0_axis_tlast
    );
end STRUCTURE;
