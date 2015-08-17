#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     diff_input_buf_3_wave.tcl (Thu Jul 23 02:04:18 2015)
#
#  Module   diff_input_buf_3_wrapper
#  Instance diff_input_buf_3
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "system_axisim_tb${ps}dut" }

# wave add $tbpath${ps}diff_input_buf_3${ps}SINGLE_ENDED_INPUT -into $id
  wave add $tbpath${ps}diff_input_buf_3${ps}DIFF_INPUT_P -into $id
  wave add $tbpath${ps}diff_input_buf_3${ps}DIFF_INPUT_N -into $id

