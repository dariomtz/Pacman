`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module numToLed(
    input [1:0] num,
    input pressed,
    input gameOver,
    output [3:0] leds
    );

    assign leds =   (gameOver)           ? 15:
                    (num == 0 & pressed) ?  1:
                    (num == 1 & pressed) ?  2:
                    (num == 2 & pressed) ?  4:
                    (num == 3 & pressed) ?  8:
                                            0;

endmodule
