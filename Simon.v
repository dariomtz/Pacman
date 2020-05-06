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

	reg myTurn;
	wire [1:0] myNum;
	reg pressed;
	reg gmOver;
	reg [4:0] counterSimon;
	reg [6:0] counterPlayer;
	reg userState;
	wire [1:0] rand;
	reg [3:0] level;
	reg [3:0] timesPressed;
	reg [1:0] memory[15:0];

	random r(.clk(clk), .rand(rand));

	assign myNum = memory[timesPressed];
	
	always @(posedge clk or posedge reset)
	begin
		if (reset) begin
			//Simon begins
			myTurn <= 0;
			//reset game over and counters
			gmOver <= 0;
			counterSimon <= 0;
			counterPlayer <= 0;
			level <= 0;
			timesPressed <= 0;

			//change the number to a rand
			//myNum <= rand;
			memory[0] <= rand;

		end else begin
			if (!gmOver) begin
				if (myTurn) begin
					//press buttons
					counterSimon <= counterSimon + 1;
					if (counterSimon == 30) begin

						if (level == timesPressed) begin
							timesPressed <= 0;
							//change turn
							myTurn <= myTurn + 1;

						end else begin

							if (pressed) begin
								timesPressed <= timesPressed + 1;
								
							end

							pressed <= pressed + 1; //toggle pressed
						end
						counterSimon <= 0;
					end
					
				end else begin
					//user turn
					if (level == timesPressed) begin
						timesPressed <= 0;
						//change turn
						myTurn <= myTurn + 1;
						if (level == 15) begin
							gmOver <= 1;
						end else begin
							memory[level] <= rand;
							level <= level + 1;
						end
					end else begin 
						if(playerPressed)begin
						
							if(myNum == playerNum)begin
								userState <= 1;
							end else begin
								gmOver <= 1;
							end
							counterPlayer <= 0;

						end else begin
							counterPlayer <= counterPlayer + 1;

							if (counterPlayer == 120) begin //if two seconds go by without pressing
								gmOver <= 1;
							end

							if(userState == 1) begin								
								timesPressed <= timesPressed + 1;
								userState <= 0;
							end
						end
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
