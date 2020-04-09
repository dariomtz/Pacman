`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module top(
    input [3:0] rows,
    input [3:0] cols,
    output [7:0] leds
    );

    assign leds[0] = rows[0] & cols[0];
    assign leds[1] = rows[0] & cols[0];
    assign leds[2] = rows[0] & cols[0];
    assign leds[3] = rows[0] & cols[0];
    assign leds[4] = rows[0] & cols[0];
    assign leds[5] = rows[0] & cols[0];
    assign leds[6] = rows[0] & cols[0];
    assign leds[7] = rows[0] & cols[0];
    
                                                
endmodule