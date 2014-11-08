# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/splash-themes-livecd/splash-themes-livecd-2007.0-r2.ebuild,v 1.1 2008/09/14 11:38:47 spock Exp $

inherit eutils

DESCRIPTION="Provide cpuid.h include for glibc compilation with gcc non providing it"
HOMEPAGE=""
SRC_URI=""
SLOT=0
LICENSE="GPL-2"
KEYWORDS="~amd64 amd64 ~x86 x86"
IUSE=""

src_install() {
	mkdir -p ${D}/usr/include/
	cp ${FILESDIR}/cpuid.h ${D}/usr/include/
}

