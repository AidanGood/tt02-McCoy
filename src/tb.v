`default_nettype none
`timescale 1ns/1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

module tb (
    // testbench is controlled by test.py
    input clk,
    input reset,
    input [5:0] instr,
    output [8:0] data_out);

    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
    end


    wire [7:0] inputs = {clk, reset, instr};
    wire [7:0] outputs;
    assign data_out = outputs;
    
    
    aidan_McCoy McCoy( .io_in(inputs), .io_out (outputs));

endmodule
