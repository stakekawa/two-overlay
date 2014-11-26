# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils autotools

DESCRIPTION="HepMC - a C++ Event Record for Monte Carlo Generators"
HOMEPAGE="https://savannah.cern.ch/projects/hepmc/"
SRC_URI="${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	econf \
		--enable-shared \
		--with-momentum=GEV \
		--with-length=MM \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS README
}
