`include "16bit_FA.v"
module twos_comp(inp,out);
input [15:0]inp;
output [15:0]out;

wire [15:0]o1;

wire sum;

assign o1[15:0]=~(inp[15:0]);

sixteenbitadder s1(o1,16'd1,1'b0,out,carry);


endmodule
