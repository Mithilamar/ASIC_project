class tl_agent extends uvm_agent;
	rand bit rc_ep_f;
	tl_drv drv;
	tl_sqr sqr;
	//tl_mon mon;
	//tl_cov cov;
	`uvm_component_utils_begin(tl_agent)
		`uvm_field_int(rc_ep_f, UVM_ALL_ON)
	`uvm_component_utils_end
	function new(string name="", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		drv = tl_drv::type_id::create("drv", this);
		sqr = tl_sqr::type_id::create("sqr", this);
		//mon = tl_mon::type_id::create("mon", this);
		//cov = tl_cov::type_id::create("cov", this);
	endfunction

	function void connect_phase(uvm_phase phase);
		drv.seq_item_port.connect(sqr.seq_item_export);
		//mon.ap_port.connect(cov.analysis_export);
	endfunction
endclass
