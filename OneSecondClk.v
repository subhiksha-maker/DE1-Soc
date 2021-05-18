`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2021 10:08:53
// Design Name: 
// Module Name: OneSecondClk
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


module OneSecondClk(
    input reset,
    input start,
    input clk,
    output reg OSClk
    );
    
    parameter par1=1000,par2=25000;
    reg [10:0] par1_counter;
    reg [16:0] par2_counter;
    reg start_internal;
    always @(posedge clk,negedge reset)
    begin
     if(!reset)
      begin
       par1_counter<=0;
       par2_counter<=0;
       OSClk<=0;
       start_internal<=0;
      end
      else if(start_internal)
       begin
        if(par1_counter==par1)
         begin
          OSClk<=~OSClk;
          par1_counter<=0;
          par2_counter<=0;
         end
        else if(par2_counter==par2)
         begin
          par1_counter<=par1_counter+1;
          par2_counter<=0;
         end 
        else
         begin
          par2_counter<=par2_counter+1;
         end 
       end
      else if (start)
       begin
         start_internal<=1;
       end 
    end
endmodule
