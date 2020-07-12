`include "lab2.v"

module top;

reg [15:0]a,b;
wire [15:0] c;

float_multiplier f2(a,b,c);
initial 
begin
#0 a=16'b0100011100000000;b=16'b0100100100000000;  //7*10
#10 a=16'b100011100011010;b=16'b100100100100110;  //7.1x10.3
end
	
	initial $monitor($time," a=%5b b=%5b sign_c=%b, c_exponent=%b ,c_mantisa=%b",a,b,c[15],c[14:10],c[9:0]);
endmodule
