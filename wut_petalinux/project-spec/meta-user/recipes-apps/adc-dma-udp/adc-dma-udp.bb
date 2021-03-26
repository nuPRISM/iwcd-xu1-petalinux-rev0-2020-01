#
# This file is the adc-dma-udp recipe.
#

SUMMARY = "Simple adc-dma-udp application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://adc-dma-udp.c \
           file://dma-proxy.h \
	   file://Makefile \
		  "

S = "${WORKDIR}"

do_compile() {
	     oe_runmake
}

do_install() {
	     install -d ${D}${bindir}
	     install -m 0755 adc-dma-udp ${D}${bindir}
}
