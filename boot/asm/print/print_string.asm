;
; Print String
;
; @brief        Print a string to the screen using the BIOS interrupt 0x10.
;
; @discussion   This routine prints a character in a string one character at a time.
;               This makes use of the code for print_character.asm written by the author
;               here: https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf
;
; @author       Harrison Statham
;
; ax = ??
; bx = address of the string to print.
;
;

print_string:

    pusha                               ; Push all the registers onto the stack to preserve them.

print_string_loop:

    mov     ax, [bx]                    ; Since ax contains the address of the string, then we want to
                                        ; load the contents at the lower part of ax into al.

    cmp     al, 0                       ; Compare al to 0 - which is the terminating byte.
    je      print_string_loop_done      ; If al is zero, then we have reached the end of the string.
                                        ; Jump out of the loop!

                                        ; See print_character.asm
    mov     ah ,    0x0E                ; Print character to screen.
    int     0x10                        ; Call the interrupt.

    ; Prepare for next iteration.
    add     bx, 1                       ; Increment the pointer. Note its a char so we inc by 1.
    jmp     print_string_loop           ; Yes, this routine works so increment by 1 is correct.

print_string_loop_done:
    popa                                ; Pop off all of the registers.
    ret
