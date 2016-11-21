;
; Boot Sector
;
; @brief        A boot sector that prints a hex number as a string.
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
    mov     ah, 0x0
    int     0x16

    cmp     al, 0x0D
    je      get_name_loop_end

    push    bx
    mov     cx, NAME_STRING
    add     bx, cx
    mov     ah, 0x0
    mov     [bx], ax

    pop     bx

    ; Prepare for the next iteration.
    add     bx, 1
    jmp     get_name_loop


get_name_loop_end:

    mov     bx,     NAME_STRING
    call    print_line


jmp     $                           ; Loop-dee-loop

%include "asm/print/print_character.asm"
%include "asm/print/print_string.asm"
%include "asm/print/print_line.asm"
%include "asm/print/print_hex.asm"
%include "asm/print/print_registers.asm"
%include "asm/print/print_hex2.asm"
%include "asm/print/dump_bios.asm"

HELLO_STRING:
db  'Hello! Enter your name.', 0



NAME_STRING:
    db  '-------------------', 0






times 510 -( $ - $$ ) db 0              ; Padding

dw  0xAA55                              ; Magic number.
