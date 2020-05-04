`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module btnInterpreter(
	input [3:0] btns,
    output [1:0] num,
    output pressed
    );

    assign pressed = (btns == 1) | (btns == 2) | (btns == 4) | (btns == 8);
    assign num =    (btns == 1) ?   0:
                    (btns == 2) ?   1:
                    (btns == 4) ?   2:
                                    3;

endmodule
