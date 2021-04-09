set outputDir ./output
file mkdir $outputDir

set exportDir ./export
file mkdir $exportDir

set_part xczu4cg-fbvb900-1-e
# maxThreads fixes a crash in Ubuntu 18.04 LTS
# set_param general.maxThreads 1

# STEP 1: setup design sources and constraints
read_verilog -sv [ glob ./src/*.sv]

read_bd [ glob ./Vivado_NuPRISM/NuPRISM.srcs/sources_1/bd/MercuryXU1/*.bd ]
generate_target all [ get_files ./Vivado_NuPRISM/NuPRISM.srcs/sources_1/bd/MercuryXU1/MercuryXU1.bd ]

read_xdc ./src/MercuryXU1_NuPRISM.xdc

# STEP 2: run synthesis, report utilization and timing estimates, write checkpoint design
synth_design -top system_top
write_checkpoint -force $outputDir/post_synth
report_utilization -file $outputDir/post_synth_util.rpt
report_timing -sort_by group -max_paths 5 -path_type summary -file $outputDir/post_synth_timing.rpt

# STEP 3: run placement and logic optimization, report utilization and timing estimates

opt_design
power_opt_design
place_design

write_debug_probes -force $outputDir/system.ltx
write_hw_platform -fixed -force -file $exportDir/system.xsa

phys_opt_design

write_checkpoint -force $outputDir/post_place
report_clock_utilization -file $outputDir/clock_util.rpt
report_utilization -file $outputDir/post_place_util.rpt
report_timing -sort_by group -max_paths 5 -path_type summary -file $outputDir/post_place_timing.rpt

# STEP 4: run router, report actual utilization and timing, write checkpoint design, run DRCs

route_design

write_checkpoint -force $outputDir/post_route

report_timing_summary -file $outputDir/post_route_timing_summary.rpt
report_utilization -file $outputDir/post_route_util.rpt
report_power -file $outputDir/post_route_power.rpt
report_methodology -file $outputDir/post_impl_checks.rpt
report_drc -file $outputDir/post_imp_drc.rpt

write_verilog -force $outputDir/system_impl_netlist.v
write_xdc -no_fixed_only -force $outputDir/system_impl.xdc

# STEP 5: generate a bitstream

write_bitstream -force $outputDir/system.bit
