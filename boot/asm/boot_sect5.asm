;
; Boot Sector
;
; @brief        A boot sector that prints a string using our function.
;
; @link         https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf
; @author       Nick Blundell
; @note         Nick Blundell was the original author of the code.
;
; @author       Harrison Statham
; @note         Harrison Statham only added comments and some other structure.
;



[org 0x7c00]                        ; Tell the assembler where this code will be loaded

mov     bx,     HELLO_MSG           ; Use BX as a parameter to our function , so
call    print_string                ; we can specify the address of a string.
mov     bx,     GOODBYE_MSG
call    print_string

jmp     $                           ; Hang

                                    ; Note all file includes are referenced from the build
                                    ; script dir (..)
%include "asm/print_string.asm"     ; Include the assembly file with the print_string code.

; Data

HELLO_MSG:
db 'Hello World!' , 0          ; <-- The zero on the end tells our routine where to stop printing.

GOODBYE_MSG:
db 'Goodbye !', 0

; Padding and magic number.

times 510 -( $ - $$ ) db 0
dw  0xAA55
