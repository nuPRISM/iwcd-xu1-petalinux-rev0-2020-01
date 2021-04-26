vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/interrupt_control_v3_1_4
vlib questa_lib/msim/axi_gpio_v2_0_23
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_7
vlib questa_lib/msim/zynq_ultra_ps_e_vip_v1_0_7
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_21
vlib questa_lib/msim/fifo_generator_v13_2_5
vlib questa_lib/msim/axi_data_fifo_v2_1_20
vlib questa_lib/msim/axi_crossbar_v2_1_22
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/lib_fifo_v1_0_14
vlib questa_lib/msim/lib_srl_fifo_v1_0_2
vlib questa_lib/msim/axi_datamover_v5_1_23
vlib questa_lib/msim/axi_sg_v4_1_13
vlib questa_lib/msim/axi_dma_v7_1_22
vlib questa_lib/msim/xlconstant_v1_1_7
vlib questa_lib/msim/smartconnect_v1_0
vlib questa_lib/msim/xlconcat_v2_1_3
vlib questa_lib/msim/axis_infrastructure_v1_1_0
vlib questa_lib/msim/axis_data_fifo_v2_0_3
vlib questa_lib/msim/axi_protocol_converter_v2_1_21

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 questa_lib/msim/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_23 questa_lib/msim/axi_gpio_v2_0_23
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_7 questa_lib/msim/axi_vip_v1_1_7
vmap zynq_ultra_ps_e_vip_v1_0_7 questa_lib/msim/zynq_ultra_ps_e_vip_v1_0_7
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_21 questa_lib/msim/axi_register_slice_v2_1_21
vmap fifo_generator_v13_2_5 questa_lib/msim/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_20 questa_lib/msim/axi_data_fifo_v2_1_20
vmap axi_crossbar_v2_1_22 questa_lib/msim/axi_crossbar_v2_1_22
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap lib_fifo_v1_0_14 questa_lib/msim/lib_fifo_v1_0_14
vmap lib_srl_fifo_v1_0_2 questa_lib/msim/lib_srl_fifo_v1_0_2
vmap axi_datamover_v5_1_23 questa_lib/msim/axi_datamover_v5_1_23
vmap axi_sg_v4_1_13 questa_lib/msim/axi_sg_v4_1_13
vmap axi_dma_v7_1_22 questa_lib/msim/axi_dma_v7_1_22
vmap xlconstant_v1_1_7 questa_lib/msim/xlconstant_v1_1_7
vmap smartconnect_v1_0 questa_lib/msim/smartconnect_v1_0
vmap xlconcat_v2_1_3 questa_lib/msim/xlconcat_v2_1_3
vmap axis_infrastructure_v1_1_0 questa_lib/msim/axis_infrastructure_v1_1_0
vmap axis_data_fifo_v2_0_3 questa_lib/msim/axis_data_fifo_v2_0_3
vmap axi_protocol_converter_v2_1_21 questa_lib/msim/axi_protocol_converter_v2_1_21

vlog -work xilinx_vip -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"/home/edev/tools/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/edev/tools/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/edev/tools/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/home/edev/tools/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -64 -93 \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_23 -64 -93 \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/bb35/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_gpio_0_0/sim/MercuryXU1_axi_gpio_0_0.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MercuryXU1/ip/MercuryXU1_proc_sys_reset_0_0/sim/MercuryXU1_proc_sys_reset_0_0.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_7 -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ce6c/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_7 -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/MercuryXU1/ip/MercuryXU1_zynq_ultra_ps_e_0_0/sim/MercuryXU1_zynq_ultra_ps_e_0_0_vip_wrapper.v" \

vlog -work generic_baseblocks_v2_1_0 -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_21 -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2ef9/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5 -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -64 -93 \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5 -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_20 -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/47c9/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_22 -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b68e/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/MercuryXU1/ip/MercuryXU1_xbar_1/sim/MercuryXU1_xbar_1.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0_1/proc_common_v3_00_a/hdl/src/vhdl/MercuryXU1_system_management_wiz_0_0_conv_funs_pkg.vhd" \
"../../../bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0_1/proc_common_v3_00_a/hdl/src/vhdl/common_types_pkg.vhd" \
"../../../bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0_1/proc_common_v3_00_a/hdl/src/vhdl/MercuryXU1_system_management_wiz_0_0_proc_common_pkg.vhd" \
"../../../bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0_1/proc_common_v3_00_a/hdl/src/vhdl/MercuryXU1_system_management_wiz_0_0_ipif_pkg.vhd" \
"../../../bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0_1/proc_common_v3_00_a/hdl/src/vhdl/MercuryXU1_system_management_wiz_0_0_family_support.vhd" \
"../../../bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0_1/proc_common_v3_00_a/hdl/src/vhdl/MercuryXU1_system_management_wiz_0_0_family.vhd" \
"../../../bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0_1/proc_common_v3_00_a/hdl/src/vhdl/MercuryXU1_system_management_wiz_0_0_soft_reset.vhd" \
"../../../bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0_1/proc_common_v3_00_a/hdl/src/vhdl/MercuryXU1_system_management_wiz_0_0_pselect_f.vhd" \
"../../../bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0_1/axi_lite_ipif_v1_31_a/hdl/src/vhdl/MercuryXU1_system_management_wiz_0_0_address_decoder.vhd" \
"../../../bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0_1/axi_lite_ipif_v1_31_a/hdl/src/vhdl/MercuryXU1_system_management_wiz_0_0_slave_attachment.vhd" \
"../../../bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0_1/interrupt_control_v2_01_a/hdl/src/vhdl/MercuryXU1_system_management_wiz_0_0_interrupt_control.vhd" \
"../../../bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0_1/axi_lite_ipif_v1_31_a/hdl/src/vhdl/MercuryXU1_system_management_wiz_0_0_axi_lite_ipif.vhd" \
"../../../bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0_1/MercuryXU1_system_management_wiz_0_0_xadc_core_drp.vhd" \
"../../../bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0_1/MercuryXU1_system_management_wiz_0_0_axi_xadc.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0_1/MercuryXU1_system_management_wiz_0_0.v" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_fifo_v1_0_14 -64 -93 \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/a5cb/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_23 -64 -93 \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/af86/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_13 -64 -93 \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4919/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_22 -64 -93 \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/0fb1/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_dma_0_0/sim/MercuryXU1_axi_dma_0_0.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/sim/bd_cc23.v" \

