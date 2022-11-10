/*
* Aidan Good
* iSign.v
* This module is for sign-extending the immediate value in the instruction.
*/


module iSign(
    input [2:0] imm,
    output [5:0] out);

    assign out = imm[2] ? {3'b111, imm} : {3'b000, imm};

endmodule

