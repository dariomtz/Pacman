`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module top(
    input clk,
    input [3:0] rows,
    output [3:0] cols,
    output [6:0] display
    );

    wire [3:0] num;
    
    keyboard k(.clk(clk), .r(rows), .c(cols), .out(num));
    
    display d(.n(num), .d(display));
                                                
endmodule