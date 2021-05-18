`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2021 13:44:00
// Design Name: 
// Module Name: Game_top
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


module Game_top(
input reset,
input clk,
input start,
input random,
input [3:0] sw,
output [6:0] score_display,
output [6:0] random_number,
output [6:0] decoded_ones,
output [6:0] decorded_tens);
wire [3:0] ones_digit, tens_digit,ran_no;
wire done,start_condt,random_condt;
reg [3:0]random_no_reg,score;
parameter INIT=0,START=1,FINISH=2;
reg [1:0] state=0;
timer time_1(clk,ones_digit,tens_digit,start_condt,reset,done);
decoder_7seg decode_ones(ones_digit,decoded_ones);
decoder_7seg decode_tens(tens_digit,decorded_tens);
decoder_7seg decode_random(ran_no,random_number);
decoder_7seg decode_score(score,score_display);
ButtonShaper button_start(start,start_condt,clk,reset);
ButtonShaper button_random(random,random_condt,clk,reset);
random_no ran_generator(random,clk,reset,ran_no);

always @(posedge clk)
begin
 if(!reset)
  state<=INIT;
 else 
  case(state)
   INIT:begin
          if(start_condt)
            begin
             state<=START;
             score<=0;
            end 
          else
            state<=INIT;   
        end
   START:begin
           if(random_condt && random_no_reg!=0 && random_no_reg==sw)
            score<=score+1;
            
           if(done)
             state<=FINISH;
           else
             state<=START;  
         end
  FINISH:begin
          if(!reset)
            state<=INIT;
          else
            state<=FINISH;  
         end 
    default: begin
             state<=INIT;   
             end 
    endcase                        
end 

always @(posedge random,negedge reset)
begin
 if(!reset)
 random_no_reg<=0;
 else
 random_no_reg<=ran_no;
end

endmodule
