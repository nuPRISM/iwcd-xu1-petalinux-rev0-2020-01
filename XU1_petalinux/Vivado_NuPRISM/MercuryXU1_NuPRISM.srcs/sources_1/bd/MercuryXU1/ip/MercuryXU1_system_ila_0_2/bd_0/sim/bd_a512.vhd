--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Command: generate_target bd_a512.bd
--Design : bd_a512
--Purpose: IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_a512 is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of bd_a512 : entity is "bd_a512,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_a512,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of bd_a512 : entity is "MercuryXU1_system_ila_0_2.hwdef";
end bd_a512;

architecture STRUCTURE of bd_a512 is
  component bd_a512_ila_lib_0 is
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
  end component bd_a512_ila_lib_0;
  signal clk_1 : STD_LOGIC;
  signal probe0_1 : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal probe1_1 : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal probe2_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal probe3_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal probe4_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal probe5_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal probe6_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN MercuryXU1_zynq_ultra_ps_e_0_0_pl_clk0, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
begin
  clk_1 <= clk;
  probe0_1(19 downto 0) <= probe0(19 downto 0);
  probe1_1(19 downto 0) <= probe1(19 downto 0);
  probe2_1(31 downto 0) <= probe2(31 downto 0);
  probe3_1(31 downto 0) <= probe3(31 downto 0);
  probe4_1(31 downto 0) <= probe4(31 downto 0);
  probe5_1(31 downto 0) <= probe5(31 downto 0);
  probe6_1(0) <= probe6(0);
ila_lib: component bd_a512_ila_lib_0
     port map (
      clk => clk_1,
      probe0(19 downto 0) => probe0_1(19 downto 0),
      probe1(19 downto 0) => probe1_1(19 downto 0),
      probe2(31 downto 0) => probe2_1(31 downto 0),
      probe3(31 downto 0) => probe3_1(31 downto 0),
      probe4(31 downto 0) => probe4_1(31 downto 0),
      probe5(31 downto 0) => probe5_1(31 downto 0),
      probe6(0) => probe6_1(0)
    );
end STRUCTURE;
