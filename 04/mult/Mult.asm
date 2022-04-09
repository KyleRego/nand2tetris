// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// 	Pseudocode
// 	Set counter equal to 0
// 	Set R2 equal to 0
// 	LOOP:
//   	If counter == R1 goto END
//		Set the value of R2 equal to R2 plus R0
//		Increment counter
//		goto LOOP
// 	END:
//		
// Set counter equal to 0
	@0
	D=A
	@counter
	M=D
// Set R2 equal to 0
	@0
	D=A
	@R2
	M=D
(LOOP)
// If counter == R1 goto END
	@counter
	D=M
	@R1
	D=D-M
	@END
	D;JEQ
// Set the value of R2 equal to R2 plus R0
	@R0
	D=M
	@R2
	M=D+M
// Increment counter
	@counter
	M=M+1
// goto LOOP
	@LOOP
	0;JMP
(END)
	@END
	0;JMP
