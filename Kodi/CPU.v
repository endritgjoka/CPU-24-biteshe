`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2022 11:14:38 AM
// Design Name: 
// Module Name: CPU
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

//Hyrje ne CPU - CLock CPU_IN_1
module CPU(
    input Clock
);

wire [3:0] opcode, funct; 
wire RegDst, Branch, MemRead, MemWrite, RegWrite, MemToReg, ALUSrc;
wire [1:0] ALUOp;

Datapath DP
(
Clock,
RegDst, Branch, MemRead, MemWrite, RegWrite, MemToReg, ALUSrc,
ALUOp,
opcode,
funct
);

CU ControlUnit (opcode, funct,
RegDst, 
Branch, 
MemRead, 
MemToReg,
ALUOp,
MemWrite, 
ALUSrc,
RegWrite
);

endmodule
