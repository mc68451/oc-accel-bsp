
## Pblock for placing VIO IPs and Debug Hub IP closer to DLx logic. This Pblock includes everything in the design except for a couple of I/O and clock buffers and BSCAN primitives which are constrained outside of this Pblock
#create_pblock pblock_1
#resize_pblock pblock_1 -add CLOCKREGION_X0Y0:CLOCKREGION_X1Y1
#add_cells_to_pblock pblock_1 [get_cells [list dbg_hub top_i/oc_host_if/inst/dlx_phy top_i/oc_host_if/inst/DLx_phy_vio_0_inst top_i/oc_host_if/inst/vio_reset_n_inst_tlx top_i/oc_host_if/inst/tlx]]
#
#remove_cells_from_pblock pblock_1 [get_cells top_i/oc_host_if/inst/dlx_phy/IBUFDS_freerun]
## remove_cells_from_pblock pblock_1 [get_cells dbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.u_bufg_icon_tck]
#remove_cells_from_pblock pblock_1 [get_cells top_i/oc_host_if/inst/dlx_phy/BUFGCE_DIV_inst]
## remove_cells_from_pblock pblock_1 [get_cells dbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_inst/SERIES7_BSCAN.bscan_inst]
#
#set_property USER_CLOCK_ROOT X0Y1 [get_nets {top_i/oc_host_if/inst/dlx_phy/example_wrapper_inst/gtwiz_userclk_tx_inst/rxusrclk2_in[0]}]
#
#set_property EXTRACT_ENABLE NO [get_cells {top_i/oc_host_if/inst/dlx_phy/ocx_dlx_top_inst/rx/main/replay_deskew_cntr_q_reg[*] top_i/oc_host_if/inst/dlx_phy/ocx_dlx_top_inst/rx/lane?/ts1_cntr_q_reg[*] top_i/oc_host_if/inst/dlx_phy/ocx_dlx_top_inst/rx/lane?/lfsr_q_reg[*] top_i/oc_host_if/inst/dlx_phy/ocx_dlx_top_inst/rx/lane?/deskew_buffer?_q_reg[*] top_i/oc_host_if/inst/dlx_phy/ocx_dlx_top_inst/rx/main/crc_bits_q_reg[*]}]
#set_power_opt -exclude_cells [get_cells {top_i/oc_host_if/inst/dlx_phy/ocx_dlx_top_inst/tx/flt/bram/ram_sdp_reg_?}]
#
#set_property MAX_FANOUT 60 [get_nets {top_i/oc_host_if/inst/dlx_phy/ocx_dlx_top_inst/tx/ctl/ctl_x4_not_x8_tx_mode}]
## set_property MAX_FANOUT 60 [get_nets {top_i/oc_host_if/inst/dlx_phy/ocx_dlx_top_inst/rx/main/deskew_all_valid_l0}]
#set_property MAX_FANOUT 80 [get_nets {top_i/oc_host_if/inst/dlx_phy/ocx_dlx_top_inst/rx/reset}]
#set_property MAX_FANOUT 50 [get_nets {top_i/oc_host_if/inst/dlx_phy/ocx_dlx_top_inst/tx/flt/crc_zero_d1_q}]
#set_property MAX_FANOUT 50 [get_nets {top_i/oc_host_if/inst/dlx_phy/ocx_dlx_top_inst/rx/training_q}]
#set_property MAX_FANOUT 26 [get_nets {top_i/oc_host_if/inst/dlx_phy/ocx_dlx_top_inst/tx/flt/crc_zero_d2_q}]
#
## 1024: Added more constraints to disable inference of enable/reset for some regs
#set_property EXTRACT_ENABLE NO [get_cells {top_i/oc_host_if/inst/tlx/OCX_TLX_FRAMER/cmd_cntl_flit_reg_reg[*]}]
#set_property EXTRACT_ENABLE NO [get_cells {top_i/oc_host_if/inst/tlx/OCX_TLX_FRAMER/vc0_fifo/valid_entry_counter_reg[*]}]
#set_property EXTRACT_ENABLE NO [get_cells {top_i/oc_host_if/inst/tlx/OCX_TLX_PARSER/TLX_Parser/flit_parser/ctl_flit_dout_reg[*]}]
#
#set_property EXTRACT_RESET NO [get_cells {top_i/oc_host_if/inst/tlx/OCX_TLX_PARSER/TLX_RCV_FIFO/CMD_FIFO_MAC/CMD_INFO_CTL/ctl_cnt_dout_reg[*]}]
#set_property EXTRACT_RESET NO [get_cells {top_i/oc_host_if/inst/dlx_phy/ocx_dlx_top_inst/tx/flt/pre_crc_data_q_reg[*]}]
#set_property EXTRACT_RESET NO [get_cells {top_i/oc_host_if/inst/tlx/OCX_TLX_PARSER/TLX_RCV_FIFO/RESP_FIFO_MAC/RESP_INFO_CTL/data_wr_cnt_dout_reg[*]}]
#set_property EXTRACT_RESET NO [get_cells {top_i/oc_host_if/inst/tlx/OCX_TLX_PARSER/TLX_RCV_FIFO/CMD_FIFO_MAC/CMD_INFO_CTL/data_wr_cnt_dout_reg[*]}]

#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets oc_host_if_clock_tlx]
