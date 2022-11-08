/*
* Aidan Good
* branch.v
* Logic for if the next PC is +1 or from alu
*/

module branch(
    input [7:0] x8,
    input bez,
    input ja,
    output reg pcSel);
    
    always @(*) begin
        if (ja == 1) pcSel = 0;
        else if (bez == 1) begin
            pcSel = (x8 == 8'd0) ? 1 : 0;
        end
        else pcSel = 0;
    end
endmodule    
