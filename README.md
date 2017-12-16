# NYU_EL6463AHD_FinalProject
Advanced Hardware Design

There is an instruction memory in the processor. Each instruction has 32 bits. It indicates the processor what to do in the current clock cycle. Every instruction should be done in one clock period.
 
There are 3 types of instructions. (a) R-Type for arithmetic instructions, (b) I-Type for immediate value operations, load and store instructions, and (c) J-Type for jump instructions. 

Figure 1.1 Instruction types

And here is the schematic provided in the project description. It introduces the way of connecting different components. It is worth noting that it uses 8-bit instructions which is different in the project. So, we must change or delete some parts, such as PCplus4 and left rotate by 2. 

