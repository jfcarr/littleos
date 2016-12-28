kernel.elf: loader.o
	ld -T link.ld -melf_i386 loader.o -o kernel.elf

loader.o: loader.s
	nasm -f elf32 loader.s

clean:
	-rm -f kernel.elf
	-rm -f loader.o
