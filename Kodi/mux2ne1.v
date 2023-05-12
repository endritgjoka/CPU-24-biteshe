`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2022 05:29:14 PM
// Design Name: 
// Module Name: mux2ne1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux2ne1(
    input Hyrja0,
    input Hyrja1,
    input S,
    output reg Dalja
    );
    
//assign Dalja = S ? Hyrja1 : Hyrja0;
    
    always @* begin
        case (S)
            1'b0:  Dalja = Hyrja0;
            1'b1:  Dalja = Hyrja1;
        endcase
    end
endmodule
