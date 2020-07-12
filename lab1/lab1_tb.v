`include "lab1.v"
module top;
reg a_s;
reg [15:0] a,b;
wire [15:0] c;
 float_adder f1(a_s,a,b,c); 
initial
begin
#0 a_s=1;a=16'b0100010100000000; b=16'b0100100000000000;  //a=5,b=8
#10 a_s=0;a=16'b0100001000000000; b=16'b0100001000000000;	//a=b=3
#20 a_s=1;a=16'b100011101001101;b=16'b100100000001101;	//a=7.3,b=8.1
//#20 a=16'b0011110001100110; b=16'b0011110001100110;
//#30 A=32'd656;B=32'd100;cin=1'b0;
//#40 A=32'd3333;B=32'd6666;cin=1'b1;

end
initial $monitor($time,"a_s=%b a=%5b b=%5b sign_c=%b, c_exponent=%b ,c_mantisa=%b",a_s,a,b,c[15],c[14:10],c[9:0]);

endmodule

