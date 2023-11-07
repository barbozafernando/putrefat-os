[org 0x7c00] ; tell the assembler that our offset is bootsector code


mov ah, 0x0E		; Set up 4K stack space after this bootloader
add al, "H"		; (4096 + 512) / 16 bytes per paragraph

jmp $			; Jump here - infinite loop!

; padding and magic number
times 510-($-$$) db 0
dw 0xAA55
