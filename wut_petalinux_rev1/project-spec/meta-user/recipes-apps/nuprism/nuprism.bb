#
# This is the GPIO-DEMO apllication recipe
#
#

SUMMARY = "nuprism autoconf application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
SRC_URI = "file://nuprism \
        "
S = "${WORKDIR}/nuprism"
CFLAGS_prepend = "-I ${S}/include"
inherit autotools
