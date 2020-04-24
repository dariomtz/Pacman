`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module clk25Mhz(
	input clk_50mhz,
	output clk_25mhz,
    );

	reg [1:0] cnt;
	
	always @(posedge clk_50mhz)
		cnt <= cnt + 1;

    assign clk_25mhz = cnt[1];
                                                
endmodule