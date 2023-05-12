`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2022 05:25:23 PM
// Design Name: 
// Module Name: ALU32
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


module ALU24(
    input [23:0] A,
    input [23:0] B,
    input BNegate,
    input [2:0] Op,
    input [3:0] shiftAmount,
    output Zero,
    output [23:0] Result_final,
    output [47:0] Mul_result,
    output Overflow,
    output CarryOut
    );
    
    wire [22:0] COUT;
    wire [23:0] result;
    wire [23:0] SLLt;
    wire [47:0] mul;
    wire [23:0] resforslt;
  
    PC_Adder pcforslt(A, ~B, 1'b1, resforslt,  carryout);
  
    SLL sll( A, B, shiftAmount, SLLt);
    MUL mul_result(A, B, mul);


  
    ALU1 ALU0(A[0], B[0], BNegate, BNegate, resforslt[23], Op, result[0], COUT[0]);
    ALU1 ALU1(A[1], B[1], COUT[0], BNegate, 0, Op, result[1], COUT[1]);
    ALU1 ALU2(A[2], B[2], COUT[1], BNegate, 0, Op, result[2], COUT[2]);
	  ALU1 ALU3(A[3], B[3], COUT[2], BNegate, 0, Op, result[3], COUT[3]);
    ALU1 ALU4(A[4], B[4], COUT[3], BNegate, 0, Op, result[4], COUT[4]);
    ALU1 ALU5(A[5], B[5], COUT[4], BNegate, 0, Op, result[5], COUT[5]);
    ALU1 ALU6(A[6], B[6], COUT[5], BNegate, 0, Op, result[6], COUT[6]);
    ALU1 ALU7(A[7], B[7], COUT[6], BNegate, 0, Op, result[7], COUT[7]);
    ALU1 ALU8(A[8], B[8], COUT[7], BNegate, 0, Op, result[8], COUT[8]);
    ALU1 ALU9(A[9], B[9], COUT[8], BNegate, 0, Op, result[9], COUT[9]);
    ALU1 ALU10(A[10], B[10], COUT[9], BNegate, 0, Op, result[10], COUT[10]);
    ALU1 ALU11(A[11], B[11], COUT[10], BNegate, 0, Op, result[11], COUT[11]);
    ALU1 ALU12(A[12], B[12], COUT[11], BNegate, 0, Op, result[12], COUT[12]);
    ALU1 ALU13(A[13], B[13], COUT[12], BNegate, 0, Op, result[13], COUT[13]);
    ALU1 ALU14(A[14], B[14], COUT[13], BNegate, 0, Op, result[14], COUT[14]);
    ALU1 ALU15(A[15], B[15], COUT[14], BNegate, 0, Op, result[15], COUT[15]);
    ALU1 ALU16(A[16], B[16], COUT[15], BNegate, 0, Op, result[16], COUT[16]);
    ALU1 ALU17(A[17], B[17], COUT[16], BNegate, 0, Op, result[17], COUT[17]);
    ALU1 ALU18(A[18], B[18], COUT[17], BNegate, 0, Op, result[18], COUT[18]);
    ALU1 ALU19(A[19], B[19], COUT[18], BNegate, 0, Op, result[19], COUT[19]);
    ALU1 ALU20(A[20], B[20], COUT[19], BNegate, 0, Op, result[20], COUT[20]);
    ALU1 ALU21(A[21], B[21], COUT[20], BNegate, 0, Op, result[21], COUT[21]);
    ALU1 ALU22(A[22], B[22], COUT[21], BNegate, 0, Op, result[22], COUT[22]);
    ALU1 ALU23(A[23], B[23], COUT[22], BNegate, 0, Op, result[23], CarryOut);


 assign Zero = ~(result[0] | result[1] | 
                result[2] | result[3] | 
                result[4] | result[5] | 
                result[6] | result[7] | 
                result[8] | result[9] | 
                result[10] | result[11] | 
                result[12] | result[13] | 
                result[14] | result[15] | 
                result[16] | result[17] | 
                result[18] | result[19] | 
                result[20] | result[21] | 
                result[22] | result[23] ); 
                    
  assign Overflow = COUT[22] ^ CarryOut;
  

  mux3ne2_24b muxikryesor(result,mul,  SLLt, Op, Result_final, Mul_result);

    
endmodule