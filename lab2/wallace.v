`include "HalfAdd.v"
`include "FullAdd.v"
`include "Partial.v"

module WallMul(A, B, prod);
	input [7:0] A,B;
	output [15:0] prod;

	wire [7:0] p0, p1, p2, p3, p4, p5, p6, p7;
	
	wire s110, s111, s112, s113, s114, s115, s116, s117, s118, s119;
	wire s123, s124, s125, s126, s127, s128, s129, s1210, s1211, s1212;

	wire s210, s211, s212, s213, s214, s215, s216, s217, s218, s219, s2110, s2111, s2112;
	wire s225, s226, s227, s228, s229, s2210, s2211, s2212, s2213, s2214;

	wire s30, s31, s32, s33, s34, s35, s36, s37, s38, s39, s310, s311, s312, s313, s314;

	wire s40, s41, s42, s43, s44, s45, s46, s47, s48, s49, s410, s411, s412, s413, s414;

	wire c111, c112, c113, c114, c115, c116, c117, c118, c119;
	wire c121, c122, c123, c124, c125, c126, c127, c128, c129;

	wire c212, c213, c214, c215, c216, c217, c218, c219, c2110, c2111;
	wire c225, c226, c227, c228, c229, c2210, c2211, c2212, c2213;

	wire c33, c34, c35, c36, c37, c38, c39, c310, c311, c312;

	wire c44, c45, c46, c47, c48, c49, c410, c411, c412, c413;

	wire t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15;

	partprod pa1(A, B[0], p0);
	partprod pa2(A, B[1], p1);
	partprod pa3(A, B[2], p2);
	partprod pa4(A, B[3], p3);
	partprod pa5(A, B[4], p4);
	partprod pa6(A, B[5], p5);
	partprod pa7(A, B[6], p6);
	partprod pa8(A, B[7], p7);

	//Stage 1 group 1:
	assign s110 = p0[0];
	HalfAdder ha111(p0[1],p1[0], s111, c111);
	FullAdder fa112(p0[2],p1[1], p2[0], s112, c112);
	FullAdder fa113(p0[3],p1[2], p2[1], s113, c113);
	FullAdder fa114(p0[4],p1[3], p2[2], s114, c114);
	FullAdder fa115(p0[5],p1[4], p2[3], s115, c115);
	FullAdder fa116(p0[6],p1[5], p2[4], s116, c116);
	FullAdder fa117(p0[7],p1[6], p2[5], s117, c117);
	HalfAdder ha118(p1[7], p2[6], s118, c118);
	assign s119 = p2[7];

	//Stage 1 group 2:
	assign s123 = p3[0];
	HalfAdder ha124(p3[1],p4[0], s124, c124);
	FullAdder fa125(p3[2],p4[1], p5[0], s125, c125);
	FullAdder fa126(p3[3],p4[2], p5[1], s126, c126);
	FullAdder fa127(p3[4],p4[3], p5[2], s127, c127);
	FullAdder fa128(p3[5],p4[4], p5[3], s128, c128);
	FullAdder fa129(p3[6],p4[5], p5[4], s129, c129);
	FullAdder fa1210(p3[7],p4[6], p5[5], s1210, c1210);
	HalfAdder ha1211(p4[7], p5[6], s1211, c1211);
	assign s1212 = p5[7];

	//Stage 2 group 1:
	assign s210 = s110;
	assign s211 = s111;
	HalfAdder ha212(s112, c111, s212, c212);
	FullAdder fa213(s113, c112, s123, s213, c213);
	FullAdder fa214(s114, c113, s124, s214, c214);
	FullAdder fa215(s115, c114, s125, s215, c215);
	FullAdder fa216(s116, c115, s126, s216, c216);
	FullAdder fa217(s117, c116, s127, s217, c217);
	FullAdder fa218(s118, c117, s128, s218, c218);
	FullAdder fa219(s119, c118, s129, s219, c219);
	assign s2110 = s1210;
	assign s2111 = s1211;
	assign s2112 = s1212;

	//Stage 2 group 2:
	assign s225 = c124;
	HalfAdder ha226(c125, p6[0], s226, c226);
	FullAdder fa227(c126, p6[1], p7[0], s227, c227);
	FullAdder fa228(c127, p6[2], p7[1], s228, c228);
	FullAdder fa229(c128, p6[3], p7[2], s229, c229);
	FullAdder fa2210(c129, p6[4], p7[3], s2210, c2210);
	FullAdder fa2211(c1210, p6[5], p7[4], s2211, c2211);
	FullAdder fa2212(c1211, p6[6], p7[5], s2212, c2212);
	HalfAdder ha2213(p6[7], p7[6], s2213, c2213);
	assign s2214 = p7[7];

	//Stage 3:
	assign s30 = s210;
	assign s31 = s211;
	assign s32 = s212;
	HalfAdder ha33(s213, c212, s33, c33);
	HalfAdder ha34(s214, c213, s34, c34);
	FullAdder fa35(s215, c214, s225, s35, c35);
	FullAdder fa36(s216, c215, s226, s36, c36);
	FullAdder fa37(s217, c216, s227, s37, c37);
	FullAdder fa38(s218, c217, s228, s38, c38);
	FullAdder fa39(s219, c218, s229, s39, c39);
	FullAdder fa310(s2110, c219, s2210, s310, c310);
	HalfAdder ha311(s2111, s2211, s311, c311);
	HalfAdder ha312(s2112, s2212, s312, c312);
	assign s313 = s2213;
	assign s314 = s2214;

	//Stage 4:
	assign s40 = s30;
	assign s41 = s31;
	assign s42 = s32;
	assign s43 = s33;
	HalfAdder ha44(s34, c33, s44, c44);
	HalfAdder ha45(s35, c34, s45, c45);
	HalfAdder ha46(s36, c35, s46, c46);
	FullAdder fa47(s37, c36, c226, s47, c47);
	FullAdder fa48(s38, c37, c227, s48, c48);
	FullAdder fa49(s39, c38, c228, s49, c49);
	FullAdder fa410(s310, c39, c229, s410, c410);
	FullAdder fa411(s311, c310, c2210, s411, c411);
	FullAdder fa412(s312, c311, c2211, s412, c412);
	FullAdder fa413(s313, c312, c2212, s413, c413);
	HalfAdder ha414(s314, c2213, s414, c414);

	//Final Step:

	assign prod[0]=s40;
	assign prod[1]=s41;
	assign prod[2]=s42;
	assign prod[3]=s43;
	assign prod[4]=s44;

	HalfAdder o5(s45, c44, prod[5], t5);
	FullAdder o6(s46, c45, t5, prod[6], t6);
	FullAdder o7(s47, c46, t6, prod[7], t7);
	FullAdder o8(s48, c47, t7, prod[8], t8);
	FullAdder o9(s49, c48, t8, prod[9], t9);
	FullAdder o10(s410, c49, t9, prod[10], t10);
	FullAdder o11(s411, c410, t10, prod[11], t11);
	FullAdder o12(s412, c411, t11, prod[12], t12);
	FullAdder o13(s413, c412, t12, prod[13], t13);
	FullAdder o14(s414, c413, t13, prod[14], t14);
	HalfAdder o15(c414, t14, prod[15], t15);

endmodule
