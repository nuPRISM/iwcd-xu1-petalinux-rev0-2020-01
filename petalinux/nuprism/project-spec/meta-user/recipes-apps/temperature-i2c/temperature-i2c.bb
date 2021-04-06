#
# This file is the temperature-i2c recipe.
#

SUMMARY = "Simple temperature-i2c application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://temperature-i2c.c \
		   file://max30205-i2c.h \
		   file://max30205-i2c.c \
	   	   file://Makefile \
		  "

S = "${WORKDIR}"

do_compile() {
	     oe_runmake
}

do_install() {
	     install -d ${D}${bindir}
	     install -m 0755 temperature-i2c ${D}${bindir}
}
