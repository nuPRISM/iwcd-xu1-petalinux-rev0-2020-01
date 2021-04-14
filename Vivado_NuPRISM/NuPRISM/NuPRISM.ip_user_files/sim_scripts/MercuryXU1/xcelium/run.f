-makelib xcelium_lib/xilinx_vip -sv \
  "/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "/home/edev/tools/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xpm -sv \
  "/home/edev/tools/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/home/edev/tools/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/home/edev/tools/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/home/edev/tools/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/axi_lite_ipif_v3_0_4 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/interrupt_control_v3_1_4 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_gpio_v2_0_23 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/bb35/hdl/axi_gpio_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_gpio_0_0/sim/MercuryXU1_axi_gpio_0_0.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/MercuryXU1/ip/MercuryXU1_proc_sys_reset_0_0/sim/MercuryXU1_proc_sys_reset_0_0.vhd" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_7 -sv \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ce6c/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/zynq_ultra_ps_e_vip_v1_0_7 -sv \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/e257/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/MercuryXU1/ip/MercuryXU1_zynq_ultra_ps_e_0_0/sim/MercuryXU1_zynq_ultra_ps_e_0_0_vip_wrapper.v" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_21 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2ef9/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_20 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/47c9/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_22 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b68e/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/MercuryXU1/ip/MercuryXU1_xbar_1/sim/MercuryXU1_xbar_1.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
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
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0_1/MercuryXU1_system_management_wiz_0_0.v" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_fifo_v1_0_14 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/a5cb/hdl/lib_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_srl_fifo_v1_0_2 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_datamover_v5_1_23 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/af86/hdl/axi_datamover_v5_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_sg_v4_1_13 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4919/hdl/axi_sg_v4_1_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_dma_v7_1_22 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/0fb1/hdl/axi_dma_v7_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_dma_0_0/sim/MercuryXU1_axi_dma_0_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/sim/bd_cc23.v" \
-endlib
-makelib xcelium_lib/xlconstant_v1_1_7 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_0/sim/bd_cc23_one_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_1/sim/bd_cc23_psr_aclk_0.vhd" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/2702/hdl/sc_util_v1_0_vl_rfs.sv" \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_2/sim/bd_cc23_arsw_0.sv" \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_3/sim/bd_cc23_rsw_0.sv" \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_4/sim/bd_cc23_awsw_0.sv" \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_5/sim/bd_cc23_wsw_0.sv" \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_6/sim/bd_cc23_bsw_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/053f/hdl/sc_mmu_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_7/sim/bd_cc23_s00mmu_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_8/sim/bd_cc23_s00tr_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/9d43/hdl/sc_si_converter_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_9/sim/bd_cc23_s00sic_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_10/sim/bd_cc23_s00a2s_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/4676/hdl/sc_node_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
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
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_29/sim/bd_cc23_m00s2a_0.sv" \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_30/sim/bd_cc23_m00arn_0.sv" \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_31/sim/bd_cc23_m00rn_0.sv" \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_32/sim/bd_cc23_m00awn_0.sv" \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_33/sim/bd_cc23_m00wn_0.sv" \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_34/sim/bd_cc23_m00bn_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/7af8/hdl/sc_exit_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/bd_0/ip/ip_35/sim/bd_cc23_m00e_0.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axi_smc_0/sim/MercuryXU1_axi_smc_0.v" \
-endlib
-makelib xcelium_lib/xlconcat_v2_1_3 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/MercuryXU1/ip/MercuryXU1_xlconcat_0_0/sim/MercuryXU1_xlconcat_0_0.v" \
-endlib
-makelib xcelium_lib/axis_infrastructure_v1_1_0 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axis_data_fifo_v2_0_3 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/50d0/hdl/axis_data_fifo_v2_0_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/MercuryXU1/ip/MercuryXU1_axis_data_fifo_0_0/sim/MercuryXU1_axis_data_fifo_0_0.v" \
  "../../../bd/MercuryXU1/ip/MercuryXU1_xlconstant_3_0/sim/MercuryXU1_xlconstant_3_0.v" \
  "../../../bd/MercuryXU1/ip/MercuryXU1_xlconstant_4_0/sim/MercuryXU1_xlconstant_4_0.v" \
  "../../../bd/MercuryXU1/ip/MercuryXU1_xlconstant_5_0/sim/MercuryXU1_xlconstant_5_0.v" \
  "../../../bd/MercuryXU1/sim/MercuryXU1.v" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_21 \
  "../../../../NuPRISM.srcs/sources_1/bd/MercuryXU1/ipshared/8dfa/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/MercuryXU1/ip/MercuryXU1_auto_pc_0/sim/MercuryXU1_auto_pc_0.v" \
  "../../../bd/MercuryXU1/ip/MercuryXU1_auto_pc_1/sim/MercuryXU1_auto_pc_1.v" \
  "../../../bd/MercuryXU1/ip/MercuryXU1_auto_pc_2/sim/MercuryXU1_auto_pc_2.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

