DATA SEGMENT
STR1 DB 'HELLO'
LEN EQU $-STR1
STR2 DB 20 DUP(0)
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA,ES:DATA
START:
MOV AX,DATA
MOV DS,AX
MOV ES,AX
MOV SI,offset STR1
MOV DI,offset STR2+(LEN-1)
MOV CX,LEN
UP:CLD   ;clear direction flag to auto incremenet SI register
LODSB  ;load AX with character pointed by SI register
STD    ;set the direction flag to auto decrement DI register
STOSB ;contents of AX is stored at address pointed by DI
LOOP UP

MOV AH,4CH
INT 21H
CODE ENDS
END START