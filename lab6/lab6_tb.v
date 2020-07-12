`include "lab6.v"
module top7;

wire [15:0] pc;
wire [15:0] instruction_reg;
reg clk,reset;
instruction_Fetch i1(pc,instruction_reg,clk,reset);

initial 
begin
reset=1;
clk =0;
//pc=16'b0;
end

always 
#5  clk =  ! clk; 

initial 
begin
#1 reset=0;
end

//#10 read_addr1=5'b00010;read_addr2=5'b00011;write_addr=5'b00000;w_en=0;write_data=16'd10;


always @(*)
		$monitor($time," pc=%5b instruction_reg=%5b ",pc,instruction_reg);
	
initial
	#100 $finish;
endmodule

