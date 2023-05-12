`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2022 11:50:52 AM
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(
input wire[23:0] PCAddress,
output wire[23:0] Instruction
);

reg[7:0] instrMem[127:0];

wire [23:0] pcadress1, pcadress2;
wire cout1, cout2;

initial
$readmemb("instructionMemory.mem", instrMem);

PC_Adder p1(PCAddress, 24'd1, 1'b0, pcadress1, cout1);
PC_Adder p2(PCAddress, 24'd2, 1'b0, pcadress2, cout2);



assign Instruction[23:16] = instrMem[PCAddress];
assign Instruction[15:8] = instrMem[pcadress1];
assign Instruction[7:0] = instrMem[pcadress2];


endmodule
