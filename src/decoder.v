/*
* Aidan Good
* decoder.v
* This creates the control signals from the opcode
*/

module decoder(
	input [2:0] opcode,
	output reg bez,
	output reg ja,
	output reg op1,
	output reg [1:0] op2,
	output reg writeReg,
	output reg writex8,
	output reg [1:0] x8Sel);

	always @(*) begin
		case(opcode)
            // bez (branch equal zero)
            3'b000: begin
                bez = 1;
                ja = 0;
                op1 = 0;
                op2 = 1;
                writeReg = 0;
                writex8 = 0;
                x8Sel = 0;
            end
            // li (load immediate)
            3'b001: begin
                bez = 0;
                ja = 0;
                op1 = 0;
                op2 = 0;
                writeReg = 0;
                writex8 = 1;
                x8Sel = 1;
            end
            // ja (jump unconditional)
            3'b010: begin
                bez = 0;
                ja = 1;
                op1 = 1;
                op2 = 1;
                writeReg = 0;
                writex8 = 0;
                x8Sel = 0;
            end
            // add
            3'b011: begin
                bez = 0;
                ja = 0;
                op1 = 0;
                op2 = 0;
                writeReg = 0;
                writex8 = 1;
                x8Sel = 1;
            end
            // lr (load register)
            3'b100: begin
                bez = 0;
                ja = 0;
                op1 = 0;
                op2 = 0;
                writeReg = 0;
                writex8 = 1;
                x8Sel = 0;
            end
            // not
            3'b101: begin
                bez = 0;
                ja = 0;
                op1 = 1;
                op2 = 0;
                writeReg = 0;
                writex8 = 1;
                x8Sel = 2;
            end 
            // sr (store register)
            3'b110: begin
                bez = 0;
                ja = 0;
                op1 = 0;
                op2 = 0;
                writeReg = 1;
                writex8 = 0;
                x8Sel = 0;
            end
        endcase
    end
endmodule



