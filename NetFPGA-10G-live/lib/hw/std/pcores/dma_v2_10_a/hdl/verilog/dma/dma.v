/*******************************************************************************
 *
 *  NetFPGA-10G http://www.netfpga.org
 *
 *  File:
 *        dma.v
 *
 *  Library:
 *        hw/std/pcores/dma_v2_10_a
 *
 *  Module:
 *        dma
 *
 *  Author:
 *        Mario Flajslik
 *        James Hongyi Zeng	
 *        Marco Forconesi
 *
 *  Description:
 *        Top level DMA module that wraps the dma_engine with the PCIe core,
 *        AXI lite master and AXI lite slave test registers.
 *
 *  Copyright notice:
 *        Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
 *                                 Junior University
 *
 *  Licence:
 *        This file is part of the NetFPGA 10G development base package.
 *
 *        This file is free code: you can redistribute it and/or modify it under
 *        the terms of the GNU Lesser General Public License version 2.1 as
 *        published by the Free Software Foundation.
 *
 *        This package is distributed in the hope that it will be useful, but
 *        WITHOUT ANY WARRANTY; without even the implied warranty of
 *        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *        Lesser General Public License for more details.
 *
 *        You should have received a copy of the GNU Lesser General Public
 *        License along with the NetFPGA source package.  If not, see
 *        http://www.gnu.org/licenses/.
 *
 */
