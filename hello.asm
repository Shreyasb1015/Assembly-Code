DATA SEGMENT
msg DB 'Hello, World!', '$'
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE ,DS:DATA
START:
MOV AX,DATA
MOV DS,AX
MOV AH, 09h  
LEA DX, msg
INT 21h    
MOV AH, 4Ch
INT 21h
CODE ENDS
END START
