`include "uvm_pkg.sv"
import uvm_pkg::*;
`include "tl_dll_intf.sv"
`include "tl_item.sv"
`include "tl_drv.sv"
`include "tl_sqr.sv"
`include "tl_agent.sv"
`include "tl_env.sv"
`include "tl_seq_lib.sv"
module top;
reg clk;
	tl_dll_intf pif(clk);
	`include "test_lib.sv"

	initial begin
		uvm_config_db#(virtual tl_dll_intf)::set(uvm_root::get(), "*", "pif", pif);
	end

	initial begin
		clk = 0;
	end

	initial begin
		run_test("test_mem_rd");
	end
endmodule
