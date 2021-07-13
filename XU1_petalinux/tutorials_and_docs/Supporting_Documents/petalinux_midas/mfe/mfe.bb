#
# This file is the mfe recipe.
#

SUMMARY = "Darkside MIDAS Frontend"
SECTION = "PETALINUX/apps"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

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
