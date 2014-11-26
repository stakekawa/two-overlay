# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Natural Gentoo Blue Curl theme"
HOMEPAGE="http://kde-look.org/content/show.php/BlueCurls+fbcondecor%2Bgensplash?content=128161"
SRC_URI="https://www.dropbox.com/s/pmz04lclf9zqq1n/BlueCurls-0.3.tar.gz"

SLOT=0
LICENSE="Artistic GPL-2 as-is"
KEYWORDS="~amd64 amd64 ~ppc ~x86 x86"
IUSE=""
RESTRICT="binchecks strip nomirror"

DEPEND=">=media-gfx/splashutils-1.5.4"

S="${WORKDIR}/BlueCurls"

pkg_setup() {
	if ! built_with_use media-gfx/splashutils mng
	then
		ewarn "MNG support is missing from splashutils.  You will not see the"
		ewarn "service icons as services are starting."
	fi
}

src_install() {
	dodir /etc/splash/BlueCurls/
	cp -R ${S}/* ${D}/etc/splash/BlueCurls/
}
