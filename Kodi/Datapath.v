`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 

module Datapath(
input Clock,
input RegDst, Branch, MemRead, 
MemWrite, RegWrite, MemToReg, ALUSrc, 
input [1:0] ALUOp, 
output [3:0] opcode , funct
);

reg[23:0] pc_initial; 
wire [23:0] pc3, pcbeq, pc_next; 
wire [23:0] instruction; 
wire [3:0] mux_regfile; 
wire[23:0] readData1, readData2, writeData,  
mux_ALU, ALU_Out, Zgjerimi, memToMux, 
beq_zgjerimi, branchAdderToMux, beqAddressp, beqAddressn, beqAddress;  
wire [3:0] ALUCtrl; 
wire zerof, overflow, carryout; 
wire andMuxBranch; 
wire pc_cout1, pc_cout2, pc_cout3;
wire [47:0] Multiply_result, MulRead;
wire MulRegWrite;

initial
begin
    pc_initial = 24'd10; //inicializimi fillesat i PC ne adresen 10
end

always@(posedge Clock)
begin
    pc_initial <= pc_next; //azhurimi i PC ne cdo teh pozitiv me adresen e ardhshme
    
end

PC_Adder pc1(pc_initial, 24'd3 , 1'b0, pc3, pc_cout1);

assign opcode = instruction[23:20]; 
assign funct = instruction[3:0]; 


assign beq_zgjerimi = {{12{instruction[11]}}, instruction[11:0]};
InstructionMemory IM(pc_initial, instruction); 

mux2ne1_4b r_or_ireg(instruction[15:12],instruction[11:8],RegDst, mux_regfile);

assign Zgjerimi = {{12{instruction[11]}}, instruction[11:0]};  

RegisterFile RF(instruction[19:16], instruction[15:12], mux_regfile, writeData, RegWrite, Clock, readData1, readData2 ); 

mux_for_mul mul(ALUCtrl[2:0], MulRegWrite);
MulRegFile MMulRegFileRF(Multiply_result, Clock,MulRegWrite, MulRead); 


mux2ne1_24b i_or_r( readData2, Zgjerimi, ALUSrc , mux_ALU);  

ALUControl AC(ALUOp,funct, ALUCtrl); 

ALU24 ALU(readData1, mux_ALU, ALUCtrl[3], ALUCtrl[2:0], instruction[7:4], zerof,ALU_Out,Multiply_result, overflow, carryout);

DataMemory DM(ALU_Out, readData2, MemWrite, MemRead, Clock, memToMux);

mux2ne1_24b mem_or_alu( ALU_Out, memToMux, MemToReg , writeData);  
//assign writeData = (MemToReg == 1'b1) ? memToMux : ALU_Out;

assign andMuxBranch = zerof & Branch;

PC_Adder pc3_pozitiv(pc3, beq_zgjerimi, 1'b0,beqAddressp, pc_cout2);
PC_Adder pc3_negativ(pc3, ~beq_zgjerimi, 1'b1, beqAddressn, pc_cout3);

mux2ne1_24b up_or_down( beqAddressp, beqAddressn, beq_zgjerimi[23] , beqAddress);  

mux2ne1_24b beq_or_pc3( pc3, beqAddress, andMuxBranch, pc_next);  

endmodule
