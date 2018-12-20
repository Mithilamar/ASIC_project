class tl_uvc_base_test extends uvm_test;
	tl_env env;
	`uvm_component_utils(tl_uvc_base_test)
	function new(string name="", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env = tl_env::type_id::create("env", this);
	endfunction
endclass

class test_mem_rd extends tl_uvc_base_test;
	`uvm_component_utils(test_mem_rd)
	function new(string name="", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction

	task run_phase(uvm_phase phase);
		tl_mem_rd_seq mem_rd_seq;
		mem_rd_seq = tl_mem_rd_seq::type_id::create("mem_rd_seq");
		phase.raise_objection(this);
		fork
		mem_rd_seq.start(env.rc_agent_i.sqr);
		//mem_rd_seq.start(env.ep_agent_i.sqr);
		join
		phase.drop_objection(this);

	endtask
	/*ksdjdj*/

endclass

class test_mem_wr extends tl_uvc_base_test;
	`uvm_component_utils(test_mem_wr)
	function new(string name="", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction

	task run_phase(uvm_phase phase);
		tl_mem_wr_seq mem_wr_seq;
		mem_wr_seq = tl_mem_wr_seq::type_id::create("mem_wr_seq");
		phase.raise_objection(this);
		fork
		mem_wr_seq.start(env.rc_agent_i.sqr);
		join
		phase.drop_objection(this); 

	endtask

endclass
