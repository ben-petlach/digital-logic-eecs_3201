// ClockDivider.v
// Divides a 25 MHz input clock down to a 1 Hz output clock
// For use with DE-10 Lite FPGA board

module ClockDivider (
    input  clock_in,   // 25 MHz input clock
    output clock_out   // 1 Hz output clock
);

    reg [23:0] counter;
    reg        clock_reg;

    // 25 MHz / 2 = 12,500,000 counts per half-period
    // Toggle every 12,500,000 cycles -> 1 Hz full period
    localparam HALF_PERIOD = 24'd12_500_000;

    always @(posedge clock_in) begin
        if (counter >= HALF_PERIOD - 1) begin
            counter   <= 24'd0;
            clock_reg <= ~clock_reg;
        end else begin
            counter <= counter + 24'd1;
        end
    end

    assign clock_out = clock_reg;

endmodule