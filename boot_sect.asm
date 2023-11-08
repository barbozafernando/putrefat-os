;
; A boot sector that prints a string using our function.
;
[org 0x7c00]                ; Tell the assembler where this code will be loaded

mov si, HELLO_MSG           ; Use BX as a parameter to our function, so
call print_string           ; We can specify the address of a string.

jmp $

%include "print_string.asm"

HELLO_MSG db "Welcome to the PutrefatOS!", 0

; Padding and magic number.
times 510 - ( $ - $$ ) db 0
dw 0xaa55
