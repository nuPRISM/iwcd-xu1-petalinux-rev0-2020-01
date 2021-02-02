#
# This file is the adc recipe.
#

SUMMARY = "Simple adc application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://adc.c \
	       file://Makefile \
           file://gpio_init.sh \
		  "

INITSCRIPT_NAME = "gpio_init"
INITSCRIPT_PARAMS = "defaults 99"

S = "${WORKDIR}"

inherit update-rc.d

RDEPENDS_${PN}_append += "bash"

do_compile() {
	     oe_runmake
}

do_install() {
	     install -d ${D}${bindir}
	     install -m 0755 adc ${D}${bindir}
         install -d ${D}${sysconfdir}/init.d/
         install -m 0755 gpio_init.sh ${D}${sysconfdir}/init.d/gpio_init
}