;
; A boot sector that prints a string using our function.
;
[org 0x7c00]                ; Tell the assembler where this code will be loaded

mov si, GREETINGS_MSG       ; Use BX as a parameter to our function, so
call print_string           ; We can specify the address of a string.

mov dx, 0x1fb6
call print_hex

%include "print_string.asm"
%include "print_hex.asm"

GREETINGS_MSG db "*** Welcome to the PutrefatOS! ***", 0
HEX_OUT db "0x0000", 0

; Padding and magic number.
times 510 - ( $ - $$ ) db 0
dw 0xaa55
