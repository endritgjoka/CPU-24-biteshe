`timescale 1ns / 1ps



module PC_Adder(
    input [23:0] pc,
    input [23:0] pc_increment,
    input CIN,
    output [23:0] shuma,
    output COUT
    );

 wire bartja[22:0];
 
 Mbledhesi_1b m0(pc[0], pc_increment[0], CIN, shuma[0], bartja[0]);
 Mbledhesi_1b m1(pc[1], pc_increment[1], bartja[0], shuma[1], bartja[1]);
 Mbledhesi_1b m2(pc[2], pc_increment[2], bartja[1], shuma[2], bartja[2]);
 Mbledhesi_1b m3(pc[3], pc_increment[3], bartja[2], shuma[3], bartja[3]);
 Mbledhesi_1b m4(pc[4], pc_increment[4], bartja[3], shuma[4], bartja[4]);
 Mbledhesi_1b m5(pc[5], pc_increment[5], bartja[4], shuma[5], bartja[5]);
 Mbledhesi_1b m6(pc[6], pc_increment[6], bartja[5], shuma[6], bartja[6]);
 Mbledhesi_1b m7(pc[7], pc_increment[7], bartja[6], shuma[7], bartja[7]);
 Mbledhesi_1b m8(pc[8], pc_increment[8], bartja[7], shuma[8], bartja[8]);
 Mbledhesi_1b m9(pc[9], pc_increment[9], bartja[8], shuma[9], bartja[9]);
 Mbledhesi_1b m10(pc[10], pc_increment[10], bartja[9], shuma[10], bartja[10]);
 Mbledhesi_1b m11(pc[11], pc_increment[11], bartja[10], shuma[11], bartja[11]);
 Mbledhesi_1b m12(pc[12], pc_increment[12], bartja[11], shuma[12], bartja[12]);
 Mbledhesi_1b m13(pc[13], pc_increment[13], bartja[12], shuma[13], bartja[13]);
 Mbledhesi_1b m14(pc[14], pc_increment[14], bartja[13], shuma[14], bartja[14]);
 Mbledhesi_1b m15(pc[15], pc_increment[15], bartja[14], shuma[15], bartja[15]);
 Mbledhesi_1b m16(pc[16], pc_increment[16], bartja[15], shuma[16], bartja[16]);
 Mbledhesi_1b m17(pc[17], pc_increment[17], bartja[16], shuma[17], bartja[17]);
 Mbledhesi_1b m18(pc[18], pc_increment[18], bartja[17], shuma[18], bartja[18]);
 Mbledhesi_1b m19(pc[19], pc_increment[19], bartja[18], shuma[19], bartja[19]);
 Mbledhesi_1b m20(pc[20], pc_increment[20], bartja[19], shuma[20], bartja[20]);
 Mbledhesi_1b m21(pc[21], pc_increment[21], bartja[20], shuma[21], bartja[21]);
 Mbledhesi_1b m22(pc[22], pc_increment[22], bartja[21], shuma[22], bartja[22]);
 Mbledhesi_1b m23(pc[23], pc_increment[23], bartja[22], shuma[23], COUT);    
    
endmodule