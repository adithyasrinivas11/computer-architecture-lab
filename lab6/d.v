module dff(d,clk,reset,q);
input [15:0] d;
input clk, reset;
output [15:0]q;
reg q;

initial
q<= 16'd0;

always@(posedge clk or posedge reset)
	if(reset)
 		q <= 16'b0;
	else
		q <= d;

endmodule
