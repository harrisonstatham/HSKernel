;
; Print Hex
;
; @brief        Print a hex number as a string.
;
; @author       Harrison Statham
;
; ax = ??
; bx = the number to print
; cx = mask
; dh = amount to shift by.
; dl = index of character to set.

print_hex2:

    pusha

    ; Setup everything
    mov     cx,     0x000F
    mov     dh,     0x00
    mov     dl,     0x05





print_hex2_loop:

    cmp     dl,     0x01
    je      print_hex2_loop_end

    call    print_registers

    mov     ax,     bx              ; In our example, move 0x7FFF into al.
    and     ax,     cx              ; AND ax with the mask in cx.

    push    cx
    mov     ch,     0
    mov     cl,     dh

    shr     ax,     cl

    pop     cx

    ; Check the magnitude of the number.
    cmp     al,     0xA             ; Is the number less than 0xA ?

    jl      print_hex2_lt          ; Jump if the number is less than 0xA.

    add     al,     55              ; Add 55 to the number to put it in the correct ASCII range.
    jmp     print_hex2_done        ; Jump over.

print_hex2_lt:
    add     al,     48              ; Add 48 to put it in the correct ASCII range.

print_hex2_done:

    push    bx
    mov     bh, 0
    mov     bl, dl
    ; Set the 5th char of HEX_STRING to the new ASCII code.
    mov     [HEX_STRING2 + bx],  al  ;

    pop     bx

    ; Prepare for next iteration

    sub     dl,     1
    add     dh,     4
    shl     cx,     4
    jmp     print_hex2_loop


print_hex2_loop_end:


    mov     al,     HEX_STRING2
    call    print_string

    popa
    ret

HEX_STRING2:
    db  '0x0000', 0


HEX_PRINT2_DEBUG:
    db  'DEBUG HERE ', 0




