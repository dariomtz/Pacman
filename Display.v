`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz and natxsglez
//////////////////////////////////////////////////////////////////////////////////
module Display(
	input simonTurn,
	input gameOver,
	input clk,
	output [3:0]pos,
	output [7:0] display
    );
	reg [1:0]mux;
	reg toggle;
	reg [16:0]counter1;
	reg [6:0]counter2;
	
	always @(posedge clk)
	begin
		if(counter1 == 100_000)
			begin
				mux <= mux + 1;
				counter1 <= 0;
				if(counter2 == 100)
					begin
						toggle <= toggle + 1;
					end
				counter2 <= counter2 + 1;
			end
			counter1 <= + 1;
	end
	
	assign pos = (mux = 0) ? 14 :
					 (mux = 1) ? 13 :
					 (mux = 2) ? 11 :
									 7  ;
	assign display = (~gameOver & simonTurn & (mux == 0 | mux == 1)) ? 7'b0010010 ://S
						  (~gameOver & simonTurn & (mux == 2 | mux == 3)) ? 7'b1111111 ://Off
						  (~gameOver & ~simonTurn & mux == 0) ? 7'b0010001 :
						  (~gameOver & ~simonTurn & mux == 1) ? 7'b0001000 :
						  (~gameOver & ~simonTurn & mux == 2) ? 7'b1000111 :
						  (~gameOver & ~simonTurn & mux == 3) ? 7'b0001100 :
						  (gameOver & ~toggle & mux == 0) ? 7'b0000110 :
						  (gameOver & ~toggle & mux == 1) ? 7'b1001000 :
						  (gameOver & ~toggle & mux == 2) ? 7'b0001000 :
						  (gameOver & ~toggle & mux == 3) ? 7'b0000010 :
						  (gameOver & toggle & mux == 0) ? 7'b0101111 :
						  (gameOver & toggle & mux == 1) ? 7'b0000110 :
						  (gameOver & toggle & mux == 2) ? 7'b1000001 :
						  (gameOver & toggle & mux == 3) ? 7'b1000000 :
																	  7'b0000000 ;
																	  
				
endmodule