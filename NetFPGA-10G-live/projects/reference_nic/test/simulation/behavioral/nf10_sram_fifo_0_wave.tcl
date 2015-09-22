#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     nf10_sram_fifo_0_wave.tcl (Fri Aug 28 11:22:59 2015)
#
#  Module   nf10_sram_fifo_0_wrapper
#  Instance nf10_sram_fifo_0
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "system_axisim_tb${ps}dut" }

# wave add $tbpath${ps}nf10_sram_fifo_0${ps}aclk -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}memclk -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}memclk_200 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}memclk_270 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_d_0 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_q_0 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_sa_0 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_w_n_0 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_r_n_0 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_bw_n_0 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_dll_off_n_0 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_cq_0 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_cq_n_0 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_c_n_0 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_k_n_0 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_c_0 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_k_0 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_d_1 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_q_1 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_sa_1 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_w_n_1 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_r_n_1 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_bw_n_1 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_dll_off_n_1 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_cq_1 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_cq_n_1 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_c_n_1 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_k_n_1 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_c_1 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_k_1 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_d_2 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_q_2 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_sa_2 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_w_n_2 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_r_n_2 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_bw_n_2 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_dll_off_n_2 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_cq_2 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_cq_n_2 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_c_n_2 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_k_n_2 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_c_2 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}qdr_k_2 -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}masterbank_sel_pin -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}aresetn -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}s_axis_tready -into $id
# wave add $tbpath${ps}nf10_sram_fifo_0${ps}s_axis_tdata -into $id
# wave add $tbpath${ps}nf10_sram_fifo_0${ps}s_axis_tuser -into $id
# wave add $tbpath${ps}nf10_sram_fifo_0${ps}s_axis_tlast -into $id
# wave add $tbpath${ps}nf10_sram_fifo_0${ps}s_axis_tvalid -into $id
# wave add $tbpath${ps}nf10_sram_fifo_0${ps}s_axis_tstrb -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}m_axis_tvalid -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}m_axis_tdata -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}m_axis_tuser -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}m_axis_tlast -into $id
# wave add $tbpath${ps}nf10_sram_fifo_0${ps}m_axis_tready -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}m_axis_tstrb -into $id
  wave add $tbpath${ps}nf10_sram_fifo_0${ps}locked -into $id
# wave add $tbpath${ps}nf10_sram_fifo_0${ps}debug_mem_controller_dout -into $id
# wave add $tbpath${ps}nf10_sram_fifo_0${ps}debug_mem_controller_dout_addr -into $id
# wave add $tbpath${ps}nf10_sram_fifo_0${ps}debug_mem_controller_dout_ready -into $id
# wave add $tbpath${ps}nf10_sram_fifo_0${ps}debug_calibration -into $id
# wave add $tbpath${ps}nf10_sram_fifo_0${ps}mem_dbg -into $id
# wave add $tbpath${ps}nf10_sram_fifo_0${ps}fifo_dbg -into $id

