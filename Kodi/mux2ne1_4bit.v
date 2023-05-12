module mux2ne1_4b(
    input [3:0] Hyrja0,
    input [3:0] Hyrja1,
    input  S,
    output reg [3:0]  Dalja
    );    

  //assign Dalja = S ? ; Hyrja1 : Hyrja0;

always@* begin
        case (S)
            1'b0:  Dalja = Hyrja0;
            1'b1:  Dalja = Hyrja1;
        endcase
    end

  endmodule