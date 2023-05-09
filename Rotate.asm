(CHECKROT)
@4
D=M
@STOP
D;JEQ // Jump to the end if we have shifted the number of times we need to
@3 // Check if the first bit is 1
D=M
@ZERO
D;JGT // Jump if the first bit is 0
@3 // If the first bit is 1, shift left and add 1
D=M
D=D+M
D=D+1
M=D
@4
M=M-1
D=M
@CHECKROT
0;JMP
(ZERO) // If the first bit is 0, shift left
@3
D=M
D=D+M
M=D
@4
M=M-1
D=M
@CHECKROT
0;JMP
(STOP) // End of the program
@3
D=M
@5
M=D
(END)
@END
0;JMP