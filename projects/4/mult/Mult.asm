// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

// TODO Challenges:
// Make it more efficient by looping the fewer number of times
// Pass in a function bit, and do add / subtract / multiply / divide (calculator)

// Reset R2
@R2
M=0
// Load R0 
@R0
D=M
// i = R0 
@i
M=D
// If i = 0, jump to END
@END
D;JEQ
// Now we want to take the value of R1, and add it to itself
(LOOP)
@R1
D=M
// Add it to the sum
@R2
D=D+M
M=D
// Decrement i
@i
D=M-1
M=D
// If i=0, jump to END 
@i
D=M
@END
D;JEQ
// Loop
@LOOP
0;JMP
// End of program
(END)
@END
0;JMP
