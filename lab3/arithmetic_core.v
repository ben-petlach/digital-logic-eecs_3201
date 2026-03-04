module arithmetic_core (
    input [3:0] num1,
    input [3:0] num2,
    input op_select,
    output reg [3:0] result,
    output reg carry
);

    always @(*) begin
        if (op_select == 1'b0)
            {carry, result} = num1 + num2;
        else
            {carry, result} = num1 - num2;
    end

endmodule