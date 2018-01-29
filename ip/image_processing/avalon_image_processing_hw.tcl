# TCL File Generated by Component Editor 16.0
# Wed Dec 20 17:48:32 CET 2017
# DO NOT MODIFY


# 
# avalon_image_processing "avalon_image_processing" v1.0
# Roberto Fernandez (robertofem@gmail.com) 2017.12.20.17:48:32
# Connects processor with image processing component
# 

# 
# request TCL package from ACDS 16.0
# 
package require -exact qsys 16.0


# 
# module avalon_image_processing
# 
set_module_property DESCRIPTION "Connects processor with image processing component"
set_module_property NAME avalon_image_processing
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR "Roberto Fernandez (robertofem@gmail.com)"
set_module_property DISPLAY_NAME avalon_image_processing
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL avalon_image_processing
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file avalon_image_processing.vhd VHDL PATH avalon_image_processing.vhd TOP_LEVEL_FILE


# 
# parameters
# 
add_parameter HUE_THRESHOLD_L INTEGER 220 "0 to 255"
set_parameter_property HUE_THRESHOLD_L DEFAULT_VALUE 220
set_parameter_property HUE_THRESHOLD_L DISPLAY_NAME HUE_THRESHOLD_L
set_parameter_property HUE_THRESHOLD_L TYPE INTEGER
set_parameter_property HUE_THRESHOLD_L UNITS None
set_parameter_property HUE_THRESHOLD_L ALLOWED_RANGES -2147483648:2147483647
set_parameter_property HUE_THRESHOLD_L DESCRIPTION "0 to 255"
set_parameter_property HUE_THRESHOLD_L HDL_PARAMETER true
add_parameter HUE_THRESHOLD_H INTEGER 30 "0 to 255"
set_parameter_property HUE_THRESHOLD_H DEFAULT_VALUE 30
set_parameter_property HUE_THRESHOLD_H DISPLAY_NAME HUE_THRESHOLD_H
set_parameter_property HUE_THRESHOLD_H TYPE INTEGER
set_parameter_property HUE_THRESHOLD_H UNITS None
set_parameter_property HUE_THRESHOLD_H ALLOWED_RANGES -2147483648:2147483647
set_parameter_property HUE_THRESHOLD_H DESCRIPTION "0 to 255"
set_parameter_property HUE_THRESHOLD_H HDL_PARAMETER true
add_parameter BRIGHTNESS_THRESHOLD_L INTEGER 60 "0 to 255"
set_parameter_property BRIGHTNESS_THRESHOLD_L DEFAULT_VALUE 60
set_parameter_property BRIGHTNESS_THRESHOLD_L DISPLAY_NAME BRIGHTNESS_THRESHOLD_L
set_parameter_property BRIGHTNESS_THRESHOLD_L TYPE INTEGER
set_parameter_property BRIGHTNESS_THRESHOLD_L UNITS None
set_parameter_property BRIGHTNESS_THRESHOLD_L ALLOWED_RANGES -2147483648:2147483647
set_parameter_property BRIGHTNESS_THRESHOLD_L DESCRIPTION "0 to 255"
set_parameter_property BRIGHTNESS_THRESHOLD_L HDL_PARAMETER true
add_parameter BRIGHTNESS_THRESHOLD_H INTEGER 255
set_parameter_property BRIGHTNESS_THRESHOLD_H DEFAULT_VALUE 255
set_parameter_property BRIGHTNESS_THRESHOLD_H DISPLAY_NAME BRIGHTNESS_THRESHOLD_H
set_parameter_property BRIGHTNESS_THRESHOLD_H TYPE INTEGER
set_parameter_property BRIGHTNESS_THRESHOLD_H UNITS None
set_parameter_property BRIGHTNESS_THRESHOLD_H HDL_PARAMETER true
add_parameter SATURATION_THRESHOLD_L INTEGER 60 "0 to 255"
set_parameter_property SATURATION_THRESHOLD_L DEFAULT_VALUE 60
set_parameter_property SATURATION_THRESHOLD_L DISPLAY_NAME SATURATION_THRESHOLD_L
set_parameter_property SATURATION_THRESHOLD_L TYPE INTEGER
set_parameter_property SATURATION_THRESHOLD_L UNITS None
set_parameter_property SATURATION_THRESHOLD_L ALLOWED_RANGES -2147483648:2147483647
set_parameter_property SATURATION_THRESHOLD_L DESCRIPTION "0 to 255"
set_parameter_property SATURATION_THRESHOLD_L HDL_PARAMETER true
add_parameter SATURATION_THRESHOLD_H INTEGER 255
set_parameter_property SATURATION_THRESHOLD_H DEFAULT_VALUE 255
set_parameter_property SATURATION_THRESHOLD_H DISPLAY_NAME SATURATION_THRESHOLD_H
set_parameter_property SATURATION_THRESHOLD_H TYPE INTEGER
set_parameter_property SATURATION_THRESHOLD_H UNITS None
set_parameter_property SATURATION_THRESHOLD_H HDL_PARAMETER true


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset_n reset_n Input 1


