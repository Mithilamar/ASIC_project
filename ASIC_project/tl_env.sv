class tl_env extends uvm_env;
	tl_agent rc_agent_i;
	tl_agent ep_agent_i;
	`uvm_component_utils(tl_env)
	function new(string name="", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		rc_agent_i = tl_agent::type_id::create("rc_agent_i", this);
		ep_agent_i = tl_agent::type_id::create("ep_agent_i", this);
		uvm_config_db#(int)::set(this, "rc_agent_i*", "rc_ep_f", 1);
		uvm_config_db#(int)::set(this, "ep_agent_i*", "rc_ep_f", 0);
	endfunction
endclass
