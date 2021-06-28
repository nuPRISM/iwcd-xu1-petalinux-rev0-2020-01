#
# This file is the adc-dma2 recipe.
#

SUMMARY = "Simple adc-dma2 application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://adc-dma2.c \
           file://dbg.h \
           file://adc.h \
           file://adc.c \
           file://clc.h \
           file://clc.c \
           file://dma-proxy.h \            
	       file://Makefile \
		  "

S = "${WORKDIR}"

do_compile() {
	     oe_runmake
}

do_install() {
	     install -d ${D}${bindir}
	     install -m 0755 adc-dma2 ${D}${bindir}
}
