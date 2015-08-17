//-----------------------------------------------------------------------------
// nf10_barrier_0_wrapper.v
//-----------------------------------------------------------------------------

`timescale 1 ps / 100 fs

`uselib lib=unisims_ver lib=nf10_barrier_v1_00_a

module nf10_barrier_0_wrapper
  (
    activity_stim,
    activity_rec,
    activity_trans_sim,
    activity_trans_log,
    barrier_req,
    barrier_req_trans,
    barrier_proceed
  );
  input [4:0] activity_stim;
  input [4:0] activity_rec;
  input activity_trans_sim;
  input activity_trans_log;
  input [4:0] barrier_req;
  input barrier_req_trans;
  output barrier_proceed;

  nf10_barrier
    #(
      .NUM_PORTS ( 4 )
    )
    nf10_barrier_0 (
      .activity_stim ( activity_stim ),
      .activity_rec ( activity_rec ),
      .activity_trans_sim ( activity_trans_sim ),
      .activity_trans_log ( activity_trans_log ),
      .barrier_req ( barrier_req ),
      .barrier_req_trans ( barrier_req_trans ),
      .barrier_proceed ( barrier_proceed )
    );

endmodule

