#
# This file is the midas recipe.
#

SUMMARY = "MIDAS"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

# gitsm brings in the submodules
SRC_URI = "gitsm://bitbucket.org/tmidas/midas.git;protocol=https;branch=develop;rev=4054e07d5a986216189df6364a3fcec35724618c file://cmake.patch"

# Sometimes the PR service seems to fail under Ubuntu, you can switch to this
PR = "r0"

# This is needed to force SRCREV to update
#PRSERV_HOST = "localhost:0"
#PV = "1.0+git${SRCPV}"

# Dependecies required to build MIDAS
DEPENDS = "curl zlib"

# CMake Flag to only build library (added via patch ATM)
EXTRA_OECMAKE = "-DLIBS_ONLY=1 "

# Oddly bitbake doesn't put it in 'midas' but in 'git'
S = "${WORKDIR}/git"

# MIDAS installs unversioned libraries
# So we need to stop bitbake from erroring on them
SOLIBS = ".so"
FILES_SOLIBSDEV = ""

# Files to place in the build
FILES_${PN} = "${libdir}/*.so ${includedir}/midas/*"

inherit pkgconfig cmake

do_install() {
	cmake_do_install
  install -d -m 0655 ${D}${includedir}/midas
  install -m 0644 ${S}/include/*.h ${D}${includedir}/midas/
}