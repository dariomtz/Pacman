`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineer: dariomtz and natxsglez
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

	wire [1:0] rand;
	random r(.clk(clk), .rand(rand));

	reg myTurn;
	reg [1:0] myNum;
	reg pressed;
	reg gmOver;
	reg [4:0] counterSimon;
	reg userState;
	
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
				if(playerPressed)begin
					
					if(myNum == playerNum)begin
						userState <= 1;
					end else begin
						gmOver <= 1;
					end
				end else begin
					if(userState == 1) begin
						myTurn <= myTurn + 1;
						myNum <= rand;
						userState <= 0;
					end
				end
			end
		end
			
	end

	assign simonTurn = myTurn;
	assign simonNum = myNum;
	assign simonPressed = pressed;
	assign gameOver = gmOver;

endmodule
