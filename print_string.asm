; SI -> should contain the string address.
print_string:
  mov al, [si]       ; Load char from the string into AL
  mov ah, 0x0E       ; BIOS interrupt to print
  int 0x10           ; Call BIOS interrupt to print the char
  inc si             ; Go to the next char
  cmp byte [si], 0   ; Compare current char whether is 0 or not
  jne print_string   ; If not zero, call function again
  ret                ; Its zero then return

