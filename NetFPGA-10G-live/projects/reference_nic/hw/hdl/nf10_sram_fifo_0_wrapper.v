//-----------------------------------------------------------------------------
// nf10_sram_fifo_0_wrapper.v
//-----------------------------------------------------------------------------

module nf10_sram_fifo_0_wrapper
  (
    aclk,
    memclk,
    memclk_200,
    memclk_270,
    qdr_d_0,
    qdr_q_0,
    qdr_sa_0,
    qdr_w_n_0,
    qdr_r_n_0,
    qdr_bw_n_0,
    qdr_dll_off_n_0,
    qdr_cq_0,
    qdr_cq_n_0,
    qdr_c_n_0,
    qdr_k_n_0,
    qdr_c_0,
    qdr_k_0,
    qdr_d_1,
    qdr_q_1,
    qdr_sa_1,
    qdr_w_n_1,
    qdr_r_n_1,
    qdr_bw_n_1,
    qdr_dll_off_n_1,
    qdr_cq_1,
    qdr_cq_n_1,
    qdr_c_n_1,
    qdr_k_n_1,
    qdr_c_1,
    qdr_k_1,
    qdr_d_2,
    qdr_q_2,
    qdr_sa_2,
    qdr_w_n_2,
    qdr_r_n_2,
    qdr_bw_n_2,
    qdr_dll_off_n_2,
    qdr_cq_2,
    qdr_cq_n_2,
    qdr_c_n_2,
    qdr_k_n_2,
    qdr_c_2,
    qdr_k_2,
    masterbank_sel_pin,
    aresetn,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tuser,
    s_axis_tlast,
    s_axis_tvalid,
    s_axis_tstrb,
    m_axis_tvalid,
    m_axis_tdata,
    m_axis_tuser,
    m_axis_tlast,
    m_axis_tready,
    m_axis_tstrb,
    locked,
    debug_mem_controller_dout,
    debug_mem_controller_dout_addr,
    debug_mem_controller_dout_ready,
    debug_calibration,
    mem_dbg,
    fifo_dbg
  );
  input aclk;
  input memclk;
  input memclk_200;
  input memclk_270;
  output [35:0] qdr_d_0;
  input [35:0] qdr_q_0;
  output [18:0] qdr_sa_0;
  output qdr_w_n_0;
  output qdr_r_n_0;
  output [3:0] qdr_bw_n_0;
  output qdr_dll_off_n_0;
  input [0:0] qdr_cq_0;
  input [0:0] qdr_cq_n_0;
  output [0:0] qdr_c_n_0;
  output [0:0] qdr_k_n_0;
  output [0:0] qdr_c_0;
  output [0:0] qdr_k_0;
  output [35:0] qdr_d_1;
  input [35:0] qdr_q_1;
  output [18:0] qdr_sa_1;
  output qdr_w_n_1;
  output qdr_r_n_1;
  output [3:0] qdr_bw_n_1;
  output qdr_dll_off_n_1;
  input [0:0] qdr_cq_1;
  input [0:0] qdr_cq_n_1;
  output [0:0] qdr_c_n_1;
  output [0:0] qdr_k_n_1;
  output [0:0] qdr_c_1;
  output [0:0] qdr_k_1;
  output [35:0] qdr_d_2;
  input [35:0] qdr_q_2;
  output [18:0] qdr_sa_2;
  output qdr_w_n_2;
  output qdr_r_n_2;
  output [3:0] qdr_bw_n_2;
  output qdr_dll_off_n_2;
  input [0:0] qdr_cq_2;
  input [0:0] qdr_cq_n_2;
  output [0:0] qdr_c_n_2;
  output [0:0] qdr_k_n_2;
  output [0:0] qdr_c_2;
  output [0:0] qdr_k_2;
  input [2:0] masterbank_sel_pin;
  input aresetn;
  output s_axis_tready;
  input [255:0] s_axis_tdata;
  input [127:0] s_axis_tuser;
  input s_axis_tlast;
  input s_axis_tvalid;
  input [31:0] s_axis_tstrb;
  output m_axis_tvalid;
  output [255:0] m_axis_tdata;
  output [127:0] m_axis_tuser;
  output m_axis_tlast;
  input m_axis_tready;
  output [31:0] m_axis_tstrb;
  input locked;
  output [215:0] debug_mem_controller_dout;
  output [18:0] debug_mem_controller_dout_addr;
  output [0:0] debug_mem_controller_dout_ready;
  output [2:0] debug_calibration;
  output [63:0] mem_dbg;
  output [63:0] fifo_dbg;

  nf10_sram_fifo
    nf10_sram_fifo_0 (
      .aclk ( aclk ),
      .memclk ( memclk ),
      .memclk_200 ( memclk_200 ),
      .memclk_270 ( memclk_270 ),
      .qdr_d_0 ( qdr_d_0 ),
      .qdr_q_0 ( qdr_q_0 ),
      .qdr_sa_0 ( qdr_sa_0 ),
      .qdr_w_n_0 ( qdr_w_n_0 ),
      .qdr_r_n_0 ( qdr_r_n_0 ),
      .qdr_bw_n_0 ( qdr_bw_n_0 ),
      .qdr_dll_off_n_0 ( qdr_dll_off_n_0 ),
      .qdr_cq_0 ( qdr_cq_0 ),
      .qdr_cq_n_0 ( qdr_cq_n_0 ),
      .qdr_c_n_0 ( qdr_c_n_0 ),
      .qdr_k_n_0 ( qdr_k_n_0 ),
      .qdr_c_0 ( qdr_c_0 ),
      .qdr_k_0 ( qdr_k_0 ),
      .qdr_d_1 ( qdr_d_1 ),
      .qdr_q_1 ( qdr_q_1 ),
      .qdr_sa_1 ( qdr_sa_1 ),
      .qdr_w_n_1 ( qdr_w_n_1 ),
      .qdr_r_n_1 ( qdr_r_n_1 ),
      .qdr_bw_n_1 ( qdr_bw_n_1 ),
      .qdr_dll_off_n_1 ( qdr_dll_off_n_1 ),
      .qdr_cq_1 ( qdr_cq_1 ),
      .qdr_cq_n_1 ( qdr_cq_n_1 ),
      .qdr_c_n_1 ( qdr_c_n_1 ),
      .qdr_k_n_1 ( qdr_k_n_1 ),
      .qdr_c_1 ( qdr_c_1 ),
      .qdr_k_1 ( qdr_k_1 ),
      .qdr_d_2 ( qdr_d_2 ),
      .qdr_q_2 ( qdr_q_2 ),
      .qdr_sa_2 ( qdr_sa_2 ),
      .qdr_w_n_2 ( qdr_w_n_2 ),
      .qdr_r_n_2 ( qdr_r_n_2 ),
      .qdr_bw_n_2 ( qdr_bw_n_2 ),
      .qdr_dll_off_n_2 ( qdr_dll_off_n_2 ),
      .qdr_cq_2 ( qdr_cq_2 ),
      .qdr_cq_n_2 ( qdr_cq_n_2 ),
      .qdr_c_n_2 ( qdr_c_n_2 ),
      .qdr_k_n_2 ( qdr_k_n_2 ),
      .qdr_c_2 ( qdr_c_2 ),
      .qdr_k_2 ( qdr_k_2 ),
      .masterbank_sel_pin ( masterbank_sel_pin ),
      .aresetn ( aresetn ),
      .s_axis_tready ( s_axis_tready ),
      .s_axis_tdata ( s_axis_tdata ),
      .s_axis_tuser ( s_axis_tuser ),
      .s_axis_tlast ( s_axis_tlast ),
      .s_axis_tvalid ( s_axis_tvalid ),
      .s_axis_tstrb ( s_axis_tstrb ),
      .m_axis_tvalid ( m_axis_tvalid ),
      .m_axis_tdata ( m_axis_tdata ),
      .m_axis_tuser ( m_axis_tuser ),
      .m_axis_tlast ( m_axis_tlast ),
      .m_axis_tready ( m_axis_tready ),
      .m_axis_tstrb ( m_axis_tstrb ),
      .locked ( locked ),
      .debug_mem_controller_dout ( debug_mem_controller_dout ),
      .debug_mem_controller_dout_addr ( debug_mem_controller_dout_addr ),
      .debug_mem_controller_dout_ready ( debug_mem_controller_dout_ready ),
      .debug_calibration ( debug_calibration ),
      .mem_dbg ( mem_dbg ),
      .fifo_dbg ( fifo_dbg )
    );

endmodule

