`include "cla_16bit.v"
`include "d.v"

module instruction_Fetch(pc,instruction_reg,clk,reset);
reg [16:1] register [1024:1];
output [15:0]pc;
output [15:0]instruction_reg;
input clk,reset;
wire [15:0]sum;
//assign pc[15:10]=6'b0;


carry_look_ahead_16bit c12(pc,16'b1, 1'b0, sum,cout);
dff dd3(sum,clk,reset,pc);

assign instruction_reg=register[pc[9:0]];

initial 
begin
 register[3]<=16'b0000000000000010;
 register[7]<=16'b0000000000000110;
 end
////begin
//assign register[3]=16'd100;
//assign register[7]=16'd180;
//end

endmodule

