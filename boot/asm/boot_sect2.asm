;
; Boot Sector
;
; @brief        A simple boot sector that prints a message to the screen using a BIOS routine.
;
; @link         https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf
; @author       Nick Blundell
; @note         Nick Blundell was the original author of the code.
;
; @author       Harrison Statham
; @note         Harrison Statham only added comments and some other structure.
;


mov ah, 0x0e                        ; int 10/ ah = 0eh -> scrolling teletype BIOS routine

mov al, 'H'
int 0x10

mov al, 'e'
int 0x10

mov al, 'l'
int 0x10

mov al, 'l'

int 0x10

mov al , 'o'
int 0x10

jmp $                               ; Jump to the current address ( i.e. forever ).

;
; Padding and magic BIOS number.
;
times 510 -( $ - $$ ) db 0          ; Pad the boot sector out with zeros

dw 0xAA55                           ; Last two bytes form the magic number ,
                                    ; so BIOS knows we are a boot sector.
