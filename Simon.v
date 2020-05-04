`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:28:37 05/04/2020 
// Design Name: 
// Module Name:    Simon 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Simon(
    output reg simonTurn,
    output reg [1:0] simonNum,
	 input [1:0] playerNum,
	 input playerPressed,
    output reg simonPressed,
    input clk
    );
	 always @(posedge clk)
	 begin
		if(simonTurn)
			simonNum <= simonNum + 1;
	 end

endmodule
