`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2021 14:21:38
// Design Name: 
// Module Name: random_no
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


module random_no(
    input start,
    input clk,
    input reset,
    output reg [3:0] ran_no=0
    );
    always @(posedge clk)
    begin
     if(!reset)
      ran_no=0;
     else if (!start)
      begin
       if(ran_no>=9)
         ran_no<=1;
       else
         ran_no<=ran_no + 1;  
      end
    end
    
endmodule
