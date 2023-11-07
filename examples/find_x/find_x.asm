;
; A simple boot sector program that demonstrates addressing.
;

mov ah, 0x0E ; int 10/ah = 0eh -> scrolling teletype BIOS routine

; First attempt
mov al, the_secret
int 0x10              ; does this print an x?

; Second attempt
mov al, [the_secret]
int 0x10              ; does this print an x?

; Third attempt
mov bx, the_secret
add bx, 0x7C00
mov al, [bx]
int 0x10              ; does this print an x?

; Fourth attempt
mov al, [0x7C1E]
int 0x10              ; does this print an x?

jmp $

the_secret:
  db "X"

; Padding and magic BIOS number.
times 510 -( $ - $$ ) db 0
dw 0xaa55

