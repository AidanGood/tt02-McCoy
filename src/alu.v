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
    
    assign aluOut = op1 + op2;
	
	//assign aluOut = (aluFun) ? ~op1 : (op1 + op2);
	
endmodule


