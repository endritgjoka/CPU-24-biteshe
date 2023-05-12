module mux5ne1(
    input Hyrja0,
    input Hyrja1,
    input Hyrja2,
    input Hyrja3,
    input Hyrja4,
    input [2:0] S,
    output reg Dalja
    );    
  
//   assign Dalja = S[2] ? (S[1] ? (S[0] ? Hyrja7 : Hyrja6) : (
//     S[0] ? Hyrja5 : Hyrja4)) : (S[1] ? (S[0] ? Hyrja3 : Hyrja2): (S[0] ? Hyrja1: Hyrja0));

  always @* begin
        case (S)
            3'b000:  Dalja = Hyrja0;
            3'b001:  Dalja = Hyrja1;
            3'b010:  Dalja = Hyrja2;
            3'b011:  Dalja = Hyrja3;
            3'b101:  Dalja = Hyrja4;

        endcase
    end

endmodule