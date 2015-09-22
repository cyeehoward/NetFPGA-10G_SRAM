#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     record_nf10_axis_converter_dma_slave_M_AXIS_wave.tcl (Fri Aug 28 11:22:59 2015)
#
#  Module   record_nf10_axis_converter_dma_slave_m_axis_wrapper
#  Instance record_nf10_axis_converter_dma_slave_M_AXIS
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "system_axisim_tb${ps}dut" }

# wave add $tbpath${ps}record_nf10_axis_converter_dma_slave_M_AXIS${ps}aclk -into $id
# wave add $tbpath${ps}record_nf10_axis_converter_dma_slave_M_AXIS${ps}s_axis_tdata -into $id
# wave add $tbpath${ps}record_nf10_axis_converter_dma_slave_M_AXIS${ps}s_axis_tstrb -into $id
# wave add $tbpath${ps}record_nf10_axis_converter_dma_slave_M_AXIS${ps}s_axis_tuser -into $id
# wave add $tbpath${ps}record_nf10_axis_converter_dma_slave_M_AXIS${ps}s_axis_tvalid -into $id
  wave add $tbpath${ps}record_nf10_axis_converter_dma_slave_M_AXIS${ps}s_axis_tready -into $id
# wave add $tbpath${ps}record_nf10_axis_converter_dma_slave_M_AXIS${ps}s_axis_tlast -into $id
  wave add $tbpath${ps}record_nf10_axis_converter_dma_slave_M_AXIS${ps}counter -into $id
  wave add $tbpath${ps}record_nf10_axis_converter_dma_slave_M_AXIS${ps}activity_rec -into $id

