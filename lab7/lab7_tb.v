`include "lab7.v"

module top111;
reg [14:0]i_address;
reg i_en,clk;
reg [15:0] i_wdata;

reg [14:0] d_raddress,d_waddress;
reg [15:0] d_wdata;

wire reg [15:0] i_routput,d_routput;

cache c111(i_address,i_en,i_wdata,i_routput,d_raddress,d_waddress,d_wdata,clk,d_routput);

initial 
	begin
		clk =0;	
end
//pc	=16'b0;


always 
#25  clk =  ! clk; 

initial 
	begin
	#50 i_en=1'b1;i_address =15'd0;i_wdata=16'd11;
	
	#50 i_en=1'b1;i_address =15'd1;i_wdata=16'd21;
	
	#50 i_en=1'b1;i_address =15'd2;i_wdata=16'd31;
	
	#50 i_en=1'b1;i_address =15'd3;i_wdata=16'd51;
	
	#50 i_en=1'b1;i_address =15'd4;i_wdata=16'd61;
	
	#50 i_en=1'b1;i_address =15'd5;i_wdata=16'd71;
	
	#50 i_en=1'b1;i_address =15'd6;i_wdata=16'd81;
	
	#50 i_en=1'b1;i_address =15'd7;i_wdata=16'd91;
	
	#50 i_en=1'b0;i_address =15'd5;		//cache read
	
	#50 i_en=1'b1;i_address =15'd22;i_wdata=16'd77;
	
	#50 i_en=1'b1;i_address =15'b010000000000001;i_wdata=16'd27;
	
	#50 i_en=1'b0;i_address =15'd22;
	
	#50 i_en=1'b0;i_address =15'd2;
	
	#750
	$finish;
end

//data cache

initial 
	begin
	#50 d_raddress=15'd8;d_waddress=15'd8;d_wdata=16'd100;
	
	#50 d_raddress=15'd8;d_waddress=15'd9;d_wdata=16'd1200;
	
	#50 d_raddress=15'd8;d_waddress=15'd10;d_wdata=16'd700;
	
	#50 d_raddress=15'd10;d_waddress=15'd11;d_wdata=16'd123;
	
	#50 d_raddress=15'd11;d_waddress=15'd12;d_wdata=16'd333;
	
	#50 d_raddress=15'd13;d_waddress=15'd13;d_wdata=16'd212;
	
	#50 d_raddress=15'd12;d_waddress=15'd14;d_wdata=16'd666;
	
	#50 d_raddress=15'd11;d_waddress=15'd15;d_wdata=16'd1000;
	
	#50 d_raddress=15'd8;d_waddress=15'b010000000001001;d_wdata=16'd77;
	
	#450
	$finish;
end

	always @(*)
		begin
		$monitor("i_en=%b,i_address= %d,i_wdata=%d,i_routput=%d,d_raddress=%d,d_waddress=%d,d_wdata=%d,d_routput=%d ",i_en,i_address,i_wdata,i_routput,d_raddress,d_waddress,d_wdata,d_routput);
	end

endmodule
