// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Pseudocode
// START:
// if a key is pressed goto FILLSCREEN
// make the screen white
// goto START
// FILLSCREEN:
// n = 0
// LOOP:
// if n == 8192 goto START
// *(SCREEN + n) = -1
// increment n by 1
// goto LOOP
(START)
	// if a key is pressed go to FILLSCREEN
	@KBD
	D=M
	@FILLSCREEN
	D;JGT

	// make the screen white
	@KBD
	D=M
	@EMPTYSCREEN
	D;JEQ

	// goto START
	@START
	0;JEQ
(FILLSCREEN)
	// n = 0
	@n
	M=0
(LOOP)
	// if 8192-n=0 then goto start
	@n
	D=M
	@8192
	D=A-D
	@START
	D;JEQ
	// *(SCREEN + n)=-1
	@SCREEN
	D=A
	@n
	A=D+M
	M=-1
	// increment n by 1
	@1
	D=A
	@n
	M=D+M
	@LOOP
	0;JEQ
(EMPTYSCREEN)
	// nwhite = 0
	@nwhite
	M=0
(LOOP2)
	// if 8192-nwhite=0 then goto start
	@nwhite
	D=M
	@8192
	D=A-D
	@START
	D;JEQ
	// *(SCREEN + nwhite)=0
	@SCREEN
	D=A
	@nwhite
	A=D+M
	M=0
	// increment nwhite by 1
	@1
	D=A
	@nwhite
	M=D+M
	@LOOP2
	0;JEQ