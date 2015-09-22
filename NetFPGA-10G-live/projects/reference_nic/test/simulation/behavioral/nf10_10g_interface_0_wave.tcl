#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     nf10_10g_interface_0_wave.tcl (Thu Jan  8 14:03:11 2015)
#
#  Module   nf10_10g_interface_0_wrapper
#  Instance nf10_10g_interface_0
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "system_tb${ps}dut" }

# wave add $tbpath${ps}nf10_10g_interface_0${ps}axi_aclk -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}axi_resetn -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}m_axis_tdata -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}m_axis_tstrb -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}m_axis_tuser -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}m_axis_tvalid -into $id
# wave add $tbpath${ps}nf10_10g_interface_0${ps}m_axis_tready -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}m_axis_tlast -into $id
# wave add $tbpath${ps}nf10_10g_interface_0${ps}s_axis_tdata -into $id
# wave add $tbpath${ps}nf10_10g_interface_0${ps}s_axis_tstrb -into $id
# wave add $tbpath${ps}nf10_10g_interface_0${ps}s_axis_tuser -into $id
# wave add $tbpath${ps}nf10_10g_interface_0${ps}s_axis_tvalid -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}s_axis_tready -into $id
# wave add $tbpath${ps}nf10_10g_interface_0${ps}s_axis_tlast -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}refclk -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}dclk -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}xaui_tx_l0_p -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}xaui_tx_l0_n -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}xaui_tx_l1_p -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}xaui_tx_l1_n -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}xaui_tx_l2_p -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}xaui_tx_l2_n -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}xaui_tx_l3_p -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}xaui_tx_l3_n -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}xaui_rx_l0_p -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}xaui_rx_l0_n -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}xaui_rx_l1_p -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}xaui_rx_l1_n -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}xaui_rx_l2_p -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}xaui_rx_l2_n -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}xaui_rx_l3_p -into $id
  wave add $tbpath${ps}nf10_10g_interface_0${ps}xaui_rx_l3_n -into $id

