/*
* Aidan Good
* mcCoy.v
* top level module for the McCoy microprocessor
*/

`default_nettype none

module aidan_McCoy(
    input [7:0] io_in,
    output reg [7:0] io_out);

    // map i/o to proper labels
    wire clk = io_in[7];
    wire reset = io_in[6];
    wire [5:0] instr = io_in[5:0];
    // opcode instr[2:0]
    // reg or imm instr[5:3]
    
    // decode signals
    wire bez;
    wire ja;
    wire op1Sel;
    wire [1:0] op2Sel;
    wire writeReg;
    wire writex8;
    wire [1:0] x8Sel;
    
    // Other wires
    wire [7:0] pc;
    wire [7:0] pc1;
    wire [7:0] nextPC;
    wire pcSel;
    wire [7:0] aluOut;
    wire [7:0] x8;
    wire [7:0] newx8;
    wire [7:0] op1;
    wire [7:0] op2;
    wire [7:0] regOut;

    decoder decoderBlock( .opcode(instr[2:0]), .bez(bez), .ja(ja), .op1(op1Sel), .op2(op2Sel),
                            .writeReg(writeReg), .writex8(writex8), .x8Sel(x8Sel));
    
    /* PC related blocks */
    
    mux2 pcMux( .in0(aluOut), .in1(pc1), .sel(pcSel), .out(nextPC));
    
    pc pcBlock( .clk(clk), .reset(reset), .nextPC(nextPC), .PC(pc));
    
    add1 adder( .in(pc), .out(pc1));
    
    branch branchBlock( .x8(x8), .bez(bez), .ja(ja), .reset(reset), .pcSel(pcSel));
    
    /* ALU blocks */
    
    mux2 op1Mux( .in0({5'd0, instr[5:3]}), .in1(x8), .sel(op1Sel), .out(op1));
    
    mux3 op2Mux( .in0(regOut), .in1(pc), .in2(8'hff), .sel(op2Sel), .out(op2));
    
    alu aluBlock( .op1(op1), .op2(op2), .aluOut(aluOut));
    
    /* x8 and other register blocks */
    
    register regBlock( .clk(clk), .reset(reset), .regAddr(instr[5:3]), .x8(x8), .writeReg(writeReg),
                        .out(regOut));
                        
    x8 x8Block( .writex8(writex8), .newx8(newx8), .x8(x8));
    
    mux3 x8Mux( .in0(regOut), .in1({5'd0, instr[5:3]}), .in2(aluOut), .sel(x8Sel), .out(newx8));
    
    always @(posedge clk) begin
        io_out <= pc;
    end
    
    always @(negedge clk) begin
        io_out <= x8;
    end
    
endmodule
    
