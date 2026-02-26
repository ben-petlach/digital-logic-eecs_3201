//Ben Petlach
//# 220938080
//Last 4 digits: 8080, minterms: 0, 8

module lab(x0, x1, x2, x3, f);
	input x0, x1, x2, x3;
	output f;

	assign f = ~x0 & ~x1 & ~x2;
endmodule
