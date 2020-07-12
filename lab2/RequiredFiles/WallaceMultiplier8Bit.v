`include "FullAdder.v"
`include "HalfAdder.v"
`include "FullAdder16Bit.v"

module WallaceMultiplier8Bit (a,b,product);
input [8:1] a,b;
output wire [16:1] product;

wire [8:1] p1,p2,p3,p4,p5,p6,p7,p8;

wire [16:1] sum_1,sum_2,sum_3,sum_4,sum_5,sum_6;
wire [16:1] carry_1,carry_2,carry_3,carry_4,carry_5,carry_6;

wire [16:1] final_a,final_b;
wire cin,carry;



assign p1 = a & {8{b[1]}};
assign p2 = a & {8{b[2]}};
assign p3 = a & {8{b[3]}};
assign p4 = a & {8{b[4]}};
assign p5 = a & {8{b[5]}};
assign p6 = a & {8{b[6]}};
assign p7 = a & {8{b[7]}};
assign p8 = a & {8{b[8]}};


//set 1
assign sum_1[1]=p1[1];
HalfAdder ha_1(p1[2],p2[1],sum_1[2],carry_1[1]);
FullAdder fa_1(p1[3],p2[2],p3[1],sum_1[3],carry_1[2]);
FullAdder fa_2(p1[4],p2[3],p3[2],sum_1[4],carry_1[3]);
FullAdder fa_3(p1[5],p2[4],p3[3],sum_1[5],carry_1[4]);
FullAdder fa_4(p1[6],p2[5],p3[4],sum_1[6],carry_1[5]);
FullAdder fa_5(p1[7],p2[6],p3[5],sum_1[7],carry_1[6]);
FullAdder fa_6(p1[8],p2[7],p3[6],sum_1[8],carry_1[7]);
HalfAdder ha_2(p2[8],p3[7],sum_1[9],carry_1[8]);
assign sum_1[10]=p3[8];

assign sum_2[1]=p4[1];
HalfAdder ha_3(p4[2],p5[1],sum_2[2],carry_2[1]);
FullAdder fa_7(p4[3],p5[2],p6[1],sum_2[3],carry_2[2]);
FullAdder fa_8(p4[4],p5[3],p6[2],sum_2[4],carry_2[3]);
FullAdder fa_9(p4[5],p5[4],p6[3],sum_2[5],carry_2[4]);
FullAdder fa_10(p4[6],p5[5],p6[4],sum_2[6],carry_2[5]);
FullAdder fa_11(p4[7],p5[6],p6[5],sum_2[7],carry_2[6]);
FullAdder fa_12(p4[8],p5[7],p6[6],sum_2[8],carry_2[7]);
HalfAdder ha_4(p5[8],p6[7],sum_2[9],carry_2[8]);
assign sum_2[10]=p6[8];


//set 2
assign sum_3[1]=sum_1[1];
assign sum_3[2]=sum_1[2];
HalfAdder ha_5(sum_1[3],carry_1[1],sum_3[3],carry_3[1]);
FullAdder fa_13(sum_1[4],carry_1[2],sum_2[1],sum_3[4],carry_3[2]);
FullAdder fa_14(sum_1[5],carry_1[3],sum_2[2],sum_3[5],carry_3[3]);
FullAdder fa_15(sum_1[6],carry_1[4],sum_2[3],sum_3[6],carry_3[4]);
FullAdder fa_16(sum_1[7],carry_1[5],sum_2[4],sum_3[7],carry_3[5]);
FullAdder fa_17(sum_1[8],carry_1[6],sum_2[5],sum_3[8],carry_3[6]);
FullAdder fa_18(sum_1[9],carry_1[7],sum_2[6],sum_3[9],carry_3[7]);
FullAdder fa_19(sum_1[10],carry_1[8],sum_2[7],sum_3[10],carry_3[8]);
assign sum_3[11]=sum_2[8];
assign sum_3[12]=sum_2[9];
assign sum_3[13]=sum_2[10];

assign sum_4[1]=carry_2[1];
HalfAdder ha_6(carry_2[2],p7[1],sum_4[2],carry_4[1]);
FullAdder fa_20(carry_2[3],p7[2],p8[1],sum_4[3],carry_4[2]);
FullAdder fa_21(carry_2[4],p7[3],p8[2],sum_4[4],carry_4[3]);
FullAdder fa_22(carry_2[5],p7[4],p8[3],sum_4[5],carry_4[4]);
FullAdder fa_23(carry_2[6],p7[5],p8[4],sum_4[6],carry_4[5]);
FullAdder fa_24(carry_2[7],p7[6],p8[5],sum_4[7],carry_4[6]);
FullAdder fa_25(carry_2[8],p7[7],p8[6],sum_4[8],carry_4[7]);
HalfAdder ha_7(p7[8],p8[7],sum_4[9],carry_4[8]);
assign sum_4[10]=p8[8];


//set 3
assign sum_5[1]=sum_3[1];
assign sum_5[2]=sum_3[2];
assign sum_5[3]=sum_3[3];
HalfAdder ha_8(sum_3[4],carry_3[1],sum_5[4],carry_5[1]);
HalfAdder ha_9(sum_3[5],carry_3[2],sum_5[5],carry_5[2]);
FullAdder fa_26(sum_3[6],carry_3[3],sum_4[1],sum_5[6],carry_5[3]);
FullAdder fa_27(sum_3[7],carry_3[4],sum_4[2],sum_5[7],carry_5[4]);
FullAdder fa_28(sum_3[8],carry_3[5],sum_4[3],sum_5[8],carry_5[5]);
FullAdder fa_29(sum_3[9],carry_3[6],sum_4[4],sum_5[9],carry_5[6]);
FullAdder fa_30(sum_3[10],carry_3[7],sum_4[5],sum_5[10],carry_5[7]);
FullAdder fa_31(sum_3[11],carry_3[8],sum_4[6],sum_5[11],carry_5[8]);
HalfAdder ha_10(sum_3[12],sum_4[7],sum_5[12],carry_5[9]);
HalfAdder ha_11(sum_3[13],sum_4[8],sum_5[13],carry_5[10]);
assign sum_5[14]=sum_4[9];
assign sum_5[15]=sum_4[10];


//set 4
assign sum_6[1]=sum_5[1];
assign sum_6[2]=sum_5[2];
assign sum_6[3]=sum_5[3];
assign sum_6[4]=sum_5[4];
HalfAdder ha_12(sum_5[5],carry_5[1],sum_6[5],carry_6[1]);
HalfAdder ha_13(sum_5[6],carry_5[2],sum_6[6],carry_6[2]);
HalfAdder ha_14(sum_5[7],carry_5[3],sum_6[7],carry_6[3]);
FullAdder fa_32(sum_5[8],carry_5[4],carry_4[1],sum_6[8],carry_6[4]);
FullAdder fa_33(sum_5[9],carry_5[5],carry_4[2],sum_6[9],carry_6[5]);
FullAdder fa_34(sum_5[10],carry_5[6],carry_4[3],sum_6[10],carry_6[6]);
FullAdder fa_35(sum_5[11],carry_5[7],carry_4[4],sum_6[11],carry_6[7]);
FullAdder fa_36(sum_5[12],carry_5[8],carry_4[5],sum_6[12],carry_6[8]);
FullAdder fa_37(sum_5[13],carry_5[9],carry_4[6],sum_6[13],carry_6[9]);
FullAdder fa_38(sum_5[14],carry_5[10],carry_4[7],sum_6[14],carry_6[10]);
HalfAdder ha_15(sum_5[15],carry_4[8],sum_6[15],carry_6[11]);

//final_a
assign final_a[15:1]=sum_6[15:1];
assign final_a[16]=1'b0;

//final_b
assign final_b[1]=1'b0;
assign final_b[2]=1'b0;
assign final_b[3]=1'b0;
assign final_b[4]=1'b0;
assign final_b[5]=1'b0;
assign final_b[16:6]=carry_6[11:1];

assign cin=1'b0;
FullAdder16Bit fa16(final_a,final_b,cin,product,carry);



endmodule
