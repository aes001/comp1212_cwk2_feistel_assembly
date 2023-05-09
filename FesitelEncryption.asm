@4
D=A
@COUNT
M=D

@2
D=M
@3
M=D
@8
D=A
@4
M=D

(CHECKROT1) // ---- ROTATE ----
@4
D=M
@STOP1
D;JEQ // Jump to the end if we have shifted the number of times we need to
@3 // Check if the first bit is 1
D=M
@ZERO1
D;JGT // Jump if the first bit is 0
@3 // If the first bit is 1, shift left and add 1
D=M
D=D+M
D=D+1
M=D
@4
M=M-1
D=M
@CHECKROT1
0;JMP
(ZERO1) // If the first bit is 0, shift left
@3
D=M
D=D+M
M=D
@4
M=M-1
D=M
@CHECKROT1
0;JMP
(STOP1) // End of the program
@3
D=M
@5
M=D

@255
D=D&A
@LEFT
M=D

@2
D=M
@255
D=D&A
@RIGHT
M=D

@1
D=M
@KEY
M=D

(ENCRYPT)
@RIGHT
D=M
@TEMP
M=D
@KEY
D=M
D=!D
@255
D=D&A

@4
M=D
@RIGHT
D=M
@3
M=D

@3 // -------- XOR --------
D=M
@4
D=D&M
@BUFF
D=!D
M=D
@3
D=M
@4
D=D|M
@BUFF
D=D&M
@5
M=D // ---------------------

@3
M=D
@LEFT
D=M
@4
M=D

@3
D=M
@4
D=D&M
@BUFF
D=!D
M=D
@3
D=M
@4
D=D|M
@BUFF
D=D&M
@5
M=D

@RIGHT
M=D
@TEMP
D=M
@LEFT
M=D

@KEY
D=M
@3
M=D
@4
M=1

(CHECKROT2)
@4
D=M
@STOP2
D;JEQ // Jump to the end if we have shifted the number of times we need to
@3 // Check if the first bit is 1
D=M
@ZERO2
D;JGT // Jump if the first bit is 0
@3 // If the first bit is 1, shift left and add 1
D=M
D=D+M
D=D+1
M=D
@4
M=M-1
D=M
@CHECKROT2
0;JMP
(ZERO2) // If the first bit is 0, shift left
@3
D=M
D=D+M
M=D
@4
M=M-1
D=M
@CHECKROT2
0;JMP
(STOP2) // End of the program
@3
D=M
@5
M=D

@COUNT
M=M-1
D=M
@ENCRYPT
D;JGT

@LEFT
D=M
@3
M=D
@8
D=A
@4
M=D

(CHECKROT3)
@4
D=M
@STOP3
D;JEQ // Jump to the end if we have shifted the number of times we need to
@3 // Check if the first bit is 1
D=M
@ZERO3
D;JGT // Jump if the first bit is 0
@3 // If the first bit is 1, shift left and add 1
D=M
D=D+M
D=D+1
M=D
@4
M=M-1
D=M
@CHECKROT3
0;JMP
(ZERO3) // If the first bit is 0, shift left
@3
D=M
D=D+M
M=D
@4
M=M-1
D=M
@CHECKROT3
0;JMP
(STOP3) // End of the program
@3
D=M
@5
M=D

@5
D=M
@0
M=M|D
@RIGHT
D=M
@0
M=M|D
(END)
@END
0;JMP