`timescale 1ns / 1ps

module test2_tb();
    reg tb_clk;
    reg tb_a;
    wire [3:0] tb_r;

    test2 DUT (
        .clk(tb_clk),
        .a(tb_a),
        .r(tb_r)
    );

    always #10 tb_clk = ~tb_clk;

    always @(tb_r) begin
        if (tb_r == 4'b0000) begin
            $display("All outputs are zero at time = %0t nanoseconds", $time);
        end
    end

    initial begin
        tb_clk = 0;
        tb_a = 0;

        #100;

        tb_a = 1;

        #200;

        tb_a = 0;

        #100;

        $stop;
    end
endmodule