# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="AppleTuxBlack theme for lightdm-kde-greeter"
HOMEPAGE=""
SRC_URI="https://www.dropbox.com/s/krpvjnokxbep1af/${P}.tar.gz"

SLOT=0
LICENSE="Artistic GPL-2 as-is"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="binchecks strip"

DEPEND="x11-misc/lightdm"

S="${WORKDIR}/"

src_install() {
	insinto /etc/lightdm/
	doins "${FILESDIR}/lightdm-gtk-greeter.conf"

	dodir /
	cp -aR ${S}/* ${D}/
}
