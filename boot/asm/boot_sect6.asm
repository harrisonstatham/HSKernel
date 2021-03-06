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

call    print_registers

mov     ah, 0x0
int     0x16

call    print_registers


;call    dump_bios

jmp     $                           ; Loop-dee-loop

%include "asm/print/print_character.asm"
%include "asm/print/print_string.asm"
%include "asm/print/print_line.asm"
%include "asm/print/print_hex.asm"
%include "asm/print/print_registers.asm"
%include "asm/print/print_hex2.asm"
%include "asm/print/dump_bios.asm"

HELLO_STRING:
    db  'Hello!', 0



times 510 -( $ - $$ ) db 0              ; Padding

dw  0xAA55                              ; Magic number.
