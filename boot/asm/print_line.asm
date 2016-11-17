;
; Print Line
;
; @brief        Print a string to the screen using the BIOS interrupt 0x10. Then print a newline.
;
; @discussion   This routine prints a character in a string one character at a time. Finally it prints
;               a new line character (no such thing ;) ) to start on a new line.
;               This makes use of the code for print_character.asm written by the author
;               here: https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf
;
; @author       Harrison Statham
;
; ax = ??
; bx = address of the string to print.
;

print_line:

    pusha                           ; Push all the registers onto the stack for safe keeping.
    call    print_string            ; Call print_string

    ; Print new line character.

    popa
    ret
