/*
* Aidan Good
* add1.v
* takes input and outputs input + 1
*/

module add1(
    input [7:0] in,
    output reg [7:0] out);
    
    always @(*) begin
        out = in + 1;
    end
endmodule
