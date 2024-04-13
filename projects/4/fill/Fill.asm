// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// Start loop
(LOOP)

// Monitor keyboard input
  @KBD
  D=M

// If keyboard input = 0, set fillValue to be 0
@CLEAR
  D;JEQ

// Otherwise set fillValue to black (-1)
  @fillValue
  M=-1
  @FILL
  0;JMP

// Set fillValue to white (0)
(CLEAR)
  @fillValue
  M=0
  @FILL
  0;JMP

// Fill screen with selected colour 
(FILL)
// Set up a pointer variable
  @SCREEN
  D=A
  @screenpointer
  M=D

// Set up a loop count variable
  @8192
  D=A
  @loopcount
  M=D

// Variable to keep track of count
  @count
  M=0

// Go to the memory at the address of screenpointer, and set that memory to 1
(FILL_LOOP)

  @fillValue
  D=M
  @screenpointer
  A=M
  M=D

// Increment screenpointer by 1
  @screenpointer
  M=M+1

// Increment count by 1
  @count
  M=M+1

// If loopcount - count = 0, jump to end 
  @loopcount
  D=M
  @count
  D=D-M
  @LOOP
  D;JEQ

// Otherwise, continue looping
  @FILL_LOOP
  0;JMP

// Go to loop
  0;JMP
  @LOOP