`timescale 1ns / 1ps

module dma
#(
    // Master AXI Stream Data Width
  parameter                              C_M_AXIS_DATA_WIDTH = 32,
  parameter                              C_S_AXIS_DATA_WIDTH = 32,
    parameter C_BASEADDR=32'hffffffff,
    parameter C_HIGHADDR=32'h0
)
  (
   input          reset_n,
     
   // PCIe
   input          pcie_clk_p, // 100 MHz
   input          pcie_clk_n, // 100 MHz
   output         pci_exp_0_txp,
   output         pci_exp_0_txn,
   input          pci_exp_0_rxp,
   input          pci_exp_0_rxn,
   output         pci_exp_1_txp,
   output         pci_exp_1_txn,
   input          pci_exp_1_rxp,
   input          pci_exp_1_rxn,
   output         pci_exp_2_txp,
   output         pci_exp_2_txn,
   input          pci_exp_2_rxp,
   input          pci_exp_2_rxn,
   output         pci_exp_3_txp,
   output         pci_exp_3_txn,
   input          pci_exp_3_rxp,
   input          pci_exp_3_rxn,
   output         pci_exp_4_txp,
   output         pci_exp_4_txn,
   input          pci_exp_4_rxp,
   input          pci_exp_4_rxn,
   output         pci_exp_5_txp,
   output         pci_exp_5_txn,
   input          pci_exp_5_rxp,
   input          pci_exp_5_rxn,
   output         pci_exp_6_txp,
   output         pci_exp_6_txn,
   input          pci_exp_6_rxp,
   input          pci_exp_6_rxn,
   output         pci_exp_7_txp,
   output         pci_exp_7_txn,
   input          pci_exp_7_rxp,
   input          pci_exp_7_rxn,


   // axi streaming data interface
   input          M_AXIS_ACLK,
   output [C_M_AXIS_DATA_WIDTH-1:0]  M_AXIS_TDATA,
   output [C_M_AXIS_DATA_WIDTH/8-1:0]   M_AXIS_TSTRB,
   output         M_AXIS_TVALID,
   output [127:0] M_AXIS_TUSER,
   input          M_AXIS_TREADY,
   output         M_AXIS_TLAST,
  
   input          S_AXIS_ACLK,
   input [C_S_AXIS_DATA_WIDTH-1:0]   S_AXIS_TDATA,
   input [C_S_AXIS_DATA_WIDTH/8-1:0]    S_AXIS_TSTRB,
   input          S_AXIS_TVALID,
   output         S_AXIS_TREADY,
   input [127:0]  S_AXIS_TUSER,
   input          S_AXIS_TLAST,

   // AXI lite master
   input          M_AXI_LITE_ACLK,
   input          M_AXI_LITE_ARESETN,
   output [31:0]  M_AXI_LITE_ARADDR,
   output         M_AXI_LITE_ARVALID,
   input          M_AXI_LITE_ARREADY,
   input [31:0]   M_AXI_LITE_RDATA,
   input [1:0]    M_AXI_LITE_RRESP,
   input          M_AXI_LITE_RVALID,
   output         M_AXI_LITE_RREADY,
   output [31:0]  M_AXI_LITE_AWADDR,
   output         M_AXI_LITE_AWVALID,
   input          M_AXI_LITE_AWREADY,
   output [31:0]  M_AXI_LITE_WDATA,
   output [3:0]   M_AXI_LITE_WSTRB,
   output         M_AXI_LITE_WVALID,
   input          M_AXI_LITE_WREADY,
   input [1:0]    M_AXI_LITE_BRESP,
   input          M_AXI_LITE_BVALID,
   output         M_AXI_LITE_BREADY, 
   
   // axi lite control/status interface
   input          S_AXI_ACLK,
   input          S_AXI_ARESETN,
   input [31:0]   S_AXI_AWADDR,
   input          S_AXI_AWVALID,
   output         S_AXI_AWREADY,
   input [31:0]   S_AXI_WDATA,
   input [3:0]    S_AXI_WSTRB,
   input          S_AXI_WVALID,
   output         S_AXI_WREADY,
   output [1:0]   S_AXI_BRESP,
   output         S_AXI_BVALID,
   input          S_AXI_BREADY,
   input [31:0]   S_AXI_ARADDR,
   input          S_AXI_ARVALID,
   output         S_AXI_ARREADY,
   output [31:0]  S_AXI_RDATA,
   output [1:0]   S_AXI_RRESP,
   output         S_AXI_RVALID,
   input          S_AXI_RREADY    
   );
   
   
   wire           pcie_clk;
   wire           pcie_rst;
   wire [7:0]     pci_exp_txp;
   wire [7:0]     pci_exp_txn;
   wire [7:0]     pci_exp_rxp;
   wire [7:0]     pci_exp_rxn;

   // AXI lite master core interface
   wire           IP2Bus_MstRd_Req;
   wire           IP2Bus_MstWr_Req;
   wire [31:0]    IP2Bus_Mst_Addr;
   wire [3:0]     IP2Bus_Mst_BE;
   wire           IP2Bus_Mst_Lock;
   wire           IP2Bus_Mst_Reset;
   wire           Bus2IP_Mst_CmdAck;
   wire           Bus2IP_Mst_Cmplt;
   wire           Bus2IP_Mst_Error;
   wire           Bus2IP_Mst_Rearbitrate;
   wire           Bus2IP_Mst_Timeout;
   wire [31:0]    Bus2IP_MstRd_d;
   wire           Bus2IP_MstRd_src_rdy_n;
   wire [31:0]    IP2Bus_MstWr_d;
   wire           Bus2IP_MstWr_dst_rdy_n;


  wire [63:0]   M_AXIS_TDATA_DMA;    // AXI4-Stream (Ingress from PCIe) Master-Producer...
  wire [7:0] M_AXIS_TSTRB_DMA;
  wire [127:0]   M_AXIS_TUSER_DMA; 
  wire                                 M_AXIS_TLAST_DMA;
  wire                                 M_AXIS_TVALID_DMA;
  wire                                 M_AXIS_TREADY_DMA;

  wire  [63:0]   S_AXIS_TDATA_DMA;    // AXI4-Stream (Egress to PCIe) Slave-Consumer...
  wire  [7:0] S_AXIS_TSTRB_DMA;
  wire  [127:0]   S_AXIS_TUSER_DMA; 
  wire                                  S_AXIS_TLAST_DMA;
  wire                                  S_AXIS_TVALID_DMA;
  wire                                  S_AXIS_TREADY_DMA;


   assign {pci_exp_7_txp, pci_exp_6_txp, pci_exp_5_txp, pci_exp_4_txp, pci_exp_3_txp, pci_exp_2_txp, pci_exp_1_txp, pci_exp_0_txp} = pci_exp_txp;
   assign {pci_exp_7_txn, pci_exp_6_txn, pci_exp_5_txn, pci_exp_4_txn, pci_exp_3_txn, pci_exp_2_txn, pci_exp_1_txn, pci_exp_0_txn} = pci_exp_txn;
   assign pci_exp_rxp = {pci_exp_7_rxp, pci_exp_6_rxp, pci_exp_5_rxp, pci_exp_4_rxp, pci_exp_3_rxp, pci_exp_2_rxp, pci_exp_1_rxp, pci_exp_0_rxp};
   assign pci_exp_rxn = {pci_exp_7_rxn, pci_exp_6_rxn, pci_exp_5_rxn, pci_exp_4_rxn, pci_exp_3_rxn, pci_exp_2_rxn, pci_exp_1_rxn, pci_exp_0_rxn};

    async_axis_converter 
    #(.C_M_AXIS_DATA_WIDTH(C_M_AXIS_DATA_WIDTH),
      .C_S_AXIS_DATA_WIDTH(64)
     ) converter_master
    (
    // Global Ports
    .axi_aclk_160(M_AXIS_ACLK),
    .axi_aclk_250(pcie_clk),
    .axi_resetn(reset_n),
    
    // Master Stream Ports
    .m_axis_tdata(M_AXIS_TDATA),
    .m_axis_tstrb(M_AXIS_TSTRB),
    .m_axis_tvalid(M_AXIS_TVALID),
    .m_axis_tready(M_AXIS_TREADY),
    .m_axis_tlast(M_AXIS_TLAST),
    .m_axis_tuser(M_AXIS_TUSER),
    
    // Slave Stream Ports
    .s_axis_tdata(M_AXIS_TDATA_DMA),
    .s_axis_tstrb(M_AXIS_TSTRB_DMA),
    .s_axis_tvalid(M_AXIS_TVALID_DMA),
    .s_axis_tready(M_AXIS_TREADY_DMA),
    .s_axis_tlast(M_AXIS_TLAST_DMA),
    .s_axis_tuser(M_AXIS_TUSER_DMA)
   );

    async_axis_converter 
    #(.C_M_AXIS_DATA_WIDTH(64),
      .C_S_AXIS_DATA_WIDTH(C_S_AXIS_DATA_WIDTH)
     ) converter_slave
    (
    // Global Ports
    .axi_aclk_160(M_AXIS_ACLK),
    .axi_aclk_250(pcie_clk),
    .axi_resetn(reset_n),
    
    // Master Stream Ports
    .m_axis_tdata(S_AXIS_TDATA_DMA),
    .m_axis_tstrb(S_AXIS_TSTRB_DMA),
    .m_axis_tvalid(S_AXIS_TVALID_DMA),
    .m_axis_tready(S_AXIS_TREADY_DMA),
    .m_axis_tlast(S_AXIS_TLAST_DMA),
    .m_axis_tuser(S_AXIS_TUSER_DMA),
    
    // Slave Stream Ports
    .s_axis_tdata(S_AXIS_TDATA),
    .s_axis_tstrb(S_AXIS_TSTRB),
    .s_axis_tvalid(S_AXIS_TVALID),
    .s_axis_tready(S_AXIS_TREADY),
    .s_axis_tlast(S_AXIS_TLAST),
    .s_axis_tuser(S_AXIS_TUSER)
   );

    //-------------------------------------------------------
    // NAAS_DMA
    //-------------------------------------------------------
    naas_dma_v5 #(
        .CHN0_RX_CONFIG_TIMESTAMP(0),
        .CONFIG_MDIO_IF(0),
        .CONFIG_REGIF(1)
    ) naas_dma_mod (
        // PCIe
        .sys_clk_p(pcie_clk_p),                                // I
        .sys_clk_n(pcie_clk_n),                                // I
        .pci_exp_txp(pci_exp_txp),                             // O [7:0]
        .pci_exp_txn(pci_exp_txn),                             // O [7:0]
        .pci_exp_rxp(pci_exp_rxp),                             // I [7:0]
        .pci_exp_rxn(pci_exp_rxn),                             // I [7:0]
        .pcie_clk(pcie_clk),                                   // O
        .pcie_rst(pcie_rst),                                   // O
        // BKD
        .bkd_clk(pcie_clk),                                    // I
        .bkd_rst(pcie_rst),                                    // I
        // BKD tx
        .m_axis_tdata(M_AXIS_TDATA_DMA),                       // O [63:0]
        .m_axis_tstrb(M_AXIS_TSTRB_DMA),                       // O [7:0]
        .m_axis_tuser(M_AXIS_TUSER_DMA),                       // O [127:0]
        .m_axis_tvalid(M_AXIS_TVALID_DMA),                     // O
        .m_axis_tlast(M_AXIS_TLAST_DMA),                       // O
        .m_axis_tready(M_AXIS_TREADY_DMA),                     // I
        // BKD rx
        .s_axis_tdata(S_AXIS_TDATA_DMA),                       // I [63:0]
        .s_axis_tstrb(S_AXIS_TSTRB_DMA),                       // I [7:0]
        .s_axis_tuser(S_AXIS_TUSER_DMA),                       // I [127:0]
        .s_axis_tvalid(S_AXIS_TVALID_DMA),                     // I
        .s_axis_tlast(S_AXIS_TLAST_DMA),                       // I
        .s_axis_tready(S_AXIS_TREADY_DMA),                     // O
        // REGIF
        .reg_int_clk(M_AXI_LITE_ACLK),                         // I
        .reg_int_reset_n(M_AXI_LITE_ARESETN),                  // I
        .IP2Bus_MstRd_Req(IP2Bus_MstRd_Req),                   // O
        .IP2Bus_MstWr_Req(IP2Bus_MstWr_Req),                   // O
        .IP2Bus_Mst_Addr(IP2Bus_Mst_Addr),                     // O [31:0]
        .IP2Bus_Mst_BE(IP2Bus_Mst_BE),                         // O [3:0]
        .IP2Bus_Mst_Lock(IP2Bus_Mst_Lock),                     // O
        .IP2Bus_Mst_Reset(IP2Bus_Mst_Reset),                   // O
        .Bus2IP_Mst_CmdAck(Bus2IP_Mst_CmdAck),                 // I
        .Bus2IP_Mst_Cmplt(Bus2IP_Mst_Cmplt),                   // I
        .Bus2IP_Mst_Error(Bus2IP_Mst_Error),                   // I
        .Bus2IP_Mst_Rearbitrate(Bus2IP_Mst_Rearbitrate),       // I
        .Bus2IP_Mst_Timeout(Bus2IP_Mst_Timeout),               // I
        .Bus2IP_MstRd_d(Bus2IP_MstRd_d),                       // I [31:0]
        .Bus2IP_MstRd_src_rdy_n(Bus2IP_MstRd_src_rdy_n),       // I
        .IP2Bus_MstWr_d(IP2Bus_MstWr_d),                       // O [31:0]
        .Bus2IP_MstWr_dst_rdy_n(Bus2IP_MstWr_dst_rdy_n)        // I
        );

   axi_master_lite u_axi_m
     (
      .m_axi_lite_aclk(M_AXI_LITE_ACLK),
      .m_axi_lite_aresetn(M_AXI_LITE_ARESETN),
      .md_error(),
      .m_axi_lite_araddr(M_AXI_LITE_ARADDR),
      .m_axi_lite_arvalid(M_AXI_LITE_ARVALID),
      .m_axi_lite_arready(M_AXI_LITE_ARREADY),
      .m_axi_lite_arprot(),
      .m_axi_lite_rdata(M_AXI_LITE_RDATA),
      .m_axi_lite_rresp(M_AXI_LITE_RRESP),
      .m_axi_lite_rvalid(M_AXI_LITE_RVALID),
      .m_axi_lite_rready(M_AXI_LITE_RREADY),
      .m_axi_lite_awaddr(M_AXI_LITE_AWADDR),
      .m_axi_lite_awvalid(M_AXI_LITE_AWVALID),
      .m_axi_lite_awready(M_AXI_LITE_AWREADY),
      .m_axi_lite_awprot(),
      .m_axi_lite_wdata(M_AXI_LITE_WDATA),
      .m_axi_lite_wstrb(M_AXI_LITE_WSTRB),
      .m_axi_lite_wvalid(M_AXI_LITE_WVALID),
      .m_axi_lite_wready(M_AXI_LITE_WREADY),
      .m_axi_lite_bresp(M_AXI_LITE_BRESP),
      .m_axi_lite_bvalid(M_AXI_LITE_BVALID),
      .m_axi_lite_bready(M_AXI_LITE_BREADY),      
      .ip2bus_mstrd_req(IP2Bus_MstRd_Req),
      .ip2bus_mstwr_req(IP2Bus_MstWr_Req),
      .ip2bus_mst_addr(IP2Bus_Mst_Addr),
      .ip2bus_mst_be(IP2Bus_Mst_BE),
      .ip2bus_mst_lock(IP2Bus_Mst_Lock),
      .ip2bus_mst_reset(IP2Bus_Mst_Reset),
      .bus2ip_mst_cmdack(Bus2IP_Mst_CmdAck),
      .bus2ip_mst_cmplt(Bus2IP_Mst_Cmplt),
      .bus2ip_mst_error(Bus2IP_Mst_Error),
      .bus2ip_mst_rearbitrate(Bus2IP_Mst_Rearbitrate),
      .bus2ip_mst_cmd_timeout(Bus2IP_Mst_Timeout),
      .bus2ip_mstrd_d(Bus2IP_MstRd_d),
      .bus2ip_mstrd_src_rdy_n(Bus2IP_MstRd_src_rdy_n),
      .ip2bus_mstwr_d(IP2Bus_MstWr_d),
      .bus2ip_mstwr_dst_rdy_n(Bus2IP_MstWr_dst_rdy_n)
      );


   axi4_lite_regs_test u_axi_test
     (
      .ACLK(S_AXI_ACLK),
      .ARESETN(S_AXI_ARESETN),
      .AWADDR(S_AXI_AWADDR),
      .AWVALID(S_AXI_AWVALID),
      .AWREADY(S_AXI_AWREADY),
      .WDATA(S_AXI_WDATA),
      .WSTRB(S_AXI_WSTRB),
      .WVALID(S_AXI_WVALID),
      .WREADY(S_AXI_WREADY),
      .BRESP(S_AXI_BRESP),
      .BVALID(S_AXI_BVALID),
      .BREADY(S_AXI_BREADY),
      .ARADDR(S_AXI_ARADDR),
      .ARVALID(S_AXI_ARVALID),
      .ARREADY(S_AXI_ARREADY),
      .RDATA(S_AXI_RDATA),
      .RRESP(S_AXI_RRESP),
      .RVALID(S_AXI_RVALID),
      .RREADY(S_AXI_RREADY)
      );

   
endmodule
