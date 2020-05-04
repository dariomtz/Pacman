`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module top(
	input [1:0] num,
	input pressed,
    output [14:0] frequency
    );

	assign frequency =  (num == 0 & pressed) ?  25000:
                        (num == 1 & pressed) ?  12500:
                        (num == 2 & pressed) ?  8333:
                                                6250;
endmodule