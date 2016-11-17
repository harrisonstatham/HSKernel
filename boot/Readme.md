# HSKernel/boot

This folder contains the boot sector assembly code.


## Installing

I am assuming you are on a Linux/Mac environment. 

###Dependencies:
1. Nasm
2. QEMU / Bochs - Note I use QEMU, thus all of the build scripts will use QEMU.

### Installing Dependencies

If you dont already have the above packages installed. You should be able to install those using a package manager such as: `apt-get` `yum` `home brew` or `mac ports`. I am not going to discuss how to install those package managers or the above dependencies. There are plenty of tutorials online that do it better justice than I can.


## Building 

Once you have `nasm` and `QEMU` (or `Bochs`) installed on your machine. Then you can run the following:

~~~~

// Make BuildBootSector.bash executable from terminal.

chmod +x BuildBootSector.bash

// Run the build script.

./BuildBootSector.bash
~~~~
