



print_registers:

    pusha

    push    bx

    mov     bx,     print_registers_A
    call    print_string

    mov     bx,     ax
    call    print_hex
    pop     bx

    push    bx
    mov     bx,     print_registers_B
    call    print_string
    pop     bx

    call    print_hex

    mov     bx,     print_registers_C
    call    print_string

    mov     bx,     cx
    call    print_hex


    mov     bx,     print_registers_D
    call    print_string

    mov     bx,     dx
    call    print_hex

    popa
    ret

print_registers_A:
    db  'AX = ', 0

print_registers_B:
db  'BX = ', 0

print_registers_C:
db  'CX = ', 0

print_registers_D:
db  'DX = ', 0
