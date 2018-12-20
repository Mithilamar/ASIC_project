typedef enum {
	MRd,
	MRdLk,
	MWr,
	IORd,
	IOWr,
	CfgRd0,
	CfgWr0,
	CfgRd1,
	CfgWr1,
	TCfgRd,
	TCfgWr,
	Msg,
	MsgD,
	Cpl,
	CplD,
	CplLk,
	CplDLk,
	FetchAdd,
	Swap,
	CAS,
	LPrfx,
	EPrfx
} tlp_type_t;

typedef enum {
	DW3,
	DW4
} header_t;

//TLP Header : 3DW or 4DW
//

class tl_item extends uvm_sequence_item;
	tlp_type_t tlp_type;
	header_t header_type;
	//TLP fields
	byte prefix[$];  //these will used to pack the fields in to queue of bytes, then these queue of bytes will be driven on to the Tl-DLL interface
		//pack in to QUeue of Data word(32 bits)
	byte header[$];
	
	//DW0
	rand bit [2:0] fmt;
	//rand bit [63:0] address; 
	rand bit [4:0] typet;
	rand bit [2:0] tc;
	rand bit attr_1;
	rand bit th;
	rand bit td;
	rand bit ep;
	rand bit [1:0] attr_0;
	rand bit [1:0] at;
	rand bit [9:0] len;

	//DW1
	rand bit [15:0] requester_id;
	rand bit [7:0] st;
	rand bit [7:0] tag;
	rand bit [3:0] last_dw_be;
	rand bit [3:0] first_dw_be;
	rand bit [7:0] msg_code;

	//DW2
	rand bit [7:0] bus_number_cpl;
	rand bit [4:0] dev_number_cpl;
	rand bit [2:0] func_number_cpl;
	rand bit [7:0] func_number_ar_cpl;
	rand bit [29:0] addr_32;
	rand bit [3:0] ext_reg_number;
	rand bit [5:0] register_number;
	rand bit [15:0] vendor_id;

	//DW3
	rand bit [63:0] addr_63_32;
	rand bit [31:0] vendor_defn;

	byte payload[$];
	byte digest[4];

	`uvm_object_utils_begin(tl_item)
		`uvm_field_enum(tlp_type_t, tlp_type, UVM_ALL_ON)
		`uvm_field_enum(header_t, header_type, UVM_ALL_ON)
		`uvm_field_queue_int(prefix, UVM_ALL_ON)
		`uvm_field_queue_int(header, UVM_ALL_ON)
		`uvm_field_int(fmt, UVM_ALL_ON)
		`uvm_field_int(typet, UVM_ALL_ON)
		`uvm_field_int(tc, UVM_ALL_ON)
		`uvm_field_int(attr_1, UVM_ALL_ON)
		`uvm_field_int(th, UVM_ALL_ON)
		`uvm_field_int(td, UVM_ALL_ON)
		`uvm_field_int(ep, UVM_ALL_ON)
		`uvm_field_int(attr_0, UVM_ALL_ON)
		`uvm_field_int(at, UVM_ALL_ON)
		`uvm_field_int(len, UVM_ALL_ON)
		`uvm_field_int(requester_id, UVM_ALL_ON)
		`uvm_field_int(st, UVM_ALL_ON)
		`uvm_field_int(tag, UVM_ALL_ON)
		`uvm_field_int(last_dw_be, UVM_ALL_ON)
		`uvm_field_int(first_dw_be, UVM_ALL_ON)
		`uvm_field_int(msg_code, UVM_ALL_ON)
		`uvm_field_int(bus_number_cpl, UVM_ALL_ON)
		`uvm_field_int(dev_number_cpl, UVM_ALL_ON)
		`uvm_field_int(func_number_cpl, UVM_ALL_ON)
		`uvm_field_int(func_number_ar_cpl, UVM_ALL_ON)
		`uvm_field_int(addr_32, UVM_ALL_ON)
		`uvm_field_int(ext_reg_number, UVM_ALL_ON)
		`uvm_field_int(register_number, UVM_ALL_ON)
		`uvm_field_int(vendor_id, UVM_ALL_ON)
		`uvm_field_int(addr_63_32, UVM_ALL_ON)
		`uvm_field_int(vendor_defn, UVM_ALL_ON)
		`uvm_field_queue_int(payload, UVM_ALL_ON)
		`uvm_field_sarray_int(digest, UVM_ALL_ON)
	`uvm_object_utils_end

        constraint addr  {
		address_63_32[1:0] == 0; //address
	}

	constraint fmt_c {
		soft fmt[2] == 0;
	}

	function void post_randomize();
		if (tlp_type inside {LPrfx, EPrfx}) fmt[2] = 1; 
	endfunction


	//constraints
	//fmt, type mapping to TLP type
	constraint tlp_fmt_type_c {
		(tlp_type == MRd) -> (fmt[2:1] == 2'b00 && typet == 5'b0);
		(tlp_type == MRdLk) -> (fmt[2:1] == 2'b00 &&  typet == 5'b1);
		(tlp_type == MWr) -> (fmt[2:1] == 2'b01 && typet == 5'b0);
		(tlp_type == IORd) -> (fmt == 3'b0 && typet == 5'b10);
		(tlp_type == IOWr) -> (fmt == 3'b010  && typet == 5'b10);
		//rest of thigns are student assingemnts
	}

	/*
	function void do_pack(byte byteQ[$]);
		if (tlp_type == MRd) begin
			header[0] = {fmt, typet };
			header[1] = {fmt, typet };
			header[2] = {fmt, typet };
			if (header_type == DW4) begin
				header[3] = {};
			end
		end
		byteQ = {prefix, header, payload, digest};
	endfunction
	*/
endclass
