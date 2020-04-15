`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module top(
    input [3:0] row,
	 input clk,
	 output  [7:0] leds,
    output reg [3:0] column
    
    );

	reg [1:0] barrido;	
	wire clkSlow;
	
	clk100 clk1(clk,clkSlow);
	assign leds[7:4] = row;
	assign leds[3:0] = column;
	
	always @(posedge clkSlow)
		begin
			barrido = barrido +1;
			case ( barrido)
				0: column <='b0001;
				1: column <='b0010;
				2: column <='b0100;
				3:begin
					column <='b1000;
					// barrido <=0;
				  end
				default: column <=0;
			endcase
		end
                                                
endmodule