#
# This file is the adc-stream recipe.
#

SUMMARY = "Simple adc-stream application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://main.c \
           file://dbg.h \
           file://adc.h \
           file://adc.c \
           file://clc.h \
           file://clc.c \
	       file://Makefile \
		  "

S = "${WORKDIR}"

do_compile() {
	     oe_runmake
}

do_install() {
	     install -d ${D}${bindir}
	     install -m 0755 adc-stream ${D}${bindir}
}
