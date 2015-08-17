//-----------------------------------------------------------------------------
// nf10_nic_output_port_lookup_0_wrapper.v
//-----------------------------------------------------------------------------

`timescale 1 ps / 100 fs

`uselib lib=unisims_ver lib=proc_common_v3_00_a lib=axi_lite_ipif_v1_01_a lib=nf10_proc_common_v1_00_a lib=nf10_nic_output_port_lookup_v1_10_a

module nf10_nic_output_port_lookup_0_wrapper
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
    S_AXI_ARESETN,
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
    S_AXI_AWREADY
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
  input S_AXI_ARESETN;
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

  nf10_nic_output_port_lookup
    #(
      .C_S_AXI_DATA_WIDTH ( 32 ),
      .C_S_AXI_ADDR_WIDTH ( 32 ),
      .C_BASEADDR ( 32'h75400000 ),
      .C_HIGHADDR ( 32'h7540ffff ),
      .C_FAMILY ( "virtex5" ),
      .C_S_AXI_ACLK_FREQ_HZ ( 160000000 ),
      .C_M_AXIS_DATA_WIDTH ( 256 ),
      .C_S_AXIS_DATA_WIDTH ( 256 ),
      .C_M_AXIS_TUSER_WIDTH ( 128 ),
      .C_S_AXIS_TUSER_WIDTH ( 128 )
    )
    nf10_nic_output_port_lookup_0 (
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
      .S_AXI_ARESETN ( S_AXI_ARESETN ),
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
      .S_AXI_AWREADY ( S_AXI_AWREADY )
    );

endmodule

