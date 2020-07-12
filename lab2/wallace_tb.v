`include "Wallace.v"

module top;
	reg [7:0] A,B;
	wire [15:0] prod;

	WallMul wm(A,B,prod);
	initial
		begin
			A[7:0]=8'd100; B[7:0]=8'd33;
			#10 A[7:0]=8'b11111111; B[7:0]=8'b11111111;
			
		end

	initial
		begin

			$monitor($time, ": A=%d, B=%d, Prod=%d", A,B,prod);
			$dumpfile("Wallace.vcd");
			$dumpvars;
		end

endmodule
