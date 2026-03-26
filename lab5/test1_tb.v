`timescale 1ns/1ps

module test1_tb();
    reg tb_a, tb_b, tb_c;
    wire tb_x, tb_y;

    test1 DUT(
        .a(tb_a),
        .b(tb_b),
        .c(tb_c),
        .x(tb_x),
        .y(tb_y)
    );

    always @(tb_x, tb_y) begin
        if (tb_x == 0 && tb_y == 0) begin
            $display("All outputs are zero at time = %0t nanoseconds", $time);
        end
    end

    initial begin
        tb_a = 0;
        tb_b = 0;
        tb_c = 0;

        #20;
        tb_a = 0;
        tb_b = 0;
        tb_c = 1;

        #20;
        tb_a = 0;
        tb_b = 1;
        tb_c = 0;

        #20;
        tb_a = 0;
        tb_b = 1;
        tb_c = 1;

        #20;
        tb_a = 1;
        tb_b = 0;
        tb_c = 0;

        #20;
        tb_a = 1;
        tb_b = 0;
        tb_c = 1;

        #20;
        tb_a = 1;
        tb_b = 1;
        tb_c = 0;

        #20;
        tb_a = 1;
        tb_b = 1;
        tb_c = 1;

        $stop;
    end

endmodule