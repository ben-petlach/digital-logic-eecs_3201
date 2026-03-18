// ClockDivider.v
// Divides a 50 MHz input clock down to a 1 Hz output clock
// For use with DE-10 Lite FPGA board (MAX10_CLK1_50 - PIN_P11)

module ClockDivider (
    input  clock_in,   // 50 MHz input clock
    output clock_out   // 1 Hz output clock
);

    reg [25:0] counter;
    reg        clock_reg;

    // 50 MHz / 2 = 25,000,000 counts per half-period
    // Toggle every 25,000,000 cycles -> 1 Hz full period
    localparam HALF_PERIOD = 26'd25_000_000;

    always @(posedge clock_in) begin
        if (counter >= HALF_PERIOD - 1) begin
            counter   <= 26'd0;
            clock_reg <= ~clock_reg;
        end else begin
            counter <= counter + 26'd1;
        end
    end

    assign clock_out = clock_reg;

endmodule