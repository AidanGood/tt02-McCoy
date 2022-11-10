`default_nettype none
`timescale 1ns/1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

module tb(
    // testbench is controlled by test.py
    );

    
    reg clk = 0;
    reg reset = 0;
    reg [5:0] instr = 6'd0;
    
    wire [7:0] inputs = {clk, reset, instr};
    wire [7:0] outputs;
    
    
    aidan_McCoy McCoy( .io_in(inputs), .io_out (outputs));
    
    always #1 clk = ~clk;

    // Test program covering instructions
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1
        reset = 1;
        #2
        reset = 0;
        instr = 6'b011001; // 3 li
        #2
        instr = 6'b010110; // x2 sr 
        #2
        instr = 6'b100001; // -1 li
        #2
        instr = 6'b010100; // x2 lr
        #2
        instr = 6'b000100; // x0 lr
        #2
        instr = 6'b010011; // x2 add
        #2 
        instr = 6'b000011; // x0 add
        #2
        instr = 6'b000001; // 0 li
        #2
        instr = 6'b011000; // 3 bez
        #2
        instr = 6'b011010; // ja
        #2
        $finish;
    end

endmodule
