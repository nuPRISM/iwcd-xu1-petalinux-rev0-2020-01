# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "/home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.runs/MercuryNuPRISM_synth/system_top.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "MercuryNuPRISM_synth" START { ROLLUP_AUTO }
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xczu6eg-ffvc900-1-i

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.cache/wt [current_project]
set_property parent.project_path /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_vhdl -library xil_defaultlib {
  /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/new/tlast_generator.vhd
  /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/new/stream_multiplexer.vhd
  /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/hdl/MercuryXU1_wrapper.vhd
  /home/ab/Desktop/XU1_petalinux_rev6.1/src/system_top_NuPRISM.vhd
}
read_vhdl -library surf {
  /home/ab/Desktop/XU1_petalinux_rev6.1/lib/surf/base/general/rtl/StdRtlPkg.vhd
  /home/ab/Desktop/XU1_petalinux_rev6.1/lib/surf/xilinx/general/rtl/ClkOutBufDiff.vhd
  /home/ab/Desktop/XU1_petalinux_rev6.1/lib/surf/base/sync/rtl/Synchronizer.vhd
  /home/ab/Desktop/XU1_petalinux_rev6.1/lib/surf/base/sync/rtl/RstSync.vhd
  /home/ab/Desktop/XU1_petalinux_rev6.1/lib/surf/base/sync/rtl/SynchronizerEdge.vhd
  /home/ab/Desktop/XU1_petalinux_rev6.1/lib/surf/base/sync/rtl/SynchronizerOneShot.vhd
  /home/ab/Desktop/XU1_petalinux_rev6.1/lib/surf/base/sync/rtl/SynchronizerVector.vhd
  /home/ab/Desktop/XU1_petalinux_rev6.1/lib/surf/base/fifo/rtl/inferred/FifoWrFsm.vhd
  /home/ab/Desktop/XU1_petalinux_rev6.1/lib/surf/base/fifo/rtl/inferred/FifoRdFsm.vhd
  /home/ab/Desktop/XU1_petalinux_rev6.1/lib/surf/base/ram/inferred/SimpleDualPortRam.vhd
  /home/ab/Desktop/XU1_petalinux_rev6.1/lib/surf/base/fifo/rtl/FifoOutputPipeline.vhd
  /home/ab/Desktop/XU1_petalinux_rev6.1/lib/surf/base/fifo/rtl/inferred/FifoAsync.vhd
  /home/ab/Desktop/XU1_petalinux_rev6.1/lib/surf/base/sync/rtl/SynchronizerFifo.vhd
}
read_vhdl -library amc_carrier_core {
  /home/ab/Desktop/XU1_petalinux_rev6.1/lib/amc_carrier_core/Ad9229Deserializer.vhd
  /home/ab/Desktop/XU1_petalinux_rev6.1/lib/amc_carrier_core/Ad9229Core.vhd
}
add_files /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/MercuryXU1.bd
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_gpio_0_0/MercuryXU1_axi_gpio_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_gpio_0_0/MercuryXU1_axi_gpio_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_gpio_0_0/MercuryXU1_axi_gpio_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_proc_sys_reset_0_0/MercuryXU1_proc_sys_reset_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_proc_sys_reset_0_0/MercuryXU1_proc_sys_reset_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_zynq_ultra_ps_e_0_0/MercuryXU1_zynq_ultra_ps_e_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_zynq_ultra_ps_e_0_0/MercuryXU1_zynq_ultra_ps_e_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_xbar_1/MercuryXU1_xbar_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0_1/MercuryXU1_system_management_wiz_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0_1/MercuryXU1_system_management_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0_1/MercuryXU1_system_management_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_dma_0_0/MercuryXU1_axi_dma_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_dma_0_0/MercuryXU1_axi_dma_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_dma_0_0/MercuryXU1_axi_dma_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_1/bd_1544_psr_aclk_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_1/bd_1544_psr_aclk_0.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_2/bd_1544_arsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_3/bd_1544_rsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_4/bd_1544_awsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_5/bd_1544_wsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_6/bd_1544_bsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_10/bd_1544_s00a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_11/bd_1544_sarn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_12/bd_1544_srn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_13/bd_1544_sawn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_14/bd_1544_swn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_15/bd_1544_sbn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_19/bd_1544_s01a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_20/bd_1544_sarn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_21/bd_1544_srn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_25/bd_1544_s02a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_26/bd_1544_sawn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_27/bd_1544_swn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_28/bd_1544_sbn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_29/bd_1544_m00s2a_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_30/bd_1544_m00arn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_31/bd_1544_m00rn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_32/bd_1544_m00awn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_33/bd_1544_m00wn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/bd_0/ip/ip_34/bd_1544_m00bn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_0/ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_xbar_2/MercuryXU1_xbar_2_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_proc_sys_reset_100_0/MercuryXU1_proc_sys_reset_100_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_proc_sys_reset_100_0/MercuryXU1_proc_sys_reset_100_0.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_proc_sys_reset_100_0/MercuryXU1_proc_sys_reset_100_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_gpio_0_1/MercuryXU1_axi_gpio_0_1_board.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_gpio_0_1/MercuryXU1_axi_gpio_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_gpio_0_1/MercuryXU1_axi_gpio_0_1.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_proc_sys_reset_300_0/MercuryXU1_proc_sys_reset_300_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_proc_sys_reset_300_0/MercuryXU1_proc_sys_reset_300_0.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_proc_sys_reset_300_0/MercuryXU1_proc_sys_reset_300_0_ooc.xdc]
set_property used_in_synthesis false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_ila_0_0/bd_0/ip/ip_0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_ila_0_0/bd_0/ip/ip_0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_ila_0_0/bd_0/ip/ip_0/ila_v6_2/constraints/ila.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_ila_0_0/bd_0/ip/ip_0/bd_6493_ila_lib_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_ila_0_0/bd_0/bd_6493_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_ila_0_0/MercuryXU1_system_ila_0_0_ooc.xdc]
set_property used_in_synthesis false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_ila_0_2/bd_0/ip/ip_0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_ila_0_2/bd_0/ip/ip_0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_ila_0_2/bd_0/ip/ip_0/ila_v6_2/constraints/ila.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_ila_0_2/bd_0/ip/ip_0/bd_a512_ila_lib_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_ila_0_2/bd_0/bd_a512_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_ila_0_2/MercuryXU1_system_ila_0_2_ooc.xdc]
set_property used_in_synthesis false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_ila_0_3/bd_0/ip/ip_0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_ila_0_3/bd_0/ip/ip_0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_ila_0_3/bd_0/ip/ip_0/ila_v6_2/constraints/ila.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_ila_0_3/bd_0/ip/ip_0/bd_65d3_ila_lib_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_ila_0_3/bd_0/bd_65d3_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_ila_0_3/MercuryXU1_system_ila_0_3_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_gpio_0_2/MercuryXU1_axi_gpio_0_2_board.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_gpio_0_2/MercuryXU1_axi_gpio_0_2_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_gpio_0_2/MercuryXU1_axi_gpio_0_2.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axis_clock_converter_0_0/MercuryXU1_axis_clock_converter_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_1/bd_d585_psr_aclk_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_1/bd_d585_psr_aclk_0.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_2/bd_d585_arsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_3/bd_d585_rsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_4/bd_d585_awsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_5/bd_d585_wsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_6/bd_d585_bsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_10/bd_d585_s00a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_11/bd_d585_sarn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_12/bd_d585_srn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_13/bd_d585_sawn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_14/bd_d585_swn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_15/bd_d585_sbn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_19/bd_d585_s01a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_20/bd_d585_sawn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_21/bd_d585_swn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_22/bd_d585_sbn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_23/bd_d585_m00s2a_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_24/bd_d585_m00arn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_25/bd_d585_m00rn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_26/bd_d585_m00awn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_27/bd_d585_m00wn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/bd_0/ip/ip_28/bd_d585_m00bn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_smartconnect_0_1/ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_dma_0_1/MercuryXU1_axi_dma_0_1.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_dma_0_1/MercuryXU1_axi_dma_0_1_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_dma_0_1/MercuryXU1_axi_dma_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axis_clock_converter_0_1/MercuryXU1_axis_clock_converter_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axis_data_fifo_0_0/MercuryXU1_axis_data_fifo_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_gpio_sample_number_0/MercuryXU1_axi_gpio_sample_number_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_gpio_sample_number_0/MercuryXU1_axi_gpio_sample_number_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_gpio_sample_number_0/MercuryXU1_axi_gpio_sample_number_0.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_auto_pc_0/MercuryXU1_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_s00_regslice_0/MercuryXU1_s00_regslice_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_s00_regslice_0/MercuryXU1_s00_regslice_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_s00_data_fifo_0/MercuryXU1_s00_data_fifo_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_s01_regslice_0/MercuryXU1_s01_regslice_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_s01_regslice_0/MercuryXU1_s01_regslice_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_s01_data_fifo_0/MercuryXU1_s01_data_fifo_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_auto_ss_k_0/MercuryXU1_auto_ss_k_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/MercuryXU1_ooc.xdc]

