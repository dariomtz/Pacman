`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineer: dariomtz and natxsglez
//////////////////////////////////////////////////////////////////////////////////

module random(
    input clk,
    output [1:0] rand
);
    reg [1:0] num; 

    always @(posedge clk ) begin
        num <= num + 1;
    end

    assign rand = num;

endmodule // random