class pcie_status extends uvm_status;
int mem_wr_transmission_status;
int mem_wr_reception_status;
int mem_rd_transmission_status;
int mem_rd_reception_status;
int io_wr_transmission_status;
int io_rd_reception_status;
int cfg_wr0_transmission_status;
int cfg_wr0_reception_status;
int cfg_rd0_transmission_status;
int cfg_rd0_reception_status;
int cfg_wr1_transmission_status;
int cfg_wr1_reception_status;
int cfg_rd1_transmission_status;
int cfg_rd1_reception_status;
int cpl_tlp_transmitted;
int vendor_defined_message_recieve_status;
int vendor_defined_message_transmit_status;
int sspl_message_transmit_status;
int sspl_message_receive_status;
int obff_message_transmit_status;
int obff_message_receive_status;
int power_management_message_transmit_status;
int power_management_message_receive_status;
int fatal_error_transmitted;
int fatal_error_recieved;
int correctable_error_transmitted;
int correctable_error_received;
int assert_inta_transmitted;
int assert_intb_transmitted;
int assert_intc_transmitted;
int assert_intd_transmitted;
int assert_inta_received;
int assert_intb_received;
int assert_intc_received;
int assert_intd_received;
int deassert_inta_transmitted;
int deassert_intb_transmitted;
int deassert_intc_transmitted;
int deassert_intd_transmitted;
int deassert_inta_received;
int deassert_intb_received;
int deassert_intc_received;
int obff_msg_transmitted;
int obff_msg_received;
int sspl_msg_transmitted;
int sspl_msg_received;
int ltr_msg_transmitted;
int ltr_msg_received;
endclass
