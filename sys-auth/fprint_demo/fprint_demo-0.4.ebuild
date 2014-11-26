# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="a simple GTK+ application to demonstrate and test libfprint's capabilities"
HOMEPAGE="http://www.reactivated.net/fprint/wiki/Fprint_demo"
SRC_URI="mirror://sourceforge/fprint/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sys-auth/libfprint
	x11-libs/gtk+:2"
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README || die
}
