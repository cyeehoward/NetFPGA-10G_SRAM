//-----------------------------------------------------------------------------
// system_tb.v
//-----------------------------------------------------------------------------

`timescale 1 ps / 100 fs

`uselib lib=unisims_ver

// START USER CODE (Do not remove this line)

// User: Put your directives here. Code in this
//       section will not be overwritten.

// END USER CODE (Do not remove this line)

module system_tb
  (
  );

  // START USER CODE (Do not remove this line)

  // User: Put your signals here. Code in this
  //       section will not be overwritten.

  // END USER CODE (Do not remove this line)


  // Internal signals

  reg CLK;
  wire MDC;
  wire MDIO;
  wire PHY_RST_N;
  reg RESET;
  reg RS232_Uart_1_sin;
  wire RS232_Uart_1_sout;
  wire [1:0] axi_cfg_fpga_0_GPIO_IO_pin;
  wire [23:0] axi_emc_0_Mem_A_pin;
  wire [0:0] axi_emc_0_Mem_CEN_pin;
  wire [31:0] axi_emc_0_Mem_DQ_pin;
  wire [0:0] axi_emc_0_Mem_OEN_pin;
  wire axi_emc_0_Mem_WEN_pin;
  reg [2:0] masterbank_sel_pin;
  reg nf10_10g_interface_0_xaui_rx_l0_n_pin;
  reg nf10_10g_interface_0_xaui_rx_l0_p_pin;
  reg nf10_10g_interface_0_xaui_rx_l1_n_pin;
  reg nf10_10g_interface_0_xaui_rx_l1_p_pin;
  reg nf10_10g_interface_0_xaui_rx_l2_n_pin;
  reg nf10_10g_interface_0_xaui_rx_l2_p_pin;
  reg nf10_10g_interface_0_xaui_rx_l3_n_pin;
  reg nf10_10g_interface_0_xaui_rx_l3_p_pin;
  wire nf10_10g_interface_0_xaui_tx_l0_n_pin;
  wire nf10_10g_interface_0_xaui_tx_l0_p_pin;
  wire nf10_10g_interface_0_xaui_tx_l1_n_pin;
  wire nf10_10g_interface_0_xaui_tx_l1_p_pin;
  wire nf10_10g_interface_0_xaui_tx_l2_n_pin;
  wire nf10_10g_interface_0_xaui_tx_l2_p_pin;
  wire nf10_10g_interface_0_xaui_tx_l3_n_pin;
  wire nf10_10g_interface_0_xaui_tx_l3_p_pin;
  reg nf10_10g_interface_1_xaui_rx_l0_n_pin;
  reg nf10_10g_interface_1_xaui_rx_l0_p_pin;
  reg nf10_10g_interface_1_xaui_rx_l1_n_pin;
  reg nf10_10g_interface_1_xaui_rx_l1_p_pin;
  reg nf10_10g_interface_1_xaui_rx_l2_n_pin;
  reg nf10_10g_interface_1_xaui_rx_l2_p_pin;
  reg nf10_10g_interface_1_xaui_rx_l3_n_pin;
  reg nf10_10g_interface_1_xaui_rx_l3_p_pin;
  wire nf10_10g_interface_1_xaui_tx_l0_n_pin;
  wire nf10_10g_interface_1_xaui_tx_l0_p_pin;
  wire nf10_10g_interface_1_xaui_tx_l1_n_pin;
  wire nf10_10g_interface_1_xaui_tx_l1_p_pin;
  wire nf10_10g_interface_1_xaui_tx_l2_n_pin;
  wire nf10_10g_interface_1_xaui_tx_l2_p_pin;
  wire nf10_10g_interface_1_xaui_tx_l3_n_pin;
  wire nf10_10g_interface_1_xaui_tx_l3_p_pin;
  reg nf10_10g_interface_2_xaui_rx_l0_n_pin;
  reg nf10_10g_interface_2_xaui_rx_l0_p_pin;
  reg nf10_10g_interface_2_xaui_rx_l1_n_pin;
  reg nf10_10g_interface_2_xaui_rx_l1_p_pin;
  reg nf10_10g_interface_2_xaui_rx_l2_n_pin;
  reg nf10_10g_interface_2_xaui_rx_l2_p_pin;
  reg nf10_10g_interface_2_xaui_rx_l3_n_pin;
  reg nf10_10g_interface_2_xaui_rx_l3_p_pin;
  wire nf10_10g_interface_2_xaui_tx_l0_n_pin;
  wire nf10_10g_interface_2_xaui_tx_l0_p_pin;
  wire nf10_10g_interface_2_xaui_tx_l1_n_pin;
  wire nf10_10g_interface_2_xaui_tx_l1_p_pin;
  wire nf10_10g_interface_2_xaui_tx_l2_n_pin;
  wire nf10_10g_interface_2_xaui_tx_l2_p_pin;
  wire nf10_10g_interface_2_xaui_tx_l3_n_pin;
  wire nf10_10g_interface_2_xaui_tx_l3_p_pin;
  reg nf10_10g_interface_3_xaui_rx_l0_n_pin;
  reg nf10_10g_interface_3_xaui_rx_l0_p_pin;
  reg nf10_10g_interface_3_xaui_rx_l1_n_pin;
  reg nf10_10g_interface_3_xaui_rx_l1_p_pin;
  reg nf10_10g_interface_3_xaui_rx_l2_n_pin;
  reg nf10_10g_interface_3_xaui_rx_l2_p_pin;
  reg nf10_10g_interface_3_xaui_rx_l3_n_pin;
  reg nf10_10g_interface_3_xaui_rx_l3_p_pin;
  wire nf10_10g_interface_3_xaui_tx_l0_n_pin;
  wire nf10_10g_interface_3_xaui_tx_l0_p_pin;
  wire nf10_10g_interface_3_xaui_tx_l1_n_pin;
  wire nf10_10g_interface_3_xaui_tx_l1_p_pin;
  wire nf10_10g_interface_3_xaui_tx_l2_n_pin;
  wire nf10_10g_interface_3_xaui_tx_l2_p_pin;
  wire nf10_10g_interface_3_xaui_tx_l3_n_pin;
  wire nf10_10g_interface_3_xaui_tx_l3_p_pin;
  reg pcie_clk_n;
  reg pcie_clk_p;
  reg pcie_top_0_pci_exp_0_rxn_pin;
  reg pcie_top_0_pci_exp_0_rxp_pin;
  wire pcie_top_0_pci_exp_0_txn_pin;
  wire pcie_top_0_pci_exp_0_txp_pin;
  reg pcie_top_0_pci_exp_1_rxn_pin;
  reg pcie_top_0_pci_exp_1_rxp_pin;
  wire pcie_top_0_pci_exp_1_txn_pin;
  wire pcie_top_0_pci_exp_1_txp_pin;
  reg pcie_top_0_pci_exp_2_rxn_pin;
  reg pcie_top_0_pci_exp_2_rxp_pin;
  wire pcie_top_0_pci_exp_2_txn_pin;
  wire pcie_top_0_pci_exp_2_txp_pin;
  reg pcie_top_0_pci_exp_3_rxn_pin;
  reg pcie_top_0_pci_exp_3_rxp_pin;
  wire pcie_top_0_pci_exp_3_txn_pin;
  wire pcie_top_0_pci_exp_3_txp_pin;
  reg pcie_top_0_pci_exp_4_rxn_pin;
  reg pcie_top_0_pci_exp_4_rxp_pin;
  wire pcie_top_0_pci_exp_4_txn_pin;
  wire pcie_top_0_pci_exp_4_txp_pin;
  reg pcie_top_0_pci_exp_5_rxn_pin;
  reg pcie_top_0_pci_exp_5_rxp_pin;
  wire pcie_top_0_pci_exp_5_txn_pin;
  wire pcie_top_0_pci_exp_5_txp_pin;
  reg pcie_top_0_pci_exp_6_rxn_pin;
  reg pcie_top_0_pci_exp_6_rxp_pin;
  wire pcie_top_0_pci_exp_6_txn_pin;
  wire pcie_top_0_pci_exp_6_txp_pin;
  reg pcie_top_0_pci_exp_7_rxn_pin;
  reg pcie_top_0_pci_exp_7_rxp_pin;
  wire pcie_top_0_pci_exp_7_txn_pin;
  wire pcie_top_0_pci_exp_7_txp_pin;
  wire [3:0] qdr_bw_n_0;
  wire [3:0] qdr_bw_n_1;
  wire [3:0] qdr_bw_n_2;
  wire qdr_c_0;
  wire qdr_c_1;
  wire qdr_c_2;
  wire qdr_c_n_0;
  wire qdr_c_n_1;
  wire qdr_c_n_2;
  reg qdr_cq_0;
  reg qdr_cq_1;
  reg qdr_cq_2;
  reg qdr_cq_n_0;
  reg qdr_cq_n_1;
  reg qdr_cq_n_2;
  wire [35:0] qdr_d_0;
  wire [35:0] qdr_d_1;
  wire [35:0] qdr_d_2;
  wire qdr_dll_off_n_0;
  wire qdr_dll_off_n_1;
  wire qdr_dll_off_n_2;
  wire qdr_k_0;
  wire qdr_k_1;
  wire qdr_k_2;
  wire qdr_k_n_0;
  wire qdr_k_n_1;
  wire qdr_k_n_2;
  reg [35:0] qdr_q_0;
  reg [35:0] qdr_q_1;
  reg [35:0] qdr_q_2;
  wire qdr_r_n_0;
  wire qdr_r_n_1;
  wire qdr_r_n_2;
  wire [18:0] qdr_sa_0;
  wire [18:0] qdr_sa_1;
  wire [18:0] qdr_sa_2;
  wire qdr_w_n_0;
  wire qdr_w_n_1;
  wire qdr_w_n_2;
  reg refclk_A_n;
  reg refclk_A_p;
  reg refclk_B_n;
  reg refclk_B_p;
  reg refclk_C_n;
  reg refclk_C_p;
  reg refclk_D_n;
  reg refclk_D_p;

  system
    dut (
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
      .qdr_k_2 ( qdr_k_2 ),
      .qdr_c_2 ( qdr_c_2 ),
      .qdr_k_n_2 ( qdr_k_n_2 ),
      .qdr_c_n_2 ( qdr_c_n_2 ),
      .qdr_cq_n_2 ( qdr_cq_n_2 ),
      .qdr_cq_2 ( qdr_cq_2 ),
      .qdr_dll_off_n_2 ( qdr_dll_off_n_2 ),
      .qdr_bw_n_2 ( qdr_bw_n_2 ),
      .qdr_r_n_2 ( qdr_r_n_2 ),
      .qdr_w_n_2 ( qdr_w_n_2 ),
      .qdr_sa_2 ( qdr_sa_2 ),
      .qdr_q_2 ( qdr_q_2 ),
      .qdr_d_2 ( qdr_d_2 ),
      .qdr_k_1 ( qdr_k_1 ),
      .qdr_c_1 ( qdr_c_1 ),
      .qdr_k_n_1 ( qdr_k_n_1 ),
      .qdr_c_n_1 ( qdr_c_n_1 ),
      .qdr_cq_n_1 ( qdr_cq_n_1 ),
      .qdr_cq_1 ( qdr_cq_1 ),
      .qdr_dll_off_n_1 ( qdr_dll_off_n_1 ),
      .qdr_bw_n_1 ( qdr_bw_n_1 ),
      .qdr_r_n_1 ( qdr_r_n_1 ),
      .qdr_w_n_1 ( qdr_w_n_1 ),
      .qdr_sa_1 ( qdr_sa_1 ),
      .qdr_q_1 ( qdr_q_1 ),
      .qdr_d_1 ( qdr_d_1 ),
      .masterbank_sel_pin ( masterbank_sel_pin ),
      .qdr_k_0 ( qdr_k_0 ),
      .qdr_c_0 ( qdr_c_0 ),
      .qdr_k_n_0 ( qdr_k_n_0 ),
      .qdr_c_n_0 ( qdr_c_n_0 ),
      .qdr_cq_n_0 ( qdr_cq_n_0 ),
      .qdr_cq_0 ( qdr_cq_0 ),
      .qdr_dll_off_n_0 ( qdr_dll_off_n_0 ),
      .qdr_bw_n_0 ( qdr_bw_n_0 ),
      .qdr_r_n_0 ( qdr_r_n_0 ),
      .qdr_w_n_0 ( qdr_w_n_0 ),
      .qdr_sa_0 ( qdr_sa_0 ),
      .qdr_q_0 ( qdr_q_0 ),
      .qdr_d_0 ( qdr_d_0 )
    );

  // START USER CODE (Do not remove this line)

  // User: Put your stimulus here. Code in this
  //       section will not be overwritten.

  // END USER CODE (Do not remove this line)

endmodule

