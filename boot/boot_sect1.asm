;
; A simple boot sector program that loops forever.
;

;
; loop:                     ; Modified loop label because it would not compile.

loopLabel:                  ; Define a label , " loop ", that will allow
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


; Removed 0 before 0xAA55 and added "0x" to denote hex.
; Would not compile without those additions.

dw 0xAA55                   ; Last two bytes ( one word ) form the magic number ,
                            ; so BIOS knows we are a boot sector.
