print_hex:
  pusha
  mov bx, HEX_OUT
  mov cx, 4

  call print_string
  popa
  ret

convert_loop:
  pusha
  mov ax, dx
  and ax, 0Fh

  call nibble_to_hex

  mov [bx], al
  inc bx
  shr dx,4
  loop convert_loop

  mov byte [bx], 0
  call print_string
  popa
  ret

nibble_to_hex:
  pusha
  cmp al, 10
  jl is_digit
  add al, 7
  popa

is_digit:
  pusha
  add al, '0'
  popa
  ret

%include "print_string.asm"

HEX_OUT: db "0x0000", 0
