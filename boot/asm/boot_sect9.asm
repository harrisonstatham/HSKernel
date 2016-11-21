;
; Boot Sector
;
; @description          A boot sector that converts keyboard characters to their ASCII equivalent
;                       and displays them on screen. Press <ESC> to exit the program.
;
; @link         https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf
;
; @author       Harrison Statham
;

[org 0x7c00]


call    text2Ascii                  ; Call text2Ascii routine.

int     0x19                        ; Call the interrupt to restart the machine.
                                    ; Note, on QEMU this simply reloads the boot sector
                                    ; Good for starting over in case of an error.

jmp     $                           ; Loop-dee-loop

%include "asm/print/print_character.asm"
%include "asm/print/print_string.asm"
%include "asm/print/print_line.asm"
%include "asm/print/print_hex.asm"
%include "asm/print/print_registers.asm"
%include "asm/print/print_hex2.asm"
%include "asm/print/dump_bios.asm"
%include "asm/text_to_ascii.asm"


times 510 -( $ - $$ ) db 0              ; Padding

dw  0xAA55                              ; Magic number.
