`include "lab5.v"
module top6;

reg [4:0] read_addr1,read_addr2,write_addr;
//wire [31:0][15:0] register;
reg [15:0] write_data;
wire [15:0] read_data1,read_data2;
reg w_en;

register_1 r1(read_addr1,read_addr2,w_en,write_addr,write_data,read_data1,read_data2);
initial 
begin
#0 read_addr1=5'b00000;read_addr2=5'b00000;write_addr=5'b00010;w_en=1;write_data=16'd5;
#10 read_addr1=5'b00010;read_addr2=5'b00000;write_addr=5'b00011;w_en=1;write_data=16'd3;
#10 read_addr1=5'b00010;read_addr2=5'b00011;write_addr=5'b00111;w_en=1;write_data=16'd7;
//#10 read_addr1=5'b00010;read_addr2=5'b00011;write_addr=5'b00000;w_en=0;write_data=16'd10;
end
	
	initial $monitor($time," read_data1=%5b read_data2=%5b ",read_data1,read_data2);
endmodule

