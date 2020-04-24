`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module top(
	input clk,
	output vga_hs,
	output vga_vs,
    output [3:0] vga_r,
	output [3:0] vga_g,
	output [3:0] vga_b
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
				0: column <='1110;
				1: column <='b1101;
				2: column <='b1011;
				3: column <='b0111;
				default: column <=0;
			endcase
		end
                                                
endmodule