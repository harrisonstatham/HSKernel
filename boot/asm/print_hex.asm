;
; Print Hex
;
; @brief        Print a hex number as a string.
;
; @author       Harrison Statham
;
; ax = ??
; bx = the number to print
;

; NOTE: REFACTOR USING LOOP TO SHIFT OFF DATA ONE NIBBLE AT A TIME!!!
;


print_hex:

    pusha

    ; We know that our hex string only has 4 hex digits in it (16 bit)
    ; so we can AND and SHIFTR to extract the digits one at a time and then
    ; write the corresponding ASCII value to the HEX_STRING.

    ; x00 - 0x9 maps to ASCII 48 - 57
    ; Add 48 to the number and set the bit.

    ; 0xA - 0xF maps to ASCII 65 - 70
    ; Add 55 to the number and set the bit.

    ; example number: 0x7FFF


    mov     al,     bl              ; In our example, move 0xFF into al.
    and     al,     0x0F            ; al = 0x0F

    ; Check the magnitude of the number.
    cmp     al,     0xA             ; Is the number less than 0xA ?
    jl      print_hex_A_lt          ; Jump if the number is less than 0xA.

    add     al,     55              ; Add 55 to the number to put it in the correct ASCII range.
    jmp     print_hex_A_done        ; Jump over.

print_hex_A_lt:
    add     al,     48              ; Add 48 to put it in the correct ASCII range.

print_hex_A_done:

    ; Set the 6th char of HEX_STRING to the new ASCII code.
    mov     [HEX_STRING + 5],  al  ;



    mov     ax,     bx              ; In our example, move 0x7FFF into al.
    and     ax,     0x00F0
    shr     ax,     4

    ; Check the magnitude of the number.
    cmp     al,     0xA             ; Is the number less than 0xA ?

    jl      print_hex_B_lt          ; Jump if the number is less than 0xA.

    add     al,     55              ; Add 55 to the number to put it in the correct ASCII range.
    jmp     print_hex_B_done        ; Jump over.

print_hex_B_lt:
    add     al,     48              ; Add 48 to put it in the correct ASCII range.

print_hex_B_done:

    ; Set the 5th char of HEX_STRING to the new ASCII code.
    mov     [HEX_STRING + 4],  al  ;





    mov     ax,     bx              ; In our example, move 0x7FFF into al.
    and     ax,     0x0F00
    shr     ax,     8

    ; Check the magnitude of the number.
    cmp     al,     0xA             ; Is the number less than 0xA ?

    jl      print_hex_C_lt          ; Jump if the number is less than 0xA.

    add     al,     55              ; Add 55 to the number to put it in the correct ASCII range.
    jmp     print_hex_C_done        ; Jump over.

print_hex_C_lt:
    add     al,     48              ; Add 48 to put it in the correct ASCII range.

print_hex_C_done:

    ; Set the 5th char of HEX_STRING to the new ASCII code.
    mov     [HEX_STRING + 3],  al  ;





    mov     ax,     bx              ; In our example, move 0x7FFF into al.
    and     ax,     0xF000
    shr     ax,     12

    ; Check the magnitude of the number.
    cmp     al,     0xA             ; Is the number less than 0xA ?

    jl      print_hex_D_lt          ; Jump if the number is less than 0xA.

    add     al,     55              ; Add 55 to the number to put it in the correct ASCII range.
    jmp     print_hex_D_done        ; Jump over.

print_hex_D_lt:
    add     al,     48              ; Add 48 to put it in the correct ASCII range.

print_hex_D_done:

    ; Set the 5th char of HEX_STRING to the new ASCII code.
    mov     [HEX_STRING + 2],  al  ;




    ; Call the print_string routine.
    mov     bx,     HEX_STRING
    call    print_string

    popa
    ret

HEX_STRING:
    db  '0x0000', 0



