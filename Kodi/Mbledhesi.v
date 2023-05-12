`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2022 05:31:23 PM
// Design Name: 
// Module Name: Mbledhesi
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


module Mbledhesi_1b(
    input A,
    input B,
    input CIN,
    output Shuma,
    output COUT
    );

   // reg aXorb;

   // XOR_1b axorb(A,B,aXorb);
   // XOR_1b res(aXorb, CIN);

    assign Shuma = A ^ B ^ CIN;
    assign COUT = CIN & A | CIN & B | A & B;
endmodule
