#
# This file is the eeprom-i2c recipe.
#

SUMMARY = "Simple eeprom-i2c application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://eeprom-i2c.c \
		   file://24aa02e48-i2c.h \
		   file://24aa02e48-i2c.c \
	   	   file://Makefile \
		  "

S = "${WORKDIR}"

do_compile() {
	     oe_runmake
}

do_install() {
	     install -d ${D}${bindir}
	     install -m 0755 eeprom-i2c ${D}${bindir}
}
