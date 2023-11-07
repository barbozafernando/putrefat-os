;mov bx , 30
;if (bx <= 4) {
; mov al , ’A ’
;} else if (bx < 40) {
; mov al , ’B ’
;} else {
; mov al , ’C ’
;}

mov bx, 60

cmp bx, 4
jle then_block
cmp bx, 40
jl elseif_block
jmp else_block

then_block:
  mov al, "A"
  call print
  jmp done
elseif_block:
  mov al, "B"
  call print
  jmp done
else_block:
  mov al, "C"
  call print
  jmp done

%include "../../utils.asm"

done:
  jmp $

; Padding and magic number.
times 510 -( $ - $$ ) db 0
dw 0xaa55

