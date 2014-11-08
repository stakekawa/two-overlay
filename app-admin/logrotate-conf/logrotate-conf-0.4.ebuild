# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Logrotate config files"
HOMEPAGE=""
SRC_URI=""
SLOT=0
LICENSE="GPL-2"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="binchecks strip"

DEPEND="app-admin/logrotate"

src_install() {
	dodir /etc/logrotate.d/
        insinto /etc/logrotate.d/
        doins ${FILESDIR}/*
}
