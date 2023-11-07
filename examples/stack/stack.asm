;
; A simple boot sector program that demonstrates the stack.
;
mov ah, 0x0E

mov bp, 0x8000  ; Set the base of the stack a little above where BIOS
mov sp, bp      ; loads our boot sector - so it wont overwrite us.

push "A" ; Push some characters on the stack for later
push "B" ; retreival. Note, these are pushed on as
push "C" ; 16-bit values, so the most significant byte
         ; will be added by our assembler as 0x00.

pop bx      ; Note, we can only pop 16-bits, so pop to BX
mov al, bl  ; then copy bl (i.e. 8-bit char) to AL
int 0x10    ; print(al)

mov al, [0x7FFE] ; To prove our stack grows downwards from bp,
                 ; fetch the char at 0x8000 - 0x2 (i.e. 16-bits)
int 0x10         ; print(al)


jmp $            ; jump forever.

; Padding and magic BIOS number.
times 510 -( $ - $$ ) db 0
dw 0xaa55
