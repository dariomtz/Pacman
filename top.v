`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module top(
    input clk,
    input [3:0] rows,
    output reg [3:0] cols,
    output [6:0] display
    );

    wire [3:0] num;
    keyboard k(.clk(clk), .rows(rows), .cols(cols), out(num));
    
    display d(.n(num), .d(display));
                                                
endmodule