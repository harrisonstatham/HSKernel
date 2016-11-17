;
; Boot Sector
;
; @brief        A simple boot sector program that loops forever.
;
; @link         https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf
; @author       Nick Blundell
; @note         Nick Blundell was the original author of the code.
;
; @author       Harrison Statham
; @note         Harrison Statham only added comments and some other structure.
;




;
; loop:                     ; Modified loop label because it would not compile - Harrison.

loopLabel:                  ; Define a label , "loopLabel", that will allow
                            ; us to jump back to it , forever.
jmp loopLabel               ; Use a simple CPU instruction that jumps
                            ; to a new memory address to continue execution.
                            ; In our case , jump to the address of the current
                            ; instruction.

times 510 -( $ - $$ ) db 0  ; When compiled , our program must fit into 512 bytes ,
                            ; with the last two bytes being the magic number ,
                            ; so here , tell our assembly compiler to pad out our
                            ; program with enough zero bytes (db 0) to bring us to the
                            ; 510 th byte.


dw 0xAA55                   ; Last two bytes ( one word ) form the magic number ,
                            ; so BIOS knows we are a boot sector.