# 
# connection point avalon_slave
# 
add_interface avalon_slave avalon end
set_interface_property avalon_slave addressUnits WORDS
set_interface_property avalon_slave associatedClock clock
set_interface_property avalon_slave associatedReset reset
set_interface_property avalon_slave bitsPerSymbol 8
set_interface_property avalon_slave burstOnBurstBoundariesOnly false
set_interface_property avalon_slave burstcountUnits WORDS
set_interface_property avalon_slave explicitAddressSpan 0
set_interface_property avalon_slave holdTime 0
set_interface_property avalon_slave linewrapBursts false
set_interface_property avalon_slave maximumPendingReadTransactions 0
set_interface_property avalon_slave maximumPendingWriteTransactions 0
set_interface_property avalon_slave readLatency 0
set_interface_property avalon_slave readWaitTime 1
set_interface_property avalon_slave setupTime 0
set_interface_property avalon_slave timingUnits Cycles
set_interface_property avalon_slave writeWaitTime 0
set_interface_property avalon_slave ENABLED true
set_interface_property avalon_slave EXPORT_OF ""
set_interface_property avalon_slave PORT_NAME_MAP ""
set_interface_property avalon_slave CMSIS_SVD_VARIABLES ""
set_interface_property avalon_slave SVD_ADDRESS_GROUP ""

add_interface_port avalon_slave S_address address Input 7
add_interface_port avalon_slave S_writedata writedata Input 32
add_interface_port avalon_slave S_readdata readdata Output 32
add_interface_port avalon_slave S_write write Input 1
add_interface_port avalon_slave S_read read Input 1
set_interface_assignment avalon_slave embeddedsw.configuration.isFlash 0
set_interface_assignment avalon_slave embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avalon_slave embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avalon_slave embeddedsw.configuration.isPrintableDevice 0


# 
# connection point conduit_end
# 
add_interface conduit_end conduit end
set_interface_property conduit_end associatedClock clock
set_interface_property conduit_end associatedReset ""
set_interface_property conduit_end ENABLED true
set_interface_property conduit_end EXPORT_OF ""
set_interface_property conduit_end PORT_NAME_MAP ""
set_interface_property conduit_end CMSIS_SVD_VARIABLES ""
set_interface_property conduit_end SVD_ADDRESS_GROUP ""

add_interface_port conduit_end hue_threshold_l_out hue_thres_l Output 8
add_interface_port conduit_end hue_threshold_h_out hue_thres_h Output 8
add_interface_port conduit_end brightness_threshold_l_out bri_thres_l Output 8
add_interface_port conduit_end saturation_threshold_l_out sat_thres_l Output 8
add_interface_port conduit_end brightness_threshold_h_out bri_thres_h Output 8
add_interface_port conduit_end saturation_threshold_h_out sat_thres_h Output 8

