kernel.elf: loader.o
	ld -T link.ld -melf_i386 loader.o -o kernel.elf

loader.o: loader.s
	nasm -f elf32 loader.s

iso: kernel.elf
	mkdir -p iso/boot/grub
	cp stage2_eltorito iso/boot/grub
	cp kernel.elf iso/boot
	cp menu.lst iso/boot/grub
	cd iso
	genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -A os -input-charset utf8 -quiet -boot-info-table -o os.iso iso

bochs:
	bochs -f bochsrc.txt -q

clean:
	-rm -rf iso
	-rm -f kernel.elf
	-rm -f loader.o
	-rm -f os.iso
	-rm -f bochslog.txt
