![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg)

# The McCoy 6-bit Custom Microprocessor 

With design inspirations from the RISC-V ISA and [Zinnia](https://github.com/cpldcpu/tinytapeout_mcpu5) microprocessor.

Created over a 2 week period for submission into the Tiny Tapeout 2 Program, which has the following restrictions:

 - Die area is 100 µm² using the Skywater 130nm node. This gives an estimated average of 500 total gates that can fit on the die area.
 - Limited to 8 digital input and 8 digital output signals.

## Overview of Architecture

A RISC 6-bit CPU based on the Harvard Architecture. 7 instructions, 10 registers. Register x0 is always 0, registers x1 through x7 are general purpose, register x8 is a special function register and output, final register holds PC. All instructions have fixed length opcodes. Currently there is no method to detect overflow, which would require an additional instruction like RISC-V's sli. 

The 8 input bits:
 - The clock signal
 - The reset signal
 - 6 remaining bits for the instruction

The 8 output bits:
 - When clock is high, output is PC
 - When clock is low, output is x8
 - The two MSB bits are unused since the processor output is 6-bits.

TODO: Schematic of the microprocessor

## Instruction Set Architecture

Since two of the inputs are used for the clock and reset, that leaves us with 6 bits for instructions. 8 instructions and 8 addressable registers or 3-bit immediate values seemed like the most balanced choice, so instructions are broken into the following 3 types:

| I-Type | 3 Immediate bits | 3 Opcode bits |
| R-Type | 3 Register bits | 3 Opcode bits |
| X-Type | 3 Don't Cares | 3 Opcode bits |

Here are the instructions, their encoding, and their operation.

| Mnemonic | 5 | 4 | 3 | 2 | 1 | 0 | Instruction Description | Operation |
| bez | r | r | r | 0 | 0 | 0 | Branch if x8 = 0 | PC = (x8 == 0) ? PC + reg : PC + 1 |
| li | i | i | i | 0 | 0 | 1 | Load Immediate to x8 | x8 = imm |
| add | r | r | r | 0 | 1 | 1 | Add Register to x8 | x8 = x8 + reg |
| ja | x | x | x | 1 | 0 | 0 | Jump by x8 | PC = PC + x8 |
| lr | r | r | r | 1 | 0 | 1 | Load Register to x8 | x8 = reg |
| sr | r | r | r | 1 | 1 | 0 | Store x8 to Register | reg = x8 |
| not | x | x | x | 1 | 1 | 1 | Not x8 | x8 = ~x8 |

With these instructions addition, subtraction*, multiplication*, and division** can be executed on the processor. 
*these can be implimented with add, not, li, bez, lr, and sr instructions.
**division will truncate the remainder via repeated subtraction, and without an sli-like instruction this isn't really being done by the processor as you'll need to know in advance how many times to loop.

A No Op instruction is simply add x0
