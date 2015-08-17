#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     nf10_barrier_0_wave.tcl (Thu Jul 23 02:04:18 2015)
#
#  Module   nf10_barrier_0_wrapper
#  Instance nf10_barrier_0
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "system_axisim_tb${ps}dut" }

  wave add $tbpath${ps}nf10_barrier_0${ps}activity_stim -into $id
  wave add $tbpath${ps}nf10_barrier_0${ps}activity_rec -into $id
  wave add $tbpath${ps}nf10_barrier_0${ps}activity_trans_sim -into $id
  wave add $tbpath${ps}nf10_barrier_0${ps}activity_trans_log -into $id
  wave add $tbpath${ps}nf10_barrier_0${ps}barrier_req -into $id
  wave add $tbpath${ps}nf10_barrier_0${ps}barrier_req_trans -into $id
  wave add $tbpath${ps}nf10_barrier_0${ps}barrier_proceed -into $id

