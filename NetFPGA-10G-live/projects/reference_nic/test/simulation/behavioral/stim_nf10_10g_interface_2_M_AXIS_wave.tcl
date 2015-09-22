#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     stim_nf10_10g_interface_2_M_AXIS_wave.tcl (Fri Aug 28 11:22:59 2015)
#
#  Module   stim_nf10_10g_interface_2_m_axis_wrapper
#  Instance stim_nf10_10g_interface_2_M_AXIS
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "system_axisim_tb${ps}dut" }

# wave add $tbpath${ps}stim_nf10_10g_interface_2_M_AXIS${ps}aclk -into $id
  wave add $tbpath${ps}stim_nf10_10g_interface_2_M_AXIS${ps}aresetn -into $id
  wave add $tbpath${ps}stim_nf10_10g_interface_2_M_AXIS${ps}m_axis_tdata -into $id
  wave add $tbpath${ps}stim_nf10_10g_interface_2_M_AXIS${ps}m_axis_tstrb -into $id
  wave add $tbpath${ps}stim_nf10_10g_interface_2_M_AXIS${ps}m_axis_tuser -into $id
  wave add $tbpath${ps}stim_nf10_10g_interface_2_M_AXIS${ps}m_axis_tvalid -into $id
# wave add $tbpath${ps}stim_nf10_10g_interface_2_M_AXIS${ps}m_axis_tready -into $id
  wave add $tbpath${ps}stim_nf10_10g_interface_2_M_AXIS${ps}m_axis_tlast -into $id
  wave add $tbpath${ps}stim_nf10_10g_interface_2_M_AXIS${ps}counter -into $id
  wave add $tbpath${ps}stim_nf10_10g_interface_2_M_AXIS${ps}activity_stim -into $id
  wave add $tbpath${ps}stim_nf10_10g_interface_2_M_AXIS${ps}barrier_req -into $id
  wave add $tbpath${ps}stim_nf10_10g_interface_2_M_AXIS${ps}barrier_proceed -into $id

