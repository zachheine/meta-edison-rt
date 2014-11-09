# meta-edison-rt - add some useful things to the standard Intel Edison distro

meta-edison-rt is a layer that can be used with the standard Intel Edison distro to add some convenient extra capabilities including the Qt embedded runtime. Some of the recipes are from meta-oe and an alternative is to add that in device-software as described in the Edison BSP User Guide.

This is very much a work in progress.

Specific additions are:

    IMAGE_INSTALL += "pulseaudio"
    IMAGE_INSTALL += "pulseaudio-server"
    IMAGE_INSTALL += "bison"
    IMAGE_INSTALL += "coreutils"
    IMAGE_INSTALL += "git"
    IMAGE_INSTALL += "portaudio-v19"
    IMAGE_INSTALL += "espeak"
    IMAGE_INSTALL += "alsa-lib"
    IMAGE_INSTALL += "alsa-utils"
    IMAGE_INSTALL += "alsa-tools"

    # This sets the default audio output to be plughw:1,0
    IMAGE_INSTALL += "alsa-defaults"

    IMAGE_INSTALL += "nano"
    IMAGE_INSTALL += "packagegroup-core-qt4e"
    
pulseaudio doesn't seem to be set up correctly at this point. That's a TODO.

### Installation

Using "..." to represent the install directory of the Edison source:

    cd .../edison-src/device-software
    git clone git://github.com/richards-tech/meta-edison-rt
    
The layer needs to added to the bblayers.conf file which is at:

    .../edison-erc/build/conf/bblayers.conf
    
Add a line to the layers so that the BBLAYERS variable looks like this:

    BBLAYERS ?= " \
        /home/syntro/work/edison/edison-src/poky/meta \
        /home/syntro/work/edison/edison-src/poky/meta-yocto \
        /home/syntro/work/edison/edison-src/poky/meta-yocto-bsp \
        /home/syntro/work/edison/edison-src/device-software/meta-edison \
        /home/syntro/work/edison/edison-src/device-software/meta-edison-distro \
        /home/syntro/work/edison/edison-src/device-software/meta-edison-middleware \
        /home/syntro/work/edison/edison-src/device-software/meta-edison-arduino \
        /home/syntro/work/edison/edison-src/device-software/meta-edison-rt \
        \
        "
        
 The result will be too big to fit in the standard 512Mb rootfs. This must be increased.
 
 To do this, a couple of files need to be edited. First off, edit the file:

    .../edison-src/device-software/meta-edison-distro/recipes-bsp/u-boot/files/edison.env
    
In that file will be something like:

    name=rootfs,size=512MiB
    
Change this to be:

    name=rootfs,size=1024MiB
    
and save the file. Then edit the file:

    .../edison-src/device-software/meta-edison-distro/recipes-core/images/edison-image.bb
    
There’s an entry for IMAGE_ROOTFS_SIZE. Change this line to be:

    IMAGE_ROOTFS_SIZE = "1048576"
    
Then the usual "bitbake edison-image" should work and add the new features.