vlog -work xlconstant_v1_1_7 -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_0/sim/bd_cc23_one_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_1/sim/bd_cc23_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_2/sim/bd_cc23_arsw_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_3/sim/bd_cc23_rsw_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_4/sim/bd_cc23_awsw_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_5/sim/bd_cc23_wsw_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_6/sim/bd_cc23_bsw_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/053f/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_7/sim/bd_cc23_s00mmu_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_8/sim/bd_cc23_s00tr_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/9d43/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_9/sim/bd_cc23_s00sic_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_10/sim/bd_cc23_s00a2s_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_11/sim/bd_cc23_sarn_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_12/sim/bd_cc23_srn_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_13/sim/bd_cc23_sawn_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_14/sim/bd_cc23_swn_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_15/sim/bd_cc23_sbn_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_16/sim/bd_cc23_s01mmu_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_17/sim/bd_cc23_s01tr_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_18/sim/bd_cc23_s01sic_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_19/sim/bd_cc23_s01a2s_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_20/sim/bd_cc23_sarn_1.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_21/sim/bd_cc23_srn_1.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_22/sim/bd_cc23_s02mmu_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_23/sim/bd_cc23_s02tr_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_24/sim/bd_cc23_s02sic_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_25/sim/bd_cc23_s02a2s_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_26/sim/bd_cc23_sawn_1.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_27/sim/bd_cc23_swn_1.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_28/sim/bd_cc23_sbn_1.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_29/sim/bd_cc23_m00s2a_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_30/sim/bd_cc23_m00arn_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_31/sim/bd_cc23_m00rn_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_32/sim/bd_cc23_m00awn_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_33/sim/bd_cc23_m00wn_0.sv" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_34/sim/bd_cc23_m00bn_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/7af8/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_7 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_35/sim/bd_cc23_m00e_0.sv" \

vlog -work xil_defaultlib -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/sim/MercuryXU1_axi_smc_0.v" \

vlog -work xlconcat_v2_1_3 -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/MercuryXU1/ip/MercuryXU1_xlconcat_0_0/sim/MercuryXU1_xlconcat_0_0.v" \

vlog -work axis_infrastructure_v1_1_0 -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work axis_data_fifo_v2_0_3 -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/50d0/hdl/axis_data_fifo_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/MercuryXU1/ip/MercuryXU1_axis_data_fifo_0_0/sim/MercuryXU1_axis_data_fifo_0_0.v" \
"../../../bd/MercuryXU1/ip/MercuryXU1_xlconstant_3_0/sim/MercuryXU1_xlconstant_3_0.v" \
"../../../bd/MercuryXU1/ip/MercuryXU1_xlconstant_4_0/sim/MercuryXU1_xlconstant_4_0.v" \
"../../../bd/MercuryXU1/ip/MercuryXU1_xlconstant_5_0/sim/MercuryXU1_xlconstant_5_0.v" \
"../../../bd/MercuryXU1/sim/MercuryXU1.v" \
"../../../bd/MercuryXU1/ip/MercuryXU1_system_ila_0_0/bd_0/ip/ip_0/sim/bd_6493_ila_lib_0.v" \
"../../../bd/MercuryXU1/ip/MercuryXU1_system_ila_0_0/bd_0/sim/bd_6493.v" \
"../../../bd/MercuryXU1/ip/MercuryXU1_system_ila_0_0/sim/MercuryXU1_system_ila_0_0.v" \

vlog -work axi_protocol_converter_v2_1_21 -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8dfa/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/122e/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b205/hdl/verilog" "+incdir+../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c968/hdl/verilog" "+incdir+/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/MercuryXU1/ip/MercuryXU1_auto_pc_0/sim/MercuryXU1_auto_pc_0.v" \
"../../../bd/MercuryXU1/ip/MercuryXU1_auto_pc_1/sim/MercuryXU1_auto_pc_1.v" \
"../../../bd/MercuryXU1/ip/MercuryXU1_auto_pc_2/sim/MercuryXU1_auto_pc_2.v" \

vlog -work xil_defaultlib \
"glbl.v"

