#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     axi_timebase_wdt_0_wave.tcl (Fri Aug 28 11:22:59 2015)
#
#  Module   axi_timebase_wdt_0_wrapper
#  Instance axi_timebase_wdt_0
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "system_axisim_tb${ps}dut" }

# wave add $tbpath${ps}axi_timebase_wdt_0${ps}WDT_Reset -into $id
# wave add $tbpath${ps}axi_timebase_wdt_0${ps}Timebase_Interrupt -into $id
# wave add $tbpath${ps}axi_timebase_wdt_0${ps}WDT_Interrupt -into $id
  wave add $tbpath${ps}axi_timebase_wdt_0${ps}Freeze -into $id
# wave add $tbpath${ps}axi_timebase_wdt_0${ps}S_AXI_ACLK -into $id
# wave add $tbpath${ps}axi_timebase_wdt_0${ps}S_AXI_ARESETN -into $id
# wave add $tbpath${ps}axi_timebase_wdt_0${ps}S_AXI_AWADDR -into $id
# wave add $tbpath${ps}axi_timebase_wdt_0${ps}S_AXI_AWVALID -into $id
  wave add $tbpath${ps}axi_timebase_wdt_0${ps}S_AXI_AWREADY -into $id
# wave add $tbpath${ps}axi_timebase_wdt_0${ps}S_AXI_WDATA -into $id
# wave add $tbpath${ps}axi_timebase_wdt_0${ps}S_AXI_WSTRB -into $id
# wave add $tbpath${ps}axi_timebase_wdt_0${ps}S_AXI_WVALID -into $id
  wave add $tbpath${ps}axi_timebase_wdt_0${ps}S_AXI_WREADY -into $id
  wave add $tbpath${ps}axi_timebase_wdt_0${ps}S_AXI_BRESP -into $id
  wave add $tbpath${ps}axi_timebase_wdt_0${ps}S_AXI_BVALID -into $id
# wave add $tbpath${ps}axi_timebase_wdt_0${ps}S_AXI_BREADY -into $id
# wave add $tbpath${ps}axi_timebase_wdt_0${ps}S_AXI_ARADDR -into $id
# wave add $tbpath${ps}axi_timebase_wdt_0${ps}S_AXI_ARVALID -into $id
  wave add $tbpath${ps}axi_timebase_wdt_0${ps}S_AXI_ARREADY -into $id
  wave add $tbpath${ps}axi_timebase_wdt_0${ps}S_AXI_RDATA -into $id
  wave add $tbpath${ps}axi_timebase_wdt_0${ps}S_AXI_RRESP -into $id
  wave add $tbpath${ps}axi_timebase_wdt_0${ps}S_AXI_RVALID -into $id
# wave add $tbpath${ps}axi_timebase_wdt_0${ps}S_AXI_RREADY -into $id

