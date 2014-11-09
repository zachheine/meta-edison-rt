SUMMARY = "Installs asound.conf file to set default output"

LICENSE = "GPL-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

DEPENDS = "alsa-lib"

SRC_URI = "file://asound.conf \
          "
S = "${WORKDIR}"

PR = "r0"

do_install_append () {
    install -d ${D}${sysconfdir}
    install -m 0666 asound.conf ${D}${sysconfdir}
}

FILES_${PN} = "${sysconfdir}"

