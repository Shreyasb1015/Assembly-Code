DATA SEGMENT
NUM DW 0FFFH
ans DB 5 DUP(0)
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
MOV AX,DATA
MOV DS,AX
MOV AX,NUM
MOV CX,0AH
LEA SI,ans
UP:
MOV DX,00H
DIV CX
MOV[SI],DL
INC SI
CMP AX,CX
JAE UP
MOV [SI],AL
MOV AX,4C00H
INT 21H
CODE ENDS
END START

