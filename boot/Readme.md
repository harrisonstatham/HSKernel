# HSKernel/boot

This folder contains the boot sector assembly code. Every boot sector file is 512 bytes in size, and ends with a "magic word" (`0xAA55`) that indicates to the machine that it is a boot sector.


## Installing

I am assuming you are on a Linux/Mac environment. 

###Dependencies:
1. Nasm
2. QEMU / Bochs (*)


(*) I use `QEMU`, thus all of the build scripts will use `QEMU`. You could easily modify the build script to call `Bochs`.


### Installing Dependencies

If you dont already have the above packages installed. You should be able to install those using a package manager such as: `apt-get` `yum` `home brew` or `mac ports`. Alternatively, if you want to have some fun, you can install manually - not my first choice.

I am not going to discuss how to install those package managers or the above dependencies. There are plenty of tutorials online that do it better justice than I can.


## Building 

Once you have `nasm` and `QEMU` (or `Bochs`) installed on your machine. Then you can run the following:

~~~~
// Make BuildBootSector.bash executable from terminal. You only need to run this once.

chmod +x BuildBootSector.bash
~~~~

Now you can build:
~~~~
./BuildBootSector.bash <name_of_boot_sector_file_no_extension>

Example:
./BuildBootSector.bash boot_sect1
~~~~

Upon successful build you should see something like this:

~~~~
==============================================================
Welcome to the Build Script for HSKernel Boot Sectors

==============================================================
1. Starting build process...
Finished building binary.
eb  fe  00  00  00  00  00  00  00  00  00  00  00  00  00  00
00  00  00  00  00  00  00  00  00  00  00  00  00  00  00  00
*
00  00  00  00  00  00  00  00  00  00  00  00  00  00  55  aa


2. Running QEMU
WARNING: Image format was not specified for 'bin/boot_sect1.bin' and probing guessed raw.
Automatically detecting the format is dangerous for raw images, write operations on block 0 will be restricted.
Specify the 'raw' format explicitly to remove the restrictions.
~~~~


If all went well, a new window should open that looks something like:

![Alt](/QEMU-Basic-Correct-Boot.png "A QEMU window showing correct operation of the boot sector.")




