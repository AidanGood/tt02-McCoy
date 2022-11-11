/*
* Aidan Good
* branch.v
* Logic for if the next PC is PC + 1 or PC + alu output
*/

module branch(
    input [5:0] x8,
    input bez,
    input ja,
    input reset,
    output reg pcSel);
    
    always @(*) begin
        if (reset) pcSel = 1;
        else if (ja) pcSel = 0;
        else if (bez) begin
            pcSel = (x8 == 8'd0) ? 0 : 1;
        end
        else pcSel = 1;
    end
endmodule    
