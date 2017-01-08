# Little Book About OS Development

My effort working through the [Little Book About OS Development](http://littleosbook.github.io/)

## Files

File | Description
------------ | -------------
Makefile | Make directives file for various targets, including compiling assembly and C files, building the kernel, building a bootable ISO, and cleaning the build folder.
bochsrc.txt | Configuration file for Bochs.  It boots with the .iso file created by the Makefile.
link.ld | Linker configuration.  It tells the linker which object to use as an entry point, and provides various other configuration items.
loader.s | Assembly source for the OS entry point.
menu.lst | GRUB configuration file, including the OS title and kernel object name.
stage2_eltorito | GRUB legacy binary.

## Development Setup

<i>Assumes you are using Ubuntu or a Debian/Ubuntu-based distribution.  Dev setup is covered in more detail in the online book.</i>

From a bash prompt, install these essentials:

```bash
sudo apt-get install build-essential nasm genisoimage bochs bochs-sdl
```

The GNU C compiler (GCC) and GNU Make are also used, but these will probably already be installed by default.

You can probably also use something like [QEMU](http://wiki.qemu.org) or [VirtualBox](https://www.virtualbox.org) for your virtualization, but the tutorial expects you to use Bochs.
