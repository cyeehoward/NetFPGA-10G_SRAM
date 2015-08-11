//-----------------------------------------------------------------------------
// nf10_10g_interface_3_wrapper.v
//-----------------------------------------------------------------------------

module nf10_10g_interface_3_wrapper
  (
    axi_aclk,
    axi_resetn,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tlast,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tuser,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tlast,
    S_AXI_ACLK,
    S_AXI_AWADDR,
    S_AXI_AWVALID,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WVALID,
    S_AXI_BREADY,
    S_AXI_ARADDR,
    S_AXI_ARVALID,
    S_AXI_RREADY,
    S_AXI_ARREADY,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_WREADY,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_AWREADY,
    refclk,
    dclk,
    xaui_tx_l0_p,
    xaui_tx_l0_n,
    xaui_tx_l1_p,
    xaui_tx_l1_n,
    xaui_tx_l2_p,
    xaui_tx_l2_n,
    xaui_tx_l3_p,
    xaui_tx_l3_n,
    xaui_rx_l0_p,
    xaui_rx_l0_n,
    xaui_rx_l1_p,
    xaui_rx_l1_n,
    xaui_rx_l2_p,
    xaui_rx_l2_n,
    xaui_rx_l3_p,
    xaui_rx_l3_n
  );
  input axi_aclk;
  input axi_resetn;
  output [255:0] m_axis_tdata;
  output [31:0] m_axis_tstrb;
  output [127:0] m_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output m_axis_tlast;
  input [255:0] s_axis_tdata;
  input [31:0] s_axis_tstrb;
  input [127:0] s_axis_tuser;
  input s_axis_tvalid;
  output s_axis_tready;
  input s_axis_tlast;
  input S_AXI_ACLK;
  input [31:0] S_AXI_AWADDR;
  input S_AXI_AWVALID;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input S_AXI_WVALID;
  input S_AXI_BREADY;
  input [31:0] S_AXI_ARADDR;
  input S_AXI_ARVALID;
  input S_AXI_RREADY;
  output S_AXI_ARREADY;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output S_AXI_RVALID;
  output S_AXI_WREADY;
  output [1:0] S_AXI_BRESP;
  output S_AXI_BVALID;
  output S_AXI_AWREADY;
  input refclk;
  input dclk;
  output xaui_tx_l0_p;
  output xaui_tx_l0_n;
  output xaui_tx_l1_p;
  output xaui_tx_l1_n;
  output xaui_tx_l2_p;
  output xaui_tx_l2_n;
  output xaui_tx_l3_p;
  output xaui_tx_l3_n;
  input xaui_rx_l0_p;
  input xaui_rx_l0_n;
  input xaui_rx_l1_p;
  input xaui_rx_l1_n;
  input xaui_rx_l2_p;
  input xaui_rx_l2_n;
  input xaui_rx_l3_p;
  input xaui_rx_l3_n;

  nf10_10g_interface
    #(
      .C_S_AXI_DATA_WIDTH ( 32 ),
      .C_S_AXI_ADDR_WIDTH ( 32 ),
      .C_BASEADDR ( 32'h77a20000 ),
      .C_HIGHADDR ( 32'h77a2ffff ),
      .C_FAMILY ( "virtex5" ),
      .C_S_AXI_ACLK_FREQ_HZ ( 100000000 ),
      .C_M_AXIS_DATA_WIDTH ( 256 ),
      .C_S_AXIS_DATA_WIDTH ( 256 ),
      .C_XAUI_REVERSE ( 0 ),
      .C_XGMAC_CONFIGURATION ( 72'h080583000000000000 ),
      .C_XAUI_CONFIGURATION ( 8'h00 ),
      .C_M_AXIS_TUSER_WIDTH ( 128 ),
      .C_S_AXIS_TUSER_WIDTH ( 128 ),
      .C_DEFAULT_VALUE_ENABLE ( 1 ),
      .C_DEFAULT_SRC_PORT ( 8'h40 ),
      .C_DEFAULT_DST_PORT ( 8'h00 )
    )
    nf10_10g_interface_3 (
      .axi_aclk ( axi_aclk ),
      .axi_resetn ( axi_resetn ),
      .m_axis_tdata ( m_axis_tdata ),
      .m_axis_tstrb ( m_axis_tstrb ),
      .m_axis_tuser ( m_axis_tuser ),
      .m_axis_tvalid ( m_axis_tvalid ),
      .m_axis_tready ( m_axis_tready ),
      .m_axis_tlast ( m_axis_tlast ),
      .s_axis_tdata ( s_axis_tdata ),
      .s_axis_tstrb ( s_axis_tstrb ),
      .s_axis_tuser ( s_axis_tuser ),
      .s_axis_tvalid ( s_axis_tvalid ),
      .s_axis_tready ( s_axis_tready ),
      .s_axis_tlast ( s_axis_tlast ),
      .S_AXI_ACLK ( S_AXI_ACLK ),
      .S_AXI_AWADDR ( S_AXI_AWADDR ),
      .S_AXI_AWVALID ( S_AXI_AWVALID ),
      .S_AXI_WDATA ( S_AXI_WDATA ),
      .S_AXI_WSTRB ( S_AXI_WSTRB ),
      .S_AXI_WVALID ( S_AXI_WVALID ),
      .S_AXI_BREADY ( S_AXI_BREADY ),
      .S_AXI_ARADDR ( S_AXI_ARADDR ),
      .S_AXI_ARVALID ( S_AXI_ARVALID ),
      .S_AXI_RREADY ( S_AXI_RREADY ),
      .S_AXI_ARREADY ( S_AXI_ARREADY ),
      .S_AXI_RDATA ( S_AXI_RDATA ),
      .S_AXI_RRESP ( S_AXI_RRESP ),
      .S_AXI_RVALID ( S_AXI_RVALID ),
      .S_AXI_WREADY ( S_AXI_WREADY ),
      .S_AXI_BRESP ( S_AXI_BRESP ),
      .S_AXI_BVALID ( S_AXI_BVALID ),
      .S_AXI_AWREADY ( S_AXI_AWREADY ),
      .refclk ( refclk ),
      .dclk ( dclk ),
      .xaui_tx_l0_p ( xaui_tx_l0_p ),
      .xaui_tx_l0_n ( xaui_tx_l0_n ),
      .xaui_tx_l1_p ( xaui_tx_l1_p ),
      .xaui_tx_l1_n ( xaui_tx_l1_n ),
      .xaui_tx_l2_p ( xaui_tx_l2_p ),
      .xaui_tx_l2_n ( xaui_tx_l2_n ),
      .xaui_tx_l3_p ( xaui_tx_l3_p ),
      .xaui_tx_l3_n ( xaui_tx_l3_n ),
      .xaui_rx_l0_p ( xaui_rx_l0_p ),
      .xaui_rx_l0_n ( xaui_rx_l0_n ),
      .xaui_rx_l1_p ( xaui_rx_l1_p ),
      .xaui_rx_l1_n ( xaui_rx_l1_n ),
      .xaui_rx_l2_p ( xaui_rx_l2_p ),
      .xaui_rx_l2_n ( xaui_rx_l2_n ),
      .xaui_rx_l3_p ( xaui_rx_l3_p ),
      .xaui_rx_l3_n ( xaui_rx_l3_n )
    );

endmodule

