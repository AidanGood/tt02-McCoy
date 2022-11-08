/*
* Aidan Good
* alu.v
* The ALU. Only operation is addition currently. Expects only signed inputs.
*/

module alu(
	input [7:0] op1,
	input [7:0] op2,
	output reg [7:0] aluOut);

	
	always @(*) begin
		aluOut = op1 + op2;
	end
	
endmodule


