;
; Boot Sector
;
; @brief        A simple boot sector program that demonstrates addressing.
;
; @link         https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf
; @author       Nick Blundell
; @note         Nick Blundell was the original author of the code.
;
; @author       Harrison Statham
; @note         Harrison Statham only added comments and some other structure.
;



mov     ah,     0x0e                ; int 10/ ah = 0eh -> scrolling teletype BIOS routine

; First attempt

mov     al,     the_secret
int     0x10                        ; Does this print an X?

; Second attempt

mov     al,     [the_secret]
int     0x10                        ; Does this print an X?


; Third attempt

mov     bx,     the_secret
add     bx,     0x7c00
mov     al,     [bx]
int     0x10                        ; Does this print an X?


; Fourth attempt

mov     al,     [0x7c1e]
int     0x10                        ; Does this print an X?

jmp     $                           ; Jump forever.


the_secret: db "X"

; Padding and magic BIOS number.

times 510 -( $ - $$ ) db 0
dw 0xAA55
