# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="AppleTuxBlack theme for kdm-4.x"
HOMEPAGE=""
SRC_URI="https://www.dropbox.com/s/krpvjnokxbep1af/${P}.tar.gz"

SLOT=0
LICENSE="Artistic GPL-2 as-is"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="binchecks strip"

DEPEND="kde-base/kdm:4"

src_install() {
	dodir /usr/share/apps/kdm/themes/appletuxblack
	cp -aR ${S}/* ${D}/usr/share/apps/kdm/themes/appletuxblack
}
