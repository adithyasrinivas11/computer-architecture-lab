`include "mux2.v"

module barelshift (s0,s1,s2,s3,s4,inp,outp);
	input s0,s1,s2,s3,s4;
	input [10:0] inp;
	output [10:0] outp;
	wire [10:0] w1,w2,w3,w4;

mux_2_1_1 m1(s0,1'b0,inp[0],w1[0]);
mux_2_1_1 m11(s0,inp[0],inp[1],w1[1]);
mux_2_1_1 m12(s0,inp[1],inp[2],w1[2]);
mux_2_1_1 m13(s0,inp[2],inp[3],w1[3]);
mux_2_1_1 m14(s0,inp[3],inp[4],w1[4]);
mux_2_1_1 m15(s0,inp[4],inp[5],w1[5]);
mux_2_1_1 m16(s0,inp[5],inp[6],w1[6]);
mux_2_1_1 m17(s0,inp[6],inp[7],w1[7]);
mux_2_1_1 m18(s0,inp[7],inp[8],w1[8]);
mux_2_1_1 m19(s0,inp[8],inp[9],w1[9]);
mux_2_1_1 m191(s0,inp[9],inp[10],w1[10]);


mux_2_1_1 m20(s1,1'b0,w1[0],w2[0]);
mux_2_1_1 m21(s1,1'b0,w1[1],w2[1]);
mux_2_1_1 m22(s1,w1[0],w1[2],w2[2]);
mux_2_1_1 m23(s1,w1[1],w1[3],w2[3]);
mux_2_1_1 m24(s1,w1[2],w1[4],w2[4]);
mux_2_1_1 m25(s1,w1[3],w1[5],w2[5]);
mux_2_1_1 m26(s1,w1[4],w1[6],w2[6]);
mux_2_1_1 m27(s1,w1[5],w1[7],w2[7]);
mux_2_1_1 m28(s1,w1[6],w1[8],w2[8]);
mux_2_1_1 m29(s1,w1[7],w1[9],w2[9]);
mux_2_1_1 m291(s1,w1[8],w1[10],w2[10]);

mux_2_1_1 m40(s2,1'b0,w2[0],w3[0]);
mux_2_1_1 m41(s2,0,w2[1],w3[1]);
mux_2_1_1 m42(s2,0,w2[2],w3[2]);
mux_2_1_1 m43(s2,0,w2[3],w3[3]);
mux_2_1_1 m44(s2,w2[0],w2[4],w3[4]);
mux_2_1_1 m45(s2,w2[1],w2[5],w3[5]);
mux_2_1_1 m46(s2,w2[2],w2[6],w3[6]);
mux_2_1_1 m47(s2,w2[3],w2[7],w3[7]);
mux_2_1_1 m48(s2,w2[4],w2[8],w3[8]);
mux_2_1_1 m49(s2,w2[5],w2[9],w3[9]);
mux_2_1_1 m491(s2,w2[6],w2[10],w3[10]);


mux_2_1_1 m80(s3,0,w3[0],w4[0]);
mux_2_1_1 m81(s3,0,w3[1],w4[1]);
mux_2_1_1 m82(s3,0,w3[2],w4[2]);
mux_2_1_1 m83(s3,0,w3[3],w4[3]);
mux_2_1_1 m84(s3,0,w3[4],w4[4]);
mux_2_1_1 m85(s3,0,w3[5],w4[5]);
mux_2_1_1 m86(s3,0,w3[6],w4[6]);
mux_2_1_1 m87(s3,0,w3[7],w4[7]);
mux_2_1_1 m88(s3,w3[0],w3[8],w4[8]);
mux_2_1_1 m89(s3,w3[1],w3[9],w4[9]);
mux_2_1_1 m891(s3,w3[2],w3[10],w4[10]);



mux_2_1_1 m160(s4,0,w4[0],outp[0]);
mux_2_1_1 m161(s4,0,w4[1],outp[1]);
mux_2_1_1 m162(s4,0,w4[2],outp[2]);
mux_2_1_1 m163(s4,0,w4[3],outp[3]);
mux_2_1_1 m164(s4,0,w4[4],outp[4]);
mux_2_1_1 m165(s4,0,w4[5],outp[5]);
mux_2_1_1 m166(s4,0,w4[6],outp[6]);
mux_2_1_1 m167(s4,0,w4[7],outp[7]);
mux_2_1_1 m168(s4,0,w4[8],outp[8]);
mux_2_1_1 m169(s4,0,w4[9],outp[9]);
mux_2_1_1 m1691(s4,0,w4[10],outp[10]);




endmodule