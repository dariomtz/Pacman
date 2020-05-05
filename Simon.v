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
	input clk, //60 hz
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
	reg [4:0] counterSimon;
	reg [1:0] userState;
	reg [1:0] playerNumCopy;

	always @(posedge clk or posedge reset)
	begin
		if (reset) begin
			myTurn <= 1;
			//reset the number array
			gmOver <= 0;
			counterSimon <= 0;

		end else begin
			if (myTurn) begin
				//presionar botones
				counterSimon <= counterSimon + 1;
				if (counterSimon == 30) begin
					if (pressed) begin
						//cambiar turno
						myTurn <= myTurn + 1;
					end else begin
						//empezar a presionar
						
					end
					pressed <= pressed + 1; //toggle pressed
					counterSimon <= 0;
				end
				
			end else begin
				//user turn
				case (userState)
					0:
						begin
							if (playerPressed) begin //player started pressing
								userState <= 1;
							end
						end
					1:
						begin
							playerNumCopy <= playerNum;

							if (~playerPressed) begin //player stopped pressing
								userState <= 2;
							end
						end
					2:
						begin
							if(playerNumCopy != myNum)
								begin
									//game over
									gmOver <= 1;
								end
							else
								begin
									//change number or select next number
									myNum <= myNum + 1;

									//change turn
									myTurn <= myTurn + 1;
								end
							userState <= 0;
						end
					default: userState <= 0;
				endcase
			
			end
		end
			
	end

	assign simonTurn = myTurn;
	assign simonNum = myNum;
	assign simonPressed = pressed;
	assign gameOver = gmOver;

endmodule
