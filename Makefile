OBJECTS = loader.o
CC = gcc
CFLAGS = -m32 -nostdlib -nostdinc -fno-builtin -fno-stack-protector -nostartfiles -nodefaultlibs -Wall -Wextra -Werror -c
LDFLAGS = -T link.ld -melf_i386
AS = nasm
ASFLAGS = -f elf

default:
	@echo 'Valid targets:'
	@echo '  all		Build kernel and create ISO.'
	@echo '  kernel.elf	Build kernel.'
	@echo '  iso		Create ISO.'
	@echo '  bochs		Launch Bochs with ISO.'
	@echo '  clean		Remove all non-versioned objects.'

all: iso

kernel.elf: $(OBJECTS)
	ld $(LDFLAGS) $(OBJECTS) -o kernel.elf

loader.o: loader.s
	$(AS) $(ASFLAGS) loader.s 

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
