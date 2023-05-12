module MUL(
  input [23:0] A,
  input [23:0] B,
  output [47:0] Mul_result
    );
  reg [47:0] MUL;
  reg [23:0] B_modified;
  reg [23:0] count;
always @*
begin
B_modified = B;
MUL = 0;
count = 24'd24;
if ((A!=0) && (B!=0))
while (count)
  begin
   MUL = {(({24{B_modified[0]}} & A) + MUL[47:24]),MUL[23:1]};
   B_modified = B_modified >> 1;
  count = count - 1;
end
end    
    
assign Mul_result = MUL;


endmodule