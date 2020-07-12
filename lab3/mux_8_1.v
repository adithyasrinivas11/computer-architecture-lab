`include "mux.v"
module mux_81(sel,inp1,inp2,inp3,inp4,inp5,inp6,inp7,inp8,out);

input [15:0]inp1,inp2,inp3,inp4,inp5,inp6,inp7,inp8;
input [2:0] sel;
wire [15:0] out1,out2,out3,out4,out5,out6,out7,out8;
output [15:0] out;

mux_2 xx1(inp1,inp2,sel[0],out1);
mux_2 xx2(inp3,inp4,sel[0],out2);
mux_2 xx3(inp5,inp6,sel[0],out3);
mux_2 xx4(inp7,inp8,sel[0],out4);

mux_2 xx14(out1,out2,sel[1],out5);
mux_2 xx15(out3,out4,sel[1],out6);

mux_2 xx20(out5,out6,sel[2],out);

endmodule


