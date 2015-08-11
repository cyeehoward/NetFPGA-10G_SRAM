//-----------------------------------------------------------------------------
// system_stub.v
//-----------------------------------------------------------------------------

module system_stub
  (
    RESET,
    RS232_Uart_1_sout,
    RS232_Uart_1_sin,
    CLK,
    nf10_10g_interface_0_xaui_tx_l0_p_pin,
    nf10_10g_interface_0_xaui_tx_l0_n_pin,
    nf10_10g_interface_0_xaui_tx_l1_p_pin,
    nf10_10g_interface_0_xaui_tx_l1_n_pin,
    nf10_10g_interface_0_xaui_tx_l2_p_pin,
    nf10_10g_interface_0_xaui_tx_l3_n_pin,
    nf10_10g_interface_0_xaui_tx_l2_n_pin,
    nf10_10g_interface_0_xaui_tx_l3_p_pin,
    nf10_10g_interface_0_xaui_rx_l0_n_pin,
    nf10_10g_interface_0_xaui_rx_l1_p_pin,
    nf10_10g_interface_0_xaui_rx_l1_n_pin,
    nf10_10g_interface_0_xaui_rx_l2_p_pin,
    nf10_10g_interface_0_xaui_rx_l2_n_pin,
    nf10_10g_interface_0_xaui_rx_l3_p_pin,
    nf10_10g_interface_0_xaui_rx_l3_n_pin,
    nf10_10g_interface_0_xaui_rx_l0_p_pin,
    nf10_10g_interface_1_xaui_tx_l3_n_pin,
    nf10_10g_interface_1_xaui_tx_l1_n_pin,
    nf10_10g_interface_1_xaui_tx_l3_p_pin,
    nf10_10g_interface_1_xaui_tx_l0_p_pin,
    nf10_10g_interface_1_xaui_tx_l0_n_pin,
    nf10_10g_interface_1_xaui_tx_l1_p_pin,
    nf10_10g_interface_1_xaui_tx_l2_n_pin,
    nf10_10g_interface_1_xaui_rx_l0_p_pin,
    nf10_10g_interface_1_xaui_rx_l0_n_pin,
    nf10_10g_interface_1_xaui_rx_l1_p_pin,
    nf10_10g_interface_1_xaui_rx_l1_n_pin,
    nf10_10g_interface_1_xaui_rx_l2_p_pin,
    nf10_10g_interface_1_xaui_rx_l2_n_pin,
    nf10_10g_interface_1_xaui_rx_l3_p_pin,
    nf10_10g_interface_1_xaui_rx_l3_n_pin,
    nf10_10g_interface_1_xaui_tx_l2_p_pin,
    nf10_10g_interface_2_xaui_tx_l3_p_pin,
    nf10_10g_interface_2_xaui_tx_l3_n_pin,
    nf10_10g_interface_2_xaui_tx_l0_p_pin,
    nf10_10g_interface_2_xaui_tx_l0_n_pin,
    nf10_10g_interface_2_xaui_tx_l1_p_pin,
    nf10_10g_interface_2_xaui_tx_l2_p_pin,
    nf10_10g_interface_2_xaui_tx_l2_n_pin,
    nf10_10g_interface_2_xaui_rx_l0_p_pin,
    nf10_10g_interface_2_xaui_rx_l0_n_pin,
    nf10_10g_interface_2_xaui_rx_l1_p_pin,
    nf10_10g_interface_2_xaui_rx_l1_n_pin,
    nf10_10g_interface_2_xaui_rx_l2_p_pin,
    nf10_10g_interface_2_xaui_rx_l2_n_pin,
    nf10_10g_interface_2_xaui_rx_l3_p_pin,
    nf10_10g_interface_2_xaui_rx_l3_n_pin,
    nf10_10g_interface_2_xaui_tx_l1_n_pin,
    nf10_10g_interface_3_xaui_tx_l3_p_pin,
    nf10_10g_interface_3_xaui_tx_l3_n_pin,
    nf10_10g_interface_3_xaui_tx_l0_p_pin,
    nf10_10g_interface_3_xaui_tx_l0_n_pin,
    nf10_10g_interface_3_xaui_tx_l1_p_pin,
    nf10_10g_interface_3_xaui_tx_l2_p_pin,
    nf10_10g_interface_3_xaui_tx_l2_n_pin,
    nf10_10g_interface_3_xaui_rx_l0_p_pin,
    nf10_10g_interface_3_xaui_rx_l0_n_pin,
    nf10_10g_interface_3_xaui_rx_l1_p_pin,
    nf10_10g_interface_3_xaui_rx_l1_n_pin,
    nf10_10g_interface_3_xaui_rx_l2_p_pin,
    nf10_10g_interface_3_xaui_rx_l2_n_pin,
    nf10_10g_interface_3_xaui_rx_l3_p_pin,
    nf10_10g_interface_3_xaui_rx_l3_n_pin,
    nf10_10g_interface_3_xaui_tx_l1_n_pin,
    refclk_A_p,
    refclk_A_n,
    refclk_B_p,
    refclk_B_n,
    refclk_C_p,
    refclk_C_n,
    refclk_D_p,
    refclk_D_n,
    MDC,
    MDIO,
    PHY_RST_N,
    pcie_clk_p,
    pcie_top_0_pci_exp_0_txp_pin,
    pcie_clk_n,
    pcie_top_0_pci_exp_0_rxp_pin,
    pcie_top_0_pci_exp_0_rxn_pin,
    pcie_top_0_pci_exp_1_txp_pin,
    pcie_top_0_pci_exp_1_txn_pin,
    pcie_top_0_pci_exp_1_rxp_pin,
    pcie_top_0_pci_exp_1_rxn_pin,
    pcie_top_0_pci_exp_4_txp_pin,
    pcie_top_0_pci_exp_2_txp_pin,
    pcie_top_0_pci_exp_2_txn_pin,
    pcie_top_0_pci_exp_2_rxp_pin,
    pcie_top_0_pci_exp_2_rxn_pin,
    pcie_top_0_pci_exp_3_txp_pin,
    pcie_top_0_pci_exp_3_txn_pin,
    pcie_top_0_pci_exp_3_rxp_pin,
    pcie_top_0_pci_exp_3_rxn_pin,
    pcie_top_0_pci_exp_4_txn_pin,
    pcie_top_0_pci_exp_4_rxp_pin,
    pcie_top_0_pci_exp_4_rxn_pin,
    pcie_top_0_pci_exp_5_txp_pin,
    pcie_top_0_pci_exp_5_txn_pin,
    pcie_top_0_pci_exp_5_rxp_pin,
    pcie_top_0_pci_exp_5_rxn_pin,
    pcie_top_0_pci_exp_6_txp_pin,
    pcie_top_0_pci_exp_6_txn_pin,
    pcie_top_0_pci_exp_6_rxp_pin,
    pcie_top_0_pci_exp_6_rxn_pin,
    pcie_top_0_pci_exp_7_txn_pin,
    pcie_top_0_pci_exp_7_txp_pin,
    pcie_top_0_pci_exp_7_rxn_pin,
    pcie_top_0_pci_exp_7_rxp_pin,
    pcie_top_0_pci_exp_0_txn_pin,
    axi_emc_0_Mem_A_pin,
    axi_emc_0_Mem_CEN_pin,
    axi_emc_0_Mem_OEN_pin,
    axi_emc_0_Mem_WEN_pin,
    axi_emc_0_Mem_DQ_pin,
    axi_cfg_fpga_0_GPIO_IO_pin,
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
    masterbank_sel_pin,
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
    qdr_k_2
  );
  input RESET;
  output RS232_Uart_1_sout;
  input RS232_Uart_1_sin;
  input CLK;
  output nf10_10g_interface_0_xaui_tx_l0_p_pin;
  output nf10_10g_interface_0_xaui_tx_l0_n_pin;
  output nf10_10g_interface_0_xaui_tx_l1_p_pin;
  output nf10_10g_interface_0_xaui_tx_l1_n_pin;
  output nf10_10g_interface_0_xaui_tx_l2_p_pin;
  output nf10_10g_interface_0_xaui_tx_l3_n_pin;
  output nf10_10g_interface_0_xaui_tx_l2_n_pin;
  output nf10_10g_interface_0_xaui_tx_l3_p_pin;
  input nf10_10g_interface_0_xaui_rx_l0_n_pin;
  input nf10_10g_interface_0_xaui_rx_l1_p_pin;
  input nf10_10g_interface_0_xaui_rx_l1_n_pin;
  input nf10_10g_interface_0_xaui_rx_l2_p_pin;
  input nf10_10g_interface_0_xaui_rx_l2_n_pin;
  input nf10_10g_interface_0_xaui_rx_l3_p_pin;
  input nf10_10g_interface_0_xaui_rx_l3_n_pin;
  input nf10_10g_interface_0_xaui_rx_l0_p_pin;
  output nf10_10g_interface_1_xaui_tx_l3_n_pin;
  output nf10_10g_interface_1_xaui_tx_l1_n_pin;
  output nf10_10g_interface_1_xaui_tx_l3_p_pin;
  output nf10_10g_interface_1_xaui_tx_l0_p_pin;
  output nf10_10g_interface_1_xaui_tx_l0_n_pin;
  output nf10_10g_interface_1_xaui_tx_l1_p_pin;
  output nf10_10g_interface_1_xaui_tx_l2_n_pin;
  input nf10_10g_interface_1_xaui_rx_l0_p_pin;
  input nf10_10g_interface_1_xaui_rx_l0_n_pin;
  input nf10_10g_interface_1_xaui_rx_l1_p_pin;
  input nf10_10g_interface_1_xaui_rx_l1_n_pin;
  input nf10_10g_interface_1_xaui_rx_l2_p_pin;
  input nf10_10g_interface_1_xaui_rx_l2_n_pin;
  input nf10_10g_interface_1_xaui_rx_l3_p_pin;
  input nf10_10g_interface_1_xaui_rx_l3_n_pin;
  output nf10_10g_interface_1_xaui_tx_l2_p_pin;
  output nf10_10g_interface_2_xaui_tx_l3_p_pin;
  output nf10_10g_interface_2_xaui_tx_l3_n_pin;
  output nf10_10g_interface_2_xaui_tx_l0_p_pin;
  output nf10_10g_interface_2_xaui_tx_l0_n_pin;
  output nf10_10g_interface_2_xaui_tx_l1_p_pin;
  output nf10_10g_interface_2_xaui_tx_l2_p_pin;
  output nf10_10g_interface_2_xaui_tx_l2_n_pin;
  input nf10_10g_interface_2_xaui_rx_l0_p_pin;
  input nf10_10g_interface_2_xaui_rx_l0_n_pin;
  input nf10_10g_interface_2_xaui_rx_l1_p_pin;
  input nf10_10g_interface_2_xaui_rx_l1_n_pin;
  input nf10_10g_interface_2_xaui_rx_l2_p_pin;
  input nf10_10g_interface_2_xaui_rx_l2_n_pin;
  input nf10_10g_interface_2_xaui_rx_l3_p_pin;
  input nf10_10g_interface_2_xaui_rx_l3_n_pin;
  output nf10_10g_interface_2_xaui_tx_l1_n_pin;
  output nf10_10g_interface_3_xaui_tx_l3_p_pin;
  output nf10_10g_interface_3_xaui_tx_l3_n_pin;
  output nf10_10g_interface_3_xaui_tx_l0_p_pin;
  output nf10_10g_interface_3_xaui_tx_l0_n_pin;
  output nf10_10g_interface_3_xaui_tx_l1_p_pin;
  output nf10_10g_interface_3_xaui_tx_l2_p_pin;
  output nf10_10g_interface_3_xaui_tx_l2_n_pin;
  input nf10_10g_interface_3_xaui_rx_l0_p_pin;
  input nf10_10g_interface_3_xaui_rx_l0_n_pin;
  input nf10_10g_interface_3_xaui_rx_l1_p_pin;
  input nf10_10g_interface_3_xaui_rx_l1_n_pin;
  input nf10_10g_interface_3_xaui_rx_l2_p_pin;
  input nf10_10g_interface_3_xaui_rx_l2_n_pin;
  input nf10_10g_interface_3_xaui_rx_l3_p_pin;
  input nf10_10g_interface_3_xaui_rx_l3_n_pin;
  output nf10_10g_interface_3_xaui_tx_l1_n_pin;
  input refclk_A_p;
  input refclk_A_n;
  input refclk_B_p;
  input refclk_B_n;
  input refclk_C_p;
  input refclk_C_n;
  input refclk_D_p;
  input refclk_D_n;
  output MDC;
  inout MDIO;
  output PHY_RST_N;
  input pcie_clk_p;
  output pcie_top_0_pci_exp_0_txp_pin;
  input pcie_clk_n;
  input pcie_top_0_pci_exp_0_rxp_pin;
  input pcie_top_0_pci_exp_0_rxn_pin;
  output pcie_top_0_pci_exp_1_txp_pin;
  output pcie_top_0_pci_exp_1_txn_pin;
  input pcie_top_0_pci_exp_1_rxp_pin;
  input pcie_top_0_pci_exp_1_rxn_pin;
  output pcie_top_0_pci_exp_4_txp_pin;
  output pcie_top_0_pci_exp_2_txp_pin;
  output pcie_top_0_pci_exp_2_txn_pin;
  input pcie_top_0_pci_exp_2_rxp_pin;
  input pcie_top_0_pci_exp_2_rxn_pin;
  output pcie_top_0_pci_exp_3_txp_pin;
  output pcie_top_0_pci_exp_3_txn_pin;
  input pcie_top_0_pci_exp_3_rxp_pin;
  input pcie_top_0_pci_exp_3_rxn_pin;
  output pcie_top_0_pci_exp_4_txn_pin;
  input pcie_top_0_pci_exp_4_rxp_pin;
  input pcie_top_0_pci_exp_4_rxn_pin;
  output pcie_top_0_pci_exp_5_txp_pin;
  output pcie_top_0_pci_exp_5_txn_pin;
  input pcie_top_0_pci_exp_5_rxp_pin;
  input pcie_top_0_pci_exp_5_rxn_pin;
  output pcie_top_0_pci_exp_6_txp_pin;
  output pcie_top_0_pci_exp_6_txn_pin;
  input pcie_top_0_pci_exp_6_rxp_pin;
  input pcie_top_0_pci_exp_6_rxn_pin;
  output pcie_top_0_pci_exp_7_txn_pin;
  output pcie_top_0_pci_exp_7_txp_pin;
  input pcie_top_0_pci_exp_7_rxn_pin;
  input pcie_top_0_pci_exp_7_rxp_pin;
  output pcie_top_0_pci_exp_0_txn_pin;
  output [23:0] axi_emc_0_Mem_A_pin;
  output [0:0] axi_emc_0_Mem_CEN_pin;
  output [0:0] axi_emc_0_Mem_OEN_pin;
  output axi_emc_0_Mem_WEN_pin;
  inout [31:0] axi_emc_0_Mem_DQ_pin;
  inout [1:0] axi_cfg_fpga_0_GPIO_IO_pin;
  output [35:0] qdr_d_0;
  input [35:0] qdr_q_0;
  output [18:0] qdr_sa_0;
  output qdr_w_n_0;
  output qdr_r_n_0;
  output [3:0] qdr_bw_n_0;
  output qdr_dll_off_n_0;
  input qdr_cq_0;
  input qdr_cq_n_0;
  output qdr_c_n_0;
  output qdr_k_n_0;
  output qdr_c_0;
  output qdr_k_0;
  input [2:0] masterbank_sel_pin;
  output [35:0] qdr_d_1;
  input [35:0] qdr_q_1;
  output [18:0] qdr_sa_1;
  output qdr_w_n_1;
  output qdr_r_n_1;
  output [3:0] qdr_bw_n_1;
  output qdr_dll_off_n_1;
  input qdr_cq_1;
  input qdr_cq_n_1;
  output qdr_c_n_1;
  output qdr_k_n_1;
  output qdr_c_1;
  output qdr_k_1;
  output [35:0] qdr_d_2;
  input [35:0] qdr_q_2;
  output [18:0] qdr_sa_2;
  output qdr_w_n_2;
  output qdr_r_n_2;
  output [3:0] qdr_bw_n_2;
  output qdr_dll_off_n_2;
  input qdr_cq_2;
  input qdr_cq_n_2;
  output qdr_c_n_2;
  output qdr_k_n_2;
  output qdr_c_2;
  output qdr_k_2;

  (* BOX_TYPE = "user_black_box" *)
  system
    system_i (
      .RESET ( RESET ),
      .RS232_Uart_1_sout ( RS232_Uart_1_sout ),
      .RS232_Uart_1_sin ( RS232_Uart_1_sin ),
      .CLK ( CLK ),
      .nf10_10g_interface_0_xaui_tx_l0_p_pin ( nf10_10g_interface_0_xaui_tx_l0_p_pin ),
      .nf10_10g_interface_0_xaui_tx_l0_n_pin ( nf10_10g_interface_0_xaui_tx_l0_n_pin ),
      .nf10_10g_interface_0_xaui_tx_l1_p_pin ( nf10_10g_interface_0_xaui_tx_l1_p_pin ),
      .nf10_10g_interface_0_xaui_tx_l1_n_pin ( nf10_10g_interface_0_xaui_tx_l1_n_pin ),
      .nf10_10g_interface_0_xaui_tx_l2_p_pin ( nf10_10g_interface_0_xaui_tx_l2_p_pin ),
      .nf10_10g_interface_0_xaui_tx_l3_n_pin ( nf10_10g_interface_0_xaui_tx_l3_n_pin ),
      .nf10_10g_interface_0_xaui_tx_l2_n_pin ( nf10_10g_interface_0_xaui_tx_l2_n_pin ),
      .nf10_10g_interface_0_xaui_tx_l3_p_pin ( nf10_10g_interface_0_xaui_tx_l3_p_pin ),
      .nf10_10g_interface_0_xaui_rx_l0_n_pin ( nf10_10g_interface_0_xaui_rx_l0_n_pin ),
      .nf10_10g_interface_0_xaui_rx_l1_p_pin ( nf10_10g_interface_0_xaui_rx_l1_p_pin ),
      .nf10_10g_interface_0_xaui_rx_l1_n_pin ( nf10_10g_interface_0_xaui_rx_l1_n_pin ),
      .nf10_10g_interface_0_xaui_rx_l2_p_pin ( nf10_10g_interface_0_xaui_rx_l2_p_pin ),
      .nf10_10g_interface_0_xaui_rx_l2_n_pin ( nf10_10g_interface_0_xaui_rx_l2_n_pin ),
      .nf10_10g_interface_0_xaui_rx_l3_p_pin ( nf10_10g_interface_0_xaui_rx_l3_p_pin ),
      .nf10_10g_interface_0_xaui_rx_l3_n_pin ( nf10_10g_interface_0_xaui_rx_l3_n_pin ),
      .nf10_10g_interface_0_xaui_rx_l0_p_pin ( nf10_10g_interface_0_xaui_rx_l0_p_pin ),
      .nf10_10g_interface_1_xaui_tx_l3_n_pin ( nf10_10g_interface_1_xaui_tx_l3_n_pin ),
      .nf10_10g_interface_1_xaui_tx_l1_n_pin ( nf10_10g_interface_1_xaui_tx_l1_n_pin ),
      .nf10_10g_interface_1_xaui_tx_l3_p_pin ( nf10_10g_interface_1_xaui_tx_l3_p_pin ),
      .nf10_10g_interface_1_xaui_tx_l0_p_pin ( nf10_10g_interface_1_xaui_tx_l0_p_pin ),
      .nf10_10g_interface_1_xaui_tx_l0_n_pin ( nf10_10g_interface_1_xaui_tx_l0_n_pin ),
      .nf10_10g_interface_1_xaui_tx_l1_p_pin ( nf10_10g_interface_1_xaui_tx_l1_p_pin ),
      .nf10_10g_interface_1_xaui_tx_l2_n_pin ( nf10_10g_interface_1_xaui_tx_l2_n_pin ),
      .nf10_10g_interface_1_xaui_rx_l0_p_pin ( nf10_10g_interface_1_xaui_rx_l0_p_pin ),
      .nf10_10g_interface_1_xaui_rx_l0_n_pin ( nf10_10g_interface_1_xaui_rx_l0_n_pin ),
      .nf10_10g_interface_1_xaui_rx_l1_p_pin ( nf10_10g_interface_1_xaui_rx_l1_p_pin ),
      .nf10_10g_interface_1_xaui_rx_l1_n_pin ( nf10_10g_interface_1_xaui_rx_l1_n_pin ),
      .nf10_10g_interface_1_xaui_rx_l2_p_pin ( nf10_10g_interface_1_xaui_rx_l2_p_pin ),
      .nf10_10g_interface_1_xaui_rx_l2_n_pin ( nf10_10g_interface_1_xaui_rx_l2_n_pin ),
      .nf10_10g_interface_1_xaui_rx_l3_p_pin ( nf10_10g_interface_1_xaui_rx_l3_p_pin ),
      .nf10_10g_interface_1_xaui_rx_l3_n_pin ( nf10_10g_interface_1_xaui_rx_l3_n_pin ),
      .nf10_10g_interface_1_xaui_tx_l2_p_pin ( nf10_10g_interface_1_xaui_tx_l2_p_pin ),
      .nf10_10g_interface_2_xaui_tx_l3_p_pin ( nf10_10g_interface_2_xaui_tx_l3_p_pin ),
      .nf10_10g_interface_2_xaui_tx_l3_n_pin ( nf10_10g_interface_2_xaui_tx_l3_n_pin ),
      .nf10_10g_interface_2_xaui_tx_l0_p_pin ( nf10_10g_interface_2_xaui_tx_l0_p_pin ),
      .nf10_10g_interface_2_xaui_tx_l0_n_pin ( nf10_10g_interface_2_xaui_tx_l0_n_pin ),
      .nf10_10g_interface_2_xaui_tx_l1_p_pin ( nf10_10g_interface_2_xaui_tx_l1_p_pin ),
      .nf10_10g_interface_2_xaui_tx_l2_p_pin ( nf10_10g_interface_2_xaui_tx_l2_p_pin ),
      .nf10_10g_interface_2_xaui_tx_l2_n_pin ( nf10_10g_interface_2_xaui_tx_l2_n_pin ),
      .nf10_10g_interface_2_xaui_rx_l0_p_pin ( nf10_10g_interface_2_xaui_rx_l0_p_pin ),
      .nf10_10g_interface_2_xaui_rx_l0_n_pin ( nf10_10g_interface_2_xaui_rx_l0_n_pin ),
      .nf10_10g_interface_2_xaui_rx_l1_p_pin ( nf10_10g_interface_2_xaui_rx_l1_p_pin ),
      .nf10_10g_interface_2_xaui_rx_l1_n_pin ( nf10_10g_interface_2_xaui_rx_l1_n_pin ),
      .nf10_10g_interface_2_xaui_rx_l2_p_pin ( nf10_10g_interface_2_xaui_rx_l2_p_pin ),
      .nf10_10g_interface_2_xaui_rx_l2_n_pin ( nf10_10g_interface_2_xaui_rx_l2_n_pin ),
      .nf10_10g_interface_2_xaui_rx_l3_p_pin ( nf10_10g_interface_2_xaui_rx_l3_p_pin ),
      .nf10_10g_interface_2_xaui_rx_l3_n_pin ( nf10_10g_interface_2_xaui_rx_l3_n_pin ),
      .nf10_10g_interface_2_xaui_tx_l1_n_pin ( nf10_10g_interface_2_xaui_tx_l1_n_pin ),
      .nf10_10g_interface_3_xaui_tx_l3_p_pin ( nf10_10g_interface_3_xaui_tx_l3_p_pin ),
      .nf10_10g_interface_3_xaui_tx_l3_n_pin ( nf10_10g_interface_3_xaui_tx_l3_n_pin ),
      .nf10_10g_interface_3_xaui_tx_l0_p_pin ( nf10_10g_interface_3_xaui_tx_l0_p_pin ),
      .nf10_10g_interface_3_xaui_tx_l0_n_pin ( nf10_10g_interface_3_xaui_tx_l0_n_pin ),
      .nf10_10g_interface_3_xaui_tx_l1_p_pin ( nf10_10g_interface_3_xaui_tx_l1_p_pin ),
      .nf10_10g_interface_3_xaui_tx_l2_p_pin ( nf10_10g_interface_3_xaui_tx_l2_p_pin ),
      .nf10_10g_interface_3_xaui_tx_l2_n_pin ( nf10_10g_interface_3_xaui_tx_l2_n_pin ),
      .nf10_10g_interface_3_xaui_rx_l0_p_pin ( nf10_10g_interface_3_xaui_rx_l0_p_pin ),
      .nf10_10g_interface_3_xaui_rx_l0_n_pin ( nf10_10g_interface_3_xaui_rx_l0_n_pin ),
      .nf10_10g_interface_3_xaui_rx_l1_p_pin ( nf10_10g_interface_3_xaui_rx_l1_p_pin ),
      .nf10_10g_interface_3_xaui_rx_l1_n_pin ( nf10_10g_interface_3_xaui_rx_l1_n_pin ),
      .nf10_10g_interface_3_xaui_rx_l2_p_pin ( nf10_10g_interface_3_xaui_rx_l2_p_pin ),
      .nf10_10g_interface_3_xaui_rx_l2_n_pin ( nf10_10g_interface_3_xaui_rx_l2_n_pin ),
      .nf10_10g_interface_3_xaui_rx_l3_p_pin ( nf10_10g_interface_3_xaui_rx_l3_p_pin ),
      .nf10_10g_interface_3_xaui_rx_l3_n_pin ( nf10_10g_interface_3_xaui_rx_l3_n_pin ),
      .nf10_10g_interface_3_xaui_tx_l1_n_pin ( nf10_10g_interface_3_xaui_tx_l1_n_pin ),
      .refclk_A_p ( refclk_A_p ),
      .refclk_A_n ( refclk_A_n ),
      .refclk_B_p ( refclk_B_p ),
      .refclk_B_n ( refclk_B_n ),
      .refclk_C_p ( refclk_C_p ),
      .refclk_C_n ( refclk_C_n ),
      .refclk_D_p ( refclk_D_p ),
      .refclk_D_n ( refclk_D_n ),
      .MDC ( MDC ),
      .MDIO ( MDIO ),
      .PHY_RST_N ( PHY_RST_N ),
      .pcie_clk_p ( pcie_clk_p ),
      .pcie_top_0_pci_exp_0_txp_pin ( pcie_top_0_pci_exp_0_txp_pin ),
      .pcie_clk_n ( pcie_clk_n ),
      .pcie_top_0_pci_exp_0_rxp_pin ( pcie_top_0_pci_exp_0_rxp_pin ),
      .pcie_top_0_pci_exp_0_rxn_pin ( pcie_top_0_pci_exp_0_rxn_pin ),
      .pcie_top_0_pci_exp_1_txp_pin ( pcie_top_0_pci_exp_1_txp_pin ),
      .pcie_top_0_pci_exp_1_txn_pin ( pcie_top_0_pci_exp_1_txn_pin ),
      .pcie_top_0_pci_exp_1_rxp_pin ( pcie_top_0_pci_exp_1_rxp_pin ),
      .pcie_top_0_pci_exp_1_rxn_pin ( pcie_top_0_pci_exp_1_rxn_pin ),
      .pcie_top_0_pci_exp_4_txp_pin ( pcie_top_0_pci_exp_4_txp_pin ),
      .pcie_top_0_pci_exp_2_txp_pin ( pcie_top_0_pci_exp_2_txp_pin ),
      .pcie_top_0_pci_exp_2_txn_pin ( pcie_top_0_pci_exp_2_txn_pin ),
      .pcie_top_0_pci_exp_2_rxp_pin ( pcie_top_0_pci_exp_2_rxp_pin ),
      .pcie_top_0_pci_exp_2_rxn_pin ( pcie_top_0_pci_exp_2_rxn_pin ),
      .pcie_top_0_pci_exp_3_txp_pin ( pcie_top_0_pci_exp_3_txp_pin ),
      .pcie_top_0_pci_exp_3_txn_pin ( pcie_top_0_pci_exp_3_txn_pin ),
      .pcie_top_0_pci_exp_3_rxp_pin ( pcie_top_0_pci_exp_3_rxp_pin ),
      .pcie_top_0_pci_exp_3_rxn_pin ( pcie_top_0_pci_exp_3_rxn_pin ),
      .pcie_top_0_pci_exp_4_txn_pin ( pcie_top_0_pci_exp_4_txn_pin ),
      .pcie_top_0_pci_exp_4_rxp_pin ( pcie_top_0_pci_exp_4_rxp_pin ),
      .pcie_top_0_pci_exp_4_rxn_pin ( pcie_top_0_pci_exp_4_rxn_pin ),
      .pcie_top_0_pci_exp_5_txp_pin ( pcie_top_0_pci_exp_5_txp_pin ),
      .pcie_top_0_pci_exp_5_txn_pin ( pcie_top_0_pci_exp_5_txn_pin ),
      .pcie_top_0_pci_exp_5_rxp_pin ( pcie_top_0_pci_exp_5_rxp_pin ),
      .pcie_top_0_pci_exp_5_rxn_pin ( pcie_top_0_pci_exp_5_rxn_pin ),
      .pcie_top_0_pci_exp_6_txp_pin ( pcie_top_0_pci_exp_6_txp_pin ),
      .pcie_top_0_pci_exp_6_txn_pin ( pcie_top_0_pci_exp_6_txn_pin ),
      .pcie_top_0_pci_exp_6_rxp_pin ( pcie_top_0_pci_exp_6_rxp_pin ),
      .pcie_top_0_pci_exp_6_rxn_pin ( pcie_top_0_pci_exp_6_rxn_pin ),
      .pcie_top_0_pci_exp_7_txn_pin ( pcie_top_0_pci_exp_7_txn_pin ),
      .pcie_top_0_pci_exp_7_txp_pin ( pcie_top_0_pci_exp_7_txp_pin ),
      .pcie_top_0_pci_exp_7_rxn_pin ( pcie_top_0_pci_exp_7_rxn_pin ),
      .pcie_top_0_pci_exp_7_rxp_pin ( pcie_top_0_pci_exp_7_rxp_pin ),
      .pcie_top_0_pci_exp_0_txn_pin ( pcie_top_0_pci_exp_0_txn_pin ),
      .axi_emc_0_Mem_A_pin ( axi_emc_0_Mem_A_pin ),
      .axi_emc_0_Mem_CEN_pin ( axi_emc_0_Mem_CEN_pin[0:0] ),
      .axi_emc_0_Mem_OEN_pin ( axi_emc_0_Mem_OEN_pin[0:0] ),
      .axi_emc_0_Mem_WEN_pin ( axi_emc_0_Mem_WEN_pin ),
      .axi_emc_0_Mem_DQ_pin ( axi_emc_0_Mem_DQ_pin ),
      .axi_cfg_fpga_0_GPIO_IO_pin ( axi_cfg_fpga_0_GPIO_IO_pin ),
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
      .masterbank_sel_pin ( masterbank_sel_pin ),
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
      .qdr_k_2 ( qdr_k_2 )
    );

