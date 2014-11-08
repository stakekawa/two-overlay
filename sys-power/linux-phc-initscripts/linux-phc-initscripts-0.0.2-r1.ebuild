# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/splash-themes-livecd/splash-themes-livecd-2007.0-r2.ebuild,v 1.1 2008/09/14 11:38:47 spock Exp $

inherit eutils

DESCRIPTION="Initscript for linux-phc"
HOMEPAGE=""
SRC_URI=""
SLOT=0
LICENSE="GPL-2"
KEYWORDS="amd64 x86"
IUSE=""

src_install() {
        newinitd "${FILESDIR}"/initd-linux-phc linux-phc
        newconfd "${FILESDIR}"/confd-linux-phc linux-phc
}

