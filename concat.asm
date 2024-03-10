DATA SEGMENT
    string1 DB 'Hello', '$'    ; Define the first string with '$' termination
    string2 DB ' World!', '$'  ; Define the second string with '$' termination
    result DB 20 DUP(?)        ; Define a buffer to hold the concatenated string
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA         ; Load the address of the DATA segment into AX
    MOV DS, AX           ; Move the address from AX to the DS register

    LEA SI, string1      ; Load the offset of the first string into SI
    LEA DI, result       ; Load the offset of the result buffer into DI

    MOV CX, 0            ; Initialize CX to zero for counting

copy_string1:
    MOV AL, [SI]         ; Move character from string1 into AL
    CMP AL, '$'          ; Check if end of string1 reached
    JE end_copy          ; If end of string1, jump to end_copy
    MOV [DI], AL         ; Copy character from string1 to result
    INC SI               ; Move to next character in string1
    INC DI               ; Move to next position in result
    INC CX               ; Increment count of characters
    JMP copy_string1     ; Repeat for next character in string1

end_copy:
    LEA SI, string2      ; Load the offset of the second string into SI

copy_string2:
    MOV AL, [SI]         ; Move character from string2 into AL
    CMP AL, '$'          ; Check if end of string2 reached
    JE end_concat        ; If end of string2, jump to end_concat
    MOV [DI], AL         ; Copy character from string2 to result
    INC SI               ; Move to next character in string2
    INC DI               ; Move to next position in result
    INC CX               ; Increment count of characters
    JMP copy_string2     ; Repeat for next character in string2

end_concat:
    MOV BYTE PTR [DI], '$'  ; Add '$' terminator to the end of the concatenated string

    ; Print the concatenated string
    MOV AH, 09h           ; Function to print string
    LEA DX, result        ; Load the offset of the result string
    INT 21h               ; Call interrupt 21h to print string

    MOV AH, 4Ch           ; Terminate program
    INT 21h
CODE ENDS

END START
