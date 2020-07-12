`include "2scomp.v"
module top;
reg [10:0] inp;

wire [10:0] out;

twos_comp t1(inp,out);
initial
begin
#0 inp=11'b10000000000; 
#10 inp=11'b01010101010;
#20 inp=11'b11111111110;
//#30 A=32'd656;B=32'd100;cin=1'b0;
//#40 A=32'd3333;B=32'd6666;cin=1'b1;

end
initial $monitor($time,"inp=%5d out=%5b ",inp,out);

endmodule

