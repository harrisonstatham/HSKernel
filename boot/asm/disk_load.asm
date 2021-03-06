;
; Disk Load
;
; @brief        An assembly routine for reading from the disk.
;
; @link         https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf
; @author       Nick Blundell
; @note         Nick Blundell was the original author of the code.
;
; @author       Harrison Statham
; @note         Harrison Statham only added comments and some other structure.
;

; load DH sectors to ES:BX from drive DL
disk_load :

    push    dx                      ; Store DX on stack so later we can recall
                                    ; how many sectors were request to be read ,
                                    ; even if it is altered in the meantime

    mov     ah,     0x02            ; BIOS read sector function
    mov     al,     dh              ; Read DH sectors
    mov     ch,     0x00            ; Select cylinder 0
    mov     dh,     0x00            ; Select head 0
    mov     cl,     0x02            ; Start reading from second sector ( i.e.
                                    ; after the boot sector )

    call    print_registers


    int     0x13                    ; BIOS interrupt
    jc      disk_error1              ; Jump if error ( i.e. carry flag set )
    pop     dx                      ; Restore DX from the stack

    call    print_registers

    cmp     dh,     al              ; if AL ( sectors read ) != DH ( sectors expected )
    jne     disk_error2              ; display error message
    ret

disk_error1:

    mov     bx,     DISK_ERROR_MSG1
    call    print_string
    jmp     $

disk_error2:

mov     bx,     DISK_ERROR_MSG2
call    print_string
jmp     $


; Variables

DISK_ERROR_MSG1:
db " Disk read error! Could not read disk." , 0

DISK_ERROR_MSG2:
    db " Disk read error! sectors read != sectors expected" , 0
