all:
	nasm -f bin boot_sect.asm -o boot_sect.bin && qemu-system-i386 boot_sect.bin

clean:
	rm -rf *.bin
