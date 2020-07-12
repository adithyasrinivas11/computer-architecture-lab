`include "16bit_FA.v"
module twos_comp(inp,out);
input [10:0]inp;
output [10:0]out;

wire [15:0]o1,o2;

wire sum;

assign o1[10:0]=~(inp[10:0]);
assign o1[15:11]=5'b00000;
sixteenbitadder s1(o1,1'b1,1'b0,o2,carry);

assign out[10:0]=o2[10:0];
endmodule
