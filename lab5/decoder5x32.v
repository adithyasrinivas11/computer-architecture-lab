module decode(addr,out);
input [4:0]addr;
output [31:0] out;

assign out[0]= ~addr[0]& ~addr[1]& ~addr[2]& ~addr[3]& ~addr[4];
assign out[1]= addr[0]& ~addr[1]& ~addr[2]& ~addr[3]& ~addr[4];
assign out[2]= ~addr[0]& addr[1]& ~addr[2]& ~addr[3]& ~addr[4];
assign out[3]= addr[0]& addr[1]& ~addr[2]& ~addr[3]& ~addr[4];
assign out[4]= ~addr[0]& ~addr[1]& addr[2]& ~addr[3]& ~addr[4];
assign out[5]= addr[0]& ~addr[1]& addr[2]& ~addr[3]& ~addr[4];
assign out[6]= ~addr[0]& addr[1]& addr[2]& ~addr[3]& ~addr[4];
assign out[7]= addr[0]& addr[1]& addr[2]& ~addr[3]& ~addr[4];

assign out[8]= ~addr[0]& ~addr[1]& ~addr[2]& addr[3]& ~addr[4];
assign out[9]= addr[0]& ~addr[1]& ~addr[2]& addr[3]& ~addr[4];
assign out[10]= ~addr[0]& addr[1]& ~addr[2]& addr[3]& ~addr[4];
assign out[11]= addr[0]& addr[1]& ~addr[2]& addr[3]& ~addr[4];
assign out[12]= ~addr[0]& ~addr[1]& addr[2]& addr[3]& ~addr[4];
assign out[13]= addr[0]& ~addr[1]& addr[2]& addr[3]& ~addr[4];
assign out[14]= ~addr[0]& addr[1]& addr[2]& addr[3]& ~addr[4];
assign out[15]= addr[0]& addr[1]& addr[2]& addr[3]& ~addr[4];

assign out[16]= ~addr[0]& ~addr[1]& ~addr[2]& ~addr[3]& addr[4];
assign out[17]= addr[0]& ~addr[1]& ~addr[2]& ~addr[3]& addr[4];
assign out[18]= ~addr[0]& addr[1]& ~addr[2]& ~addr[3]& addr[4];
assign out[19]= addr[0]& addr[1]& ~addr[2]& ~addr[3]& addr[4];
assign out[20]= ~addr[0]& ~addr[1]& addr[2]& ~addr[3]& addr[4];
assign out[21]= addr[0]& ~addr[1]& addr[2]& ~addr[3]& addr[4];
assign out[22]= ~addr[0]& addr[1]& addr[2]& ~addr[3]& addr[4];
assign out[23]= addr[0]& addr[1]& addr[2]& ~addr[3]& addr[4];

assign out[24]= ~addr[0]& ~addr[1]& ~addr[2]& addr[3]& addr[4];
assign out[25]= addr[0]& ~addr[1]& ~addr[2]& addr[3]& addr[4];
assign out[26]= ~addr[0]& addr[1]& ~addr[2]& addr[3]& addr[4];
assign out[27]= addr[0]& addr[1]& ~addr[2]& addr[3]& addr[4];
assign out[28]= ~addr[0]& ~addr[1]& addr[2]& addr[3]& addr[4];
assign out[29]= addr[0]& ~addr[1]& addr[2]& addr[3]& addr[4];
assign out[30]= ~addr[0]& addr[1]& addr[2]& addr[3]& addr[4];
assign out[31]= addr[0]& addr[1]& addr[2]& addr[3]& addr[4];

endmodule
