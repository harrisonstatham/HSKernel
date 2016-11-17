;
; Boot Sector
;
; @brief        A boot sector that prints a hex number as a string.
;
; @link         https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf
;
; @author       Harrison Statham
; @note         This is the first boot sector that I have written.
;

[org 0x7c00]

mov     bx,     0x7FFF
call    print_hex


mov     bx,     0xAA55
call    print_hex


%include "asm/print_string.asm"
%include "asm/print_hex.asm"

HELLO_STRING:
    db  'Hello!', 0



times 510 -( $ - $$ ) db 0              ; Padding

dw  0xAA55                              ; Magic number.
