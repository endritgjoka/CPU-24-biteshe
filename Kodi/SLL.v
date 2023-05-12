module SLL(
    input [23:0] reg1,
    input [23:0] reg2,
    input [3:0] shiftAmount,
  output reg [23:0] Result
);

  wire [23:0] value_of_shift, resforsll;
  wire [23:0] extend_shamt, result;
  wire COUT1;
  //wire COUT2;
  assign extend_shamt = {20'b0, shiftAmount[3:0]};
 
// reg [23:0] my_reg;
//initial begin
//    my_reg = 24'd24;  
//end

  PC_Adder value_shift(reg2, extend_shamt, 1'b0, value_of_shift, COUT1);
  //PC_Adder value(value_of_shift, ~ my_reg, 1'b1, resforsll, COUT2);
  
//   assign result = reg1 << value_of_shift;
      
//  mux2ne1_24b muxi(24'b0, result, resforsll[23], Result);

always@* begin
        case (value_of_shift)
            24'd0:  
              Result = reg1;
            24'd1:  
              Result = {reg1[22:0], 1'd0};
            24'd2:  
              Result = {reg1[21:0], 2'd0};
            24'd3:  
              Result = {reg1[20:0], 3'd0};
            24'd4:  
              Result = {reg1[19:0], 4'd0};
            24'd5:  
              Result = {reg1[18:0], 5'd0};
            24'd6:  
              Result = {reg1[17:0], 6'd0};
            24'd7:  
              Result = {reg1[16:0], 7'd0};
            24'd8:  
              Result = {reg1[15:0], 8'd0};
            24'd9:  
              Result = {reg1[14:0], 9'd0};
            24'd10:  
             Result = {reg1[13:0], 10'd0};
              24'd11:  
             Result = {reg1[12:0], 11'd0};
            24'd12:  
            Result = {reg1[11:0], 12'd0};
             24'd13:  
            Result = {reg1[10:0], 13'd0};
             24'd14:  
            Result = {reg1[9:0], 14'd0};
             24'd15:  
            Result = {reg1[8:0], 15'd0};
             24'd16:  
            Result = {reg1[7:0], 16'd0};            
             24'd17:  
            Result = {reg1[6:0], 17'd0};  
             24'd18:  
            Result = {reg1[5:0], 18'd0};  
             24'd19:  
            Result = {reg1[4:0], 19'd0};  
             24'd20:  
            Result = {reg1[3:0], 20'd0};  
             24'd21:  
            Result = {reg1[2:0], 21'd0}; 
             24'd22:  
            Result = {reg1[1:0], 22'd0};  
             24'd23:  
            Result = {reg1[0], 23'd0};   
             default: Result = 24'b0;                                       
        endcase
    end

  
  
endmodule 