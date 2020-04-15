`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module clk100(
    input clk,
    output reg clkSlow
    );
reg [26:0] counter;
 


always @(posedge clk)
   begin
		
		if (counter == 3000000 )
			begin
			counter = 0;
			clkSlow=clkSlow+1;
			end
		else
			begin
			counter=counter+1;
			end
	end


endmodule
