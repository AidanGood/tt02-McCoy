![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg)

# The McCoy 8-bit Custom Microprocessor 

With design inspirations from the RISC-V ISA and [Zinnia](https://github.com/cpldcpu/tinytapeout_mcpu5) microprocessor.

Created over a 2 week period for submission into the Tiny Tapeout 2 Program, which has the following restrictions:

 - Die area is 150 x 170 µm using the Skywater 130nm node.
 - Limited to 8 digital input and 8 digital output signals.

## Overview 

A RISC 8-bit custom CPU. 7 instructions, 10 registers. Register x0 is always 0, registers x1 through x7 are general purpose, register x8 is a special function register and output, final register holds PC. All instructions have fixed length opcodes. Currently there is no method to detect overflow, which would require an additional instruction like RISC-V's sli. 

The 8 input bits:
 - The clock signal
 - The reset signal
 - 6 remaining bits for the instruction

The 8 output bits:
 - When clock is high, output is PC
 - When clock is low, output is x8
 - The two MSB bits are unused since the processor output is 6-bits.

![circuit diagram](./McCoy_Diagram.png)

## Instruction Set Architecture

Since two of the inputs are used for the clock and reset, that leaves us with 6 bits for instructions. 8 max instructions and 8 addressable registers or 3-bit immediate values seemed like the most balanced choice, so instructions are broken into the following 3 types:

| Type |  |  |
|---|---|---|
| I | 3 Immediate bits | 3 Opcode bits |
| R | 3 Register bits | 3 Opcode bits |
| X | 3 Don't Cares | 3 Opcode bits |

The 3 register bits in R-type instructions can access registers x0 through x7.

The 3 immediate bits in I-type instructions will be interperted as a 2's compliment number, and will be sign extended to 6-bits. This limits inputs to the range -4 to 3, but the full -128 to 127 integer range can be achieved with repeat add instructions.

Here are 7 implimented instructions, their encoding, and their operation:

| Mnemonic | Reg/Imm | Opcode | Instruction | Operation |
| ---      |---|---|---|---|
| li | i i i | 000 | Load Immediate to x8 | x8 = imm |
| add | r r r | 001 | Add Register to x8 | x8 = x8 + reg |
| bez | r r r | 010 | Branch if x8 = 0 | PC = (x8 == 0) ? PC + reg : PC + 1 |
| lr | r r r | 011 | Load Register to x8 | x8 = reg |
| sr | r r r | 100 | Store x8 to Register | reg = x8 |
| ja | x x x | 101 | Jump by x8 | PC = PC + x8 |
| not | x x x | 110 | Not x8 | x8 = ~x8 |

I wanted to stick with organized fixed-length opcodes (like RISC-V) even though if I had gone with variable length ones I would have been able to access more registers or larger immediates in some instructions. Fixed-length opcodes and organized instruction encoding is just plain simple and easy to work with.

## Special Case Registers (x0, x8, PC)

Like the RISC-V ISA, the x0 register is always going to contain the number 0. In this design it is safe to try to write another number to the x0 register, nothing will happen. Any read from the x0 register will return 0.

The PC register, since it is 8 bits, allows for programs of up to 2^8 = 128 instructions long. The only way to manually change the PC is through reset, which will set it back to 0, or through ja and bez. Otherwise it will increment by 1 each clock cycle.

The x8 register is very similar to the Accumulator from the [Zinnia](https://github.com/cpldcpu/tinytapeout_mcpu5) microprocessor. This register is necessary because the limited instruction length means instructions can only access one register. To get around this limitation, x8 acts as either a default source register (sr, not, jump, add, bez) or a default destination register (add, li, lr, not). 

## Final Thoughts and Comments

For something I spent 1 week designing the ISA and drawing circuit diagrams, and 1 week writing and debugging and optimizing the verilog to fit within the tight constraints, I think it turned out okay. 

The not instruction was originally going to be an ALU operation, but the gds tests were unable to successfully fit the design that way before the total die area was increased from 100 x 100 µm. I ended up copying what I had done to impliment pc+1, and make not its own module outside the ALU and add a 4-input mux. When the die area got increasaed, I figured why fix something that isn't broken so left it as is. 

