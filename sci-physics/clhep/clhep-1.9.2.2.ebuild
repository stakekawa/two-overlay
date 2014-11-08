# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="CLHEP - A Class Library for High Energy Physics"
HOMEPAGE="http://wwwasd.web.cern.ch/wwwasd/lhc++/clhep/"
SRC_URI="http://proj-clhep.web.cern.ch/proj-clhep/distributions/${P}.tgz"
RESTRICT="nomirror"
LICENSE=""

SLOT="0"

KEYWORDS="amd64 x86"

IUSE="doc"

DEPEND="
	>=sys-devel/automake-1.9
	>=sys-devel/autoconf-2.53"

RDEPEND=""

S=${WORKDIR}/${PV}/CLHEP

src_compile() {
	
	einfo ""
	einfo "Be careful with choosing the right gcc version (3.3.x or 3.4.x)"
	einfo "Press CTRL+C now to check or change it"
	einfo ""
	
	cd ${S}
	./configure \
		--prefix=/opt/clhep || die "./configure failed"

	emake || die "emake failed"

	if use doc ; then
		make docs || die "make docs failed"
	fi
}

src_test() {
	make check || die "make check failed :("
}

src_install() {

	make \
		prefix=${D}/opt/clhep \
		 install || die
	if use doc ; then
	make \
		prefix=${D}/opt/clhep \
		install-docs || die
	fi

	doenvd ${FILESDIR}/99clhep
}
