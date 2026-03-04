module lab3 (
	input [9:0]		SW, // x, a0_3, a0_2, a0_1, a0_0, +/-, a1_3, a1_2, a1_1, a1_0
	output [7:0] 	HEX5, HEX3, HEX2, HEX0, //a0, a1, f-mag
	output reg [7:0] HEX4, HEX1 // +/-, =, f-sign
);

	wire [3:0] a0, a1, f;
	wire c_out;
	wire [7:0] hex5, hex3, hex0;

	assign a0 = SW[8:5];
	assign a1 = SW[3:0];

	seven_segment_driver U0 (
		.num_in(a0),
		.seg_out(hex5)
	);

	seven_segment_driver U1 (
		.num_in(a1),
		.seg_out(hex3)
	);

	seven_segment_driver U2 (
		.num_in(f),
		.seg_out(hex0)
	);

	arithmetic_core U3 (
		.num1(a0),
		.num2(a1),
		.op_select(SW[4]),
		.result(f),
		.carry(c_out)
	);

	assign HEX5 = hex5;
	assign HEX3 = hex3;
	assign HEX2 = 8'b11101101;
	assign HEX0 = hex0;

	always @(*) begin
		HEX4 = (SW[4] == 1'b0) ? 8'b11110001 : 8'b11111101;
		HEX1 = 8'b11111111; //Temp value
	end
	
endmodule