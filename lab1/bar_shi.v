`include "2x1mux.v"

module bar_shif(s,i,op);

input [4:0]s;
input [10:0]i;

output [10:0]op;

wire [10:0]w1,w2,w3,w4;

mux21 m1(i[0],i[1],s[0],w1[0]); 					//s =1 then i1 is choosen
mux21 m2(i[1],i[2],s[0],w1[1]);
mux21 m3(i[2],i[3],s[0],w1[2]);
mux21 m4(i[3],i[4],s[0],w1[3]);
mux21 m5(i[4],i[5],s[0],w1[4]);
mux21 m6(i[5],i[6],s[0],w1[5]);
mux21 m7(i[6],i[7],s[0],w1[6]);
mux21 m8(i[7],i[8],s[0],w1[7]);
mux21 m9(i[8],i[9],s[0],w1[8]);
mux21 m0(i[9],i[10],s[0],w1[9]);
mux21 m01(i[10],1'b0,s[0],w1[10]);

mux21 m11(w1[0],w1[2],s[1],w2[0]);
mux21 m12(w1[1],w1[3],s[1],w2[1]);
mux21 m13(w1[2],w1[4],s[1],w2[2]);
mux21 m14(w1[3],w1[5],s[1],w2[3]);
mux21 m15(w1[4],w1[6],s[1],w2[4]);
mux21 m16(w1[5],w1[7],s[1],w2[5]);
mux21 m17(w1[6],w1[8],s[1],w2[6]);
mux21 m18(w1[7],w1[9],s[1],w2[7]);
mux21 m19(w1[8],w1[10],s[1],w2[8]);
mux21 m10(w1[9],1'b0,s[1],w2[9]);
mux21 m101(w1[10],1'b0,s[1],w2[10]);

mux21 m21(w2[0],w2[0],s[2],w3[0]);
mux21 m22(w2[1],w2[1],s[2],w3[1]);
mux21 m23(w2[2],w2[2],s[2],w3[2]);
mux21 m24(w2[3],w2[3],s[2],w3[3]);
mux21 m25(w2[4],w2[4],s[2],w3[4]);
mux21 m26(w2[5],w2[5],s[2],w3[5]);
mux21 m27(w2[6],w2[6],s[2],w3[6]);
mux21 m28(w2[7],1'b0,s[2],w3[7]);
mux21 m29(w2[8],1'b0,s[2],w3[8]);
mux21 m20(w2[9],1'b0,s[2],w3[9]);
mux21 m201(w2[10],1'b0,s[2],w3[10]);

mux21 m31(w3[0],w3[8],s[3],w4[0]);
mux21 m32(w3[1],w3[9],s[3],w4[1]);
mux21 m33(w3[2],w3[10],s[3],w4[2]);
mux21 m34(w3[3],1'b0,s[3],w4[3]);
mux21 m35(w3[4],1'b0,s[3],w4[4]);
mux21 m36(w3[5],1'b0,s[3],w4[5]);
mux21 m37(w3[6],1'b0,s[3],w4[6]);
mux21 m38(w3[7],1'b0,s[3],w4[7]);
mux21 m39(w3[8],1'b0,s[3],w4[8]);
mux21 m30(w3[9],1'b0,s[3],w4[9]);
mux21 m311(w3[10],1'b0,s[3],w4[10]);

mux21 m41(w4[0],1'b0,s[4],op[0]);
mux21 m42(w4[1],1'b0,s[4],op[1]);
mux21 m43(w4[2],1'b0,s[4],op[2]);
mux21 m44(w4[3],1'b0,s[4],op[3]);
mux21 m45(w4[4],1'b0,s[4],op[4]);
mux21 m46(w4[5],1'b0,s[4],op[5]);
mux21 m47(w4[6],1'b0,s[4],op[6]);
mux21 m48(w4[7],1'b0,s[4],op[7]);
mux21 m49(w4[8],1'b0,s[4],op[8]);
mux21 m40(w4[9],1'b0,s[4],op[9]);
mux21 m411(w4[10],1'b0,s[4],op[10]);

endmodule
