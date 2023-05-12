module mux_for_mul(
    input [2:0] Op,
    output reg MulRegWrite
);

always@* begin
        case (Op)
            3'b100:  MulRegWrite = 1'b1;
            
        default : MulRegWrite = 1'b0;
        endcase
    end

endmodule