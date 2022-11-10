![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg)

# The McCoy 6-bit Custom Microprocessor 

With design inspirations from the RISC-V ISA and [Zinnia](https://github.com/cpldcpu/tinytapeout_mcpu5) microprocessor.


## Overview of Architecture

A RISC 6-bit CPU based on the Harvard Architecture. 7 instructions, 9 registers. Register x0 is always 0, registers x1 through x7 are general purpose, and register x8 is a special function register and output. All instructions have fixed length opcodes. No overflow 

The 8 input bits:
 - The clock signal
 - The reset signal
 - 6 remaining bits for the instruction

The 8 output bits:
 - When clock is high, output is PC
 - When clock is low, output is x8

