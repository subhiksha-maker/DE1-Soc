`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2021 10:05:43
// Design Name: 
// Module Name: timer
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


module timer(
    //input [7:0] load,
    input clk,
    output reg [3:0] one_digits,
    output reg [3:0] ten_digits,
    input start,
    input reset,
    output reg done
    );
   wire OSClk; 
   OneSecondClk one_second_clk_1 (reset,start,clk,OSClk); //50MHz clk input
   always @(posedge OSClk,negedge reset)
   begin
    if(!reset)
     begin
      one_digits<=0;
      ten_digits<=0;
      done<=0;
     end
    else
     begin
      if(one_digits==9 && ten_digits==4 && done==0)
       begin
        one_digits<=0;
        ten_digits<=ten_digits+1;
        done<=1;
       end
      else if(one_digits==9 && ten_digits<2 && done==0)
       begin
        one_digits<=0;
        ten_digits<=ten_digits+1;
       end
      else if(one_digits<9 && done==0)
       begin
        one_digits<=one_digits+1;
       end 
     end
   end
   
endmodule
