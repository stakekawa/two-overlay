# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="A clone and enhancement of Super Pang, a fast-paced action game that involves popping balloons with a harpoon"
HOMEPAGE="http://apocalypse.rulez.org/pangzero/Pang_Zero"
SRC_URI="mirror://sourceforge/pangzero/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="dev-perl/SDL"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog README TODO
	make_desktop_entry pangzero "Pang Zero"
	prepgamesdirs
}
