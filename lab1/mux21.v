module mux_2(s0,i1,i0,y);

input s0,i0,i1;
output  y;
wire k;	


/*always@(s0,i1,i0)

	begin
		if(s0==1'b0 )
		begin
			assign k=i0;
			assign y=k;
		end

		else 
		begin
			assign k=i1;
			assign y=k;
		end
		

	end*/

assign y = s0?i1:i0 ;


endmodule
