//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Mon Oct  5 13:27:40 2020
//Host        : edev3 running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (AXI_EN,
    En,
    FrameSize,
    M_AXIS_tdata,
    M_AXIS_tlast,
    M_AXIS_tready,
    M_AXIS_tstrb,
    M_AXIS_tvalid,
    S_AXIS_tdata,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tstrb,
    S_AXIS_tvalid,
    m_axis_aclk,
    m_axis_aresetn);
  input AXI_EN;
  input En;
  input [7:0]FrameSize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, CLK_DOMAIN design_1_m_axis_aclk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 1, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [31:0]M_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *) output M_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input M_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TSTRB" *) output [3:0]M_AXIS_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) output M_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, CLK_DOMAIN design_1_m_axis_aclk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 1, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [31:0]S_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *) input S_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output S_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TSTRB" *) input [3:0]S_AXIS_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input S_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.M_AXIS_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.M_AXIS_ACLK, ASSOCIATED_BUSIF S_AXIS:M_AXIS, ASSOCIATED_RESET m_axis_aresetn, CLK_DOMAIN design_1_m_axis_aclk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input m_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.M_AXIS_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.M_AXIS_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input m_axis_aresetn;

  wire AXI_EN_1;
  wire En_1;
  wire [7:0]FrameSize_1;
  wire [31:0]S_AXIS_1_TDATA;
  wire S_AXIS_1_TLAST;
  wire S_AXIS_1_TREADY;
  wire [3:0]S_AXIS_1_TSTRB;
  wire S_AXIS_1_TVALID;
  wire m_axis_aclk_1;
  wire m_axis_aresetn_1;
  wire [31:0]sample_generator_0_M_AXIS_TDATA;
  wire sample_generator_0_M_AXIS_TLAST;
  wire sample_generator_0_M_AXIS_TREADY;
  wire [3:0]sample_generator_0_M_AXIS_TSTRB;
  wire sample_generator_0_M_AXIS_TVALID;

  assign AXI_EN_1 = AXI_EN;
  assign En_1 = En;
  assign FrameSize_1 = FrameSize[7:0];
  assign M_AXIS_tdata[31:0] = sample_generator_0_M_AXIS_TDATA;
  assign M_AXIS_tlast = sample_generator_0_M_AXIS_TLAST;
  assign M_AXIS_tstrb[3:0] = sample_generator_0_M_AXIS_TSTRB;
  assign M_AXIS_tvalid = sample_generator_0_M_AXIS_TVALID;
  assign S_AXIS_1_TDATA = S_AXIS_tdata[31:0];
  assign S_AXIS_1_TLAST = S_AXIS_tlast;
  assign S_AXIS_1_TSTRB = S_AXIS_tstrb[3:0];
  assign S_AXIS_1_TVALID = S_AXIS_tvalid;
  assign S_AXIS_tready = S_AXIS_1_TREADY;
  assign m_axis_aclk_1 = m_axis_aclk;
  assign m_axis_aresetn_1 = m_axis_aresetn;
  assign sample_generator_0_M_AXIS_TREADY = M_AXIS_tready;
  design_1_sample_generator_0_0 sample_generator_0
       (.AXI_EN(AXI_EN_1),
        .En(En_1),
        .FrameSize(FrameSize_1),
        .m_axis_aclk(m_axis_aclk_1),
        .m_axis_aresetn(m_axis_aresetn_1),
        .m_axis_tdata(sample_generator_0_M_AXIS_TDATA),
        .m_axis_tlast(sample_generator_0_M_AXIS_TLAST),
        .m_axis_tready(sample_generator_0_M_AXIS_TREADY),
        .m_axis_tstrb(sample_generator_0_M_AXIS_TSTRB),
        .m_axis_tvalid(sample_generator_0_M_AXIS_TVALID),
        .s_axis_aclk(m_axis_aclk_1),
        .s_axis_aresetn(m_axis_aresetn_1),
        .s_axis_tdata(S_AXIS_1_TDATA),
        .s_axis_tlast(S_AXIS_1_TLAST),
        .s_axis_tready(S_AXIS_1_TREADY),
        .s_axis_tstrb(S_AXIS_1_TSTRB),
        .s_axis_tvalid(S_AXIS_1_TVALID));
endmodule
