;
; Print Character
;
; @brief        Print out a character to the screen.
; @discussion   Print out a character to the screen using the BIOS interrupt 0x10.
;
; @link         https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf
; @author       Nick Blundell
; @note         Nick Blundell was the original author of the code.
;
; @author       Harrison Statham
; @note         Harrison Statham only added comments and some other structure.
;

print_character:

    pusha                       ; Push all registers onto the stack for safe keeping.
    mov     ah ,    0x0E        ; Move 0x0E into the upper byte of ax.
    mov     al,     bl          ; then copy bl ( i.e. 8- bit char ) to al
    int     0x10                ; print (al) - call the BIOS interrupt.
    popa                        ; Pop all the registers off the stack.
    ret
