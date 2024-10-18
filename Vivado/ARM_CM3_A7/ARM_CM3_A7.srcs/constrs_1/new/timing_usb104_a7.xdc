# -----------------------------------------------------------------------------
#  The confidential and proprietary information contained in this file may
#  only be used by a person authorised under and to the extent permitted
#  by a subsisting licensing agreement from ARM limited.
#
#             (C) COPYRIGHT 2018 ARM limited.
#                 ALL RIGHTS RESERVED
#
#  This entire notice must be reproduced on all copies of this file
#  and copies of this file may only be made by a person if such person is
#  permitted to do so under the terms of a subsisting license agreement
#  from ARM limited.
#
#       SVN Information
#
#       Checked In          : $Date$
#
#       Revision            : $Revision$
#
#       Release Information : Cortex-M3 DesignStart-r0p1-00rel0
#
# -----------------------------------------------------------------------------
#  Project : Cortex-M3 Arty A7 Example design with V2C-DAPLink adaptor board
#
#  Purpose : Constraints for M3 on Arty A7 board
#            IO standards and pull-ups
#            Timing constraints for IO.  
#            (Base clock frequencies defined by board file)
#
# -----------------------------------------------------------------------------

# --------------------------------------------------
# JTAG ports
# --------------------------------------------------

# JTAG connected to PMOD connector JC (nearest to device)
set_property PULLUP true [get_ports nTRST]
set_property PULLDOWN true [get_ports TDI]
#set_property PULLUP true [get_ports nRESET]

set_property IOSTANDARD LVCMOS33 [get_ports nTRST]
set_property IOSTANDARD LVCMOS33 [get_ports TDI]
set_property IOSTANDARD LVCMOS33 [get_ports TDO[0]]


# *****************************************************************************
# Timing
# *****************************************************************************

# Overall timing derived from clock wizard

# --------------------------------------------------
# Clocks
# --------------------------------------------------


# --------------------------------------------------
# Input clocks
# --------------------------------------------------

# --------------------------------------------------
# Clock groups
# --------------------------------------------------


# Set asynchronous clocks
# This comamnd overrides all other timing settings, including the desired set_max_delay.  See forum post
# https://forums.xilinx.com/t5/Timing-Analysis/CDC-Constrains-set-clock-groups-precedes-set-max-delay/td-p/589843
# Therefore better to do set_false_paths where necessary, and set_max_delay where desired.
#set_clock_groups -name async_group -asynchronous -group {cpu_clk} \
#                                                 -group {qspi_clk base_qspi_clk dap_qspi_clk dap_spi_clk} \
#                                                 -group {SWCLKTCK} \
#                                                 -group {slow_out_clk}

# REVISIT - replace with max_delay constraint
#set_false_path -from [get_clocks cpu_clk] -to [get_clocks -include_generated_clocks qspi_clk]
#set_false_path -from [get_clocks -include_generated_clocks qspi_clk] -to [get_clocks cpu_clk]

set_max_delay [get_clocks sys_clock] -datapath_only 16.0

                                                 
# --------------------------------------------------
# Internal timings
# --------------------------------------------------
# The DAP is asynchronous to the CPU, (SWCLKTCK and cpu_clk).
# However need to ensure that all signals pass across the relevant CDC structures quickly enough
# This should be within 2 cycles of the fastest clock, (cpu_clk).  This is currently 50MHz, ~20ns.
# We only wish to constrain the acutal datapath, we do not need to consider clock skew and jitter
# as these are asychronous clocks
# Set to be less that cpu_clk period for guaranteed transistion times.
set_max_delay -from [get_clocks sys_clock] -to [get_clocks TCK]   -datapath_only 16.0
set_max_delay -from [get_clocks TCK]   -to [get_clocks sys_clock] -datapath_only 16.0

# --------------------------------------------------
# Debug signals
# --------------------------------------------------

set debug_od 5.0
set debug_id 5.0

# JTAG
# Note, these are optional ports and may be removed from the build
set_input_delay  -clock [get_clocks TCK] -add_delay $debug_id [get_ports TDI]
set_input_delay  -clock [get_clocks TCK] -add_delay $debug_id [get_ports nTRST]
set_output_delay -clock [get_clocks TCK] -add_delay $debug_od [get_ports TDO*]

# --------------------------------------------------
# Untimed ports
# --------------------------------------------------
# Following ports have no timing requirement to any output or on-board clock.
# Set to small delays to give timing closure
set untimed_od 0.5
set untimed_id 0.5

# Reset
set_input_delay  -clock [get_clocks sys_clock] -add_delay $untimed_id [get_ports reset*]
