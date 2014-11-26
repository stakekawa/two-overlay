# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils

DESCRIPTION="Natural Gentoo theme"
HOMEPAGE="http://www.kde-look.org/content/show.php/Natural+Gentoo?content=49074"
SRC_URI="https://www.dropbox.com/s/qvovl2uqozwb8oq/naturalgentoo-${PV}.tar.gz"

SLOT=0
LICENSE="Artistic GPL-2 as-is"
KEYWORDS="~amd64 amd64 ~ppc ~x86 x86"
IUSE=""
RESTRICT="binchecks strip nomirror"

DEPEND=">=media-gfx/splashutils-1.5.4"

S="${WORKDIR}/naturalgentoo"

pkg_setup() {
	if ! built_with_use media-gfx/splashutils mng
	then
		ewarn "MNG support is missing from splashutils.  You will not see the"
		ewarn "service icons as services are starting."
	fi
}

src_install() {
	dodir /etc/splash/naturalgentoo/
	cp -R ${S}/* ${D}/etc/splash/naturalgentoo/
}
