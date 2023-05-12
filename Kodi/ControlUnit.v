`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2022 06:13:25 PM
// Design Name: 
// Module Name: CU
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


module CU(
    input [3:0] OPCODE,
    input [3:0] Funct, 
    output reg RegDst, 
    output reg Branch,
    output reg MemRead,
    output reg MemToReg,
    output reg[1:0] AluOp,
    output reg MemWrite,
    output reg AluSrc,
    output reg RegWrite
    );
    
    
always @ (OPCODE)
begin
case(OPCODE)
4'b0110: //PER R-FORMAT
    begin
         case(Funct)
         4'b0101:
            begin
               RegDst = 1'bX;
               AluSrc = 0;
               MemToReg = 0;
               RegWrite = 1'bX;
               MemRead = 0;
               MemWrite = 0;
               Branch = 0;
               AluOp[1] = 1;
               AluOp[0] = 1;
            end
            default:
            begin
            RegDst = 1;
            AluSrc = 0;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            AluOp[1] = 1;
            AluOp[0] = 0;
            end       

        endcase
    
    end

4'b0010: //PER LS
    begin
    RegDst = 0;
    AluSrc = 1;
    MemToReg = 1;
    RegWrite = 1;
    MemRead = 1;
    MemWrite = 0;
    Branch = 0;
    AluOp[1] = 0;
    AluOp[0] = 0;
    end 
    
4'b0011: //PER SS
    begin
    RegDst = 1'bX;
    AluSrc = 1;
    MemToReg = 0;
    RegWrite = 1'bX;
    MemRead = 0;
    MemWrite = 1;
    Branch = 0;
    AluOp[1] = 0;
    AluOp[0] = 0;
    end 
    
4'b0100: //PER BEQ
    begin
    RegDst = 0;
    AluSrc = 0;
    MemToReg = 0;
    RegWrite = 0;
    MemRead = 0;
    MemWrite = 0;
    Branch = 1;
    AluOp[1] = 0;
    AluOp[0] = 1;
    end 
4'b0001: //PER ADDI
    begin
     RegDst = 0;
     AluSrc = 1;
     MemToReg = 0;
     RegWrite = 1;
     MemRead = 0;
     MemWrite = 0;
     Branch = 0;
     AluOp[1] = 0;
     AluOp[0] = 0;
    end 
endcase

end

endmodule

