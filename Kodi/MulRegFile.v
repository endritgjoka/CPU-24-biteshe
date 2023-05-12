`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2022 11:28:30 AM
// Design Name: 
// Module Name: RegisterFile
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


module MulRegFile(

input wire[47:0] WriteData,
input wire Clock,
input MulRegWrite,
output wire[47:0] ReadRata
);
    
reg[47:0] Register;


initial 
begin
   Register <= 48'd0; 
end
 


//Shkruaj ne regjister
always @(posedge Clock)
begin
Register <= WriteData;
end

//Lexo regjistrin ReadData
assign ReadRata = Register;


endmodule