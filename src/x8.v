/*
* Aidan Good
* x8.v
* This impliments the x8 register
*/

module x8(
    input [5:0] newx8,
    input writex8,
    output reg [5:0] x8);
    
    always @(*) begin
        if (writex8) begin
            x8 = newx8;
        end
        else x8 = x8;
    end
endmodule 
