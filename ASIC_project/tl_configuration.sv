class tl_configuration extends uvm_configuration;
int max_payload_size;
int max_read_request;
bit ecrc_generation_enable;
bit ecrc_detection_enable;
bit fatal_error_detection_enable;
bit non_fatal_error_detection_enable;
bit correctable_error_detection_enable;
bit ari_enable;
bit extended_tag_field_supported;
bit vc1_enable;
bit vc2_enable;
bit vc3_enable;
bit vc4_enable;
bit vc5_enable;
bit vc6_enable;
bit vc7_enable;
bit tc0_map_vc1;
bit tc1_map_vc1;
bit tc2_map_vc1;
bit tc3_map_vc1;
bit tc4_map_vc1;
bit tc5_map_vc1;
bit tc6_map_vc1;

//Map all TC's to VC's
endclass
