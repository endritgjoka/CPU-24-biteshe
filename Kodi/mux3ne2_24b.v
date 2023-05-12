module mux3ne2_24b(
    input [23:0] Hyrja0,
    input [47:0] Hyrja1,
    input [23:0] Hyrja2,
    input [2:0] S,
    output  reg[23:0] Dalja_nga_ALU,
    output  reg[47:0] Dalja_nga_MUL

    );    
  
    always@* begin
        case (S)
            3'b000:  
            begin 
            Dalja_nga_ALU = Hyrja0;
            Dalja_nga_MUL = 48'b0;
            end
            3'b001:  
            begin
            Dalja_nga_ALU = Hyrja0;
            Dalja_nga_MUL = 48'b0;
            end
            3'b010:  
            begin
            Dalja_nga_ALU = Hyrja0;
            Dalja_nga_MUL = 48'b0;
            end
            3'b011:  
            begin
            Dalja_nga_ALU = Hyrja0;
            Dalja_nga_MUL = 48'b0;
            end
            3'b100:  
            begin 
            Dalja_nga_MUL = Hyrja1;
            Dalja_nga_ALU = 24'b0;
            end
            3'b101:  
            begin
            Dalja_nga_ALU = Hyrja0;
            Dalja_nga_MUL = 48'b0;
            end
            3'b110:  
            begin
            Dalja_nga_ALU = Hyrja2;
            Dalja_nga_MUL = 48'b0;
            end

        endcase
    end


endmodule