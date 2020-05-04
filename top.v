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
	wire simonPressed;
	wire playerPressed;
	wire clkRedu;
	wire simonTurn;
	wire [1:0]playerNum;
	wire [1:0]simonNum;
	wire [14:0] frequency;

	btnInterpreter i(.btns(btns), .num(playerNum), .pressed(playerPressed));

	ClkRedu simonClk(.clk(clk), .reset(0), .ClkRedu(clkRedu));
	Simon simon(.simonTurn(simonTurn), .simonNum(simonNum),
					.playerNum(playerNum), .playerPressed(playerPressed),
					.simonPressed(simonPressed), .clk(clkRedu));
	
	assign num = (simonTurn) ? simonNum :
										playerNum;
										
	assign pressed = (simonTurn) ? simonPressed :
											 playerPressed;
	
	numToFrequency f0(.num(num), .pressed(pressed), .frequency(frequency));

	
	
	numToLed n(.num(num), .pressed(pressed), .leds(leds));

	Speaker s(.clk(clk), .play(pressed), .frequency(frequency), .sound(sound));
	
	
                                                
endmodule