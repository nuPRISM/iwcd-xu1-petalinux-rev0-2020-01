#
# This file is the clock-cleaner-i2c recipe.
#

SUMMARY = "Simple clock-cleaner-i2c application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://clock-cleaner-i2c.c \
		   file://clc-i2c.c \
		   file://clc-i2c.h \
		   file://clock-cleaner-config.h \
	   	   file://Makefile \
		  "

S = "${WORKDIR}"

do_compile() {
	     oe_runmake
}

do_install() {
	     install -d ${D}${bindir}
	     install -m 0755 clock-cleaner-i2c ${D}${bindir}
}
