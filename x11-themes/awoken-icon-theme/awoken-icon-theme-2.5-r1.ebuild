# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/faenza-xfce-icon-theme/faenza-xfce-icon-theme-0.2.1.ebuild,v 1.1 2012/01/10 18:43:06 ssuominen Exp $

EAPI=4
inherit gnome2-utils

DESCRIPTION="AwOken icon theme"
HOMEPAGE="http://alecive.deviantart.com/art/AwOken-163570862"
SRC_URI="https://dl.dropbox.com/u/8029324/AwOken-2.5.zip"

LICENSE="CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="binchecks strip"

S="${WORKDIR}/AwOken-2.5"

src_install() {
	cd ${S}
        tar -xzf AwOken.tar.gz
        tar -xzf AwOkenDark.tar.gz
        tar -xzf AwOkenWhite.tar.gz
        rm -f `find . -name "*customization*" -print`
	rm -f AwOken/Installation_and_Instructions.pdf
	rm -f *.tar.gz
	dodir /usr/share/icons/
	insinto /usr/share/icons/
	doins -r * || die
}

pkg_preinst() {	gnome2_icon_savelist; }
pkg_postinst() { gnome2_icon_cache_update; }
pkg_postrm() { gnome2_icon_cache_update; }