read_ip -quiet /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/ip/clk_wiz_0_b65_mmcm/clk_wiz_0_b65_mmcm.xci
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/ip/clk_wiz_0_b65_mmcm/clk_wiz_0_b65_mmcm_board.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/ip/clk_wiz_0_b65_mmcm/clk_wiz_0_b65_mmcm.xdc]
set_property used_in_implementation false [get_files -all /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/ip/clk_wiz_0_b65_mmcm/clk_wiz_0_b65_mmcm_ooc.xdc]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/MercuryNuPRISM/new/debug.xdc
set_property used_in_implementation false [get_files /home/ab/Desktop/XU1_petalinux_rev6.1/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/MercuryNuPRISM/new/debug.xdc]

read_xdc /home/ab/Desktop/XU1_petalinux_rev6.1/src/MercuryXU1_NuPRISM.xdc
set_property used_in_implementation false [get_files /home/ab/Desktop/XU1_petalinux_rev6.1/src/MercuryXU1_NuPRISM.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top system_top -part xczu6eg-ffvc900-1-i
OPTRACE "synth_design" END { }


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef system_top.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "MercuryNuPRISM_synth_synth_report_utilization_0" "report_utilization -file system_top_utilization_synth.rpt -pb system_top_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "MercuryNuPRISM_synth" END { }
