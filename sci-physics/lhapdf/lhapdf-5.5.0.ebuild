# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils autotools

DESCRIPTION="The Les Houche Accord Parton Density Function library"
HOMEPAGE="http://projects.hepforge.org/lhapdf/"
SRC_URI="${P}.tar.gz http://www.hepforge.org/archive/lhapdf/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS="~x86 ~amd64"

IUSE="doc"
DEPEND=">=sys-devel/gcc-4.1.2
	doc? ( app-doc/doxygen ) "
RDEPEND="${DEPEND}"

src_compile() {
	econf \
		--enable-shared \
		--enable-static \
		--enable-lhaglue \
		$(use_enable doc doxygen) \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS README TODO
}
