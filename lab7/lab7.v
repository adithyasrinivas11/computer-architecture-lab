//f


module cache(i_address,i_en,i_wdata,i_routput,d_raddress,d_waddress,d_wdata,clk,d_routput);

input [14:0] i_address;
input i_en,clk;
input [15:0] i_wdata;

input [14:0]d_raddress,d_waddress;
input [15:0] d_wdata;

output reg [15:0] i_routput,d_routput;

reg [1023:0] i_cache [0:15] ;
reg [1:0] i_tag [1023:0];
reg [1023:0] i_valid,i_dirty;

reg [2047:0] d_cache [15:0];
reg  d_tag [2047:0];
reg [2048:0] d_valid,d_dirty;

reg [4095:0] mm [15:0];
integer i;

initial begin
	for(i=0;i<2048;i=i+1) begin
		i_valid[i]<=0;
		i_dirty[i]=0;
	end
end

initial begin
	for(i=0;i<1024;i=i+1) begin	
		d_valid[i]<=0;
		d_dirty[i]=0;
	end
end

initial begin
	for(i=0;i<1024;i=i+1) begin	
		i_tag[i]<=0;
	end
end
initial begin
	for(i=0;i<2048;i=i+1) begin	
		d_tag[i]<=0;
	end
end

always @(posedge clk) 
	begin
	if(i_address[14:13]== i_tag[i_address[12:3]] && (i_en== 1'b1) && (i_dirty[i_address[12:3]]==1'b0)) begin	//inst write
	
	//$display("imhere 55");
	
	if(i_address[2:0]==3'b000)
		i_cache[i_address[12:3]][15:0]=i_wdata;
	if(i_address[2:0]==3'b001)
		i_cache[i_address[12:3]][31:16]=i_wdata;
	if(i_address[2:0]==3'b010)
		i_cache[i_address[12:3]][47:32]=i_wdata;
	if(i_address[2:0]==3'b011)
		i_cache[i_address[12:3]][63:48]=i_wdata;
	if(i_address[2:0]==3'b100)
		i_cache[i_address[12:3]][79:64]=i_wdata;
	if(i_address[2:0]==3'b101)
		i_cache[i_address[12:3]][95:80]=i_wdata;
	if(i_address[2:0]==3'b110)
		i_cache[i_address[12:3]][111:96]=i_wdata;
	if(i_address[2:0]==3'b111)
		i_cache[i_address[12:3]][127:112]=i_wdata;
	
	i_dirty[i_address[12:3]]=1'b1;
	i_valid[i_address[12:3]]=1'b1;
end
	
	if(i_address[14:13]== i_tag[i_address[12:3]] && (i_en== 1'b1) && i_dirty[i_address[12:3]]==1'b1) begin//ins write miss dirty=1
	//$display("imhere 79");
	mm[i_address[14:3]]=i_cache[i_address[14:3]];						//writing back in main mem
	i_cache[i_address[12:3]]=mm[i_address[14:3]];						//fetching drom main mem
	i_dirty[i_address[12:3]]=1'b0;
	
	if(i_address[2:0]==3'b000)
		i_cache[i_address[12:3]][15:0]=i_wdata;
	if(i_address[2:0]==3'b001)
		i_cache[i_address[12:3]][31:16]=i_wdata;
	if(i_address[2:0]==3'b010)
		i_cache[i_address[12:3]][47:32]=i_wdata;
	if(i_address[2:0]==3'b011)
		i_cache[i_address[12:3]][63:48]=i_wdata;
	if(i_address[2:0]==3'b100)
		i_cache[i_address[12:3]][79:64]=i_wdata;
	if(i_address[2:0]==3'b101)
		i_cache[i_address[12:3]][95:80]=i_wdata;
	if(i_address[2:0]==3'b110)
		i_cache[i_address[12:3]][111:96]=i_wdata;
	if(i_address[2:0]==3'b111)
		i_cache[i_address[12:3]][127:112]=i_wdata;
	
	i_dirty[i_address[12:3]]=1'b1;
	i_valid[i_address[12:3]]=1'b1;
end
	
	if(i_address[14:13] != i_tag[i_address[12:3]] && (i_en== 1'b1)) begin		//inst cache write miss
	
	i_cache[i_address[12:3]]=mm[i_address[14:3]];						//fetching drom main mem
	
	if(i_address[2:0]==3'b000)
		i_cache[i_address[12:3]][15:0]=i_wdata;
	if(i_address[2:0]==3'b001)
		i_cache[i_address[12:3]][31:16]=i_wdata;
	if(i_address[2:0]==3'b010)
		i_cache[i_address[12:3]][47:32]=i_wdata;
	if(i_address[2:0]==3'b011)
		i_cache[i_address[12:3]][63:48]=i_wdata;
	if(i_address[2:0]==3'b100)
		i_cache[i_address[12:3]][79:64]=i_wdata;
	if(i_address[2:0]==3'b101)
		i_cache[i_address[12:3]][95:80]=i_wdata;
	if(i_address[2:0]==3'b110)
		i_cache[i_address[12:3]][111:96]=i_wdata;
	if(i_address[2:0]==3'b111)
		i_cache[i_address[12:3]][127:112]=i_wdata;
	
	i_dirty[i_address[12:3]]=1'b1;
	i_valid[i_address[12:3]]=1'b1;
end

	if(i_address[14:13] == i_tag[i_address[12:3]] && (i_en== 1'b0) && i_valid[i_address[12:3]]==1'b1) begin //inst cache read hit
	
	if(i_address[2:0]==3'b000 )
		i_routput=i_cache[i_address[12:3]][15:0];
	if(i_address[2:0]==3'b001)
		i_routput=i_cache[i_address[12:3]][31:16];
	if(i_address[2:0]==3'b010)
		i_routput=i_cache[i_address[12:3]][47:32];
	if(i_address[2:0]==3'b011)
		i_routput=i_cache[i_address[12:3]][63:48];
	if(i_address[2:0]==3'b100)
		i_routput=i_cache[i_address[12:3]][79:64];
	if(i_address[2:0]==3'b101)
		i_routput=i_cache[i_address[12:3]][95:80];
	if(i_address[2:0]==3'b110)
		i_routput=i_cache[i_address[12:3]][111:96];
	if(i_address[2:0]==3'b111)
		i_routput=i_cache[i_address[12:3]][127:112];
	
end
					
	if(i_address[14:13] != i_tag[i_address[12:3]] && (i_en== 1'b0)) begin	//inst cache read miss
	
	i_cache[i_address[12:3]]=mm[i_address[14:3]];
	i_valid[i_address[12:3]]=1'b1;
	
	if(i_address[2:0]==3'b000 )
		i_routput=i_cache[i_address[12:3]][15:0];
	if(i_address[2:0]==3'b001)
		i_routput=i_cache[i_address[12:3]][31:16];
	if(i_address[2:0]==3'b010)
		i_routput=i_cache[i_address[12:3]][47:32];
	if(i_address[2:0]==3'b011)
		i_routput=i_cache[i_address[12:3]][63:48];
	if(i_address[2:0]==3'b100)
		i_routput=i_cache[i_address[12:3]][79:64];
	if(i_address[2:0]==3'b101)
		i_routput=i_cache[i_address[12:3]][95:80];
	if(i_address[2:0]==3'b110)
		i_routput=i_cache[i_address[12:3]][111:96];
	if(i_address[2:0]==3'b111)
		i_routput=i_cache[i_address[12:3]][127:112];
end	
	
if(i_address[14:13] == i_tag[i_address[12:3]] && (i_en == 1'b0) && i_valid[i_address[12:3]]==1'b0) begin //read miss as valid bit=0
	
	i_cache[i_address[12:3]]=mm[i_address[14:3]];
	i_valid[i_address[12:3]]=1'b1;
	
	if(i_address[2:0]==3'b000 )
		i_routput=i_cache[i_address[12:3]][15:0];
	if(i_address[2:0]==3'b001)
		i_routput=i_cache[i_address[12:3]][31:16];
	if(i_address[2:0]==3'b010)
		i_routput=i_cache[i_address[12:3]][47:32];
	if(i_address[2:0]==3'b011)
		i_routput=i_cache[i_address[12:3]][63:48];
	if(i_address[2:0]==3'b100)
		i_routput=i_cache[i_address[12:3]][79:64];
	if(i_address[2:0]==3'b101)
		i_routput=i_cache[i_address[12:3]][95:80];
	if(i_address[2:0]==3'b110)
		i_routput=i_cache[i_address[12:3]][111:96];
	if(i_address[2:0]==3'b111)
		i_routput=i_cache[i_address[12:3]][127:112];
end		
	
	if(d_waddress[14] == d_tag[d_waddress[13:3]] && d_dirty[d_waddress[13:3]]==1'b0) begin		//data write
	
	if(d_waddress[2:0]==3'b000)
		d_cache[d_waddress[13:3]][15:0]=d_wdata;
	if(d_waddress[2:0]==3'b001)
		d_cache[d_waddress[13:3]][31:16]=d_wdata;
	if(d_waddress[2:0]==3'b010)
		d_cache[d_waddress[13:3]][47:32]=d_wdata;
	if(d_waddress[2:0]==3'b011)
		d_cache[d_waddress[13:3]][63:48]=d_wdata;
	if(d_waddress[2:0]==3'b100)
		d_cache[d_waddress[13:3]][79:64]=d_wdata;
	if(d_waddress[2:0]==3'b101)
		d_cache[d_waddress[13:3]][95:80]=d_wdata;
	if(d_waddress[2:0]==3'b110)
		d_cache[d_waddress[13:3]][111:96]=d_wdata;
	if(d_waddress[2:0]==3'b111)
		d_cache[d_waddress[13:3]][127:112]=d_wdata;
	
	d_dirty[d_waddress[13:3]]=1'b1;
	d_valid[d_waddress[13:3]]=1'b1;
end

	if(d_waddress[14] != d_tag[d_waddress[13:3]]) begin		//data write
	
	d_cache[d_waddress[13:3]]=mm[d_waddress[14:3]];						//fetching drom main mem
	
	if(d_waddress[2:0]==3'b000)
		d_cache[d_waddress[13:3]][15:0]=d_wdata;
	if(d_waddress[2:0]==3'b001)
		d_cache[d_waddress[13:3]][31:16]=d_wdata;
	if(d_waddress[2:0]==3'b010)
		d_cache[d_waddress[13:3]][47:32]=d_wdata;
	if(d_waddress[2:0]==3'b011)
		d_cache[d_waddress[13:3]][63:48]=d_wdata;
	if(d_waddress[2:0]==3'b100)
		d_cache[d_waddress[13:3]][79:64]=d_wdata;
	if(d_waddress[2:0]==3'b101)
		d_cache[d_waddress[13:3]][95:80]=d_wdata;
	if(d_waddress[2:0]==3'b110)
		d_cache[d_waddress[13:3]][111:96]=d_wdata;
	if(d_waddress[2:0]==3'b111)
		d_cache[d_waddress[13:3]][127:112]=d_wdata;
	
	d_dirty[d_waddress[13:3]]=1'b1;
	d_valid[d_waddress[13:3]]=1'b1;
end

	if(d_waddress[14] == d_tag[d_waddress[13:3]] && d_dirty[d_waddress[13:3]]==1'b1) begin		//data write but dirty bit
	
	mm[d_waddress[14:3]]=d_cache[d_waddress[14:3]];						//writing back in main mem
	d_cache[d_waddress[13:3]]=mm[d_waddress[14:3]];						//fetching drom main mem
	d_dirty[d_waddress[13:3]]=1'b0;
	
	if(d_waddress[2:0]==3'b000)
		d_cache[d_waddress[13:3]][15:0]=d_wdata;
	if(d_waddress[2:0]==3'b001)
		d_cache[d_waddress[13:3]][31:16]=d_wdata;
	if(d_waddress[2:0]==3'b010)
		d_cache[d_waddress[13:3]][47:32]=d_wdata;
	if(d_waddress[2:0]==3'b011)
		d_cache[d_waddress[13:3]][63:48]=d_wdata;
	if(d_waddress[2:0]==3'b100)
		d_cache[d_waddress[13:3]][79:64]=d_wdata;
	if(d_waddress[2:0]==3'b101)
		d_cache[d_waddress[13:3]][95:80]=d_wdata;
	if(d_waddress[2:0]==3'b110)
		d_cache[d_waddress[13:3]][111:96]=d_wdata;
	if(d_waddress[2:0]==3'b111)
		d_cache[d_waddress[13:3]][127:112]=d_wdata;
	
	d_dirty[d_waddress[13:3]]=1'b1;
	d_valid[d_waddress[13:3]]=1'b1;
end


if(d_raddress[14] == d_tag[d_raddress[13:3]] && (d_dirty[d_waddress[13:3]]==1'b0)) begin		//data read hit
	
	if(d_raddress[2:0]==3'b000)
		d_routput=d_cache[d_raddress[13:3]][15:0];
	if(d_raddress[2:0]==3'b001)
		d_routput=d_cache[d_raddress[13:3]][31:16];
	if(d_raddress[2:0]==3'b010)
		d_routput=d_cache[d_raddress[13:3]][47:32];
	if(d_raddress[2:0]==3'b011)
		d_routput=d_cache[d_raddress[13:3]][63:48];
	if(d_raddress[2:0]==3'b100)
		d_routput=d_cache[d_raddress[13:3]][79:64];
	if(d_raddress[2:0]==3'b101)
		d_routput=d_cache[d_raddress[13:3]][95:80];
	if(d_raddress[2:0]==3'b110)
		d_routput=d_cache[d_raddress[13:3]][111:96];
	if(d_raddress[2:0]==3'b111)
		d_routput=d_cache[d_raddress[13:3]][127:112];
end

	if(d_raddress[14] != d_tag[d_raddress[13:3]]) begin		//data read miss as block not in cache
	
	d_cache[d_waddress[13:3]]=mm[d_waddress[14:3]];						//fetching drom main mem
	//d_dirty[d_waddress[13:3]]=1'b0;
	
	if(d_raddress[2:0]==3'b000)
		d_routput=d_cache[d_raddress[13:3]][15:0];
	if(d_raddress[2:0]==3'b001)
		d_routput=d_cache[d_raddress[13:3]][31:16];
	if(d_raddress[2:0]==3'b010)
		d_routput=d_cache[d_raddress[13:3]][47:32];
	if(d_raddress[2:0]==3'b011)
		d_routput=d_cache[d_raddress[13:3]][63:48];
	if(d_raddress[2:0]==3'b100)
		d_routput=d_cache[d_raddress[13:3]][79:64];
	if(d_raddress[2:0]==3'b101)
		d_routput=d_cache[d_raddress[13:3]][95:80];
	if(d_raddress[2:0]==3'b110)
		d_routput=d_cache[d_raddress[13:3]][111:96];
	if(d_raddress[2:0]==3'b111)
		d_routput=d_cache[d_raddress[13:3]][127:112];
end

	if(d_raddress[14] == d_tag[d_raddress[13:3]] && (d_dirty[d_waddress[13:3]]==1'b1)) begin	//data read miss with dirty bit=1
	
	mm[d_waddress[14:3]]=d_cache[d_waddress[14:3]];						//writing back in main mem
	d_cache[d_waddress[13:3]]=mm[d_waddress[14:3]];						//fetching drom main mem
	d_dirty[d_waddress[13:3]]=1'b0;
	
	if(d_raddress[2:0]==3'b000)
		d_routput=d_cache[d_raddress[13:3]][15:0];
	if(d_raddress[2:0]==3'b001)
		d_routput=d_cache[d_raddress[13:3]][31:16];
	if(d_raddress[2:0]==3'b010)
		d_routput=d_cache[d_raddress[13:3]][47:32];
	if(d_raddress[2:0]==3'b011)
		d_routput=d_cache[d_raddress[13:3]][63:48];
	if(d_raddress[2:0]==3'b100)
		d_routput=d_cache[d_raddress[13:3]][79:64];
	if(d_raddress[2:0]==3'b101)
		d_routput=d_cache[d_raddress[13:3]][95:80];
	if(d_raddress[2:0]==3'b110)
		d_routput=d_cache[d_raddress[13:3]][111:96];
	if(d_raddress[2:0]==3'b111)
		d_routput=d_cache[d_raddress[13:3]][127:112];
end

end

//always @(*)
//begin
//	$display("zero_shift =%d!===> %b,++< %b,---%d===%d",i_cache[0][15:0],i_tag[i_address[12:3]],i_address[14:13],i_en,i_dirty[i_address[12:3]]);
//	$monitor("%d**%d",i_cache[1][31:15],i_cache[2][15:0]);
//end


endmodule
