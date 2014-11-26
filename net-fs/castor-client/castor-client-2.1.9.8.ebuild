# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils

DESCRIPTION="Cern Advanced mass STORage client libraries and binaries"
HOMEPAGE="http://castor.web.cern.ch/castor/"
SRC_URI="http://castorold.web.cern.ch/castorold/DIST/CERN/savannah/CASTOR.pkg/2.1.9-*/2.1.9-8/castor-2.1.9-8.tar.gz"
LICENSE="GPL-2"

SLOT="0"

KEYWORDS="x86 amd64"

IUSE=""

DEPEND=""

RDEPEND="${DEPEND}"

S="${WORKDIR}/castor-2.1.9"

src_compile() {
	export MAJOR_CASTOR_VERSION=2.1
	export MINOR_CASTOR_VERSION=9.8
	export CASTOR_NOSTK=1
	export CASTOR_CLIENT=1

	cd ${S}

	epatch ${FILESDIR}/castor-2.1.9.8-tape-Imakefile.diff

	make -f Makefile.ini

	make client || die "emake failed"
}

src_install() {
	export DESTDIR="${D}"
	make installclient || die "emake install failed"
}
