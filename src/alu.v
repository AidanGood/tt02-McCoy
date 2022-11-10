/*
* Aidan Good
* alu.v
* The ALU. Only operation is addition currently. Expects only signed inputs.
*/

module alu(
	input [5:0] op1,
	input [5:0] op2,
	input aluFun,
	output [5:0] aluOut);

	
	
	always @(*) begin
	    case (aluFun)
	        1'b0: aluOut = op1 + op2;
	        1'b1: aluOut = ~op1;
	    endcase
    end
    
    //assign aluOut = op1 + op2;
	
	
endmodule


