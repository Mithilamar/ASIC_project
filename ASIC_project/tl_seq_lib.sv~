class tl_base_seq extends uvm_sequence#(tl_item);
	`uvm_object_utils(tl_base_seq)
	function new(string name="");
		super.new(name);
	endfunction

	task pre_body();
		if (starting_phase != null)
		this.starting_phase.raise_objection(this);
	endtask
	task post_body();
		if (starting_phase != null)
		this.starting_phase.drop_objection(this);
	endtask
endclass

class tl_mem_rd_seq extends tl_base_seq;
	`uvm_object_utils(tl_mem_rd_seq)
	function new(string name="");
		super.new(name);
	endfunction

	task body();
		`uvm_do_with(req, {req.tlp_type == MRd;})
		//`uvm_do_with(req, {req.tlp_type == MRd; req.addr == 64'h84389433409})
	endtask
endclass


class tl_mem_wr_seq extends tl_base_seq;
	`uvm_object_utils(tl_mem_wr_seq)
	function new(string name="");
		super.new(name);
	endfunction

	task body();
		`uvm_do_with(req, {req.tlp_type == MWr;})
		//`uvm_do_with(req, {req.tlp_type == MWr; req.addr == 64'h84389433409})
	endtask
endclass


