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
	input clk,
	input reset,
	input [1:0] playerNum,
	input playerPressed,

    output simonTurn,
    output [1:0] simonNum,
    output simonPressed,
	output gameOver
    );

	reg myTurn;
	reg [1:0] myNum;
	reg pressed;
	reg gmOver;

	always @(posedge clk or posedge reset)
	begin
		if (reset) begin
			myTurn <= 1;
			//reset the number array
			gmOver <= 0;

		end else begin
			if (myTurn) begin
				//presionar botones
				if (pressed) begin
					//cambiar turno
					myTurn <= myTurn + 1;
				end else begin
					//empezar a presionar
					
				end
				pressed <= pressed + 1; //dejar de presionar o volver a presionar
			end else begin
				//escuchar user input
				if (playerPressed) begin
					//checar num del player
					if(playerNum != myNum)
						begin
							//game over
							gmOver <= 1;
						end
					
					//cambiar turno
					myNum <= myNum + 1;
					myTurn <= myTurn + 1;
					
				end else begin
					//contar para limitar el tiempo
				end
			end
		end
			
	end

	assign simonTurn = myTurn;
	assign simonNum = myNum;
	assign simonPressed = pressed;
	assign gameOver = gmOver;

endmodule
