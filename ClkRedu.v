`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineer: natxsglez
//////////////////////////////////////////////////////////////////////////////////
module ClkRedu(
	input clk,
	input reset,
	output reg ClkRedu //slower clock
    );

	reg [19:0] count; //20 bits to fit 833_334
	always @(posedge clk, posedge reset)
		begin
			if(reset)
				begin
					count <= 0; 
					ClkRedu <= 0; 
				end
			else
				begin
					count <= count + 1;
					if(count == 416_667) //count to 833_334 to toggle 60 times per second
						begin
							ClkRedu <= ClkRedu + 1; //Toggle output
							count <=0; //restart count
						end
				end
		end



endmodule
