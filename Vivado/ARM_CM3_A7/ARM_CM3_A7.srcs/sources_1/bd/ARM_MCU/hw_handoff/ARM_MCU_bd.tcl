
################################################################
# This is a generated script based on design: ARM_MCU
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source ARM_MCU_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# tri_io_buf

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a100tcsg324-1
   set_property BOARD_PART digilentinc.com:usb104-a7:part0:1.3 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name ARM_MCU

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: Reset_and_Clocks
proc create_hier_cell_Reset_and_Clocks { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_Reset_and_Clocks() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir O -from 0 -to 0 Res
  create_bd_pin -dir O -from 0 -to 0 Res1
  create_bd_pin -dir O -from 0 -to 0 Res2
  create_bd_pin -dir O -from 0 -to 0 Res3
  create_bd_pin -dir O -type clk clk_out1
  create_bd_pin -dir I -type rst mb_debug_sys_rst
  create_bd_pin -dir I -type rst reset
  create_bd_pin -dir I -type clk sys_clock

  # Create instance: External_Reset, and set properties
  set External_Reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 External_Reset ]

  # Create instance: Interconnect_Reset_AND, and set properties
  set Interconnect_Reset_AND [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 Interconnect_Reset_AND ]
  set_property -dict [ list \
   CONFIG.C_SIZE {1} \
 ] $Interconnect_Reset_AND

  # Create instance: Peripheral_Reset_AND, and set properties
  set Peripheral_Reset_AND [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 Peripheral_Reset_AND ]
  set_property -dict [ list \
   CONFIG.C_SIZE {1} \
 ] $Peripheral_Reset_AND

  # Create instance: System_Reset, and set properties
  set System_Reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 System_Reset ]

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [ list \
   CONFIG.CLKOUT1_JITTER {151.636} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50.000} \
   CONFIG.CLK_IN1_BOARD_INTERFACE {sys_clock} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {20.000} \
   CONFIG.MMCM_DIVCLK_DIVIDE {1} \
   CONFIG.RESET_BOARD_INTERFACE {reset} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $clk_wiz_0

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_0

  # Create instance: util_vector_logic_1, and set properties
  set util_vector_logic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_1

  # Create instance: util_vector_logic_2, and set properties
  set util_vector_logic_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_2 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {or} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_orgate.png} \
 ] $util_vector_logic_2

  # Create instance: util_vector_logic_3, and set properties
  set util_vector_logic_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_3 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_3

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net CORTEXM3_AXI_0_SYSRESETREQ [get_bd_pins mb_debug_sys_rst] [get_bd_pins System_Reset/mb_debug_sys_rst]
  connect_bd_net -net External_Reset_interconnect_aresetn [get_bd_pins External_Reset/interconnect_aresetn] [get_bd_pins Interconnect_Reset_AND/Op2]
  connect_bd_net -net External_Reset_mb_reset [get_bd_pins External_Reset/mb_reset] [get_bd_pins util_vector_logic_1/Op1] [get_bd_pins util_vector_logic_2/Op1]
  connect_bd_net -net External_Reset_peripheral_aresetn [get_bd_pins External_Reset/peripheral_aresetn] [get_bd_pins Peripheral_Reset_AND/Op2]
  connect_bd_net -net Interconnect_Reset_AND_Res [get_bd_pins Res] [get_bd_pins Interconnect_Reset_AND/Res]
  connect_bd_net -net Peripheral_Reset_AND_Res [get_bd_pins Res3] [get_bd_pins Peripheral_Reset_AND/Res]
  connect_bd_net -net System_Reset_interconnect_aresetn [get_bd_pins Interconnect_Reset_AND/Op1] [get_bd_pins System_Reset/interconnect_aresetn]
  connect_bd_net -net System_Reset_mb_reset [get_bd_pins System_Reset/mb_reset] [get_bd_pins util_vector_logic_2/Op2]
  connect_bd_net -net System_Reset_peripheral_aresetn [get_bd_pins Peripheral_Reset_AND/Op1] [get_bd_pins System_Reset/peripheral_aresetn]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins clk_out1] [get_bd_pins External_Reset/slowest_sync_clk] [get_bd_pins System_Reset/slowest_sync_clk] [get_bd_pins clk_wiz_0/clk_out1]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins External_Reset/dcm_locked] [get_bd_pins System_Reset/dcm_locked] [get_bd_pins clk_wiz_0/locked]
  connect_bd_net -net reset_1 [get_bd_pins reset] [get_bd_pins clk_wiz_0/reset] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net sys_clock_1 [get_bd_pins sys_clock] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins External_Reset/ext_reset_in] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins Res1] [get_bd_pins util_vector_logic_1/Res]
  connect_bd_net -net util_vector_logic_2_Res [get_bd_pins util_vector_logic_2/Res] [get_bd_pins util_vector_logic_3/Op1]
  connect_bd_net -net util_vector_logic_3_Res [get_bd_pins Res2] [get_bd_pins util_vector_logic_3/Res]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins System_Reset/aux_reset_in] [get_bd_pins System_Reset/ext_reset_in] [get_bd_pins xlconstant_0/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set usb_uart [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 usb_uart ]

  # Create ports
  set TCK [ create_bd_port -dir I -type clk TCK ]
  set TDI [ create_bd_port -dir I TDI ]
  set TDO [ create_bd_port -dir IO -from 0 -to 0 TDO ]
  set TMS [ create_bd_port -dir I TMS ]
  set nTRST [ create_bd_port -dir I -type rst nTRST ]
  set reset [ create_bd_port -dir I -type rst reset ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $reset
  set sys_clock [ create_bd_port -dir I -type clk sys_clock ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
   CONFIG.PHASE {0.000} \
 ] $sys_clock

  # Create instance: CORTEXM3_AXI_0, and set properties
  set CORTEXM3_AXI_0 [ create_bd_cell -type ip -vlnv Arm.com:CortexM:CORTEXM3_AXI:1.1 CORTEXM3_AXI_0 ]
  set_property -dict [ list \
   CONFIG.BB_PRESENT {false} \
   CONFIG.DEBUG_LVL {1} \
   CONFIG.ITCM_INIT_FILE {bram_a7.hex} \
   CONFIG.MPU_PRESENT {false} \
   CONFIG.TRACE_LVL {0} \
 ] $CORTEXM3_AXI_0

  # Create instance: Reset_and_Clocks
  create_hier_cell_Reset_and_Clocks [current_bd_instance .] Reset_and_Clocks

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.0 axi_bram_ctrl_0 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_0

  # Create instance: axi_bram_ctrl_0_bram, and set properties
  set axi_bram_ctrl_0_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 axi_bram_ctrl_0_bram ]
  set_property -dict [ list \
   CONFIG.EN_SAFETY_CKT {false} \
 ] $axi_bram_ctrl_0_bram

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {2} \
   CONFIG.NUM_SI {2} \
 ] $axi_interconnect_0

  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]
  set_property -dict [ list \
   CONFIG.UARTLITE_BOARD_INTERFACE {usb_uart} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_uartlite_0

  # Create instance: tri_io_buf_0, and set properties
  set block_name tri_io_buf
  set block_cell_name tri_io_buf_0
  if { [catch {set tri_io_buf_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $tri_io_buf_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_WIDTH {2} \
 ] $xlconstant_1

  # Create interface connections
  connect_bd_intf_net -intf_net CORTEXM3_AXI_0_CM3_CODE_AXI3 [get_bd_intf_pins CORTEXM3_AXI_0/CM3_CODE_AXI3] [get_bd_intf_pins axi_interconnect_0/S01_AXI]
  connect_bd_intf_net -intf_net CORTEXM3_AXI_0_CM3_SYS_AXI3 [get_bd_intf_pins CORTEXM3_AXI_0/CM3_SYS_AXI3] [get_bd_intf_pins axi_interconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins axi_bram_ctrl_0_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_bram_ctrl_0/S_AXI] [get_bd_intf_pins axi_interconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins axi_interconnect_0/M01_AXI] [get_bd_intf_pins axi_uartlite_0/S_AXI]
  connect_bd_intf_net -intf_net axi_uartlite_0_UART [get_bd_intf_ports usb_uart] [get_bd_intf_pins axi_uartlite_0/UART]

  # Create port connections
  connect_bd_net -net CORTEXM3_AXI_0_SYSRESETREQ [get_bd_pins CORTEXM3_AXI_0/SYSRESETREQ] [get_bd_pins Reset_and_Clocks/mb_debug_sys_rst]
  connect_bd_net -net CORTEXM3_AXI_0_TDO [get_bd_pins CORTEXM3_AXI_0/TDO] [get_bd_pins tri_io_buf_0/din]
  connect_bd_net -net CORTEXM3_AXI_0_nTDOEN [get_bd_pins CORTEXM3_AXI_0/nTDOEN] [get_bd_pins tri_io_buf_0/oen_N]
  connect_bd_net -net Interconnect_Reset_AND_Res [get_bd_pins Reset_and_Clocks/Res] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_interconnect_0/S01_ARESETN]
  connect_bd_net -net Net [get_bd_ports TDO] [get_bd_pins tri_io_buf_0/io_pad]
  connect_bd_net -net Peripheral_Reset_AND_Res [get_bd_pins Reset_and_Clocks/Res3] [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins axi_uartlite_0/s_axi_aresetn]
  connect_bd_net -net SWCLKTCK_0_1 [get_bd_ports TCK] [get_bd_pins CORTEXM3_AXI_0/SWCLKTCK]
  connect_bd_net -net SWDITMS_0_1 [get_bd_ports TMS] [get_bd_pins CORTEXM3_AXI_0/SWDITMS]
  connect_bd_net -net TDI_0_1 [get_bd_ports TDI] [get_bd_pins CORTEXM3_AXI_0/TDI]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins CORTEXM3_AXI_0/HCLK] [get_bd_pins Reset_and_Clocks/clk_out1] [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/M01_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_interconnect_0/S01_ACLK] [get_bd_pins axi_uartlite_0/s_axi_aclk]
  connect_bd_net -net nTRST_0_1 [get_bd_ports nTRST] [get_bd_pins CORTEXM3_AXI_0/nTRST]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins Reset_and_Clocks/reset]
  connect_bd_net -net sys_clock_1 [get_bd_ports sys_clock] [get_bd_pins Reset_and_Clocks/sys_clock]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins CORTEXM3_AXI_0/DBGRESETn] [get_bd_pins Reset_and_Clocks/Res1]
  connect_bd_net -net util_vector_logic_3_Res [get_bd_pins CORTEXM3_AXI_0/SYSRESETn] [get_bd_pins Reset_and_Clocks/Res2]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins CORTEXM3_AXI_0/CFGITCMEN] [get_bd_pins xlconstant_1/dout]

  # Create address segments
  create_bd_addr_seg -range 0x00002000 -offset 0x60000000 [get_bd_addr_spaces CORTEXM3_AXI_0/CM3_SYS_AXI3] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
  create_bd_addr_seg -range 0x00002000 -offset 0x60000000 [get_bd_addr_spaces CORTEXM3_AXI_0/CM3_CODE_AXI3] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
  create_bd_addr_seg -range 0x00010000 -offset 0x40600000 [get_bd_addr_spaces CORTEXM3_AXI_0/CM3_SYS_AXI3] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40600000 [get_bd_addr_spaces CORTEXM3_AXI_0/CM3_CODE_AXI3] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


