/*
* Aidan Good
* iSign.v
* This module is for sign-extending the immediate value in the instruction.
*/


module iSign(
    input [2:0] imm,
    output [7:0] out);

    assign out = imm[2] ? {5'b11111, imm} : {5'b00000, imm};

endmodule

