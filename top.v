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

	wire clk_25mhz;

	clk25Mhz c(.clk_50mhz(clk), .clk_25mhz(clk_25mhz));
	
	
                                                
endmodule