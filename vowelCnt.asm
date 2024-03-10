DATA SEGMENT
    word DB 'Hello, World!', '$'   ; Define the word string with '$' termination
    vowels DB 'AEIOU', '$'          ; Define vowels string with '$' termination
    count DB 0                      ; Variable to store the count of vowels
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA        ; Load the address of the DATA segment into AX
    MOV DS, AX          ; Move the address from AX to the DS register

    LEA SI, word        ; Load the offset of the word string into SI
    LEA DI, vowels      ; Load the offset of the vowels string into DI

count_vowels:
    MOV AL, [SI]        ; Move character from word into AL
    CMP AL, '$'         ; Check if end of string reached
    JE end_count        ; If end of string, jump to end_count
    MOV CX, 5           ; Set up loop counter for vowels
    MOV BX, DI          ; Load BX with address of vowels
check_vowel:
    MOV DL, [BX]        ; Move character from vowels into DL
    CMP AL, DL          ; Compare character from word with vowels
    JNE not_vowel       ; If not vowel, jump to not_vowel
    INC count           ; Increment count if vowel found
not_vowel:
    INC BX              ; Move to next character in vowels
    LOOP check_vowel    ; Loop until all vowels checked
    INC SI              ; Move to next character in word
    JMP count_vowels    ; Repeat for next character in word

end_count:
    MOV AH, 02h         ; Function to print character
    MOV DL, count       ; Load DL with count
    ADD DL, 30h         ; Convert count to ASCII
    INT 21h             ; Call interrupt 21h to print count

    MOV AH, 4Ch         ; Terminate program
    INT 21h
CODE ENDS

END START
