inherit xenclient
inherit autotools pkgconfig lib_package

DEPENDS = "xen-tools"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"

SRCREV_source = "${AUTOREV}"

PV = "0+git${SRCPV}"

SRC_URI = "git://github.com/jean-edouard/tailxendmesg.git;protocol=git;branch=master;name=source"

S = "${WORKDIR}/git/"

LDFLAGS += " -lxenctrl "
