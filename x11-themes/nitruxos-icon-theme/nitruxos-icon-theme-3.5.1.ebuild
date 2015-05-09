# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit gnome2-utils

DESCRIPTION="The Icon set is part of The Nitrux Artwork Project and was created to be used in the upcoming NITRUX OS"
HOMEPAGE="http://xfce-look.org/content/show.php/Nitrux+OS+Icons?content=154497"
SRC_URI="http://nitrux.in/downloads/files/free/nitrux-icon-theme-${PV}.tar.gz"

LICENSE="CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="${DEPEND}"

RESTRICT="binchecks strip"

S=${WORKDIR}/Nitrux

src_install() {
	cd ${S}
	dodir /usr/share/icons/Nitrux/
	insinto /usr/share/icons/Nitrux/
	doins -r * || die
}

pkg_preinst() {	gnome2_icon_savelist; }
pkg_postinst() { gnome2_icon_cache_update; }
pkg_postrm() { gnome2_icon_cache_update; }
