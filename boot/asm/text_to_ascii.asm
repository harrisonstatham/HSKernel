;
; Text to Ascii 
;
; @brief        Forget your ascii table? Not to worry, just use this!
;
; @link         https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf
;
; @author       Harrison Statham
;

text2Ascii:

    pusha

text2AsciiLoop:

    ; Call the keyboard interrupt to get a character from the user.
    mov     ah, 0x0
    int     0x16

    cmp     al, 0x1B
    je      text2AsciiLoopEnd

    mov     bx, 0
    mov     bl, al
    call    print_hex

    jmp     text2AsciiLoop

text2AsciiLoopEnd:

    mov     bx, text2AsciiString
    call    print_line

    popa
    ret

text2AsciiString:
    db  'Bye!', 0
