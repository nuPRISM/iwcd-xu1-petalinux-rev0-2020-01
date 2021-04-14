onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+MercuryXU1 -L xilinx_vip -L xpm -L axi_lite_ipif_v3_0_4 -L lib_cdc_v1_0_2 -L interrupt_control_v3_1_4 -L axi_gpio_v2_0_23 -L xil_defaultlib -L proc_sys_reset_v5_0_13 -L axi_infrastructure_v1_1_0 -L axi_vip_v1_1_7 -L zynq_ultra_ps_e_vip_v1_0_7 -L generic_baseblocks_v2_1_0 -L axi_register_slice_v2_1_21 -L fifo_generator_v13_2_5 -L axi_data_fifo_v2_1_20 -L axi_crossbar_v2_1_22 -L lib_pkg_v1_0_2 -L lib_fifo_v1_0_14 -L lib_srl_fifo_v1_0_2 -L axi_datamover_v5_1_23 -L axi_sg_v4_1_13 -L axi_dma_v7_1_22 -L xlconstant_v1_1_7 -L smartconnect_v1_0 -L xlconcat_v2_1_3 -L axis_infrastructure_v1_1_0 -L axis_data_fifo_v2_0_3 -L axi_protocol_converter_v2_1_21 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.MercuryXU1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {MercuryXU1.udo}

run -all

endsim

quit -force