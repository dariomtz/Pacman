`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineer: natxsglez
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
				if(conteo == 833_334) //contar hasta 25 millones para hacer Toggleo cada 0.5s
					begin
						ClkRedu <= ClkRedu + 1; //Togglea la salida
						conteo <=0; //reinicia la cuenta
					end
			end
	end



endmodule
