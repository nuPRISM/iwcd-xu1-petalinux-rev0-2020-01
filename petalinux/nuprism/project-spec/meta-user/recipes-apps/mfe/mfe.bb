#
# This file is the mfe recipe.
#

SUMMARY = "Simple mfe application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://mfe.cpp \
		   file://experim.h \
           file://Makefile \
		  "

S = "${WORKDIR}"

DEPENDS = "midas"
CXXFLAGS_prepend = "-I${STAGING_INCDIR}/midas "

do_compile() {
	     oe_runmake
}

do_install() {
	     install -d ${D}${bindir}
	     install -m 0755 mfe ${D}${bindir}
}
