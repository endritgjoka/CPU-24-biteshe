module MulRegFile_test();
reg[47:0] WriteMul;
reg MulRegWrite, Clock;
wire[47:0] Readmul;

initial
begin
#0 Clock=1'b0;
#10 WriteMul = 48'd10; MulRegWrite=1'b1;
#10 Clock=1'b1;
#10 Clock=1'b0; MulRegWrite = 1'b1;
#10 WriteMul = 47'd8; MulRegWrite=1'b1;
#10 Clock=1'b1;
#10 Clock=1'b0; MulRegWrite=0;
#10 $stop;


end
MulRegFile MF(WriteMul, Clock,MulRegWrite, Readmul);
endmodule