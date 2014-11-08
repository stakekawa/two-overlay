# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="Natural Gentoo theme for kdm-4.x"
HOMEPAGE=""
SRC_URI="https://www.dropbox.com/s/od5n1s65k1htg07/${P}.tar.gz"

SLOT=0
LICENSE="Artistic GPL-2 as-is"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="binchecks strip"

DEPEND="kde-base/kdm:4"

src_install() {
	dodir /usr/share/apps/kdm/themes
	cp -aR ${S}/* ${D}/usr/share/apps/kdm/themes/
}
