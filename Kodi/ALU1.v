`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2022 05:27:39 PM
// Design Name: 
// Module Name: ALU1
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

module ALU1(
    input A,
    input B,
    input CIN,
    input BInvert,
    input Less,
    input [2:0] Op,
    output Result,
    output CarryOut
    );
    
   wire JoB, mB, dhe_teli, ose_teli, mb_teli, XOR; 
 
   assign JoB = ~B;
   
   mux2ne1 muxB(B, JoB, BInvert, mB);
   
   assign dhe_teli = A & mB;
   assign ose_teli = A | mB;
   assign XOR = A ^ mB;
  // assign XOR = (A & ~mB) | (~A & mB);
  //XOR_1b aXORmb(A, mB, XOR);

   Mbledhesi_1b m1(A, mB, CIN, mb_teli, CarryOut);
   
   //mux4ne1 MuxiKryesor(dhe_teli, ose_teli, mb_teli, Less, Op, Result);
  mux5ne1 MuxiKryesor(dhe_teli, ose_teli, mb_teli,Less, XOR,Op, Result);
    
    
endmodule
