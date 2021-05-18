`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2021 13:40:22
// Design Name: 
// Module Name: timer_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module timer_tb;

reg clk=0,start,reset;
wire [3:0]ones_digit,tens_digits;
wire done;
timer timer_1(clk,ones_digit,tens_digits,start,reset,done);
always begin
#10;
clk=~clk;
end
initial begin
start=0;
reset=1; //active low signal
#50;

reset=0;
#100;

reset =1;
#100;

start=1;
#20;
start=0;
#200;

end
endmodule
