`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module top(
	input clk,
	input rst,
	output vga_hs,
	output vga_vs,
    output [2:0] vga_r,
	output [2:0] vga_g,
	output [1:0] vga_b
    );

	wire pixel_clk;

	clk25Mhz c(.clk_50mhz(clk), .clk_25mhz(pixel_clk));
	
	wire [9:0] x;  // current pixel x position: 10-bit value: 0-1023
    wire [8:0] y;  // current pixel y position:  9-bit value: 0-511

	vga640x480 display (
        .i_clk(clk),
        .i_pix_stb(pixel_clk),
        .i_rst(rst),
        .o_hs(vga_hs), 
        .o_vs(vga_vs), 
        .o_x(x), 
        .o_y(y)
    );

	assign vga_r[2] = 1;
	assign vga_r[1] = 1;
	assign vga_r[0] = 1;
	assign vga_g = 0;
	assign vga_b = 0;
                                                
endmodule