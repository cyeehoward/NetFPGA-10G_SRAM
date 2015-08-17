#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     stim_dma_0_M_AXIS_wave.tcl (Thu Jul 23 02:04:18 2015)
#
#  Module   stim_dma_0_m_axis_wrapper
#  Instance stim_dma_0_M_AXIS
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "system_axisim_tb${ps}dut" }

# wave add $tbpath${ps}stim_dma_0_M_AXIS${ps}aclk -into $id
  wave add $tbpath${ps}stim_dma_0_M_AXIS${ps}aresetn -into $id
  wave add $tbpath${ps}stim_dma_0_M_AXIS${ps}m_axis_tdata -into $id
  wave add $tbpath${ps}stim_dma_0_M_AXIS${ps}m_axis_tstrb -into $id
  wave add $tbpath${ps}stim_dma_0_M_AXIS${ps}m_axis_tuser -into $id
  wave add $tbpath${ps}stim_dma_0_M_AXIS${ps}m_axis_tvalid -into $id
# wave add $tbpath${ps}stim_dma_0_M_AXIS${ps}m_axis_tready -into $id
  wave add $tbpath${ps}stim_dma_0_M_AXIS${ps}m_axis_tlast -into $id
  wave add $tbpath${ps}stim_dma_0_M_AXIS${ps}counter -into $id
  wave add $tbpath${ps}stim_dma_0_M_AXIS${ps}activity_stim -into $id
  wave add $tbpath${ps}stim_dma_0_M_AXIS${ps}barrier_req -into $id
  wave add $tbpath${ps}stim_dma_0_M_AXIS${ps}barrier_proceed -into $id

