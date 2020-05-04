`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineer: Nataly Salazar
// 
// Create Date:    09:37:24 03/25/2020 
// Design Name: 
// Module Name:    ClkRedu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ClkRedu(
	input clk,
	input reset,
	output reg ClkRedu //para bocina: puerto A PIN1: B2
    );

reg [24:0] conteo; //se definen 25 bits para el conteo porque 2^25 = 33Millones
always @(posedge clk, posedge reset)
	begin
		if(reset)
			begin
				conteo <= 0; //reiniciar la cuenta
				ClkRedu <= 0; //reiniciar la salida
			end
		else
			begin
				conteo <= conteo + 1;
				if(conteo == 25_000_000) //contar hasta 25 millones para hacer Toggleo cada 0.5s
					begin
						ClkRedu <= ClkRedu + 1; //Togglea la salida
						conteo <=0; //reinicia la cuenta
					end
			end
	end



endmodule
