set_property SRC_FILE_INFO {cfile:E:/SW/Vivado_Projetcs/ARM_CM3_A7/ARM_CM3_A7.srcs/constrs_1/new/usb104_a7.xdc rfile:../../../ARM_CM3_A7.srcs/constrs_1/new/usb104_a7.xdc id:1} [current_design]
set_property SRC_FILE_INFO {cfile:E:/SW/Vivado_Projetcs/ARM_CM3_A7/ARM_CM3_A7.srcs/constrs_1/new/timing_usb104_a7.xdc rfile:../../../ARM_CM3_A7.srcs/constrs_1/new/timing_usb104_a7.xdc id:2} [current_design]
set_property src_info {type:XDC file:1 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E3   IOSTANDARD LVCMOS33 } [get_ports { sys_clock }]; #IO_L13P_T2_MRCC_15 Sch=uclk
set_property src_info {type:XDC file:1 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C4   IOSTANDARD LVCMOS33 } [get_ports { TCK }]; #IO_L13P_T2_MRCC_15 Sch=uclk
set_property src_info {type:XDC file:1 line:72 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B2    IOSTANDARD LVCMOS33 } [get_ports { TMS }]; #IO_L10N_T1_AD15N_35   Sch=jb[2]
set_property src_info {type:XDC file:1 line:73 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B3    IOSTANDARD LVCMOS33 } [get_ports { nTRST }]; #IO_L10P_T1_AD15P_35   Sch=jb[3]
set_property src_info {type:XDC file:1 line:74 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B4    IOSTANDARD LVCMOS33 } [get_ports { TDI }]; #IO_L7N_T1_AD6N_35     Sch=jb[4]
set_property src_info {type:XDC file:1 line:75 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B1    IOSTANDARD LVCMOS33 } [get_ports { TDO[0] }]; #IO_L9P_T1_DQS_AD7P_35 Sch=jb[7]
set_property src_info {type:XDC file:2 line:79 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay [get_clocks sys_clock] -datapath_only 16.0
set_property src_info {type:XDC file:2 line:91 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_clocks sys_clock] -to [get_clocks TCK]   -datapath_only 16.0
set_property src_info {type:XDC file:2 line:92 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_clocks TCK]   -to [get_clocks sys_clock] -datapath_only 16.0
set_property src_info {type:XDC file:2 line:103 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay  -clock [get_clocks TCK] -add_delay 5.0 [get_ports TDI]
set_property src_info {type:XDC file:2 line:104 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay  -clock [get_clocks TCK] -add_delay 5.0 [get_ports nTRST]
set_property src_info {type:XDC file:2 line:105 export:INPUT save:INPUT read:READ} [current_design]
set_output_delay -clock [get_clocks TCK] -add_delay 5.0 [get_ports TDO*]
