`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2022 11:13:47 AM
// Design Name: 
// Module Name: ALUControl
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

module ALUControl(
input [1:0] ALUOp,
input [3:0] Funct,
output reg [3:0] ALUCtrl
);

always @(ALUOp)
begin
case(ALUOp) // ALUOp, 00-lw,sw, addi; 01-beq,bne, 10-R-format, 11 - MUL
    2'b00: ALUCtrl = 4'b0010; //LW+SW+ ADDI (mbledhje)
    2'b01: ALUCtrl = 4'b1010; //BEQ+BNE (zbritje)
    2'b10: //R-Format
        case(Funct)
            4'b0010: ALUCtrl = 4'b0010; //ADD
            4'b0011: ALUCtrl = 4'b1010; //SUB
            4'b0000: ALUCtrl =4'b0000; //AND
            4'b0001 : ALUCtrl = 4'b0001; //OR
            4'b0100 : ALUCtrl = 4'b0011; //SLT
            4'b0110 : ALUCtrl = 4'b0101; //XOR
            4'b0111 : ALUCtrl = 4'b0110; //SLL
        endcase

    2'b11:  ALUCtrl = 4'b0100; // per MUL
endcase
end



endmodule
