# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/xfce-gant-icon-theme/xfce-gant-icon-theme-3.9_p6.ebuild,v 1.1 2009/09/02 08:34:15 ssuominen Exp $

inherit gnome2-utils

DESCRIPTION="Xfce OSX Aluminium Icon Theme"
HOMEPAGE="http://www.xfce-look.org/content/show.php/OSX_Aluminium?content=99140"
SRC_URI="http://3rik.free.fr/Linux/Themes/Xfce/OSX_Aluminium-1.2.tar.bz2"

LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

RDEPEND="x11-themes/hicolor-icon-theme"
DEPEND="${RDEPEND}"

RESTRICT="binchecks strip"

S=${WORKDIR}/OSX_Aluminium

pkg_preinst() {
	gnome2_icon_savelist
}

src_install() {
	rm -f preferences-desktop-default-applications.png || die
	insinto /usr/share/icons/OSX_Aluminium
	doins -r * || die
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}

