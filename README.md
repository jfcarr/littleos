# Little Book of OS Development

My effort working through the [Little Book of OS Development](http://littleosbook.github.io/) 

## Development Setup

<i>Assumes you are using Ubuntu or a Debian/Ubuntu-based distribution.  Dev setup is covered in more detail in the online book.</i>

From a bash prompt, install these essentials:

`sudo apt-get install build-essential nasm genisoimage bochs bochs-sdl`

The GNU C compiler (GCC) and GNU Make are also used, but these will probably already be installed by default.

You can probably also use something like [QEMU](http://wiki.qemu.org) or [VirtualBox](https://www.virtualbox.org) for your virtualization, but the tutorial expects you to use Bochs.
