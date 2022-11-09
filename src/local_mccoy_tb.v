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
    
    
    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1
        reset = 1;
        clk = 1;
        #1
        clk = 0;
        #1
        clk = 1;
        reset = 0;
        #1
        instr = 6'b011001;
        clk = 0;
        #1
        clk = 1;
        #1
        clk = 0;
        #1
        clk = 1;
        #1
        $finish;
    end

endmodule
