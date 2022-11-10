/*
* Aidan Good
* add1.v
* takes input and outputs input + 1
*/

module add1(
    input [5:0] in,
    output [5:0] out);
    
    assign out = in + 1;
    
endmodule
