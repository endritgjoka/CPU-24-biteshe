`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2022 12:13:15 PM
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
input wire[23:0] Address,
input wire[23:0] WriteData,
input wire MemWrite,
input wire MemRead,
input wire Clock,
output wire[23:0] ReadData
);

reg[7:0] dataMem[127:0];

wire [23:0] pcadress1,pcadress2;
wire cout1, cout2;

initial
$readmemb("dataMemory.mem", dataMem);

PC_Adder p1(Address, 24'd1, 1'b0, pcadress1, cout1);
PC_Adder p2(Address, 24'd2, 1'b0, pcadress2, cout2);

always@(posedge Clock)
begin
    if(MemWrite) 
        begin
            //bigEndian
            dataMem[Address] <= WriteData[23:16];
            dataMem[pcadress1] <= WriteData[15:8];
            dataMem[pcadress2] <= WriteData[7:0];
           end
end

always@(negedge Clock)
begin
$writememb("dataMemory.mem", dataMem);
end

 
 assign ReadData[23:16] = dataMem[Address];
 assign ReadData[15:8] = dataMem[pcadress1];
 assign ReadData[7:0] = dataMem[pcadress2];



endmodule
