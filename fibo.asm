DATA SEGMENT
cnt DB 10
fib DB 10 DUP(0)
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
MOV AX,DATA
MOV DS,AX
MOV AL,00H  ;Al has 1st no from the sequence
LEA SI,fib ;loading offset address of ans location
MOV[SI],AL
INC SI
INC AL
MOV [SI],AL
MOV CL,cnt
MOV CH,00H
SUB CX,02H  ;coz we have already intialized first two elements
L1:
MOV AL,[SI-1]
ADD AL,[SI]
DAA    ;Conver into decimal
INC SI
MOV [SI],AL
LOOP L1

MOV AH,4CH
INT 21H
CODE ENDS
END START


