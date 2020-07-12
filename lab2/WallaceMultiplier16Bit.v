//`include "FullAdder.v"
`include "FullAdder32Bit.v"
`include "WallaceMultiplier8Bit.v"

module WallaceMultiplier16Bit (a,b,product);
input [16:1] a,b;
output wire [32:1] product;

wire [32:1] intermediate_1, intermediate_2, intermediate_3, intermediate_4;

wire [2:0] carry;
wire [32:1] intermediate_sum_1, intermediate_sum_2;


WallaceMultiplier8Bit wa_1(a[8:1], b[8:1], intermediate_1[16:1]);
assign intermediate_1[32:17]=16'b0000000000000000;
WallaceMultiplier8Bit wa_2(a[16:9], b[8:1], intermediate_2[24:9]);
assign intermediate_2[32:25]=8'b00000000;
assign intermediate_2[8:1]=8'b00000000;
WallaceMultiplier8Bit wa_3(a[8:1], b[16:9], intermediate_3[24:9]);
assign intermediate_3[32:25]=8'b00000000;
assign intermediate_3[8:1]=8'b00000000;
WallaceMultiplier8Bit wa_4(a[16:9], b[16:9], intermediate_4[32:17]);
assign intermediate_4[16:1]=16'b0000000000000000;


FullAdder32Bit fa_1(intermediate_1,intermediate_2,1'b0,intermediate_sum_1,carry[0]);
FullAdder32Bit fa_2(intermediate_3,intermediate_4,1'b0,intermediate_sum_2,carry[1]);
FullAdder32Bit fa_3(intermediate_sum_1,intermediate_sum_2,1'b0,product,carry[2]);


endmodule
