print_hex:
  mov si, HEX_OUT         ; Load the address of the HEX_OUT buffer into SI
  xor cx, cx              ; Initialize a counter to keep track of the position in the buffer

convert_loop:
  mov ax, dx              ; Extract the less significant char (4-bits) from DX
  and ax, 0Fh             ; Mask out all bits except the 4 less significant bits

  call char_to_hex      ; Convert the char to its corresponding hexadecimal character

  mov di, si              ; Store the hexadecimal character in the buffer
  add di, cx              ; Calculate the address in DI

  mov [di], al

  inc cx                  ; Move to the next char in the buffer
  shr dx, 4               ; Shift the remaining bits in DX to the right by 4 bits

  cmp cx, 4               ; Check if all 4 chars have been processed
  je done

  jmp convert_loop        ; If not, continue the loop

char_to_hex:
  ; Input: AL - Nibble (4 bits) value
  ; Output: AL - Hexadecimal character '0'-'9' or 'A'-'F'
  cmp al, 10              ; Compare AL value with 10
  jl is_digit             ; Jump if char is less than 10
  add al, 7               ; If its not a digit (10-15), convert to 'A'-'F'

is_digit:
  add al, '0'             ; Convert the char value to its ASCII character representation
  ret

done:
  mov di, si              ; Null-terminate the string
  add di, cx              ; Calculate the address in DI
  mov byte [di], 0
  call print_string       ; Call the function to print the string pointed to by SI
  ret

