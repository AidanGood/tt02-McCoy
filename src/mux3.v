/*
* Aidan Good
* mux2.v
* impliment a 3-input mux switch
*/

module mux3(
    input [5:0] in0,
    input [5:0] in1,
    input [5:0] in2,
    input [1:0] sel,
    output reg [5:0] out);

    always @(*) begin
        case(sel)
            2'b00: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
            2'b11: out = in2;
        endcase
    end
endmodule
