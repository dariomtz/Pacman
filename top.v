`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module top(
	input [3:0] btns,
	input clk,
	output [3:0] leds,
	output sound
    );

	wire [1:0] num;
	wire pressed;

	btnInterpreter i(.btns(btns), .num(num), .pressed(pressed));

	numToLed n(.num(num), .pressed(pressed), .leds(leds));

	Speaker s(.clk(clk), .play(pressed), .frequency(25000), .sound(sound));
                                                
endmodule