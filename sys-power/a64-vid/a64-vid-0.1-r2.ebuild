# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="a64-vid util to check frequency and vid on AMD cpu"
HOMEPAGE=""
SRC_URI=""
SLOT=0
LICENSE="GPL-2"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT=""

S="${WORKDIR}"

src_unpack() {
	cd ${S}
	cp ${FILESDIR}/${PN}.c .
}

src_compile() {
	cd ${S}
	gcc -o ${PN} ${PN}.c
}

src_install() {
	cd ${S}
        dosbin ${PN}
}
