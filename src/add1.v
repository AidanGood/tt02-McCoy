/*
* Aidan Good
* add1.v
* takes input and outputs input + 1
*/

module add1(
    input [7:0] in,
    output [7:0] out);
    
    
    assign out = in + 1;
    
endmodule
