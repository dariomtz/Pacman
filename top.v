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

	wire [14:0] frequency;
	numToFrequency f0(.num(num), .pressed(pressed), .frequency(frequency));

	numToLed n(.num(num), .pressed(pressed), .leds(leds));

	Speaker s(.clk(clk), .play(pressed), .frequency(frequency), .sound(sound));
                                                
endmodule