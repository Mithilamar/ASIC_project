class tl_drv extends uvm_driver#(tl_item);
	rand bit rc_ep_f;
	`uvm_component_utils_begin(tl_drv)
		`uvm_field_int(rc_ep_f, UVM_ALL_ON)
	`uvm_component_utils_end
	function new(string name="", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
			seq_item_port.get_next_item(req);
			req.print();
			//req.pack();  //it will pack all the Header fields  into header byteQ
					//byteQ will be driven in to Design
			seq_item_port.item_done();
		end
	endtask
endclass
