#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     microblaze_0_ilmb_wave.tcl (Fri Aug 28 11:22:59 2015)
#
#  Module   microblaze_0_ilmb_wrapper
#  Instance microblaze_0_ilmb
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "system_axisim_tb${ps}dut" }

# wave add $tbpath${ps}microblaze_0_ilmb${ps}LMB_Clk -into $id
# wave add $tbpath${ps}microblaze_0_ilmb${ps}SYS_Rst -into $id
  wave add $tbpath${ps}microblaze_0_ilmb${ps}LMB_Rst -into $id
# wave add $tbpath${ps}microblaze_0_ilmb${ps}M_ABus -into $id
# wave add $tbpath${ps}microblaze_0_ilmb${ps}M_ReadStrobe -into $id
# wave add $tbpath${ps}microblaze_0_ilmb${ps}M_WriteStrobe -into $id
# wave add $tbpath${ps}microblaze_0_ilmb${ps}M_AddrStrobe -into $id
# wave add $tbpath${ps}microblaze_0_ilmb${ps}M_DBus -into $id
# wave add $tbpath${ps}microblaze_0_ilmb${ps}M_BE -into $id
# wave add $tbpath${ps}microblaze_0_ilmb${ps}Sl_DBus -into $id
# wave add $tbpath${ps}microblaze_0_ilmb${ps}Sl_Ready -into $id
  wave add $tbpath${ps}microblaze_0_ilmb${ps}LMB_ABus -into $id
  wave add $tbpath${ps}microblaze_0_ilmb${ps}LMB_ReadStrobe -into $id
  wave add $tbpath${ps}microblaze_0_ilmb${ps}LMB_WriteStrobe -into $id
  wave add $tbpath${ps}microblaze_0_ilmb${ps}LMB_AddrStrobe -into $id
  wave add $tbpath${ps}microblaze_0_ilmb${ps}LMB_ReadDBus -into $id
  wave add $tbpath${ps}microblaze_0_ilmb${ps}LMB_WriteDBus -into $id
  wave add $tbpath${ps}microblaze_0_ilmb${ps}LMB_Ready -into $id
  wave add $tbpath${ps}microblaze_0_ilmb${ps}LMB_BE -into $id

