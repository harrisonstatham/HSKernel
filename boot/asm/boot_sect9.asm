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


call    text2Ascii

int     0x19

jmp     $                           ; Loop-dee-loop

%include "asm/print/print_character.asm"
%include "asm/print/print_string.asm"
%include "asm/print/print_line.asm"
%include "asm/print/print_hex.asm"
%include "asm/print/print_registers.asm"
%include "asm/print/print_hex2.asm"
%include "asm/print/dump_bios.asm"
%include "asm/text_to_ascii.asm"

HELLO_STRING:
db  'Hello! Enter your name. Then hit <Enter>.', 0



NAME_STRING:
db  '-------------------', 0






times 510 -( $ - $$ ) db 0              ; Padding

dw  0xAA55                              ; Magic number.
