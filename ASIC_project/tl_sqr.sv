class tl_sqr extends uvm_sequencer#(tl_item);
	`uvm_component_utils(tl_sqr)
	function new(string name="", uvm_component parent=null);
		super.new(name, parent);
	endfunction
endclass

