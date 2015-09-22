#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     dma_0_wave.tcl (Thu Jan  8 14:03:11 2015)
#
#  Module   dma_0_wrapper
#  Instance dma_0
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "system_tb${ps}dut" }

  wave add $tbpath${ps}dma_0${ps}reset_n -into $id
  wave add $tbpath${ps}dma_0${ps}pcie_clk_p -into $id
  wave add $tbpath${ps}dma_0${ps}pcie_clk_n -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_0_txp -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_0_txn -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_0_rxp -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_0_rxn -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_1_txp -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_1_txn -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_1_rxp -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_1_rxn -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_2_txp -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_2_txn -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_2_rxp -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_2_rxn -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_3_txp -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_3_txn -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_3_rxp -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_3_rxn -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_4_txp -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_4_txn -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_4_rxp -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_4_rxn -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_5_txp -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_5_txn -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_5_rxp -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_5_rxn -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_6_txp -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_6_txn -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_6_rxp -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_6_rxn -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_7_txp -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_7_txn -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_7_rxp -into $id
  wave add $tbpath${ps}dma_0${ps}pci_exp_7_rxn -into $id
# wave add $tbpath${ps}dma_0${ps}M_AXI_LITE_ACLK -into $id
# wave add $tbpath${ps}dma_0${ps}M_AXI_LITE_ARESETN -into $id
  wave add $tbpath${ps}dma_0${ps}M_AXI_LITE_AWADDR -into $id
  wave add $tbpath${ps}dma_0${ps}M_AXI_LITE_AWVALID -into $id
# wave add $tbpath${ps}dma_0${ps}M_AXI_LITE_AWREADY -into $id
  wave add $tbpath${ps}dma_0${ps}M_AXI_LITE_WDATA -into $id
  wave add $tbpath${ps}dma_0${ps}M_AXI_LITE_WSTRB -into $id
  wave add $tbpath${ps}dma_0${ps}M_AXI_LITE_WVALID -into $id
# wave add $tbpath${ps}dma_0${ps}M_AXI_LITE_WREADY -into $id
# wave add $tbpath${ps}dma_0${ps}M_AXI_LITE_BRESP -into $id
# wave add $tbpath${ps}dma_0${ps}M_AXI_LITE_BVALID -into $id
  wave add $tbpath${ps}dma_0${ps}M_AXI_LITE_BREADY -into $id
  wave add $tbpath${ps}dma_0${ps}M_AXI_LITE_ARADDR -into $id
  wave add $tbpath${ps}dma_0${ps}M_AXI_LITE_ARVALID -into $id
# wave add $tbpath${ps}dma_0${ps}M_AXI_LITE_ARREADY -into $id
# wave add $tbpath${ps}dma_0${ps}M_AXI_LITE_RDATA -into $id
# wave add $tbpath${ps}dma_0${ps}M_AXI_LITE_RRESP -into $id
# wave add $tbpath${ps}dma_0${ps}M_AXI_LITE_RVALID -into $id
  wave add $tbpath${ps}dma_0${ps}M_AXI_LITE_RREADY -into $id
# wave add $tbpath${ps}dma_0${ps}S_AXI_ACLK -into $id
# wave add $tbpath${ps}dma_0${ps}S_AXI_ARESETN -into $id
# wave add $tbpath${ps}dma_0${ps}S_AXI_AWADDR -into $id
# wave add $tbpath${ps}dma_0${ps}S_AXI_AWVALID -into $id
  wave add $tbpath${ps}dma_0${ps}S_AXI_AWREADY -into $id
# wave add $tbpath${ps}dma_0${ps}S_AXI_WDATA -into $id
# wave add $tbpath${ps}dma_0${ps}S_AXI_WSTRB -into $id
# wave add $tbpath${ps}dma_0${ps}S_AXI_WVALID -into $id
  wave add $tbpath${ps}dma_0${ps}S_AXI_WREADY -into $id
  wave add $tbpath${ps}dma_0${ps}S_AXI_BRESP -into $id
  wave add $tbpath${ps}dma_0${ps}S_AXI_BVALID -into $id
# wave add $tbpath${ps}dma_0${ps}S_AXI_BREADY -into $id
# wave add $tbpath${ps}dma_0${ps}S_AXI_ARADDR -into $id
# wave add $tbpath${ps}dma_0${ps}S_AXI_ARVALID -into $id
  wave add $tbpath${ps}dma_0${ps}S_AXI_ARREADY -into $id
  wave add $tbpath${ps}dma_0${ps}S_AXI_RDATA -into $id
  wave add $tbpath${ps}dma_0${ps}S_AXI_RRESP -into $id
  wave add $tbpath${ps}dma_0${ps}S_AXI_RVALID -into $id
# wave add $tbpath${ps}dma_0${ps}S_AXI_RREADY -into $id
# wave add $tbpath${ps}dma_0${ps}M_AXIS_ACLK -into $id
  wave add $tbpath${ps}dma_0${ps}M_AXIS_TDATA -into $id
  wave add $tbpath${ps}dma_0${ps}M_AXIS_TSTRB -into $id
  wave add $tbpath${ps}dma_0${ps}M_AXIS_TUSER -into $id
  wave add $tbpath${ps}dma_0${ps}M_AXIS_TVALID -into $id
# wave add $tbpath${ps}dma_0${ps}M_AXIS_TREADY -into $id
  wave add $tbpath${ps}dma_0${ps}M_AXIS_TLAST -into $id
# wave add $tbpath${ps}dma_0${ps}S_AXIS_ACLK -into $id
# wave add $tbpath${ps}dma_0${ps}S_AXIS_TDATA -into $id
# wave add $tbpath${ps}dma_0${ps}S_AXIS_TSTRB -into $id
# wave add $tbpath${ps}dma_0${ps}S_AXIS_TUSER -into $id
# wave add $tbpath${ps}dma_0${ps}S_AXIS_TVALID -into $id
  wave add $tbpath${ps}dma_0${ps}S_AXIS_TREADY -into $id
# wave add $tbpath${ps}dma_0${ps}S_AXIS_TLAST -into $id

