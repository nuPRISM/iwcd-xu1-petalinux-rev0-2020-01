# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "AXI_FASTER_THAN_TRIGGER_CLK" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FREQ_DIV_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NUM_EXTERNAL_TRIGGERS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SAMPLES_PER_PACKET_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TIMESTAMP_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TRIGGER_TYPE_WIDTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.AXI_FASTER_THAN_TRIGGER_CLK { PARAM_VALUE.AXI_FASTER_THAN_TRIGGER_CLK } {
	# Procedure called to update AXI_FASTER_THAN_TRIGGER_CLK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_FASTER_THAN_TRIGGER_CLK { PARAM_VALUE.AXI_FASTER_THAN_TRIGGER_CLK } {
	# Procedure called to validate AXI_FASTER_THAN_TRIGGER_CLK
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to update C_S00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S00_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.FREQ_DIV_WIDTH { PARAM_VALUE.FREQ_DIV_WIDTH } {
	# Procedure called to update FREQ_DIV_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FREQ_DIV_WIDTH { PARAM_VALUE.FREQ_DIV_WIDTH } {
	# Procedure called to validate FREQ_DIV_WIDTH
	return true
}

proc update_PARAM_VALUE.NUM_EXTERNAL_TRIGGERS { PARAM_VALUE.NUM_EXTERNAL_TRIGGERS } {
	# Procedure called to update NUM_EXTERNAL_TRIGGERS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_EXTERNAL_TRIGGERS { PARAM_VALUE.NUM_EXTERNAL_TRIGGERS } {
	# Procedure called to validate NUM_EXTERNAL_TRIGGERS
	return true
}

proc update_PARAM_VALUE.SAMPLES_PER_PACKET_WIDTH { PARAM_VALUE.SAMPLES_PER_PACKET_WIDTH } {
	# Procedure called to update SAMPLES_PER_PACKET_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SAMPLES_PER_PACKET_WIDTH { PARAM_VALUE.SAMPLES_PER_PACKET_WIDTH } {
	# Procedure called to validate SAMPLES_PER_PACKET_WIDTH
	return true
}

proc update_PARAM_VALUE.TIMESTAMP_WIDTH { PARAM_VALUE.TIMESTAMP_WIDTH } {
	# Procedure called to update TIMESTAMP_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TIMESTAMP_WIDTH { PARAM_VALUE.TIMESTAMP_WIDTH } {
	# Procedure called to validate TIMESTAMP_WIDTH
	return true
}

proc update_PARAM_VALUE.TRIGGER_TYPE_WIDTH { PARAM_VALUE.TRIGGER_TYPE_WIDTH } {
	# Procedure called to update TRIGGER_TYPE_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TRIGGER_TYPE_WIDTH { PARAM_VALUE.TRIGGER_TYPE_WIDTH } {
	# Procedure called to validate TRIGGER_TYPE_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.SAMPLES_PER_PACKET_WIDTH { MODELPARAM_VALUE.SAMPLES_PER_PACKET_WIDTH PARAM_VALUE.SAMPLES_PER_PACKET_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SAMPLES_PER_PACKET_WIDTH}] ${MODELPARAM_VALUE.SAMPLES_PER_PACKET_WIDTH}
}

proc update_MODELPARAM_VALUE.TRIGGER_TYPE_WIDTH { MODELPARAM_VALUE.TRIGGER_TYPE_WIDTH PARAM_VALUE.TRIGGER_TYPE_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TRIGGER_TYPE_WIDTH}] ${MODELPARAM_VALUE.TRIGGER_TYPE_WIDTH}
}

proc update_MODELPARAM_VALUE.TIMESTAMP_WIDTH { MODELPARAM_VALUE.TIMESTAMP_WIDTH PARAM_VALUE.TIMESTAMP_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TIMESTAMP_WIDTH}] ${MODELPARAM_VALUE.TIMESTAMP_WIDTH}
}

proc update_MODELPARAM_VALUE.NUM_EXTERNAL_TRIGGERS { MODELPARAM_VALUE.NUM_EXTERNAL_TRIGGERS PARAM_VALUE.NUM_EXTERNAL_TRIGGERS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_EXTERNAL_TRIGGERS}] ${MODELPARAM_VALUE.NUM_EXTERNAL_TRIGGERS}
}

proc update_MODELPARAM_VALUE.FREQ_DIV_WIDTH { MODELPARAM_VALUE.FREQ_DIV_WIDTH PARAM_VALUE.FREQ_DIV_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FREQ_DIV_WIDTH}] ${MODELPARAM_VALUE.FREQ_DIV_WIDTH}
}

proc update_MODELPARAM_VALUE.AXI_FASTER_THAN_TRIGGER_CLK { MODELPARAM_VALUE.AXI_FASTER_THAN_TRIGGER_CLK PARAM_VALUE.AXI_FASTER_THAN_TRIGGER_CLK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_FASTER_THAN_TRIGGER_CLK}] ${MODELPARAM_VALUE.AXI_FASTER_THAN_TRIGGER_CLK}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
}