endmodule

module system
  (
    RESET,
    RS232_Uart_1_sout,
    RS232_Uart_1_sin,
    CLK,
    nf10_10g_interface_0_xaui_tx_l0_p_pin,
    nf10_10g_interface_0_xaui_tx_l0_n_pin,
    nf10_10g_interface_0_xaui_tx_l1_p_pin,
    nf10_10g_interface_0_xaui_tx_l1_n_pin,
    nf10_10g_interface_0_xaui_tx_l2_p_pin,
    nf10_10g_interface_0_xaui_tx_l3_n_pin,
    nf10_10g_interface_0_xaui_tx_l2_n_pin,
    nf10_10g_interface_0_xaui_tx_l3_p_pin,
    nf10_10g_interface_0_xaui_rx_l0_n_pin,
    nf10_10g_interface_0_xaui_rx_l1_p_pin,
    nf10_10g_interface_0_xaui_rx_l1_n_pin,
    nf10_10g_interface_0_xaui_rx_l2_p_pin,
    nf10_10g_interface_0_xaui_rx_l2_n_pin,
    nf10_10g_interface_0_xaui_rx_l3_p_pin,
    nf10_10g_interface_0_xaui_rx_l3_n_pin,
    nf10_10g_interface_0_xaui_rx_l0_p_pin,
    nf10_10g_interface_1_xaui_tx_l3_n_pin,
    nf10_10g_interface_1_xaui_tx_l1_n_pin,
    nf10_10g_interface_1_xaui_tx_l3_p_pin,
    nf10_10g_interface_1_xaui_tx_l0_p_pin,
    nf10_10g_interface_1_xaui_tx_l0_n_pin,
    nf10_10g_interface_1_xaui_tx_l1_p_pin,
    nf10_10g_interface_1_xaui_tx_l2_n_pin,
    nf10_10g_interface_1_xaui_rx_l0_p_pin,
    nf10_10g_interface_1_xaui_rx_l0_n_pin,
    nf10_10g_interface_1_xaui_rx_l1_p_pin,
    nf10_10g_interface_1_xaui_rx_l1_n_pin,
    nf10_10g_interface_1_xaui_rx_l2_p_pin,
    nf10_10g_interface_1_xaui_rx_l2_n_pin,
    nf10_10g_interface_1_xaui_rx_l3_p_pin,
    nf10_10g_interface_1_xaui_rx_l3_n_pin,
    nf10_10g_interface_1_xaui_tx_l2_p_pin,
    nf10_10g_interface_2_xaui_tx_l3_p_pin,
    nf10_10g_interface_2_xaui_tx_l3_n_pin,
    nf10_10g_interface_2_xaui_tx_l0_p_pin,
    nf10_10g_interface_2_xaui_tx_l0_n_pin,
    nf10_10g_interface_2_xaui_tx_l1_p_pin,
    nf10_10g_interface_2_xaui_tx_l2_p_pin,
    nf10_10g_interface_2_xaui_tx_l2_n_pin,
    nf10_10g_interface_2_xaui_rx_l0_p_pin,
    nf10_10g_interface_2_xaui_rx_l0_n_pin,
    nf10_10g_interface_2_xaui_rx_l1_p_pin,
    nf10_10g_interface_2_xaui_rx_l1_n_pin,
    nf10_10g_interface_2_xaui_rx_l2_p_pin,
    nf10_10g_interface_2_xaui_rx_l2_n_pin,
    nf10_10g_interface_2_xaui_rx_l3_p_pin,
    nf10_10g_interface_2_xaui_rx_l3_n_pin,
    nf10_10g_interface_2_xaui_tx_l1_n_pin,
    nf10_10g_interface_3_xaui_tx_l3_p_pin,
    nf10_10g_interface_3_xaui_tx_l3_n_pin,
    nf10_10g_interface_3_xaui_tx_l0_p_pin,
    nf10_10g_interface_3_xaui_tx_l0_n_pin,
    nf10_10g_interface_3_xaui_tx_l1_p_pin,
    nf10_10g_interface_3_xaui_tx_l2_p_pin,
    nf10_10g_interface_3_xaui_tx_l2_n_pin,
    nf10_10g_interface_3_xaui_rx_l0_p_pin,
    nf10_10g_interface_3_xaui_rx_l0_n_pin,
    nf10_10g_interface_3_xaui_rx_l1_p_pin,
    nf10_10g_interface_3_xaui_rx_l1_n_pin,
    nf10_10g_interface_3_xaui_rx_l2_p_pin,
    nf10_10g_interface_3_xaui_rx_l2_n_pin,
    nf10_10g_interface_3_xaui_rx_l3_p_pin,
    nf10_10g_interface_3_xaui_rx_l3_n_pin,
    nf10_10g_interface_3_xaui_tx_l1_n_pin,
    refclk_A_p,
    refclk_A_n,
    refclk_B_p,
    refclk_B_n,
    refclk_C_p,
    refclk_C_n,
    refclk_D_p,
    refclk_D_n,
    MDC,
    MDIO,
    PHY_RST_N,
    pcie_clk_p,
    pcie_top_0_pci_exp_0_txp_pin,
    pcie_clk_n,
    pcie_top_0_pci_exp_0_rxp_pin,
    pcie_top_0_pci_exp_0_rxn_pin,
    pcie_top_0_pci_exp_1_txp_pin,
    pcie_top_0_pci_exp_1_txn_pin,
    pcie_top_0_pci_exp_1_rxp_pin,
    pcie_top_0_pci_exp_1_rxn_pin,
    pcie_top_0_pci_exp_4_txp_pin,
    pcie_top_0_pci_exp_2_txp_pin,
    pcie_top_0_pci_exp_2_txn_pin,
    pcie_top_0_pci_exp_2_rxp_pin,
    pcie_top_0_pci_exp_2_rxn_pin,
    pcie_top_0_pci_exp_3_txp_pin,
    pcie_top_0_pci_exp_3_txn_pin,
    pcie_top_0_pci_exp_3_rxp_pin,
    pcie_top_0_pci_exp_3_rxn_pin,
    pcie_top_0_pci_exp_4_txn_pin,
    pcie_top_0_pci_exp_4_rxp_pin,
    pcie_top_0_pci_exp_4_rxn_pin,
    pcie_top_0_pci_exp_5_txp_pin,
    pcie_top_0_pci_exp_5_txn_pin,
    pcie_top_0_pci_exp_5_rxp_pin,
    pcie_top_0_pci_exp_5_rxn_pin,
    pcie_top_0_pci_exp_6_txp_pin,
    pcie_top_0_pci_exp_6_txn_pin,
    pcie_top_0_pci_exp_6_rxp_pin,
    pcie_top_0_pci_exp_6_rxn_pin,
    pcie_top_0_pci_exp_7_txn_pin,
    pcie_top_0_pci_exp_7_txp_pin,
    pcie_top_0_pci_exp_7_rxn_pin,
    pcie_top_0_pci_exp_7_rxp_pin,
    pcie_top_0_pci_exp_0_txn_pin,
    axi_emc_0_Mem_A_pin,
    axi_emc_0_Mem_CEN_pin,
    axi_emc_0_Mem_OEN_pin,
    axi_emc_0_Mem_WEN_pin,
    axi_emc_0_Mem_DQ_pin,
    axi_cfg_fpga_0_GPIO_IO_pin,
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
    masterbank_sel_pin,
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
    qdr_k_2
  );
  input RESET;
  output RS232_Uart_1_sout;
  input RS232_Uart_1_sin;
  input CLK;
  output nf10_10g_interface_0_xaui_tx_l0_p_pin;
  output nf10_10g_interface_0_xaui_tx_l0_n_pin;
  output nf10_10g_interface_0_xaui_tx_l1_p_pin;
  output nf10_10g_interface_0_xaui_tx_l1_n_pin;
  output nf10_10g_interface_0_xaui_tx_l2_p_pin;
  output nf10_10g_interface_0_xaui_tx_l3_n_pin;
  output nf10_10g_interface_0_xaui_tx_l2_n_pin;
  output nf10_10g_interface_0_xaui_tx_l3_p_pin;
  input nf10_10g_interface_0_xaui_rx_l0_n_pin;
  input nf10_10g_interface_0_xaui_rx_l1_p_pin;
  input nf10_10g_interface_0_xaui_rx_l1_n_pin;
  input nf10_10g_interface_0_xaui_rx_l2_p_pin;
  input nf10_10g_interface_0_xaui_rx_l2_n_pin;
  input nf10_10g_interface_0_xaui_rx_l3_p_pin;
  input nf10_10g_interface_0_xaui_rx_l3_n_pin;
  input nf10_10g_interface_0_xaui_rx_l0_p_pin;
  output nf10_10g_interface_1_xaui_tx_l3_n_pin;
  output nf10_10g_interface_1_xaui_tx_l1_n_pin;
  output nf10_10g_interface_1_xaui_tx_l3_p_pin;
  output nf10_10g_interface_1_xaui_tx_l0_p_pin;
  output nf10_10g_interface_1_xaui_tx_l0_n_pin;
  output nf10_10g_interface_1_xaui_tx_l1_p_pin;
  output nf10_10g_interface_1_xaui_tx_l2_n_pin;
  input nf10_10g_interface_1_xaui_rx_l0_p_pin;
  input nf10_10g_interface_1_xaui_rx_l0_n_pin;
  input nf10_10g_interface_1_xaui_rx_l1_p_pin;
  input nf10_10g_interface_1_xaui_rx_l1_n_pin;
  input nf10_10g_interface_1_xaui_rx_l2_p_pin;
  input nf10_10g_interface_1_xaui_rx_l2_n_pin;
  input nf10_10g_interface_1_xaui_rx_l3_p_pin;
  input nf10_10g_interface_1_xaui_rx_l3_n_pin;
  output nf10_10g_interface_1_xaui_tx_l2_p_pin;
  output nf10_10g_interface_2_xaui_tx_l3_p_pin;
  output nf10_10g_interface_2_xaui_tx_l3_n_pin;
  output nf10_10g_interface_2_xaui_tx_l0_p_pin;
  output nf10_10g_interface_2_xaui_tx_l0_n_pin;
  output nf10_10g_interface_2_xaui_tx_l1_p_pin;
  output nf10_10g_interface_2_xaui_tx_l2_p_pin;
  output nf10_10g_interface_2_xaui_tx_l2_n_pin;
  input nf10_10g_interface_2_xaui_rx_l0_p_pin;
  input nf10_10g_interface_2_xaui_rx_l0_n_pin;
  input nf10_10g_interface_2_xaui_rx_l1_p_pin;
  input nf10_10g_interface_2_xaui_rx_l1_n_pin;
  input nf10_10g_interface_2_xaui_rx_l2_p_pin;
  input nf10_10g_interface_2_xaui_rx_l2_n_pin;
  input nf10_10g_interface_2_xaui_rx_l3_p_pin;
  input nf10_10g_interface_2_xaui_rx_l3_n_pin;
  output nf10_10g_interface_2_xaui_tx_l1_n_pin;
  output nf10_10g_interface_3_xaui_tx_l3_p_pin;
  output nf10_10g_interface_3_xaui_tx_l3_n_pin;
  output nf10_10g_interface_3_xaui_tx_l0_p_pin;
  output nf10_10g_interface_3_xaui_tx_l0_n_pin;
  output nf10_10g_interface_3_xaui_tx_l1_p_pin;
  output nf10_10g_interface_3_xaui_tx_l2_p_pin;
  output nf10_10g_interface_3_xaui_tx_l2_n_pin;
  input nf10_10g_interface_3_xaui_rx_l0_p_pin;
  input nf10_10g_interface_3_xaui_rx_l0_n_pin;
  input nf10_10g_interface_3_xaui_rx_l1_p_pin;
  input nf10_10g_interface_3_xaui_rx_l1_n_pin;
  input nf10_10g_interface_3_xaui_rx_l2_p_pin;
  input nf10_10g_interface_3_xaui_rx_l2_n_pin;
  input nf10_10g_interface_3_xaui_rx_l3_p_pin;
  input nf10_10g_interface_3_xaui_rx_l3_n_pin;
  output nf10_10g_interface_3_xaui_tx_l1_n_pin;
  input refclk_A_p;
  input refclk_A_n;
  input refclk_B_p;
  input refclk_B_n;
  input refclk_C_p;
  input refclk_C_n;
  input refclk_D_p;
  input refclk_D_n;
  output MDC;
  inout MDIO;
  output PHY_RST_N;
  input pcie_clk_p;
  output pcie_top_0_pci_exp_0_txp_pin;
  input pcie_clk_n;
  input pcie_top_0_pci_exp_0_rxp_pin;
  input pcie_top_0_pci_exp_0_rxn_pin;
  output pcie_top_0_pci_exp_1_txp_pin;
  output pcie_top_0_pci_exp_1_txn_pin;
  input pcie_top_0_pci_exp_1_rxp_pin;
  input pcie_top_0_pci_exp_1_rxn_pin;
  output pcie_top_0_pci_exp_4_txp_pin;
  output pcie_top_0_pci_exp_2_txp_pin;
  output pcie_top_0_pci_exp_2_txn_pin;
  input pcie_top_0_pci_exp_2_rxp_pin;
  input pcie_top_0_pci_exp_2_rxn_pin;
  output pcie_top_0_pci_exp_3_txp_pin;
  output pcie_top_0_pci_exp_3_txn_pin;
  input pcie_top_0_pci_exp_3_rxp_pin;
  input pcie_top_0_pci_exp_3_rxn_pin;
  output pcie_top_0_pci_exp_4_txn_pin;
  input pcie_top_0_pci_exp_4_rxp_pin;
  input pcie_top_0_pci_exp_4_rxn_pin;
  output pcie_top_0_pci_exp_5_txp_pin;
  output pcie_top_0_pci_exp_5_txn_pin;
  input pcie_top_0_pci_exp_5_rxp_pin;
  input pcie_top_0_pci_exp_5_rxn_pin;
  output pcie_top_0_pci_exp_6_txp_pin;
  output pcie_top_0_pci_exp_6_txn_pin;
  input pcie_top_0_pci_exp_6_rxp_pin;
  input pcie_top_0_pci_exp_6_rxn_pin;
  output pcie_top_0_pci_exp_7_txn_pin;
  output pcie_top_0_pci_exp_7_txp_pin;
  input pcie_top_0_pci_exp_7_rxn_pin;
  input pcie_top_0_pci_exp_7_rxp_pin;
  output pcie_top_0_pci_exp_0_txn_pin;
  output [23:0] axi_emc_0_Mem_A_pin;
  output [0:0] axi_emc_0_Mem_CEN_pin;
  output [0:0] axi_emc_0_Mem_OEN_pin;
  output axi_emc_0_Mem_WEN_pin;
  inout [31:0] axi_emc_0_Mem_DQ_pin;
  inout [1:0] axi_cfg_fpga_0_GPIO_IO_pin;
  output [35:0] qdr_d_0;
  input [35:0] qdr_q_0;
  output [18:0] qdr_sa_0;
  output qdr_w_n_0;
  output qdr_r_n_0;
  output [3:0] qdr_bw_n_0;
  output qdr_dll_off_n_0;
  input qdr_cq_0;
  input qdr_cq_n_0;
  output qdr_c_n_0;
  output qdr_k_n_0;
  output qdr_c_0;
  output qdr_k_0;
  input [2:0] masterbank_sel_pin;
  output [35:0] qdr_d_1;
  input [35:0] qdr_q_1;
  output [18:0] qdr_sa_1;
  output qdr_w_n_1;
  output qdr_r_n_1;
  output [3:0] qdr_bw_n_1;
  output qdr_dll_off_n_1;
  input qdr_cq_1;
  input qdr_cq_n_1;
  output qdr_c_n_1;
  output qdr_k_n_1;
  output qdr_c_1;
  output qdr_k_1;
  output [35:0] qdr_d_2;
  input [35:0] qdr_q_2;
  output [18:0] qdr_sa_2;
  output qdr_w_n_2;
  output qdr_r_n_2;
  output [3:0] qdr_bw_n_2;
  output qdr_dll_off_n_2;
  input qdr_cq_2;
  input qdr_cq_n_2;
  output qdr_c_n_2;
  output qdr_k_n_2;
  output qdr_c_2;
  output qdr_k_2;
endmodule

