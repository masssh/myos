        bits 16
        org 0x7c00
start:
        xor     ax,     ax
        mov     ds,     ax
        mov     es,     ax
        mov     fs,     ax
        mov     gs,     ax
        mov     ss,     ax
        mov     sp,     0x7c00

        mov     al,     0x00
        mov     ah,     0x03
        int     0x10

        mov     si,     msg
        mov     ah,     0x0e

println:
        lodsb
        or      al,     al
        jz      hang
        
        int     0x10
        jmp     println

hang:
        hlt
        jmp     hang

msg:
        db      "Hello, World", 13, 10, 0
        times   510 - ($-$$)    db      0
        db      0x55, 0xaa
