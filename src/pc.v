/*
* Aidan Good
* pc.v
* PC register and reset logic
*/

module pc(
    input [5:0] nextPC,
    input clk,
    input reset,
    output reg [5:0] PC);
    
    always @(negedge clk) begin
        if (reset) 
            PC <= 6'd0;
        else
            PC <= nextPC;
    end
endmodule
        
