`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2021 05:06:18 PM
// Design Name: 
// Module Name: RegisterFile_Test
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


module RegisterFile_Test();

reg[3:0] RS, RT, RD;
reg RegWrite, Clock;
reg[23:0] WriteData;
wire[23:0] ReadRS, ReadRT;

initial
begin
#0 Clock=1'b0;
#10 RD=4'd8; WriteData = 24'd4; RegWrite=1'b1;
#10 Clock=1'b1;
#10 Clock=1'b0;RegWrite = 1'b1;
#10 RD=4'd9; WriteData = 24'd2; RegWrite=1'b1;
#10 Clock=1'b1;
#10 Clock=1'b0; RegWrite=0;
#10 RS=4'd8; RT=4'd9;
#10 $stop;


end
RegisterFile RF(RS, RT, RD, WriteData, RegWrite, Clock ,ReadRS, ReadRT);
endmodule
