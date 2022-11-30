/*
* Aidan Good
* alu.v
* The ALU. Only operation is addition currently.
*/

module alu(
	input [7:0] op1,
	input [7:0] op2,
	output [7:0] aluOut);
    
    assign aluOut = op1 + op2;
	

	
endmodule


