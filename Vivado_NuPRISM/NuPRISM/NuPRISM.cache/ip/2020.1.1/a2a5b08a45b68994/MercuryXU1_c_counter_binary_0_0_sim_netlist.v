// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1.1 (lin64) Build 2960000 Wed Aug  5 22:57:21 MDT 2020
// Date        : Wed Mar  3 11:18:18 2021
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN MercuryXU1_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} DATA_WIDTH 32}" *) output [31:0]Q;

  wire CLK;
  wire [31:0]Q;
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
  (* C_WIDTH = "32" *) 
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
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
(* C_THRESH0_VALUE = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "32" *) 
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
  input [31:0]L;
  output THRESH0;
  output [31:0]Q;

  wire \<const1> ;
  wire CLK;
  wire [31:0]Q;
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
  (* C_WIDTH = "32" *) 
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
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
L8SjpzXUmy8G26hvHRgPD31E0oJjg3hiCCqRClyft1dDxkd26wPaci9g6AgDvNExqJcvmi6K0tlu
cva26t8d8FjbZ8yiNxoCcx53A0MwKDRbrb3DxuI3NB9eu74GKf9508tb15+k30kURWwRhItzPUNM
m39UE6FXynM16mrpQd3X+bG04v+RRW93VgUS3+6w1Z4+6WNYnTj7xGloGPI5NnDx4Vv66S+A/0mg
n5tONhAOnYrrT0MpgdjNYC1+oj+kSZAM/vY1JURC+NFNNZf93BdOt3aK+hORw9EzXh93llA0ZoIF
17n0v+D3qecmAceFVly/R1UCJyBPztQrSG7/4A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MlrHW8M3lfrglUMYfeVRL53ebbZ9N/jDG4Frqoy0hox2Ed5ERwg1q1t9zZia1Q9dzi04bjcOz+gY
urkbSXe9/FOJqjkXlVqWlTh1WkaHjWGNFAegEvfN6c51NVxJ/Z9/RyzUmFY6xfPQflFRrBvIxl7i
BVeoMJEJaf4KJyzkp2kIYmBek97AKLv6o4BCQ2ywEt2P5sZEa8n8yNvSSCHI8z7kmok4h6D8JJp/
OJwRhhoE0hb1gCzI94iMVrwJi5f/nnNqRJOP7t9d7UvDtLYkmbO2RQnynPgMpTVCQ028Bj/IOirp
SYLFCKED1oc6vqtcPkIgPw63bqqgHWXNfu725g==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 16288)
`pragma protect data_block
qY1rMDE+2mXCKAMEf24sBVjxsezZQIvy1Vv0FTYFpFM/9rFsfYhddkzmVG0ShwBIWxiMcOK4Ebp8
XCGwEU4Uj3a7d2NaXO1JY+1yGGiZS+JSJpXijq3eybvU+Uuxvi10APMe23gAkJVdBS4sTS0o59mA
07UI/2q55JpuNzLDpnbGR2Pg3OiwonM74Gm6Ezuaukx/oSz/DWEZPa0w/GIOrqrx67j9IbO/hJN1
+XVWKz5qqSsJbxvRLMvdg3ocStz5nPx4lYHq4B8+c7Z4OTCwS5jkBOgh8XjlPvI2dFQPlxRUGEI/
A0qOaABbPfbo5nH1CIn5mOKA/tIohw1Taj5mnOb7Zk83FpIuJSJ4zu49nj0h53NiV6zy91Zs2YCx
DYsda2wbTn5xda4oq06IATw4ftfu8qXdA/bD+Xi6NkFpO6qodzHi30aTGfF1KrhJwueQ8rN9juj9
MoRb5pkLqNPLFTZ5SG01eboJHIdVizUlUV+4du7fSVtNyBkaTuqEEEG7Lqc0SxzOuqpeDU1HoLl/
y+Tand3w4gPX/lb5l2VltUGsHKVx9jLwiQ/S0kOPHMVGyfkF9FR9TTiGvIgYkNSWZfCfbpH1QZt6
/it7C7KnfoD7Tgre+UDXXj/Xxvhv62ou1UH1N6YxLcAKTs10MRAydejFx5bsL3575knJXi2Vduv9
BOy3/ioPQ3Dv93uFq3M4GUziW2Nh7Viw/A8exF5Mi2I0n8nKDJXT5ZT47JuAmaalGUzin5jVDQMO
KXWFkpFdg/+eCnqUcZwP11Y6F63lZPclOigFlJNOkUoz3KB3Fa+BSS95lY+g0dO3loWnVyZ3y5sl
8L00YKtYyRR06DnG6sPoRM3Si8LAKiuNwCn/4Kq+e8ye5HkGFk5CoJ+N2uTc9rhAIoFBYXIlWDWd
sXL/hR4/1RENgPFGMOdJ7KJmc82QuTL92ET9mk97xGlYY8R7YAv87f0YCRHHk0dK41RrrS2imOlJ
KOJ/YJP9MDsx8IGaBeZSWeQX3phAi5TySs9lZ+PfRM7Oi4QYIIt7pI0j/iQRI9kSpMytjBzWX4H4
NZYZBw8YLce2lLRMY1YpOL7+Mn5oD/e0bIWsguU/1QYj9HBFOT11vBmBNnbpdC1AcX1uNPxEHuDP
DJeGvlK1elMa3Xb+YIrlKCPmAGLw6PLnTvXh6U2Kgo2KfXvUGFTUoxLP4WaVJCfUHbnrCffXAWtE
JN+YPERNZ7pwf9in/Yl+Vd3n4vCEq9ChqGNLXNB56oO3Y4OdWjpD0iQDgYNsxLbN7arrO0+zxv9f
JQajV7kbNiae/0iZpsmMtEhbNMyHLbOUx+5uMISCrIRNLuUsjpB3BwlVxooIK+qslBgYf5PdMgQY
Kp1D2sh50LjBBU9MxnKtmRk3kSvESjpxMGtK5fkqjc3cvSQgUmvRxVm1uQ/h59De1CpEF0yQaDmg
KW2JuIZXzOIpi595K2261hpU/nSJTEzfm1KlLPMl7iIObNcJvY6k7JaHHU1M8CS3lJ2XD5A/jPfj
TXmpdlm0l7cLiWGMvOtwx8G4Ip8J1Ph7P93lhNx9hc4RAs/DkBc2+VgAngnfU573CrBhJ85/xtVm
fywYrUs+J+4PTEI2akMJs05ov69OIqLC4CWEjM8jajen0lByCUGi4f7iCiH8wVRH1ArWcvO+53ZY
+vX9hlDt8JTTvMqqmLlnMmWWX8eDw1QuyXRccaUC2YAxL2xDmX/snGf1nei5dcIb93xZ0/FxfPBi
XAWU86+C/2qkO9DjcAWA562DWxCpVnhcVSMmcG5OPyQxN+isNu8kPRgLtkpiwDzlURWsy1wrS8oH
Hp54/xoPBo8a2+L9M0x29kfCR9lspgO4OQBa2g3fZ8ltnFHQLoJ+YDHNOvtkX9S5LlJyFh0Dqpu0
GYBvUfpiZq/0ez3S2wQd9sAQ6slR6lTdFwguPvzHyJAF39VviwlqDM5bAnezEsmnlkpo1dojnBMX
4kWFfIQm+D3g62+fbgo66Sk1MR9tukUrp5M6mpmfzKlSuf+j4pa4+muEbLPfx+sLiDfaoYjAwEt+
S8Of+WjwCKqR1+P3bGJBR+a0Lj/AXJ01+BTj2PgdyNOj1umdEBLFblBjqyuwW6Iw4RG3zJUggYzZ
eyvSI8ChRxSpRy6Vvny0HtPeTrQAXkVFqQw7KS+nMVt/usSRv9oT777O1eb36wbNTKZ6cQUlpzZK
OAO8eMRx9cI4hrjoRkAfoutNUEl7fJw/eds7tTcuzTzY5MURIdIX6797wUT4bbE8GZM7RmaisEYz
sRdepObS4jv/zBSNFqutX0ZwjgI0kB9z4BIOs88BGr+Yj2M9t61Qmhnv1RbwoK9CCL1CB6sAPsei
FO1xx2B3T5qsXITyv4zjUhjFZJIuSOMak9c7QnARn6fH8I+JUcAkMNondy/UWN4Ou/mGJqiVrtNi
HOjKxJYKl4lj9JyNhtP9tV/XgvGL5mk+KwR0qDcYS4Ak82+tnjWLJnK/C5wetImfUFK+z/AlAGxX
PJDd3LnuqewHNAhBQ0a/5iBu/c9kYM7uhG937rsp916fnFqiO6tyfLUy/vfUYRmJGEhChrV7cIZ4
9ojFbke3pq95HbzGas2PAou6akgJXrySt1Vof7gUxkkMXV6zmBC5o2/KGgsOp1GVrDzIvUxEcL5P
pgWunG5/4NecbEJ6pB514LZHQXyGmIfz48CJmo46zEI6G37IRZHPLUqEBhVGGs/+2yfWLUoFEvZS
eVfbWEKeWqrakACfBtzKT14nAYbc8n8bGij9uJYm/y3tUfIFbQSNgGKXOZIgdw+oI3s6oVymhKY6
nPZ6pw9zoK5rTqcalQc2A+Z2gM3Uv/9g0zD1xrMzqzXxN0UYNl+Mz6YOHOrJOzdJByrDFGaKF6cq
Ddn/HWO9eKha9nhl99+lylGaEjH10DTL611HLpgFf01EWeBoEHAtUQtU4zj9fGJX+d81lnY9bR3D
s021QMCrzgmb8C4HlR1z7QeVsKWpTf5iWI9vVlcy7OwEuGH9Rcmy0msMNBm06g6g0FNSui3muQiq
M+ho53jAGQLh5Kj2Ck6OG5JODCpl7lmNXZa9/KytOHzPb1oVL+3O09zz3VL7ar1tJ9jmq0dTvPtm
2sKaZTmRitvtUdmzGxDVRybXXdf0Z58N9wHCchIgoSvJlVSqaVn6lwSSyQpqRG8Z3tYAEdcYs9Nf
GO75afAvfBPG8Dgfg86CIj4kGSXh2gg43f9MNnni7d+e8M4gD51UoseDw6JU5wAmmmWcDRuDNbWT
dQmEpqBjGOqeY2FRrVjk372qQ74HOyTDM86m3t8eYB6yjB0cDIn3YjCZbNEjF6eoxgOWtji//Fdv
bjqyDZRriN1GYntZIIkKmY2MBqvLdmJ3qP6mU3pya2zJBZlpagAhvzw2Z5Q/gK/2G97o7z12TKMW
3FrduwA7d0oHMTc/1lUTzVrenYkvzGXQoDNb1vpFjJcWR4EErAZAgpfWglZV9Jw0bTG+aE+b0CEn
b+SmVgUVlYnepBkaYSL1bhDdV+mA+k3AJZVfKGIfyrfSLA6ARjVpIneuqSWXGfn3T024jdEtLuxT
VL16c2TyJmn++iRvRGl6tNFHuQZXTA3Zd/1c5AvDdrmXWWJ8+oNXetQRPBeJHzXS/HNR3jBvDY01
YAOFs8VBYunQ5yIIO6hFE0TUmIgSWZv/xrO2pcDB/pzHzQ5duj1TozaiD580FfiNpUk8siEhCPUm
hOxfWoQRy+YMLivvVHAGRuTZJAJPfIiLLOW7nrVZ6P9O5Zp/ew83FSaY4/E+TgQjRSEWfEmO6EW5
vDkVbgQ9mjffJz4pYVFwvGN/FiMhiMdQ8nkIHNdjxvMYKmYMjeuy3gIcEx/zpBjX6M87H1Pyk3av
91lW6sataNhRQ6YzN2qaaaLVohCl+zEktjz0O1aD4sqLjJkc/AaJKQxkW8Dc58L9CVoj19SalsGz
4/OhxZO/kEte/oxfJ7VJLsqYKw5hBRMPq7IKUG+JTVazR9+wQZy5AtrzUnmoj5wcfAQftU8yjJla
Pqc0XyRijjqvYPmlLJNDZmAr3UnYCA2Vj4vJXBXMV9zdyGwpjnPPmjSbuBmQkgJw7MI6VkmpFMFW
gG8yiPL02f82I4ZfYwIDt5+awIQFUhEyQZNyCRstKYnRPbFCVAMHG80/vfcbmHBVK+UnVwsb7AfB
YEZyKof7qTer488vgvd7SBAjoUGTayt88tlRsx7Q9Gi2+Sort8+L5deqtLskfQ9m7n3oouKgc55T
eOWhwb5D1GPXl2lNcq7QgruRUPQZ3N6XtLUN+LtPatImTVrAVfffUoM1YAelmF83/0wAH74NSmEZ
MpCqNAhhEQYFg5EDXqwNwNOz06w3gP35ep3WcwDCCHEgSVIEdH+Q1MqPqnjLbBcCdO1pTRqF2hKT
UgwifdsBtvhISaVngULEtx3Hl/egxCaCWV8RJUFQBvFaR1Bp/znxyYbWWYDVBI/Zu2YWv//3Yzg5
vyNn/toUk+PDbc+z+FJBPG7GyIL1szNAY5D6tgh7I90eJZNiWzXDqbHpyAyX4s7FLMVqpM9j9BxR
+IfY6EyedjqjU7xzE/3Fr1J2VSXTTBo2tewO1iX9L6Tz1WzFnzZBoA2zM5Cl/3n0zwyD3GrxxzNn
w3PTr1TlWoEDY/cTM/gZ0rRwEv7L98nVMDHfGTSWQ52Dun4Z+FwjszfWzLBrEoeygHSnGVjGxlQ6
r+dr+d60MK68Ojm3sx3lY98koYidg617C/ceiTaIWfUkd5gpg9aaz1nOl/L5f7btK9cCKeK1EaNx
gtTA1h9aJbwgaWUzYU7DvemGTl9sMkN/HjMpfNhHMBVaJceNd0ifGrbk0oM3jKk6EFEIrTSe55AZ
b74KvCWhuI94MGE6DF2syXXbpRVLAhlZb5sOL+zWG15Jf4vFlXgIqBwBBzrk0Kkuc5gBqGi9mFrI
0cTtBBqN4w+fccJNPoXaqAX5uHHS9yUn4jy08vsW1n5ZmLWasoA0rySqg4X0w1WqzjJjRsVxu789
03OoG6nm/8T5aZY2Z2HTDR+08Rk2uy9vjYzveKwN64YgvUVEbWcOAKhct9q/+gW5dwVHBnkXMKYK
m/c/735Urddg45VM4e+ooWtYH8IpiO73YEJjd1T9QkCyGfeiJLfMeA5C7F1vPCl4B7vf3qicb6pX
M+OhF8+/ToMSTmy+nT1tLuXV2ISScAG+CCu7eD+Gr8jQMhVqpAWQWoCeSo7toFpoNNw6JQ9I6ggQ
BEDkJ0Ul1gPMPGx/3z+a/WgXIFpG38dPtEk1JRqu45luP2I+yeyE9sBWcIicomwTDmHYPyQFtOHN
4UoKUlsQx9VW3XDgodfUCyxlA0Oea37E/NA/p2AtKlzdz1lQpc3TPcZ7RkQEZ2P1NNgf/OS2E2Gb
LOA2Of4Wy1XLpLz4JCZzPIEpCIpQBiFO6mk7xCszfNEFyutArjsxxUymqGoaZLA/dZ+ewhkSZwbE
tdoiTtMrKjLmmdHYrRqe1ZJ7OEMrUV7LS/QLhaR1txP7px4gElJULdrKz4QqomRd4onZwpcfW9R+
s9sRaAZ+gElXSyh08dmVFRDQ6Vvu9eIYYpU+jUrl9nark5tr+JzcJqw71Y46It6v+t8MRpH6YqXm
fshMngh3lFX8l/tSLkspS8qEbbqv9N4AISjO13Xt9xBUqh+RK52Q8HIHrh5cm+su5oJe29iDzRnL
dozlYLRBooQzqQQFEJvASRPKJklzG4MQHuT/VqIN3Xuq63K99qhuJYiMyfVhfAlSbimpWWGDhJ33
ourh8KINU/1899PhF6wzwISAOiiFJn6Do0TUqii98otL4gh5mj9NakLbagHuhaU6sIc3UWC0nKe9
QzMpKJc7pGwureW8ESkCJVsnsNrlD/qcno0lUj9hkKMvnmGa0FOnl3yDB0DWa5xEbMeZqqvbHlJ6
+aA9bhi+pwxcMCfizt+CBPeJ/GDVmeB3qI3b+A4lgI5uvwoRQRu0Li38jI1xVv/hazzPKtqo5YFH
Z7LTDT12Qjc+6kVzFN29noO4GwoV3d5DdQuUFCIJFZx8hFr/RSWlbLstD/trt6ImtnymxQPx1cem
XKTgJJo5gFaqmNAT+7v5Qal9Jboo825NjMFi2TpztXp2f4kY+8vyDxDHeapkwenbH/M3MmuKNkII
EfTApaMOBefB5NbFQPukwKjvP0GFiL3EHiiA8R/FwsMMy2onniplEHuwRanChRFyY1DmZManPbPt
QYf2FyBHboPqpBb1z3UHDrc5B++fJeEshcO0tINCJijvLQnk9/4sWqlwC+t7q49LPn2HfWeLHWFc
ZhBnCgKUjUaBzHGvOz2p5Dx9YSzhlArTIYE+Ech0K/SLqFSNVnWn9/mwz/jt6sKoJL3nBMOUVH/+
IGbX/wJ5iGCIglctDfsg0hbq1zZTGb5pY45skda6UxDk+mY42LZLtzAzA31mXPmlM6z7lt1ah3dB
TSyUJ53d9JiC2BZnW6dNI0kpqWVREDDrlQWtUlyoR+StwDAtiDbd2GkYXAvE5W3FGEDIqAVor3Jp
GOP2gXBm4B/NBBOIrRFZp0FDHbiqpucG51vOixjPncdcjHKWSXdZumH75RKEX+nPQ6tj7Tht2Wqf
ZfKgKbkCASQgTshpED04CrXXsbVOVE5qCt7/xMGiCXp7KafM2Mbto9aIriUg7qEh833Bp/GIzBmf
FOtUB+H2CVzEcvxBgso4DuhpRdFzDqL+E7CcwduCKZcQpvOwSlzOIsTQyuPp5xXHSHBgz9rltE0l
6RyvyQ6GmNCiB3Nte1v5X3JTteQWsXTsWkbhTLIzmH4FOLnWpplvqIUBWnNCDy2AWgeRhfZ379Dv
PgyhxJl28cqnCMgHOOFxhamXTrShXMRqI9m84ip0zTtkodkSUuv4YJuQshLHp9cU52YW0EDIz46s
3GcqUvjv9WC0XyGzxDNycimi765aVpMcMdwO97S/nDsaKzto6LuDDGKrDNRRxnJ7Pdbp/XNQf1GN
4AXB9Q9sMYzWfG90/ZhBO2fpeMcQMMxaWkwSywXag2GhGtnVv4Ksf0Lqol7UNKW5dmrRsAeN3Lmt
QDAocNtOQ50xZi6VRE9BtMKKpTOZwq9LRMhs+Ye56mAcHI3r63Zdt/LNx6REqLNl4HSejwXAgtT6
IMIdxxnVfvovrZsZL+89HFowcpw0g40rp8rphSmfBR9ZetJLcC84yyPe0LqXJKFn5mt2L+jRwrK/
RUONNcVx3UrWq6eIk26Idx4jqsCM9gvDbfVhqw9BwlHPrZFgpp+sSp+LxBvkiXQPOS1Ztu0LNrGH
FwEddDCgGlQ7KjwknlanhXbDPsoHm968onQGBT3kgbs47nTUSBXC8zg6pjqwQng24xA3oTFTVYQz
4guHjMz6wA771rbA5svNak4Md7T3TMfRKXhxEgQn+X0CAVB9QAWDKDAJMPToU41dbe3q/YZpVVtR
3KioEm0lWZoCHSonFHVV+TyLdy5fDT0GtybKbcMNZaggzyHCYYvTy7qbVjDVpugYyDi1w8nDZNXt
oN5rF72SXGO/a+hkgOggeEqpMNXi0NhP/kU2QCpCAJBfu2HEviZLQJJZRUm+iCgFtyiogsDVzclE
EZzb6CKB8dR1igmo1XJQ+GgNIjxMY8UL4fvAzl3kpY0iwGtfuiz+ig3ltgEfGgtC7Gpj2W/2daaK
FR/UJwkUAzLJXP8tRsCjxIGLqmUR5GnusUikRAITxeIwvalEtb7/K7rqt6a5JQa0FFVdGVWpgnyC
5OoZBuAJDRE/z9RPxviZZ5J6cA8SqZIe/zaJUwxsDkvaZ2j2QQcbH5Ez5uQ5oHrnABPwUD7k/ZI1
h+YY80VeZoQUFXk7f8Putn3EQ8kXYLAEnp0uTxFi7m6nWQz9662s8h+wTLn3Y+HQR+hJky3SFV25
PnnBYkd3ZkyFZ5su1rVsg2A2yKC7Ots8JL53kzbrs6yEYV20kOfMVZH5KoLEpaASaSy7+WTqkN9m
8fm9A8cVHreuBFi+EQzQc6mNnd0uD2TbRrZAVvb2+72fhHXiDVzL0snoOXAB4LNuHAqF9CiosFq2
c4ncwv5gwbMtD9zsePnU2WBtV7dszTC47RM+jiQ12J/4BqdvDX0akNv3E6F0nsuy9+LCqFzDOt1o
i9MGulsgV14pce9wTlJ1MCvmO+AJBnNbabUzcG/fCUvj8BQbemsZBPvsbHaVJ/38tdlJqpK4pSJd
Yo4db8WxixEZh9xWRTRNdHs43nI/qcOS7BYAH3Ee066WxS9L90Mtz68iMVpHvlWhsz+puA94fOC9
rt/FPfAfstyMp7gzeFD7pkjimcZLMtP8g5O9yVePcnffvHjkbSbyEo2E2cVPPmdUpMb7xgLqJGwA
Hnak7Z1mVkpL3r5GxWZsb/HGXbYQeQzzIXvqjHz4WjvS5+utdfF746CLz/cEZKYdQz5Y/Sh36wKe
ysTGiZRdJDyuK+I7/dNd9wPasAqwsYBgXAEezV5JcuyCsNlJcRLpleck1ivKqRVS9qTYq7chhX67
7zJJyaxk2P6HkMf7e1EklplDkcYKafs8bcLN1NcWEabxJtz4y9R0IA1Uxu5MVfjVLIL/u7onNmlF
vKt3a1S5qrkNOg08eefSP9grwd2Oy7dfvygFDCXKpvzATcQkG5bEla6HW6pY5sJOtk1x1qrmmCQ6
RuvKdyl9KHgzNpg8KUUu+Z4kZ4Io3wDo5IVt6c5VnVsT0YZN5sG6azf7vyCMy5fjvI3ivAUw/UVv
CXH/GXxNCNQ5ahUG2+ZI5oZ/Ac9aNfV1XNsv2SuKuFbe8Bs+AT1Neek9dcNAEo9Wt1fn5v4LwkJj
SiEqYpg+1PBUkMxbum0t7WhIg6A8GwlSfFB8L6OSXgtXugO8K2gGCnF2ADFOPWWSWy/mfUJCO19w
YDHKlxd5G7bH7sBS/zAO8Zl/V5uUZP7zQhaUuDyjFIl2WWezd/biXYmBBc2E3R5f5eJwBiLLqfJP
ulUMHCigyGkt957tIvMbJNu532qnWCZ+7s5WRAvSvAoF2nw5wdoDAVR9ZGkJg6zo/NKUMEbJWeHs
3XmKjgwAfh9Taqd1stjfQkLzl+V4Pd5O+6bTTaGrSeU+cd5CG2k/mYGWXrGW5vBvU9y0Da+B0ZIY
+AjF3mBugMEvsObLnrxiYtqVXtnHvKXTw6fq+ehgwXP10Q/UvZUX3Kkuazvud5lJ6pv4vDG1gpVI
Q2BODY2sgUv+UB0M/7SBTegrq3VjSZ7p0Da4HO+pFBIs2DD6z+DotGYG/Aq/9FLMLOtcxVUNPfxE
B9Em1esw2JLA4KZR7kKcVeXVr0EZcT+wUWDFDeJmwLmI69IyJXT1KdRUc5+kLXyaikHRsQJu5F/N
0i5jWaNTCL+H7hw8iSiqSSi+gI0exR19JwqP7vsJVCWiPhw1rZF/nWBW0jN1FY5ZLHCkBWlUG98f
l+fypgufKaB6+KxIBH0hSob/VAi1bzTu/FdxHfSHULfqVFrxcqayKWJpqd4VkFVc0AYQtk25nYXW
D8cv5Mzdpby7ke/8BA6jhrIodNWHIAlPXleG5V7x+an85J3Xe2Cc3AjgXjysBqjeXtmcR6FibDX7
fh0FM6VzCLQBtFRBxdhS2etYrBtXMU9HyiFY03AJHPk+U608i//RK7e7XO/lrRM5Ya5cSWgyeJqE
3gZyhSGpm+o9DUc6bQ/OlvSnmRNZZM30/4S8vgAXkoJWNaDpelvTvnIGQKK8gnyIKFNL8Fe4KQEj
PovQn43F+NTfDUf5VkBZ2jtzXudZQ2UVvho+lmLPXT6LtHcAbde2ukCuW6mjUHhSI9qR3WB0woX/
X/4iz2a4FuwEzk7NZjm0stWAt7ark7boCNSRGb8Acr7nAlYKvCEriH46XMdlbNY60tKFaNqseDq+
i05pfx93/SnCzOxrGBdvOamrJrQqc+reyNcSl1/vXqFHbU7+e65qHiFAc5uhypqWnNEKnrhACdZc
Gs7lghJDRTXHtHSoZYhpdUUVbv+BCRKue84XSzT3Mk9Wsfq8v5gQEavjdeEZnx2B4zUKA9xUSpjT
daI+KskK1BOTkU3AER746qGQQ/Ec+C3HeSSnLHcEvqbKRIO+hPAPlfNFSn8DP/g3AaO76EaMsjVs
hHVnf5HsYy3q0L5vmUN0GW2XaT3LywRnmXgWPsO0yYfuSIQCLwkR4xk/GcP86/d7eVe+JLw/Db9j
i0iwAzmxVAecMcJ29N9onvM74k+LcJrZq89g/XlMbVukh0NhDn768fYC4lHeW043cConBv4h9af9
0F0+gCz+eAdU8aALVtOVGs4Tr9dpFOjGsh6FSkieVsk6V6s8ew0N6I/CkZApmgamRAeW129aTQvj
rUINSeWbZXQP5QyjxzmiRgFG8v1mSM2GpD1vllgQ4fDaHV/vCen717Kc8eJNjv6XwNPk0pwlwIo0
s14lJq/WRfWxYoyNwee2zYHE5gfl9a8Fm3ZyeZX4+HWY3k7xksjdl9ALIccHuGlVo8tZyN2PboxU
2kaL3dDpZy/9kdEXwY3uocd20LxNLk39hs0ay6flQeL3JUdQodMRhSl5NSGzpHLpXx+hn3mp2zFT
e8SxdB+WGge3pJuO/vcf2Yye6WSTzP3QjvyeMU6ME1l0lSryyOTylJaXUL98Zmigx4tJ0ovGZNJa
9BkHUPuf1sBmMkEp/dvjA6Fat6HXSqGezLgEOMO6PWgl7VDAGdFe0jXR790mC1/7I+nHTMGCHblS
eVECEOBlWoOR74aZ3ECOqa17EQ3kdVyGwJFAPPIp+vaN0/CTx6H/NsUnobwwJQszI1+ibYxra+zm
PizKpf/YDQPVGJagiwcz/bEyaa0cVNArqb6ypKnISK9Gi53obLnA0klxso+b2aa0Bg4clw+75s9L
IJ+yPXYXqxZCCJD5KVRHTNfE9XvLXuIzFlaWY+PXuCmDSsTMpGVbbP1/2pPLm0XlGrRDPK+uONqn
bb8P+nDNIsw5993tAXhIzy/a8I7OrwdnqTXbpWV7AYm6sCA/ylPBTaui0AvBwOzOKy14lIMQjda2
5Y3VD8Ps+CEbu/eZPgBPay/zb40dwswSqVgvPMf259dV0//zYNv1JwLkrbvTHVCk8/UBR5+N9L+p
cmvQSfkVpIw3fTr9e4ktGJSg4UjIuQc7W1RkZhathYwFHlXqcrUOcEq6DjRX3sGCN1hwG0MlIX1a
946W1riMXf6zezEKUBYBzSiMjIHJQDUBTnTICJnE/uH796NeeKAa2ZdvKtP2XCZp4Ho7X5YjklFf
TcwFUdeLXULk2fPHj8HN5lMLWejapzmhq5zNJPFLFHNOiBc8XOUMkh0LDY4fs7rwIi0iDbgvFNje
50OuzNwZVelKNYSSV9VRZvE3+wCjm9+wvjUSH2ZsetxHDlW9F0UYMOEHdafrdK2h/+hCAS/qTj2N
RWvCGOXHRMkGuymN0US6B1Ej/z4tmgxZggxO8bCBnCtA+/YOdpNb0wEBbj2AhvTFe+3BIr/BS4ie
kj6zvV3LtQ+EeOADbPo/1cxUhdu50YX4dorYHWSuif7SdQRUELo2UdAneJjxwYSzlebV3ZJ5IWi3
//Ls+CKiM2fEhuA5Pbwp2XbkdkFk5u0l1+ODH+QOofJYA2XknIIBK+mq0YvNjnhVSWn3CfqnvmUs
54NIGi63JLuitYKV5RyhGO2qG/OcZBk5IJEY/wpQHVjrE7CCsAkPbep0577+h9IhHChDOR6BacuJ
PwTtdWCAki8Egg0UIuqekzK58UucxwnVnxVpPynXLTpKlQ+vtQvUM1eJzWj6zieS1n6bYSCrX204
3xWwN5cCGRKIECMzdXI58MTGtGWfHpzSWsorFTtj2yiShhgJsxwJw/vYQU97ng5iqubJRleFMHnu
Cb2r8Jds5MQi7PlovjKDgBGTPhpyW0VAiJ0Fi5K72tWsrDqc1JHQP+dWApc7ViV8F1SP6CfAFeKY
9pd3vGbuzKphGTdyMZbSAcEI/yqRQjBbXyfNixoVvLVNyRXNcokPF3d9Odjvqyki/8mQSfkuqhs9
qRdB3RDIKIK/LuES+faSmVZPlXLBWdb2ueWGIl6qQG/k14Y08lB1irZcZKM311IdsEJH9Q5405En
0y/0KUycDZ+LQWcykfUEt1y8IzAvRIdiyOsXvgyJoMQnUY5+JgaUwj7ZGn/Jnc+bkt3Yf1yX37ra
dMOkYJ2wi9HIRyTEgnYSOmcnToTkBmEzxSKX2vJnyZB+/zdHyFfXvlr2frQLYUzeSNIzNDiyv+W6
7gqiQInfe1a/+qgsKqLnmNrhvH90De2cA5bYCxzB+mI6EFBNh4O8/emGaa1x5e3Ymgh5ucNlvBV7
KFBmhIdk03FoFW6HTvA5DWsK+y0Kpg/2YoKw1ixeRZNlHb/dQnat21WBnpeKOtqQW17hOqbb0Ki0
/6VoLKL6F7IyIohUqlHM5xlKA5k5XJ8CjhSbBDIJO91p+7W5pk0RaWG+8RfpsyL+xJsGmv3k7ZU2
9Ib7cRQZHQEstIKtESv9XtatqWMv//PtYbr2v7sIOLIWS5KtR7HpYqeYLadJZs5pnnOhgxx4N05x
aiEYXrko98wTPq0Ml9XbwjDN4UtbCppiUkKDNiNPJB9fygHoPjxt1C2CrbZsWrcitNJu2+g1XZaH
h6pK0weeucR/dRPY1EhEJRaUFiw5+5syWpXbDEdImtS79DVsJh1dTUeWV3HB2hAGzp56KMsBvT1G
wNVbJuCt+eRcKFYVdW6lfo0N7vCwCaxnT41a3oKlw0IawWoO9I2ed7errbIx4DfVwJmg5XizNSh6
E6/o5Xc2GoJX0FJgdJh2d9k9lLLVLn/qxxJ6KlT6C3YMVxbnAN+X315mGQUz8e/277lFyM5ME9qL
VdYsOdZMZst7+C9oRowKwy4dG/ohwrSshes6z3quOKVzOvo5mf9clbmq8A1EWgc3GTeox5UDaNjL
EITHZGlPn62WRVDJux3BzEVgcNzPP7oH7sH0rYiaJpu48j9vbOxL+fvfyIDs4O3KKPgK9fVF49NH
Lg3rZ03h3JbIMIUGO6MgPW8+XEsqjA08sqR9aJEccHCDUyoGG/VQ5SkuWgy03KzMUk68dkG/BFA3
a3dy6O+wCorMghHWypMKc1s1sskWHY4ff/7p/gCrKVqKXRcAd0uo/7dNWpi50thuEg39pdviz7hu
Hl23E67j754XvFOsVNHtnWl9EhQaUyMPa+gehzCBSQ5fsTluQbPfXokYrIDzEJvxa6r8OFpOURjN
P/rkEgjn2hWGLNCRQUYRYGQTHiD+i2yc0E2krYvHwEAM2aSvfd6ZjXkHIfSwKEwd1aujujdUmRvg
xnDznMsR/lmXiU5+PDY6eaJa/eiDkQeMFvBzLmEosd0bzg0pxDcw4Zg2rv/xXCpFKghFa6lLVoj9
Drw9OqeEyhfmSrwGrY7iQrzY3mzXPRSao1bOaB6JqhGr98QIu1P5aNV15wH5zIB8/Yjrk0DjGQqZ
r/Nk0G+LUpOA74MzX8cPdR/YpX+eaS/+ngreOg2yCO9087rfYtZZqdUibAGM2XQj3YIPCGlgEk+9
PQKjwQWFqqhoSD6bmOkrgf4Pn+BUn3mQFZGA5HphGD4BHAjbU/GWPD/JFNYmTMPn5+jBKudFXz9s
1g9gkkljUOImp+jBZHNBZP3iGYj2gOMMxXwJEZiEYv3spCQLDIE0cs2HcLQ0d0Miw91ELrxEptgy
YVcJs2SvzhuBM1AhSpdKLdg5EIAI9sLWsdxTpg7I5m1lsmwTDQpo/f36RnNOWRtPZNiIry0Hvfdm
X9Muw6r4mJNA2waV57xOyyfXQkXzkLLaqpTucM6GSjp6Vv11R+XZ8qMnVyOYjTnEL8hW+c/e4iBP
JAtB4jmVnQh3Slf7WmPHkSq04k9/xUwpci4tYz/fRygtuNGODCBo5PpHr8Q6HTwLMEXVqHM2YEBv
Ed1w63zUPWNhJzqRr3V2kPvbfH/GIcAREJSN8MbqhPx11NRmGVI2+yMg73KwMQ5uNKsahrbYx/GS
JETuG+rtd3pX14hSGsiQQmFnyhTTR6zO62fSAR4+Y7AYpSgI/u8b5bjyj7h67xpB3vigfb6n0qW9
SfSDwEpTL5lAWyBbGVQRdnZ0MJ34yvocOQZY/aylBstpmnbBVaJjlOjXK/asho92cpC8/bcHjBsZ
lsimnLS+QP6ufnB4LEDue4BMacJq/iVsCkC0Nb+ZHALcLFuk/j4suqnRymogyAC1zOY3rngA2r4A
uYUtodBenEDlL1mRFDNW2dCK7PKcBA4S8XMkjk8di3svHaiztQ1UrvX66bYybdtlKIznunVcdh8P
OUZ5WaAqZm+gK4CyAZ+KP2Scsh5T45YfDwTNC2pg6Aiwz7Fzx2p7HDrDnL7ks7En56ZxHtJxv3zj
ny/uI80cNf0PG8u88tTTX/3WVsduGuXrQaKrZBfI6GVxPUnydROIiqd5gMCrGMsNHtLuBtrEiCRH
JfQAHaQRD7GozlixtgRwGyCpyZiOapPftV+wHZQ78D+TitlpfM0FWwr7ozPFAQtN+vYEkEVm+Hhb
1U55k+V+5WWPEwdYfz/PGenJAx2CGEXyAPHxIbRo//2UhzVJJiv/21slt2xVlLKjpb0gRXtAIHfc
EHh1IgBz3R6PEzbrF4Cm55TIbAYMiV4XVGJvx3Z3YoQyC2sdfchKgztAevCJI8vVAVVTszulkbHz
WnOssBvzvpjOX5ckLLkb6bfjJtT2JsaPS47K3BbW60XSdiMMYzZa4aCU/NO1mzSnrVIyykOChX9m
rUezcc2ZVwqQ/BmG/mb3hbsarf0AhNvnRFCFcnZlB+R7k3uPs9oRYdFaMKFRH7rKD8w7w3r+CJR2
Af4ZCym+jT5WKQaSXBspkgydqxGyJOvO6llAA+eWI9+asF6MUFM1w8o7LqJXhy/ysQs3h0mFKWtA
xdBGEja7ud3QMMh7Fv5cqw7ZCiezouKcBLAbh1qPrm7X7NaYoRSlj7vOJTdCa7l/ZAPMI7id9JvS
Y4828Uto3gJdBCZFeGuXTY+SlulQYyeY7vIQnOR4ilB1SSHCpxN+AUopt2pNOo8VEBihAI+FTJwW
kLRvW6IfgwUCCboOmRbLqY8XfNA+mEgaDkMx1HfZoJnIoYkzFGeTi9r2x2HYv5fu9u6UZE/incWv
KRzCwIpRSufaqVrn4WhQI5wPSDHWqCvump0M1BK36TWrsiwnl9rbKF9ZnzzK2zBgJrER31ZnPp+a
MhrC18QuliqxSM7t76+W2BNEfhAoS++dfZHW7TJGOrZ6xzqnkvRcLONaN0M7n5d9q89JvqsEGr9R
zrSHjx1lUp9adHdOP1fLdg5eRdiUGguZb1qJJBOZ3vfhkkmIiIxbTqOoLvFSGMmu7rD5szSgLYUC
a0UHBDrJW9j6A4aIk08llY3SF7tnxJnu+hQ0IwlXr4IlybdDKSvHn2lK+ICfzHFS9vn+bGNV8U30
5vYI/RIrZfMniRhcd0KTuFPhSLQcmabmd/zlRJkx0vrdANXRt6HbS3xraKwuhJVcZ97KzwHtQJUG
dD4AhBGAXq4HNws4GmiO5Kz34ZXlx+kWVw74nUS65Y3UTy9H4eEE+JHiPLBJnglwUU/uDjjBE6bE
tcDGNlWLqmRm43YjI6EGmo2HWHISQvoxRXuG0T8wkj1SFr8KnKwjM5hIhueEf9QUei/pKpsDzdj8
hXI4/vDGYKq6hpkkVDST8ruF9hmfwtfgsbe8MThUVDf/9G3T7iz3aFtS0H22kM9prQfQeUipJiIa
uEPtB9+8i1kXKCzBXSQBVffYM15YrT81LHmRiCt/mtH1X7o2XKwDxrqtmC1+5OC4DY6NLU08zfet
0p+y4JUV+1JBztWv9ZDcNzqX7H64P1uFS/7vExMIqBOeXOyQ1fciylV2suKIxvZnnRTW5VJQfMBl
1il//DuUmDqb2XtAnCi7j1Fic4w7R0d00aLXU5fJx225HOFhD3+pTIUp69O4+mTMdrWqxHeIlDaT
Pp0HC+1ctXvq6EiO1TZk/+7GzF44Wv8F2drSnyGNe4mGq0oKX14KV4MHNUpGw9WJr4oz/pzDked+
SvYiNFXmwFf3m9mIiwsv5ZP3MpjPNjYklAcqW0DDS89kvaysjNumVMGVT5pPDAGduP17zxcWv9O+
cdCeDUUyETN1rrhEamue3yQwUHMKH0sjnsnWgncCjBBwVwlFAG1mLGKu0ISVaE3nLq7vM8MvRqZx
phb073x7qBCrsxzk53KMLAX9FXnpJatHrWHpBn+CjKuzH9MCzEtOzVL8EAKw8qxDKG/bdFu+Fb1j
qzKGGDk+SXBR1Jm4DwW/v72mWdaDs9SasR/A5M78icuL4wFYpQqLXyJk/Ldl9AXZR5bZSjXOjVnk
IBASDSEn/5rL+vRq7W+3CqKnb8rQEcNbUOdHwBl3P3NpFr8ah6/n69Gmo00xltVQPBNwvRtSuWh0
0jw9S0vgM/9RXcc/MCbdwnC4E4BOPN7or5+yQFHoGlvBMTx66IN1nEHw5bwBAAGxy/2dETePWMWS
3KFItpT2UjH8i3UCat/TlHSJ3bg6C4Z78s1UQEmOiGofm+HSl11YxpZqkyP2hCtw/e+GMHp7Jl33
gG3DUCA4KJ6695WznDdAfjePBz7HncsjtnsopYGp/U5KNL+Jnati45ekTyfGbHOA1qnWjXb0q9JZ
YCsS6b3xpcF2X9WGyrqksKLdK6T75eITrk3t02scrnAJ6a5CokhM+G5pkpqR15wNnnVRo3Oucs+V
8QlU3/vaVJXv++lOkZLk4EOmQmyzhHrCvJRsHmpdTFxCyGp2iQ0rwQvnGNZPLym+WPs1RtM8vpEE
7q5aPffSN6o4NradRHGflMk4IHSPu/FNYC8nxECFSlnjRKnnaVuNXkctiIFqnpBpkrDjG5Qj1UUa
9HSbxOVHg5zYky/VdznxZto6YoGI/8AkfrLnnKhWvNGSdkuYwQxQTwQ6QKugloZUSZMVlZvPz43c
Tw26YojYEGALi3aXjWUSEzOB15lKf1KfSvf9Gk/MzLQk4cQe0V2/kuQmT6YYguDGFM5Rgq5oMMWj
iJmv5Yu548NHcJHnpdQwU2i/QA5kBC9/XAg1bt1tL2y8r+s4/gYXCuKh6DRNQ+Tb71SZQ6+IhYBc
wvZoTjr+7Q5yq7ONcDF4uaP+PkS0IIs4LhHC6uMdTvJ2UsUll1SOweWACu7dYbVNqIUoJJJLMzP+
g7fHbyZjN0boAoy+jhv/uaFuJzDAsACz+k5JVdOO6cMrZne/e3OOnIkjErWJkO1uBilOtq2J1NbY
z+TvMEARq1e+36kyInkTCo0fIiLuHyktTXauXyJ6y7HVKalhrIfuLRxXTL7vW9zDiHDvIjXOUgtX
nN61MV6WA8bqAiDYXzpzd/QjvxmuuMmNlqIVHK34MrlcnUrTZgAJiYXGgQ7bNEX2BKkOY7rAJWU7
b1ULSBXJ57vsCdLj94M1xSLk9IG7yNkFJwu4rna6DTkpwiGBOc32v6objBYfS6TXC4QTVCPf+K48
LXLoK8bk08SI4bl9dWo5Y7krVxz1HFnB/C974Tl8Yit7G7vpkGm502DfhhVQMqL0+z0vVD6Wksou
JNox86xwUIDMdJwlHtD8eOvELWEWCeCfL7MPipGIL3MfQZksecbWgLMD19ZiF/8siEpSVmSO+Vcg
FbZwkYetpVxIsIm9NLfYijnq0WZyh0Qy/7ebX0ctSQPzp+8oBuhPf//VqJHWDZxM4+X5366uZ3kC
N0/R+nrGJQUQAiBILXqWIlOnSGU0551AsMFfhpOiIQvM8pejAF53Q8di/e5J+5S9IXxn5AXjmhZd
r88K6f53ba0dMMRN9VH7/Vu7TU81KBEPlB7gMqCKYC39D2z3oZJo6RXSN+uxBrFov2zBy6UNs6YX
P5kQoh0u0oAGDUOFkNG93jRSxTmkMVfICQPmPWg6vR4RJOEdl6csdl+75/gy2oaEQ8XbKc8cfrlu
4/UK1Nlr4oNbymWKymXaFGMbtS++cj4RuURTpV9j2x6//xGLp2ShGxke/33+DOD7lZVWIVIRUzfd
xktqVYcf9rGgy+LwDIYI1Xgb6NmDZdrUKNXiSNtAGc3JnB+vLV/KNwHnEki+uilE/DSk55r00Md+
T//Q0iFT5Boey9lxzPYS/S/DdEG0lH575xtBHI158cqcBeaByE1RxNQRQaqxaXjOCV998iCRsZwx
e2LI49YQJq31s4rz+mHZhqmdtoyNMTbH1mPQW3u0K69Jv1E10/05dSv3COOTFYPjw3ZUETt3g/a3
n/SOksAHhuWBb/Z2v9dA5f6F4VyrPSggzHbYR5Cd/zI/kbOZpt9RXuEx+NcKIh1U7p6iIw0oz/gK
dqq3wzwBViBUqsEMfVcYaZX/46vDS+twd5DOdyVN5VDZ6ZAHwkMHBpW8FL1sYvfcWqdFZcqtDgwr
4yRCmhWfSH525/6iBQes/2TS3Q/6rNkfUxWDqF2aVvTAYR1FeiYUCCMvh4IEntrf19NpD4k+duuU
xb45TEbTvpAv3BO03MCzFROjwXMj+8VxU/mEMdU46UyTTIsxgoELaP8FZBcUIH2HlaIza3wV95La
3maI9cRPpH/46LIplQvsf44ESpFZrWioGoHyTlhRpOdJgpDYZ8cWQzNCHHIIyJMkPVE+WonL9gPF
SgBmI2JI/TXrKNrs7EM+bUQjIlXP6lC8ZSYHE2wqPzH056plWnTVDN8u6QHv/+C01BrTE2mliQZa
CZ+MQiuHgME4BA5Z/Q7BIisGbCMOdG7p+aecfcaD7nnxuBiM1ISbMDIim9CBFm+bz26P6JFNLpD/
AHtWTrtYUkWUfJ2VVCww9nVSGAxhxEqDyW9hD8rAADPK9EdbmU8dbdqPQUbCSjCziL6GlCilJqz0
rAy+VQ4si+YEwUl9Hknj99PrZI1m6f0t6UhtTG4xNzTvs3YQppoxGFpD8T3bjljnbObZ89Y8CkCU
lvTVsNEpSF4b+1z/8vf3pRzxZahN/MnQfXprCNnj16DDXJ5R6AqurnBZebFwFlC/npll6DGw6scu
j7eQt7fMQM9PUZ30sWl83vwPGRgFMenL4+vSmpoHTvjWasWZm4bQsLsLZ+finOWif4HZEMhN45MF
oqCaWGVJWHKN7lLwzgtDK0FMIcdgT93SdmNnPzow/K6H0KqwU7/2nKrACRjGdDkWDGGlrPyPKDoy
hxSSkP49o5wYRwbfzhSq9PvWNoEdZX2OzxrN+2ZgsHRxQkJ0LImdWra3MWV+eZm4qZe7BJxLot+B
lg2Jqk8qmGK6S7V404rVJIU1ztQjrJmOj75oo6h20DcZAvuMBVZDr6o00OP3XlENmH+PsdgvkF1l
IBC9vbWEILxqFKlpXGAlityMbOW6Ryn6CGflt24/MlzuJgUOKj6K6VRAlfThstBd2b+JCnU4L5lT
jfNPIbEjuLexR06TeD+uApwKA+vx56/An1Dszbhd58CJBM/dv2kZ91toUn/O29xbInnAbjuNxMeU
H1i+cLopRpX7jnDT7EUNL1wSH/kiv8o/biRtjIGNKs+Oy/bnP16JjhjltU/KQCWrXKYLDz6QIUj5
pNq0e6ecBLZhPYwkvGUCQPnLjVfk1tRD/VdZMb2Dx+8re04nUisfDSrRqomHYd9kZtKQho/TCmK3
PpE4fhCymuEGfNCTtfI8ifXp8CG+435QI2WoOgioex/P7m+VnmSfKVPxh+r+cQO59bFV/v9tX8pm
oin78iVudgv+6WQg5c/5Qbjd2JxnD5wktCIMyBEFhvyrzXJfNKNfB1ByqFzNrUxUOe9uxqNSarjZ
8IAzYamGv0jGcCCvSaBe3HeBeKpQJ2kdaNyaJID3TAkL/f01Pp1YDfD49IScEyqkBMJ8FM1yV2Aq
8y3Sxwu6YBr6ry4opXWh3qt0kXbTVR06hNTylrW6UXkzkEkD3gXx68YbibFFQuWvfwO7Ivh+FJuV
HOo/+T3IkMNRHpOVwIYfYDz/QmGuxhq1GrIUN90KRM5Sx57afy+oI01tpiMNTCzz/q7f5IZ2qw6T
pPqJ+NKXF+0DrPO8TJCe0tIY/Hwz8IxEahLDT8LzQaotHT3fcUQubAMorjApUmwgY+vBe4s+jMq/
yxZjOYUNKa+ocs/FsnEVg1BOhijS8XYtadxndiUy9M816y6egYGpX5Ng9z/HeER6f4ej/NfbMfXd
nzEfkvSx7lWFlVDvblICkxuCwae3AKWI9cx/oY+jmKiYH1Yd39nJgJqnHGbtxm3S8CPCwnhdNTOM
3BbWX9c3kpWJoijHN5kVnnPhTMtZIrsvQhs5A6KBXpOOfE/gdBCwnlt3poslnhmXnCwfsQRz5xjq
VcUip0t6A06I/b1yakG8YBpE16F4mhTnqVDJOfDEFTw/VWmOxd0Ufvhng3obpfnM7f5y4gldurFA
GTXoLNv8ES+XSxsG3k60SRbQZEPcx+O/2Jg6dfwjlbAUNiaHwRymOkwN/Z6hpcVq12o1K0fzfYGW
hTfnKDo+f9QNss0fLrg5UXAGBt5ENfPMS5S0IQdBBAW7MdhMRYRn4TTTLrRwtey+Snc9LJN9LbIX
yR0ouxV/04OZbWCT1Dj3QHAxKLU3fHMaOovKAsU0MCS/GJDkdAIjP1V/PrnbAxZ3iBn5iaeu4yd5
fBF4jA97G5iXtPhs7QXn2svVToMGElHJRShmmb+9Vg+GRJd39LVoSv9uea66imoDTSe9yQFaATVI
JV194QeNBIbSlsxW6GX3cJyEWR58kw62HnjZH19ydMdYHjgE/5lN3iN5UOm18UKEtsnOsuNjBRZq
4XY4QmjRxXo+/ZyUes0r0jGBc2/QPTChCQPu+e3vpEBYJfBR0Kbps7nRZOv+OgEWUWmEMD7tEQos
wtwaOj+LOSYCv/9QAWUqg40Vgt3sRsFbX2M9RULqI03fZ2Xv/RhMvOengTAzUXh7kss9Df0EWfgS
WMCBwdvXW5bbOYWBCUz48hbIq2wsNoDVWFxVS8goAJ+fcc6HZ+6QyFt15nQqC41MkBr+x9whOGP/
ye15COnCEN4bgIsmsKGey9wVfpZlApUIOqMnmBKbY6jgWAMnFYP7Ca+ocx5cYAOWdeIQpGC8hlit
yKrMP/14asel6Oi765jQqwewwq2QCqKXbPaR/c1tBhHC5Cd/BulJAL4EQXn3PryFVpshePgMHzZr
mDYpTwZM8NcI6ANRIRhxVFPj6wlWtV7yR1Z73KNwNyTD+qWMu1Z3svXkjCXn5JdUwKwQHNpEL8Rl
O/Au9CH5C5YuzbEHzOFl4lQAfRFU8fY2toOVcVQzpLQj6kN4yc2aOcvP0nHzt0d3IMSYcpw8ClTm
QwBiKMQpWFJw3oEYGrHRMNyvJnA093ImU4NBiUJ4MVg0N0LaQiOKBpwkKxKWCdXlJVQiBTJZUbLN
ec0UYfkgadmQjhWsJ4Vw/9glHrjJwqlhsW7czzyU6zEsYCr2QMClaewow/GuoJ+s2eAt/Zf0q/oR
f98/lHQH7FCPMdzLZJJBKWOCy0EyCXiEYBL3wEACYHTILIyhfeCEd1gg9j/nQNJtvXEjaYa5kluP
nvIHXzZ+sqkMeG3A8Xdy3uac743uofYZXqEBdoKknYPkQXbNgmrfY6I3YM8BelrS7kBhsmfhVQO5
Pt4d9PPvWNL/TTF5dPaPaXiL4Vzg+p4BV6e/KxFwpw66dKcN0IAjKT1YypCq+zmT3fgzUMCgcDMY
MogyGzmBuNmLJyW10slHqFWkmAg8VQddOiAEY4Bm8x/wveKrxBCcNVa2YA==
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
