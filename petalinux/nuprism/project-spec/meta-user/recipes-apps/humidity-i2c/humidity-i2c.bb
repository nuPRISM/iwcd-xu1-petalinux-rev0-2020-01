#
# This file is the humidity-i2c recipe.
#

SUMMARY = "Simple humidity-i2c application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://humidity-i2c.c \
		   file://hdc1080-i2c.c \
		   file://hdc1080-i2c.h \
	   	   file://Makefile \
		  "

S = "${WORKDIR}"

do_compile() {
	     oe_runmake
}

do_install() {
	     install -d ${D}${bindir}
	     install -m 0755 humidity-i2c ${D}${bindir}
}
