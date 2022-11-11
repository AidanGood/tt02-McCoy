`default_nettype none
`timescale 1ns/1ps

/*
This is the addition/subtraction testbench. It tests the following aspects of the processor:
 - add, li, sr, not instructions
 - signed numbers 
*/

module tb(
    // testbench is controlled by test.py
    );

    
    reg clk = 0;
    reg reset = 0;
    reg [5:0] instr = 6'd0;
    
    wire [7:0] inputs = {instr, reset, clk};
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
        $display("Begin testing addition with out not. 2 + 3 and 2 + -4");
        instr = 6'b011001; // 3 li
        #2
        instr = 6'b010110; // x2 sr 
        #2
        instr = 6'b100001; // -4 li
        #2
        instr = 6'b011110; // x3 sr
        #2
        instr = 6'b010001; // 2 li
        #2
        instr = 6'b010011; // x2 add
        #1
        $display("Expected value: 2 + 3 = 5. Output: %d", outputs[5:0]); 
        #1 
        instr = 6'b010001; // 2 li
        #2
        instr = 6'b011011; // x3 add
        #2
        $display("Expected value: 2 + -4 = -2. Output: %d", $signed(outputs[5:0])); 
        $display("Begin testing addition with not. 3 - 12");
        #2
        instr = 6'b011001; // 3 li
        #2
        instr = 6'b001110; // x1 sr
        #2
        instr = 6'b001011; // x1 add
        #2
        $display("Expected value: 3 + 3 = 6. Output: %d", $signed(outputs[5:0])); 
        instr = 6'b001011; // x1 add
        #2
        $display("Expected value: 3 + 6 = 9. Output: %d", $signed(outputs[5:0])); 
        instr = 6'b001011; // x1 add
        #2
        $display("Expected value: 3 + 9 = 12. Output: %d", $signed(outputs[5:0])); 
        instr = 6'b001111; // not
        #2
        $display("Expected value: !12 = -13. Output: %d", $signed(outputs[5:0])); 
        instr = 6'b001110; // x1 sr
        #2
        instr = 6'b001001; // 1 li
        #2
        instr = 6'b001011; // x1 add
        #2
        $display("Expected value: 1 + -13 = -12. Output: %d", $signed(outputs[5:0])); 
        instr = 6'b001110; // x1 sr
        #2
        instr = 6'b011001; // 3 li
        #2
        instr = 6'b001011; // x1 add
        #2
        $display("Expected value: 3 + -12 = -9. Output: %d", $signed(outputs[5:0])); 
        $finish;
    end

endmodule
