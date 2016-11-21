;
; Dump BIOS
;
; @brief        Dump the contents of memory, exposing the code inside the BIOS.
;
; @author       Harrison Statham
;
; ax = ??
; bx = address of the string to print.
;

dump_bios:

    ; Start address = 0.
    ; Stop address = 0x7c00

    pusha


    mov     ax,     0

dump_bios_loop:

    cmp     ax,     0x7C00

    jg      dump_bios_loop_end

    ; Load the hex value at the address.

    mov     bx,     ax
    mov     bx,     [bx]
    call    print_hex

    ; Prepare for next iteration.
    add     ax,     0x1
    jmp     dump_bios_loop

dump_bios_loop_end:

    mov     bx, DUMP_BIOS_FINISHED_STR
    call    print_line


    popa
    ret


DUMP_BIOS_FINISHED_STR:
    dw  'Finished', 0
