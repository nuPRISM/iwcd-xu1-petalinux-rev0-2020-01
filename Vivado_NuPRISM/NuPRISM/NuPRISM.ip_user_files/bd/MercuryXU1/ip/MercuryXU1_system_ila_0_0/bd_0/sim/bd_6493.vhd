--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Command: generate_target bd_6493.bd
--Design : bd_6493
--Purpose: IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_6493 is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of bd_6493 : entity is "bd_6493,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_6493,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of bd_6493 : entity is "MercuryXU1_system_ila_0_0.hwdef";
end bd_6493;

architecture STRUCTURE of bd_6493 is
  component bd_6493_ila_lib_0 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe7 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe9 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe10 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe11 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe12 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe13 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component bd_6493_ila_lib_0;
  signal SLOT_0_SPI_io0_i_1 : STD_LOGIC;
  signal SLOT_0_SPI_io0_o_1 : STD_LOGIC;
  signal SLOT_0_SPI_io0_t_1 : STD_LOGIC;
  signal SLOT_0_SPI_io1_i_1 : STD_LOGIC;
  signal SLOT_0_SPI_io1_o_1 : STD_LOGIC;
  signal SLOT_0_SPI_io1_t_1 : STD_LOGIC;
  signal SLOT_0_SPI_sck_i_1 : STD_LOGIC;
  signal SLOT_0_SPI_sck_o_1 : STD_LOGIC;
  signal SLOT_0_SPI_sck_t_1 : STD_LOGIC;
  signal SLOT_0_SPI_ss_i_1 : STD_LOGIC;
  signal SLOT_0_SPI_ss_o_1 : STD_LOGIC;
  signal SLOT_0_SPI_ss_t_1 : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal probe0_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal probe1_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of SLOT_0_SPI_io0_i : signal is "xilinx.com:interface:spi:1.0 SLOT_0_SPI IO0_I";
  attribute X_INTERFACE_INFO of SLOT_0_SPI_io0_o : signal is "xilinx.com:interface:spi:1.0 SLOT_0_SPI IO0_O";
  attribute X_INTERFACE_INFO of SLOT_0_SPI_io0_t : signal is "xilinx.com:interface:spi:1.0 SLOT_0_SPI IO0_T";
  attribute X_INTERFACE_INFO of SLOT_0_SPI_io1_i : signal is "xilinx.com:interface:spi:1.0 SLOT_0_SPI IO1_I";
  attribute X_INTERFACE_INFO of SLOT_0_SPI_io1_o : signal is "xilinx.com:interface:spi:1.0 SLOT_0_SPI IO1_O";
  attribute X_INTERFACE_INFO of SLOT_0_SPI_io1_t : signal is "xilinx.com:interface:spi:1.0 SLOT_0_SPI IO1_T";
  attribute X_INTERFACE_INFO of SLOT_0_SPI_sck_i : signal is "xilinx.com:interface:spi:1.0 SLOT_0_SPI SCK_I";
  attribute X_INTERFACE_INFO of SLOT_0_SPI_sck_o : signal is "xilinx.com:interface:spi:1.0 SLOT_0_SPI SCK_O";
  attribute X_INTERFACE_INFO of SLOT_0_SPI_sck_t : signal is "xilinx.com:interface:spi:1.0 SLOT_0_SPI SCK_T";
  attribute X_INTERFACE_INFO of SLOT_0_SPI_ss_i : signal is "xilinx.com:interface:spi:1.0 SLOT_0_SPI SS_I";
  attribute X_INTERFACE_INFO of SLOT_0_SPI_ss_o : signal is "xilinx.com:interface:spi:1.0 SLOT_0_SPI SS_O";
  attribute X_INTERFACE_INFO of SLOT_0_SPI_ss_t : signal is "xilinx.com:interface:spi:1.0 SLOT_0_SPI SS_T";
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN MercuryXU1_zynq_ultra_ps_e_0_0_pl_clk0, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
begin
  SLOT_0_SPI_io0_i_1 <= SLOT_0_SPI_io0_i;
  SLOT_0_SPI_io0_o_1 <= SLOT_0_SPI_io0_o;
  SLOT_0_SPI_io0_t_1 <= SLOT_0_SPI_io0_t;
  SLOT_0_SPI_io1_i_1 <= SLOT_0_SPI_io1_i;
  SLOT_0_SPI_io1_o_1 <= SLOT_0_SPI_io1_o;
  SLOT_0_SPI_io1_t_1 <= SLOT_0_SPI_io1_t;
  SLOT_0_SPI_sck_i_1 <= SLOT_0_SPI_sck_i;
  SLOT_0_SPI_sck_o_1 <= SLOT_0_SPI_sck_o;
  SLOT_0_SPI_sck_t_1 <= SLOT_0_SPI_sck_t;
  SLOT_0_SPI_ss_i_1 <= SLOT_0_SPI_ss_i;
  SLOT_0_SPI_ss_o_1 <= SLOT_0_SPI_ss_o;
  SLOT_0_SPI_ss_t_1 <= SLOT_0_SPI_ss_t;
  clk_1 <= clk;
  probe0_1(0) <= probe0(0);
  probe1_1(0) <= probe1(0);
ila_lib: component bd_6493_ila_lib_0
     port map (
      clk => clk_1,
      probe0(0) => probe0_1(0),
      probe1(0) => probe1_1(0),
      probe10(0) => SLOT_0_SPI_io1_t_1,
      probe11(0) => SLOT_0_SPI_ss_i_1,
      probe12(0) => SLOT_0_SPI_ss_o_1,
      probe13(0) => SLOT_0_SPI_ss_t_1,
      probe2(0) => SLOT_0_SPI_sck_i_1,
      probe3(0) => SLOT_0_SPI_sck_o_1,
      probe4(0) => SLOT_0_SPI_sck_t_1,
      probe5(0) => SLOT_0_SPI_io1_i_1,
      probe6(0) => SLOT_0_SPI_io0_o_1,
      probe7(0) => SLOT_0_SPI_io0_t_1,
      probe8(0) => SLOT_0_SPI_io0_i_1,
      probe9(0) => SLOT_0_SPI_io1_o_1
    );
end STRUCTURE;
