/*
* Aidan Good
* iSign.v
* This module is for not(x8).
*/


module notx8(
    input [5:0] x8,
    output [5:0] out);

    assign out = ~x8;

endmodule

