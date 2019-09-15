		bits 16 ; real mode
		org 0x7c00 ; entry address for BIOS bootstrap
start:
		; initialize segment registers
		xor     ax, ax
		mov     ds, ax
		mov     es, ax
		mov     fs, ax
		mov     gs, ax
		mov     ss, ax
		
		mov     sp, 0x7c00 ; initialize stack pointer
		mov		si, msg

putloop:
		; print message
		mov		al,[si]
		add		si,1
		cmp		al,0
		je		fin
		mov		ah,0x0e
		mov		bx,15
		int		0x10
		jmp		putloop

fin:
		hlt
		jmp     fin

msg:
		db      "Hello, World", 13, 10, 0
		times   510-($-$$) db 0
		db      0x55, 0xaa
