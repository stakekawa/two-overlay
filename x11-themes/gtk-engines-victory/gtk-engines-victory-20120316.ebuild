# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DESCRIPTION="Victory (Strikes Again) theme for GTK+-2, GTK+-3 and xfwm4, gnome-shell, ..."
HOMEPAGE="http://xfce-look.org/content/show.php/Victory+%28Strikes+Again%29?content=123936"
SRC_URI="http://xfce-look.org/CONTENT/content-files/123936-123936-Victory20120316c.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

S=${WORKDIR}/

src_install() {
	cd ${S}
        mv "Victory for Top Panels" Victory-TopPanels
	dodir /usr/share/themes/
	insinto /usr/share/themes/
	doins -r Victory*
}
