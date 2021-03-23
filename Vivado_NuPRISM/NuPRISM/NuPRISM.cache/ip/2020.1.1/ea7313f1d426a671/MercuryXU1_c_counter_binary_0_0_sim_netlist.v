// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1.1 (lin64) Build 2960000 Wed Aug  5 22:57:21 MDT 2020
// Date        : Thu Mar 11 15:40:09 2021
// Host        : edev running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ MercuryXU1_c_counter_binary_0_0_sim_netlist.v
// Design      : MercuryXU1_c_counter_binary_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu6eg-ffvc900-1-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MercuryXU1_c_counter_binary_0_0,c_counter_binary_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_14,Vivado 2020.1.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} DATA_WIDTH 16}" *) output [15:0]Q;

  wire CLK;
  wire [15:0]Q;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "16" *) 
  (* C_XDEVICEFAMILY = "zynquplus" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_14 U0
       (.CE(1'b1),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "0" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "0" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "0" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "16" *) 
(* C_XDEVICEFAMILY = "zynquplus" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_14
   (CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    UP,
    LOAD,
    L,
    THRESH0,
    Q);
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  input UP;
  input LOAD;
  input [15:0]L;
  output THRESH0;
  output [15:0]Q;

  wire \<const1> ;
  wire CLK;
  wire [15:0]Q;
  wire NLW_i_synth_THRESH0_UNCONNECTED;

  assign THRESH0 = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "16" *) 
  (* C_XDEVICEFAMILY = "zynquplus" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_14_viv i_synth
       (.CE(1'b0),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_i_synth_THRESH0_UNCONNECTED),
        .UP(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.1.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
K7tEE7FVCN68q13VyANjoGlntg8JqMyTr1ni8kvOUuR1SVK8XP1CkVSEzWpsbA4hCOmk6cNJ2FVF
jCSse7kBuA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
QYMtjDs3cGd6CXD7fMnhhIOHaa4GS8lxXlVMdpWxNMvCob/pNzUedolmBuKPFVZVyZUalz9+PfCP
i57Lr7ze8y3312SJEU0lAp4LaPi0QB+mbw4ooa6j3kPXtnPTce2AnJPl/rTo08tNitYrb6SfnaqZ
bE0HXJbrv3Uq2JXYc58=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
AH2NLzfl5AbvJug+Z1MFfV0qyttfSaYCRvEW3GtkljpzMOOo8v3HYp1zw0QZhcotEdtjZ/k7PDTz
t0URnF421czKEjT/3qdzkxwtV3YEAMJTK1JNIR0WditisJNtylCzIsmytFhnfEg6uPSqpeJW8225
sPLHSzPp8FtwpwU2Pe03YQL9ESq5VV5un2H/arZgSwAslUe3n8UI4d4VOJuFCMIlVbtEB+/UbxUC
1bXTcCsidoGjljaNTblFVnFQ2qzvxvpeSJgCvPrM780ECmWGFuMgRBlo0xwyuzWn3tDT1x7k6ic6
prRVXvHfU/AjxZ8pVIaTHrKhDPmiO3+1gbNa0g==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
OpspLsf8eb92xZ93S/Un7rt4P5W8Z9R+CqssR3j4zdUWDr4xM8A8TzsKnaseqJB+Sc6sRzJnpRLk
Q5hqNjmUOK0CQv+5ZdjyxGirF6KmB0a9xEyN4M4/ZNjgVyRaei9LbcdP5yluKZdqG/kcmJ7XMhlv
x/rEsWNMJvzJ2Sk4UdD/4kEs5dQuXVREvBZSXig5+lakBp2Mzuk9mlIlE9If1w8aaJvZJpwinr3x
Y3G0G1vgeBh2SnyvMA4MIn+WcJGnjeHJdGHBzPTB8n/81CGNFx8AfHnTXWftOgqEhLl02TEcRS1y
1J22rgDbi8rBO9oOlH68k4NFaKAW5BGiP19CMQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
MWBclV2mQEteAfp6CFb3mKdoM+zSD7ChhmicvpvJ4yJIr9THXIAgTJPVK7rgJZCspviT+F1QPIUV
zLxshVAFhxPEM9XWgCcqI489DhrcMxQou+TntmMVf+aKd+o09xt0Mf2SULTz+KRjmLAGsQGjEqtv
k0ErSAfyUwKJNTrb8FY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rXBEscygyW4HoqDHP2wvdXS3PlqS6kGHp6awCRkEDR66+tkO0yFlMfe1Oyd3U0fxKoR0sBuhIM7w
eoxlSGoGUjsiglFAYl0v3vZDBlQPsMGMD/m/UonEm6Udx+8IcPHaNiPVjK6CFq/jjvWLA9rwYE0d
uxQ8F9lfTr0gqijoq+z0ESyOCuIAQaz1it1872tYal3JshbLH17Kt7adHNIoEfVE4ELNe6Yz5QwE
clwb+/zvOsQixyXae//s79YW6gicD5mn1R+88/3+hWkYoD4s0sHQrbL6AjHdNhWQpt6BbkgR8ANv
cO8w50U6l68E05h2+UbReV0mcQ8/n1SSl9W1Ag==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
m8th9knynCqRhpm8snKN8D7pcTTXQlU6GSGEwCaNOtWCtDsjbvq//RlbWrBJTsP+GQilQVDWWEfv
7Lxm8oLBjEikwdyOzlhzkAXuDy2XtlKlpaeM/WIqtkBuOYvO7Nri4Ok7CV5ZKQO7UGpPBBGKHtZB
TjQo+/PFxKb1S5AYzVGLwQoGdSyPvFaW8fdIqa/gr9FauHPRGS3WVlh3SI0U7lF5jjM+lASIK/5v
lALjWYqt1mYrSPI2eSKZgbMdhQfVmCVoCfrzzSQ1VJ5dNIwklG0bfZhCPO+fdOv2K1v037xSPKzQ
q2Mxhfg/BClezL4zM5f2HXFlmbFi0lbaYPHUKA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XCdKBoZpFTogSSSe/y42XUKHl4Aj6U56Pf1vdoNS383lPBFzD/qIsLa2UymIzdzRYFxDmDlZzADV
3sqXjyNgB7WYlgnJJPAvqG3TcXguMnqJpybPKqF6OntlAoC3ECRPdu3e5ez4BvMoj196UttzzzMY
RY1aM0WiSzbi4+cpoOK2cPE3CXeOSe4PHW0GmPsXTXaT+8/PSRtOHcsC69IYVh7K4rYJaa0ofQYK
FS85RGARwyJ2PzyuYrOe67Uc955omRkgGlHnNFmfh7SsNN2qq7dIKjvHhJCqe/k8tNcNs5XOPSes
/wuag9Rbuk5zyQMLxpwVAfvJ+GPBtpiEOF6bFQ==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
a2O8zLm+oA5Wcw6IcI3inZ+jxdJIAepc/EoJToV6kxuerXDpz2zl77JCaC8DeBFwZSLZ6wuooMJ3
n0M8NdZeIATK9CKWenPEewgRFM1WputQh5ibb0OUilpog/+dAYd+WBorEB5RkYUwo5SL8rYuXk5O
/PWZNYJJHHn60vx5a6aj9cUJkehBYYZP5LQrm3Xns9p9VRCmLi+5B1CAeHqdlHEYVRLxEl/0SOAX
5xoy3gjYSF7SwPrgHltv42rwKmj5gnkZWcMbLQL44C1qGziEpnbhkIP5jPWgGMkbot4VXZbH3Mhy
J2A0ixmTK66Rsd15aBj9rWpt+2qU6EByMOzJGw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UDRUmsUKRbdXN5Rf12dW6aPuV5hQU67rfLgH+evWNIS7a+SazuR/dwsvTHvI9b2nnt+owkJ4Pxvc
KLo4hf+cbt9KDVu6mZ7Da1ijDPcoefm2G2g/Z3IBJigIphwNdfQbbVGMfgt1Lf1HaiM5DPqZCMEw
qyQkqS32ZW7L60uhyJUgR6MwI2Hh9imAPWdbJd1jVNyqz7KJjGMhOGW+YDEiQpMHCmm/XuxZyYH4
w/U4MRrJMT4axBVMx+XfiT3VO3hpFUK8kB9L0BDGTzWsAONducwzpnqXr805t/7Uaj6ga7tCUBiN
JwHb5rdMzOU9jhvCD9Ahy43b8/3tNYlhoCYWsQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiypDq7PnPhd4GeiJAveymP46zj3geIzT749eL/NROoke7wWpUUACO4beSmz1uombGmqlQRZg7Re
vAYe1CJBqH30bb6qpR4XmhC2JRBfKfb0I2fg4/o6MIeSH1VEHTwPUrPhKDOuzCjlIqXgUo2EREY7
p9wPOLlu/j65Hr1OFPtW+u15pNhp0+NRT5eNJ0hAIqTiypcxXfcpL00V7daP0zudRrExRaWpba4U
C2Xygcqk/O3DaV0CBnMgfr9zFknD+oqwU66ekRaXNgaBYJUkA1I5taJcZmdTE77kH/x4Ki5hXOzi
argFJSgbjiBf8pbG181hPsnM0j6lXks/bqCCCA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9616)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
