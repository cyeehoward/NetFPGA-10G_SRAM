#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     reset_0_wave.tcl (Thu Jul 23 02:04:18 2015)
#
#  Module   reset_0_wrapper
#  Instance reset_0
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "system_axisim_tb${ps}dut" }

  wave add $tbpath${ps}reset_0${ps}Slowest_sync_clk -into $id
  wave add $tbpath${ps}reset_0${ps}Ext_Reset_In -into $id
  wave add $tbpath${ps}reset_0${ps}Aux_Reset_In -into $id
  wave add $tbpath${ps}reset_0${ps}MB_Debug_Sys_Rst -into $id
# wave add $tbpath${ps}reset_0${ps}Core_Reset_Req_0 -into $id
# wave add $tbpath${ps}reset_0${ps}Chip_Reset_Req_0 -into $id
# wave add $tbpath${ps}reset_0${ps}System_Reset_Req_0 -into $id
# wave add $tbpath${ps}reset_0${ps}Core_Reset_Req_1 -into $id
# wave add $tbpath${ps}reset_0${ps}Chip_Reset_Req_1 -into $id
# wave add $tbpath${ps}reset_0${ps}System_Reset_Req_1 -into $id
  wave add $tbpath${ps}reset_0${ps}Dcm_locked -into $id
# wave add $tbpath${ps}reset_0${ps}RstcPPCresetcore_0 -into $id
# wave add $tbpath${ps}reset_0${ps}RstcPPCresetchip_0 -into $id
# wave add $tbpath${ps}reset_0${ps}RstcPPCresetsys_0 -into $id
# wave add $tbpath${ps}reset_0${ps}RstcPPCresetcore_1 -into $id
# wave add $tbpath${ps}reset_0${ps}RstcPPCresetchip_1 -into $id
# wave add $tbpath${ps}reset_0${ps}RstcPPCresetsys_1 -into $id
  wave add $tbpath${ps}reset_0${ps}MB_Reset -into $id
  wave add $tbpath${ps}reset_0${ps}Bus_Struct_Reset -into $id
# wave add $tbpath${ps}reset_0${ps}Peripheral_Reset -into $id
  wave add $tbpath${ps}reset_0${ps}Interconnect_aresetn -into $id
  wave add $tbpath${ps}reset_0${ps}Peripheral_aresetn -into $id

