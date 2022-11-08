/*
* Aidan Good
* pc.v
* PC register and reset logic
*/

module pc(
    input [7:0] nextPC,
    input clk,
    input reset,
    output reg [7:0] PC);
    
    always @(negedge clk or posedge reset) begin
        if (reset) 
            PC <= 8'd0;
        else
            PC <= nextPC;
    end
endmodule
        
