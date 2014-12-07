# Adds some useful utilities to the standard Intel Edison build

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
IMAGE_INSTALL += "cmake"

