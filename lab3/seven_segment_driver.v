module seven_segment_driver (
	input [3:0] num_in,
	output [7:0] seg_out
);

	//NOTE: C is wrong (top not on)
	//NOTE: D is wrong (top on)
	//NOTE: E is wrong (top not on)
	//NOTE: F is wrong (top not on)
	//NOTE: 4 is wrong (top on)

	assign seg_out[0] = (num_in[0] & num_in[1] & ~num_in[2] & num_in[3]) |			  
							  (num_in[0] & ~num_in[1] & num_in[2] & num_in[3]) |
							  (~num_in[0] & ~num_in[1] & num_in[2] & ~num_in[3]) |
							  (num_in[0] & ~num_in[1] & ~num_in[2] & ~num_in[3]);
							  
	assign seg_out[1] = (~num_in[0] & num_in[2] & num_in[3]) |
							  (num_in[0] & ~num_in[1] & num_in[2] & ~num_in[3]) |
							  (~num_in[0] & num_in[1] & num_in[2]) |
							  (num_in[0] & num_in[1] & num_in[3]);
							  
	assign seg_out[2] = (~num_in[0] & num_in[1] & ~num_in[2] & ~num_in[3]) |
							  (~num_in[0] & num_in[2] & num_in[3]) |
							  (num_in[1] & num_in[2] & num_in[3]);
							  
	assign seg_out[3] = (~num_in[0] & num_in[1] & ~num_in[2] & num_in[3]) |
							  (num_in[0] & ~num_in[1] & ~num_in[2]) |
							  (num_in[0] & num_in[1] & num_in[2]) |
							  (~num_in[0] & ~num_in[1] & num_in[2] & ~num_in[3]);
							  
	assign seg_out[4] = (num_in[0] & ~num_in[1] & ~num_in[2]) |
							  (~num_in[1] & num_in[2] & ~num_in[3]) |
							  (num_in[0] & ~num_in[3]);
							  
	assign seg_out[5] = (num_in[1] & ~num_in[2] & ~num_in[3]) |
							  (num_in[0] & num_in[1] & ~num_in[3]) |
							  (num_in[0] & ~num_in[1] & num_in[2] & num_in[3]) |
							  (num_in[0] & ~num_in[2] & ~num_in[3]);
	
	assign seg_out[6] = (~num_in[1] & ~num_in[2] & ~num_in[3]) |
							  (~num_in[0] & ~num_in[1] & num_in[2] & num_in[3]) |
							  (num_in[0] & num_in[1] & num_in[2] & ~num_in[3]);
	assign seg_out[7] = 1'b1;
	
endmodule