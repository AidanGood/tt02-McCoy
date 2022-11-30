/*
* Aidan Good
* notx8.v
* This module is for not(x8) instruction.
*/


module notx8(
    input [7:0] x8,
    output [7:0] out);

    assign out = ~x8;

endmodule

