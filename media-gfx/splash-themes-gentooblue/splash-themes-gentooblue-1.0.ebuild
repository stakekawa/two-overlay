# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Gentoo Blue theme"
HOMEPAGE="http://www.kde-look.org/content/show.php/Gentoo-Blue+fbsplash?content=46481"
SRC_URI="http://www.kin9.de/files/gentoo/Gentoo-Blue-fbsplash.tar.gz"

SLOT=0
LICENSE="Artistic GPL-2 as-is"
KEYWORDS="~amd64 amd64 ~ppc ~x86 x86"
IUSE=""
RESTRICT="binchecks strip"

DEPEND=">=media-gfx/splashutils-1.5.4"

S="${WORKDIR}/gentoo-blue/"

pkg_setup() {
	if ! built_with_use media-gfx/splashutils mng
	then
		ewarn "MNG support is missing from splashutils.  You will not see the"
		ewarn "service icons as services are starting."
	fi
}

src_install() {
	dodir /etc/splash/gentoo-blue/
	cd ${S}
	chmod -x *.cfg Vera.ttf images/*
	cp -R ${S}/* ${D}/etc/splash/gentoo-blue/
}
