`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2024 19:59:07
// Design Name: 
// Module Name: tb
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



module syn_fifo_tb #(parameter FIFO_WIDTH=8, FIFO_DEPTH=8)(

    );
    
reg clk;
reg reset;
reg fifoWrEn;
reg [FIFO_WIDTH-1:0] fifoWrData;
wire fifoFull;
reg fifoRdEn;
wire [FIFO_WIDTH-1:0] fifoRdData;
wire fifoEmpty;
wire [$clog2(FIFO_DEPTH):0] fifoDataCount;

//instantiating the module 

syn_fifo fifo(clk,reset,fifoWrEn,fifoWrData,fifoFull,fifoRdEn,fifoRdData,fifoEmpty,fifoDataCount);

// generating the clock signal .
initial 
begin
clk = 0;
forever #5 clk = ~clk; //10ns is the time period of the clock.
end 
//giving the appropriate signals to check the output .
initial 
begin
 reset = 1'b1;
 #10 reset = 1'b0; fifoWrEn = 1'b1;fifoWrData='d1;fifoRdEn=1'b0;
 #10 fifoWrData='d20;
 #10 fifoWrData='d30;
 #10 fifoWrData='d40;
 #10 fifoWrData='d50;
 #10 fifoWrData='d60;
 #10 fifoWrData='d70;
 #10 fifoWrData='d30;
 #10 fifoWrData='d40;
  #10 fifoWrData='d560;
   #10 fifoWrData='d405;
 
 #10 fifoRdEn=1'b1; fifoWrEn=1'b0;
 
 
 
 #200 $finish;
 
end 
endmodule
