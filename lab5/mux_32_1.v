`include "mux.v"
module mux_32x1(sel,inp1,inp2,inp3,inp4,inp5,inp6,inp7,inp8,inp9,inp10,inp11,inp12,inp13,inp14,inp15,inp16,inp17,inp18,inp19,inp20,inp21,inp22,inp23,inp24,inp25,inp26,inp27,inp28,inp29,inp30,inp31,inp32,out);

input [15:0] inp1,inp2,inp3,inp4,inp5,inp6,inp7,inp8,inp9,inp10,inp11,inp12,inp13,inp14,inp15,inp16,inp17,inp18,inp19,inp20,inp21,inp22,inp23,inp24,inp25,inp26,inp27,inp28,inp29,inp30,inp31,inp32;
input [4:0] sel;
wire [15:0] out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15,out16,out17,out18,out19,out20,out21,out22,out23,out24,out25,out26,out27,out28,out29,out30,out31;
output [15:0] out;

mux_2 xx1(inp1,inp2,sel[0],out1);
mux_2 xx2(inp3,inp4,sel[0],out2);
mux_2 xx3(inp5,inp6,sel[0],out3);
mux_2 xx4(inp7,inp8,sel[0],out4);
mux_2 xx11(inp9,inp10,sel[0],out5);
mux_2 xx12(inp11,inp12,sel[0],out6);
mux_2 xx13(inp13,inp14,sel[0],out7);
mux_2 xx14(inp15,inp16,sel[0],out8);
mux_2 xx111(inp17,inp18,sel[0],out9);
mux_2 xx212(inp19,inp20,sel[0],out10);
mux_2 xx32(inp21,inp22,sel[0],out11);
mux_2 xx42(inp23,inp24,sel[0],out12);
mux_2 xx13q(inp25,inp26,sel[0],out13);
mux_2 xx23(inp27,inp28,sel[0],out14);
mux_2 xx33(inp29,inp30,sel[0],out15);
mux_2 xx43(inp31,inp32,sel[0],out16);



mux_2 xx124(out1,out2,sel[1],out17);
mux_2 xx125(out3,out4,sel[1],out18);
mux_2 axx124(out5,out6,sel[1],out19);
mux_2 xx1235(out7,out8,sel[1],out20);
mux_2 xx134(out9,out10,sel[1],out21);
mux_2 xx15z(out11,out12,sel[1],out22);
mux_2 xx14z(out13,out14,sel[1],out23);
mux_2 xx15zg(out15,out16,sel[1],out24);

mux_2 xxq124(out17,out18,sel[2],out25);
mux_2 xxq125(out19,out20,sel[2],out26);
mux_2 x124(out21,out22,sel[2],out27);
mux_2 xxq1235(out23,out24,sel[2],out28);

mux_2 xxe124(out25,out26,sel[3],out29);
mux_2 xxe125(out27,out28,sel[3],out30);

mux_2 xxwwe124(out29,out30,sel[4],out31);

assign out[15:0]=out31;
endmodule


