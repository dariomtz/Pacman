`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module Speaker(
	input clk,
	input play,
	input [14:0] frequency,
	output sound //Salida de sonido
    );

    reg snd;
	reg [14:0] conteo; //se definen 15 bits para el conteo porque el máximo será 25000

	always @(posedge clk)
		begin
			conteo <= conteo + 1;
			if(conteo >= frequency) //contar hasta la frecuencia dada
                begin
                    snd <= snd + 1; //Togglea el sonido
                    conteo <=0; //reinicia la cuenta
                end
		end

    assign sound = play & snd;

endmodule
