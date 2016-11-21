;
; Boot Sector
;
; @brief        A boot sector that makes use of keyboard interrupts.
;
; @link         https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf
;
; @author       Harrison Statham
;

[org 0x7c00]


mov     bx,     HELLO_STRING
call    print_line

mov     bx, 0

get_name_loop:

    ; Call the keyboard interrupt to get a character from the user.
    mov     ah,     0x0
    int     0x16

    ; Compare the character to the enter key. If the user pressed the enter key,
    ; then we break out of the loop and print the user name.
    cmp     al, 0x0D
    je      get_name_loop_end


    push    bx                          ; Push bx to remember it.
    mov     cx,     NAME_STRING         ; Get the address of the name string.
    add     bx,     cx                  ; Put the address into bx
    mov     ah,     0x0                 ; Move 0x0 into AX high.
    mov     [bx],   ax                  ; Write the character at AX to the destination pointed at by BX.
                                        ; NOTE: We need to use BX for addressing, or the assembler will complain.

    pop     bx                          ; Restore the state of BX for the next iteration.

    ; Prepare for the next iteration.
    add     bx,     1                   ; Increment BX which is the counter variable (and character index).
    jmp     get_name_loop               ; Jump to the top of the loop.


get_name_loop_end:

    mov     bx,     NAME_STRING         ; Load the address of the string to write to.
    call    print_line                  ; Print out the string.


jmp     $                               ; Loop-dee-loop


%include "asm/print/print_character.asm"
%include "asm/print/print_string.asm"
%include "asm/print/print_line.asm"
%include "asm/print/print_hex.asm"
%include "asm/print/print_registers.asm"
%include "asm/print/print_hex2.asm"
%include "asm/print/dump_bios.asm"

HELLO_STRING:
db  'Hello! Enter your name. Then hit <Enter>.', 0



NAME_STRING:
    db  '-------------------', 0


times 510 -( $ - $$ ) db 0              ; Padding

dw  0xAA55                              ; Magic number.
