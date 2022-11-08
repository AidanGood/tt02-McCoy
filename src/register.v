/*
* Aidan Good
* register.v
* This impliments the x0 - x7 registers in the cpu. Note x0 is always 0
*/

module register(
    input clk,
    input reset,
    input [2:0] regAddr,
    input [7:0] x8,
    input writeReg,
    output reg [7:0] out);

    // 8 registers 8 bits each
    reg [7:0] registers [7:0];
    //reg [7:0] tempWrite;


    // At clk edge if write enabled, write what's in x8 to requested register. keep x0 = 0	
    always @(negedge clk) begin
	if (writeReg == 1) begin
	    if (regAddr != 3'd0) 
		registers[regAddr] <= x8;
	    else
		registers[0] <= 32'b0;
	end
	registers[0] <= 32'b0;
    end

    // Output requested reg always
    always @(*) begin
	out = registers[regAddr];
    end
endmodule

