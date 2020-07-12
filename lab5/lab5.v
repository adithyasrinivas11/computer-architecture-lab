`include "d.v"
`include "decoder5x32.v"
`include "mux_32_1.v"

module register_1(read_addr1,read_addr2,w_en,write_addr,write_data,read_data1,read_data2);

wire [15:0] register[31:0];
input [4:0]read_addr1,read_addr2,write_addr;
input w_en;
input [15:0] write_data;
output [15:0] read_data1,read_data2;
wire [15:0] out11,out22;
wire [31:0] out1,out2;

/////////////////////////////////////////////////write//////////////////////////////////////////////////////////////////
decode d1(write_addr,out1);

assign out2[31:0]=out1 & {32{w_en}};


dff dd1(write_data, out2[0] & ~write_addr[0]& ~write_addr[1]& ~write_addr[2]& ~write_addr[3]& ~write_addr[4],reset,register[0]);
dff d2(write_data, out2[1] & write_addr[0]& ~write_addr[1]& ~write_addr[2]& ~write_addr[3]& ~write_addr[4],reset,register[1]);
dff d3(write_data, out2[2] & ~write_addr[0]& write_addr[1]& ~write_addr[2]& ~write_addr[3]& ~write_addr[4],reset,register[2]);
dff d4(write_data, out2[3] & write_addr[0]& write_addr[1]& ~write_addr[2]& ~write_addr[3]& ~write_addr[4],reset,register[3]);
dff d5(write_data, out2[4] & ~write_addr[0]& ~write_addr[1]& write_addr[2]& ~write_addr[3]& ~write_addr[4],reset,register[4]);
dff d6(write_data, out2[5] & write_addr[0]& ~write_addr[1]& write_addr[2]& ~write_addr[3]& ~write_addr[4],reset,register[5]);
dff d7(write_data, out2[6] & ~write_addr[0]& write_addr[1]& write_addr[2]& ~write_addr[3]& ~write_addr[4],reset,register[6]);
dff d8(write_data, out2[7] & write_addr[0]& write_addr[1]& write_addr[2]& ~write_addr[3]& ~write_addr[4],reset,register[7]);
dff d9(write_data, out2[8] & ~write_addr[0]& ~write_addr[1]& ~write_addr[2]& write_addr[3]& ~write_addr[4],reset,register[8]);
dff d10(write_data, out2[9] & write_addr[0]& ~write_addr[1]& ~write_addr[2]& write_addr[3]& ~write_addr[4],reset,register[9]);
dff d11(write_data, out2[10] & ~write_addr[0]& write_addr[1]& ~write_addr[2]& write_addr[3]& ~write_addr[4],reset,register[10]);
dff d12(write_data, out2[11] & write_addr[0]& write_addr[1]& ~write_addr[2]& write_addr[3]& ~write_addr[4],reset,register[11]);
dff d13(write_data, out2[12] & ~write_addr[0]& ~write_addr[1]& write_addr[2]& write_addr[3]& ~write_addr[4],reset,register[12]);
dff d14(write_data, out2[13] & write_addr[0]& ~write_addr[1]& write_addr[2]& write_addr[3]& ~write_addr[4],reset,register[13]);
dff d15(write_data, out2[14] & ~write_addr[0]& write_addr[1]& write_addr[2]& write_addr[3]& ~write_addr[4],reset,register[14]);
dff d16(write_data, out2[15] & write_addr[0]& write_addr[1]& write_addr[2]& write_addr[3]& ~write_addr[4],reset,register[15]);
dff d17(write_data, out2[16] & ~write_addr[0]& ~write_addr[1]& ~write_addr[2]& ~write_addr[3]& write_addr[4],reset,register[16]);
dff d18(write_data, out2[17] & write_addr[0]& ~write_addr[1]& ~write_addr[2]& ~write_addr[3]& write_addr[4],reset,register[17]);
dff d19(write_data, out2[18] & ~write_addr[0]& write_addr[1]& ~write_addr[2]& ~write_addr[3]& write_addr[4],reset,register[18]);
dff d20(write_data, out2[19] & write_addr[0]& write_addr[1]& ~write_addr[2]& ~write_addr[3]& write_addr[4],reset,register[19]);
dff d21(write_data, out2[20] & ~write_addr[0]& ~write_addr[1]& write_addr[2]& ~write_addr[3]& write_addr[4],reset,register[20]);
dff d22(write_data, out2[21] & write_addr[0]& ~write_addr[1]& write_addr[2]& ~write_addr[3]& write_addr[4],reset,register[21]);
dff d23(write_data, out2[22] & ~write_addr[0]& write_addr[1]& write_addr[2]& ~write_addr[3]& write_addr[4],reset,register[22]);
dff d24(write_data, out2[23] & write_addr[0]& write_addr[1]& write_addr[2]& ~write_addr[3]& write_addr[4],reset,register[23]);
dff d25(write_data, out2[24] & ~write_addr[0]& ~write_addr[1]& ~write_addr[2]& write_addr[3]& write_addr[4],reset,register[24]);
dff d26(write_data, out2[25] & write_addr[0]& ~write_addr[1]& ~write_addr[2]& write_addr[3]& write_addr[4],reset,register[25]);
dff d27(write_data, out2[26] & ~write_addr[0]& write_addr[1]& ~write_addr[2]& write_addr[3]& write_addr[4],reset,register[26]);
dff d28(write_data, out2[27] & write_addr[0]& write_addr[1]& ~write_addr[2]& write_addr[3]& write_addr[4],reset,register[27]);
dff d29(write_data, out2[28] & ~write_addr[0]& ~write_addr[1]& write_addr[2]& write_addr[3]& write_addr[4],reset,register[28]);
dff d30(write_data, out2[29] & write_addr[0]& ~write_addr[1]& write_addr[2]& write_addr[3]& write_addr[4],reset,register[29]);
dff d31(write_data, out2[30] & ~write_addr[0]& write_addr[1]& write_addr[2]& write_addr[3]& write_addr[4],reset,register[30]);
dff d32(write_data, out2[31] &write_addr[0]& write_addr[1]& write_addr[2]& write_addr[3]& write_addr[4],reset,register[31]);

//always @(*)
//begin
//	$display("reg[2] = %b  reg[3]=%b ",register[2],register[3]);
//end
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////read//////////////////////////////////////////////////////
mux_32x1 m11 (read_addr1,register[0],register[1],register[2],register[3],register[4],register[5],register[6],register[7],register[8],register[9],register[10],register[11],register[12],register[13],register[14],register[15],register[16],register[17],register[18],register[19],register[20],register[21],register[22],register[23],register[24],register[25],register[26],register[27],register[28],register[29],register[30],register[31],read_data1);
mux_32x1 m22 (read_addr2,register[0],register[1],register[2],register[3],register[4],register[5],register[6],register[7],register[8],register[9],register[10],register[11],register[12],register[13],register[14],register[15],register[16],register[17],register[18],register[19],register[20],register[21],register[22],register[23],register[24],register[25],register[26],register[27],register[28],register[29],register[30],register[31],read_data2);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
endmodule

