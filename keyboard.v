`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module keyboard(
    input clk,
    input [3:0] r,
    output [3:0] c,
    output [3:0] out
    );

    reg [3:0] num;
    reg [3:0] cols;

    always @(posedge clk) begin
        case (cols)
            4'b1000: begin
                case (r)
                    4'b1000: num <= 1;
                    4'b0100: num <= 4;
                    4'b0010: num <= 7;
                    4'b0001: num <= 14;
                endcase
                cols <= 4'b0100;
            end
             
            4'b0100: begin
                case (r)
                    4'b1000: num <= 2;
                    4'b0100: num <= 5;
                    4'b0010: num <= 8;
                    4'b0001: num <= 0;
                endcase
                cols <= 4'b0010;
            end
             
            4'b0010: begin
                case (r)
                    4'b1000: num <= 3;
                    4'b0100: num <= 6;
                    4'b0010: num <= 9;
                    4'b0001: num <= 15;
                endcase
                cols <= 4'b0001;
            end

            4'b0001: begin
                case (r)
                    4'b1000: num <= 10;
                    4'b0100: num <= 11;
                    4'b0010: num <= 12;
                    4'b0001: num <= 13;
                endcase
                cols <= 4'b1000;
            end

            default: cols <= 4'b1000;
             
        endcase
    end

    assign c = cols;
    assign out = num;
    
                                                
endmodule