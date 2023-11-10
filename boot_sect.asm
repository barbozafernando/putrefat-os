[org 0x7C00]                ; Tell the assembler where this code will be loaded

[bits 16]

; Adjust segment registers
mov ax, 0
mov ds, ax
mov es, ax
mov ax, 0x0000
mov ss, ax

; Set the base of the stack a little above where BIOS
; loads our boot sector.
mov bp, 0x8000
mov sp, bp                  

mov si, GREETINGS_MSG
call print_string

%include "print_string.asm"

GREETINGS_MSG db "*** Welcome to the PutrefatOS! ***", 0

; Padding and magic number.
times 510 - ( $ - $$ ) db 0
dw 0xAA55
