
create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list {B64_C[1].serdes_clock/inst/clk_out2_62p5}]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 12 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {adc_par_data[5][0]} {adc_par_data[5][1]} {adc_par_data[5][2]} {adc_par_data[5][3]} {adc_par_data[5][4]} {adc_par_data[5][5]} {adc_par_data[5][6]} {adc_par_data[5][7]} {adc_par_data[5][8]} {adc_par_data[5][9]} {adc_par_data[5][10]} {adc_par_data[5][11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 12 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {adc_par_data[3][0]} {adc_par_data[3][1]} {adc_par_data[3][2]} {adc_par_data[3][3]} {adc_par_data[3][4]} {adc_par_data[3][5]} {adc_par_data[3][6]} {adc_par_data[3][7]} {adc_par_data[3][8]} {adc_par_data[3][9]} {adc_par_data[3][10]} {adc_par_data[3][11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 12 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {adc_par_data[6][0]} {adc_par_data[6][1]} {adc_par_data[6][2]} {adc_par_data[6][3]} {adc_par_data[6][4]} {adc_par_data[6][5]} {adc_par_data[6][6]} {adc_par_data[6][7]} {adc_par_data[6][8]} {adc_par_data[6][9]} {adc_par_data[6][10]} {adc_par_data[6][11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 12 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {adc_par_data[8][0]} {adc_par_data[8][1]} {adc_par_data[8][2]} {adc_par_data[8][3]} {adc_par_data[8][4]} {adc_par_data[8][5]} {adc_par_data[8][6]} {adc_par_data[8][7]} {adc_par_data[8][8]} {adc_par_data[8][9]} {adc_par_data[8][10]} {adc_par_data[8][11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 12 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {adc_par_data[4][0]} {adc_par_data[4][1]} {adc_par_data[4][2]} {adc_par_data[4][3]} {adc_par_data[4][4]} {adc_par_data[4][5]} {adc_par_data[4][6]} {adc_par_data[4][7]} {adc_par_data[4][8]} {adc_par_data[4][9]} {adc_par_data[4][10]} {adc_par_data[4][11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 12 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {adc_par_data[7][0]} {adc_par_data[7][1]} {adc_par_data[7][2]} {adc_par_data[7][3]} {adc_par_data[7][4]} {adc_par_data[7][5]} {adc_par_data[7][6]} {adc_par_data[7][7]} {adc_par_data[7][8]} {adc_par_data[7][9]} {adc_par_data[7][10]} {adc_par_data[7][11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 12 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {adc_par_data[9][0]} {adc_par_data[9][1]} {adc_par_data[9][2]} {adc_par_data[9][3]} {adc_par_data[9][4]} {adc_par_data[9][5]} {adc_par_data[9][6]} {adc_par_data[9][7]} {adc_par_data[9][8]} {adc_par_data[9][9]} {adc_par_data[9][10]} {adc_par_data[9][11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 12 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {adc_par_data[0][0]} {adc_par_data[0][1]} {adc_par_data[0][2]} {adc_par_data[0][3]} {adc_par_data[0][4]} {adc_par_data[0][5]} {adc_par_data[0][6]} {adc_par_data[0][7]} {adc_par_data[0][8]} {adc_par_data[0][9]} {adc_par_data[0][10]} {adc_par_data[0][11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 12 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {adc_par_data[14][0]} {adc_par_data[14][1]} {adc_par_data[14][2]} {adc_par_data[14][3]} {adc_par_data[14][4]} {adc_par_data[14][5]} {adc_par_data[14][6]} {adc_par_data[14][7]} {adc_par_data[14][8]} {adc_par_data[14][9]} {adc_par_data[14][10]} {adc_par_data[14][11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 12 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {adc_par_data[10][0]} {adc_par_data[10][1]} {adc_par_data[10][2]} {adc_par_data[10][3]} {adc_par_data[10][4]} {adc_par_data[10][5]} {adc_par_data[10][6]} {adc_par_data[10][7]} {adc_par_data[10][8]} {adc_par_data[10][9]} {adc_par_data[10][10]} {adc_par_data[10][11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 12 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {adc_par_data[12][0]} {adc_par_data[12][1]} {adc_par_data[12][2]} {adc_par_data[12][3]} {adc_par_data[12][4]} {adc_par_data[12][5]} {adc_par_data[12][6]} {adc_par_data[12][7]} {adc_par_data[12][8]} {adc_par_data[12][9]} {adc_par_data[12][10]} {adc_par_data[12][11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 12 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {adc_par_data[1][0]} {adc_par_data[1][1]} {adc_par_data[1][2]} {adc_par_data[1][3]} {adc_par_data[1][4]} {adc_par_data[1][5]} {adc_par_data[1][6]} {adc_par_data[1][7]} {adc_par_data[1][8]} {adc_par_data[1][9]} {adc_par_data[1][10]} {adc_par_data[1][11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 12 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {adc_par_data[13][0]} {adc_par_data[13][1]} {adc_par_data[13][2]} {adc_par_data[13][3]} {adc_par_data[13][4]} {adc_par_data[13][5]} {adc_par_data[13][6]} {adc_par_data[13][7]} {adc_par_data[13][8]} {adc_par_data[13][9]} {adc_par_data[13][10]} {adc_par_data[13][11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 12 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {adc_par_data[2][0]} {adc_par_data[2][1]} {adc_par_data[2][2]} {adc_par_data[2][3]} {adc_par_data[2][4]} {adc_par_data[2][5]} {adc_par_data[2][6]} {adc_par_data[2][7]} {adc_par_data[2][8]} {adc_par_data[2][9]} {adc_par_data[2][10]} {adc_par_data[2][11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 12 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {adc_par_data[15][0]} {adc_par_data[15][1]} {adc_par_data[15][2]} {adc_par_data[15][3]} {adc_par_data[15][4]} {adc_par_data[15][5]} {adc_par_data[15][6]} {adc_par_data[15][7]} {adc_par_data[15][8]} {adc_par_data[15][9]} {adc_par_data[15][10]} {adc_par_data[15][11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 12 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {adc_par_data[11][0]} {adc_par_data[11][1]} {adc_par_data[11][2]} {adc_par_data[11][3]} {adc_par_data[11][4]} {adc_par_data[11][5]} {adc_par_data[11][6]} {adc_par_data[11][7]} {adc_par_data[11][8]} {adc_par_data[11][9]} {adc_par_data[11][10]} {adc_par_data[11][11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list trigger_external]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list {B64_C[2].serdes_clock/inst/clk_out2_62p5}]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 12 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {adc_par_data[19][0]} {adc_par_data[19][1]} {adc_par_data[19][2]} {adc_par_data[19][3]} {adc_par_data[19][4]} {adc_par_data[19][5]} {adc_par_data[19][6]} {adc_par_data[19][7]} {adc_par_data[19][8]} {adc_par_data[19][9]} {adc_par_data[19][10]} {adc_par_data[19][11]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 12 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {adc_par_data[17][0]} {adc_par_data[17][1]} {adc_par_data[17][2]} {adc_par_data[17][3]} {adc_par_data[17][4]} {adc_par_data[17][5]} {adc_par_data[17][6]} {adc_par_data[17][7]} {adc_par_data[17][8]} {adc_par_data[17][9]} {adc_par_data[17][10]} {adc_par_data[17][11]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 12 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {adc_par_data[18][0]} {adc_par_data[18][1]} {adc_par_data[18][2]} {adc_par_data[18][3]} {adc_par_data[18][4]} {adc_par_data[18][5]} {adc_par_data[18][6]} {adc_par_data[18][7]} {adc_par_data[18][8]} {adc_par_data[18][9]} {adc_par_data[18][10]} {adc_par_data[18][11]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 12 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {adc_par_data[16][0]} {adc_par_data[16][1]} {adc_par_data[16][2]} {adc_par_data[16][3]} {adc_par_data[16][4]} {adc_par_data[16][5]} {adc_par_data[16][6]} {adc_par_data[16][7]} {adc_par_data[16][8]} {adc_par_data[16][9]} {adc_par_data[16][10]} {adc_par_data[16][11]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 12 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list {adc_par_data[22][0]} {adc_par_data[22][1]} {adc_par_data[22][2]} {adc_par_data[22][3]} {adc_par_data[22][4]} {adc_par_data[22][5]} {adc_par_data[22][6]} {adc_par_data[22][7]} {adc_par_data[22][8]} {adc_par_data[22][9]} {adc_par_data[22][10]} {adc_par_data[22][11]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 12 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list {adc_par_data[23][0]} {adc_par_data[23][1]} {adc_par_data[23][2]} {adc_par_data[23][3]} {adc_par_data[23][4]} {adc_par_data[23][5]} {adc_par_data[23][6]} {adc_par_data[23][7]} {adc_par_data[23][8]} {adc_par_data[23][9]} {adc_par_data[23][10]} {adc_par_data[23][11]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 12 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list {adc_par_data[20][0]} {adc_par_data[20][1]} {adc_par_data[20][2]} {adc_par_data[20][3]} {adc_par_data[20][4]} {adc_par_data[20][5]} {adc_par_data[20][6]} {adc_par_data[20][7]} {adc_par_data[20][8]} {adc_par_data[20][9]} {adc_par_data[20][10]} {adc_par_data[20][11]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 12 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list {adc_par_data[21][0]} {adc_par_data[21][1]} {adc_par_data[21][2]} {adc_par_data[21][3]} {adc_par_data[21][4]} {adc_par_data[21][5]} {adc_par_data[21][6]} {adc_par_data[21][7]} {adc_par_data[21][8]} {adc_par_data[21][9]} {adc_par_data[21][10]} {adc_par_data[21][11]}]]
create_debug_core u_ila_2 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_2]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_2]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_2]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_2]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_2]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_2]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_2]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_2]
set_property port_width 1 [get_debug_ports u_ila_2/clk]
connect_debug_port u_ila_2/clk [get_nets [list {B64_C[3].serdes_clock/inst/clk_out2_62p5}]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe0]
set_property port_width 12 [get_debug_ports u_ila_2/probe0]
connect_debug_port u_ila_2/probe0 [get_nets [list {adc_par_data[38][0]} {adc_par_data[38][1]} {adc_par_data[38][2]} {adc_par_data[38][3]} {adc_par_data[38][4]} {adc_par_data[38][5]} {adc_par_data[38][6]} {adc_par_data[38][7]} {adc_par_data[38][8]} {adc_par_data[38][9]} {adc_par_data[38][10]} {adc_par_data[38][11]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe1]
set_property port_width 12 [get_debug_ports u_ila_2/probe1]
connect_debug_port u_ila_2/probe1 [get_nets [list {adc_par_data[35][0]} {adc_par_data[35][1]} {adc_par_data[35][2]} {adc_par_data[35][3]} {adc_par_data[35][4]} {adc_par_data[35][5]} {adc_par_data[35][6]} {adc_par_data[35][7]} {adc_par_data[35][8]} {adc_par_data[35][9]} {adc_par_data[35][10]} {adc_par_data[35][11]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe2]
set_property port_width 12 [get_debug_ports u_ila_2/probe2]
connect_debug_port u_ila_2/probe2 [get_nets [list {adc_par_data[37][0]} {adc_par_data[37][1]} {adc_par_data[37][2]} {adc_par_data[37][3]} {adc_par_data[37][4]} {adc_par_data[37][5]} {adc_par_data[37][6]} {adc_par_data[37][7]} {adc_par_data[37][8]} {adc_par_data[37][9]} {adc_par_data[37][10]} {adc_par_data[37][11]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe3]
set_property port_width 12 [get_debug_ports u_ila_2/probe3]
connect_debug_port u_ila_2/probe3 [get_nets [list {adc_par_data[36][0]} {adc_par_data[36][1]} {adc_par_data[36][2]} {adc_par_data[36][3]} {adc_par_data[36][4]} {adc_par_data[36][5]} {adc_par_data[36][6]} {adc_par_data[36][7]} {adc_par_data[36][8]} {adc_par_data[36][9]} {adc_par_data[36][10]} {adc_par_data[36][11]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe4]
set_property port_width 12 [get_debug_ports u_ila_2/probe4]
connect_debug_port u_ila_2/probe4 [get_nets [list {adc_par_data[39][0]} {adc_par_data[39][1]} {adc_par_data[39][2]} {adc_par_data[39][3]} {adc_par_data[39][4]} {adc_par_data[39][5]} {adc_par_data[39][6]} {adc_par_data[39][7]} {adc_par_data[39][8]} {adc_par_data[39][9]} {adc_par_data[39][10]} {adc_par_data[39][11]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe5]
set_property port_width 12 [get_debug_ports u_ila_2/probe5]
connect_debug_port u_ila_2/probe5 [get_nets [list {adc_par_data[34][0]} {adc_par_data[34][1]} {adc_par_data[34][2]} {adc_par_data[34][3]} {adc_par_data[34][4]} {adc_par_data[34][5]} {adc_par_data[34][6]} {adc_par_data[34][7]} {adc_par_data[34][8]} {adc_par_data[34][9]} {adc_par_data[34][10]} {adc_par_data[34][11]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe6]
set_property port_width 12 [get_debug_ports u_ila_2/probe6]
connect_debug_port u_ila_2/probe6 [get_nets [list {adc_par_data[28][0]} {adc_par_data[28][1]} {adc_par_data[28][2]} {adc_par_data[28][3]} {adc_par_data[28][4]} {adc_par_data[28][5]} {adc_par_data[28][6]} {adc_par_data[28][7]} {adc_par_data[28][8]} {adc_par_data[28][9]} {adc_par_data[28][10]} {adc_par_data[28][11]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe7]
set_property port_width 12 [get_debug_ports u_ila_2/probe7]
connect_debug_port u_ila_2/probe7 [get_nets [list {adc_par_data[30][0]} {adc_par_data[30][1]} {adc_par_data[30][2]} {adc_par_data[30][3]} {adc_par_data[30][4]} {adc_par_data[30][5]} {adc_par_data[30][6]} {adc_par_data[30][7]} {adc_par_data[30][8]} {adc_par_data[30][9]} {adc_par_data[30][10]} {adc_par_data[30][11]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe8]
set_property port_width 12 [get_debug_ports u_ila_2/probe8]
connect_debug_port u_ila_2/probe8 [get_nets [list {adc_par_data[32][0]} {adc_par_data[32][1]} {adc_par_data[32][2]} {adc_par_data[32][3]} {adc_par_data[32][4]} {adc_par_data[32][5]} {adc_par_data[32][6]} {adc_par_data[32][7]} {adc_par_data[32][8]} {adc_par_data[32][9]} {adc_par_data[32][10]} {adc_par_data[32][11]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe9]
set_property port_width 12 [get_debug_ports u_ila_2/probe9]
connect_debug_port u_ila_2/probe9 [get_nets [list {adc_par_data[33][0]} {adc_par_data[33][1]} {adc_par_data[33][2]} {adc_par_data[33][3]} {adc_par_data[33][4]} {adc_par_data[33][5]} {adc_par_data[33][6]} {adc_par_data[33][7]} {adc_par_data[33][8]} {adc_par_data[33][9]} {adc_par_data[33][10]} {adc_par_data[33][11]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe10]
set_property port_width 12 [get_debug_ports u_ila_2/probe10]
connect_debug_port u_ila_2/probe10 [get_nets [list {adc_par_data[29][0]} {adc_par_data[29][1]} {adc_par_data[29][2]} {adc_par_data[29][3]} {adc_par_data[29][4]} {adc_par_data[29][5]} {adc_par_data[29][6]} {adc_par_data[29][7]} {adc_par_data[29][8]} {adc_par_data[29][9]} {adc_par_data[29][10]} {adc_par_data[29][11]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe11]
set_property port_width 12 [get_debug_ports u_ila_2/probe11]
connect_debug_port u_ila_2/probe11 [get_nets [list {adc_par_data[27][0]} {adc_par_data[27][1]} {adc_par_data[27][2]} {adc_par_data[27][3]} {adc_par_data[27][4]} {adc_par_data[27][5]} {adc_par_data[27][6]} {adc_par_data[27][7]} {adc_par_data[27][8]} {adc_par_data[27][9]} {adc_par_data[27][10]} {adc_par_data[27][11]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe12]
set_property port_width 12 [get_debug_ports u_ila_2/probe12]
connect_debug_port u_ila_2/probe12 [get_nets [list {adc_par_data[26][0]} {adc_par_data[26][1]} {adc_par_data[26][2]} {adc_par_data[26][3]} {adc_par_data[26][4]} {adc_par_data[26][5]} {adc_par_data[26][6]} {adc_par_data[26][7]} {adc_par_data[26][8]} {adc_par_data[26][9]} {adc_par_data[26][10]} {adc_par_data[26][11]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe13]
set_property port_width 12 [get_debug_ports u_ila_2/probe13]
connect_debug_port u_ila_2/probe13 [get_nets [list {adc_par_data[25][0]} {adc_par_data[25][1]} {adc_par_data[25][2]} {adc_par_data[25][3]} {adc_par_data[25][4]} {adc_par_data[25][5]} {adc_par_data[25][6]} {adc_par_data[25][7]} {adc_par_data[25][8]} {adc_par_data[25][9]} {adc_par_data[25][10]} {adc_par_data[25][11]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe14]
set_property port_width 12 [get_debug_ports u_ila_2/probe14]
connect_debug_port u_ila_2/probe14 [get_nets [list {adc_par_data[24][0]} {adc_par_data[24][1]} {adc_par_data[24][2]} {adc_par_data[24][3]} {adc_par_data[24][4]} {adc_par_data[24][5]} {adc_par_data[24][6]} {adc_par_data[24][7]} {adc_par_data[24][8]} {adc_par_data[24][9]} {adc_par_data[24][10]} {adc_par_data[24][11]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe15]
set_property port_width 12 [get_debug_ports u_ila_2/probe15]
connect_debug_port u_ila_2/probe15 [get_nets [list {adc_par_data[31][0]} {adc_par_data[31][1]} {adc_par_data[31][2]} {adc_par_data[31][3]} {adc_par_data[31][4]} {adc_par_data[31][5]} {adc_par_data[31][6]} {adc_par_data[31][7]} {adc_par_data[31][8]} {adc_par_data[31][9]} {adc_par_data[31][10]} {adc_par_data[31][11]}]]
create_debug_core u_ila_3 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_3]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_3]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_3]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_3]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_3]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_3]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_3]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_3]
set_property port_width 1 [get_debug_ports u_ila_3/clk]
connect_debug_port u_ila_3/clk [get_nets [list MercuryXU1_i/MercuryXU1_i/zynq_ultra_ps_e_0/U0/pl_clk3]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe0]
set_property port_width 1 [get_debug_ports u_ila_3/probe0]
connect_debug_port u_ila_3/probe0 [get_nets [list ADC0_SEN_OBUF]]
create_debug_port u_ila_3 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe1]
set_property port_width 1 [get_debug_ports u_ila_3/probe1]
connect_debug_port u_ila_3/probe1 [get_nets [list ADC1_SEN_OBUF]]
create_debug_port u_ila_3 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe2]
set_property port_width 1 [get_debug_ports u_ila_3/probe2]
connect_debug_port u_ila_3/probe2 [get_nets [list ADC2_SEN_OBUF]]
create_debug_port u_ila_3 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe3]
set_property port_width 1 [get_debug_ports u_ila_3/probe3]
connect_debug_port u_ila_3/probe3 [get_nets [list ADC3_SEN_OBUF]]
create_debug_port u_ila_3 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe4]
set_property port_width 1 [get_debug_ports u_ila_3/probe4]
connect_debug_port u_ila_3/probe4 [get_nets [list ADC4_SEN_OBUF]]
create_debug_core u_ila_4 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_4]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_4]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_4]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_4]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_4]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_4]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_4]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_4]
set_property port_width 1 [get_debug_ports u_ila_4/clk]
connect_debug_port u_ila_4/clk [get_nets [list MercuryXU1_i/MercuryXU1_i/zynq_ultra_ps_e_0/U0/pl_clk0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_4/probe0]
set_property port_width 1 [get_debug_ports u_ila_4/probe0]
connect_debug_port u_ila_4/probe0 [get_nets [list ADC_PDN_OBUF]]
create_debug_port u_ila_4 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_4/probe1]
set_property port_width 1 [get_debug_ports u_ila_4/probe1]
connect_debug_port u_ila_4/probe1 [get_nets [list ADC_RST_OBUF]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_1]
