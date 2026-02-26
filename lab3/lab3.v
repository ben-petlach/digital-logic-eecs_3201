module lab3 (
	input [8:0] SW,
	output [7:0] DISP
);

	reg [3:0] num_to_display;
	wire [7:0] driver_segments;
	
	seven_segment_driver U0 (
		.num_in(num_to_display),
		.seg_out(driver_segments),
	);
	
	always @(*) begin
		if			(SW[0]) num_to_display = 4'd1;
		else if	(SW[1]) num_to_display = 4'd2;
		else if	(SW[2]) num_to_display = 4'd3;
		else if	(SW[3]) num_to_display = 4'd4;
		else if	(SW[4]) num_to_display = 4'd5;
		else if	(SW[5]) num_to_display = 4'd6;
		else if	(SW[6]) num_to_display = 4'd7;
		else if	(SW[7]) num_to_display = 4'd8;
		else if	(SW[8]) num_to_display = 4'd9;
		else				  num_to_display = 4'd0;
	end
		
	assign DISP = (SW == 9'd0) ? 8'b11111111 : driver_segments;
	
endmodule