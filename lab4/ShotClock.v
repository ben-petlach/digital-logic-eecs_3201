module ShotClock (
    input        CLOCK_50MHz,
    input        reset_btn,    
    input        pause_btn,   
    input        mode_sw,
    output [7:0] HEX0,         
    output [7:0] HEX1
);

    wire        clk_1hz;         
    wire        reset  = ~reset_btn;  
    wire        pause  = ~pause_btn;  

    reg         pause_prev;       
    reg         paused;           

    reg  [4:0]  count;            
    reg  [3:0]  ones, tens;       

    wire [4:0]  max_time = mode_sw ? 5'd30 : 5'd24;

    ClockDivider cd (
        .clock_in  (CLOCK_50MHz),
        .clock_out (clk_1hz)
    );

    always @(posedge CLOCK_50MHz) begin
        pause_prev <= pause;

        if (reset) begin
            paused <= 1'b0;
        end else if (pause && !pause_prev) begin
            paused <= ~paused;  
        end
    end

    always @(posedge clk_1hz) begin
        if (reset) begin
            count <= max_time;
        end else if (!paused && count > 5'd0) begin
            count <= count - 5'd1;
        end
    end

    always @(*) begin
        tens = count / 10;
        ones = count % 10;
    end

    seven_segment_driver u_ones (
        .num_in  (ones),
        .seg_out (HEX0)
    );

    seven_segment_driver u_tens (
        .num_in  (tens),
        .seg_out (HEX1)
    );

endmodule