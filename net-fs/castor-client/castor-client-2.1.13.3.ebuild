# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Cern Advanced mass STORage client libraries and binaries"
HOMEPAGE="http://castor.web.cern.ch/castor/"
SRC_URI="http://castorold.web.cern.ch/castorold/DIST/CERN/savannah/CASTOR.pkg/2.1.13-*/2.1.13-3/castor-2.1.13-3.tar.gz"
LICENSE="GPL-2"

SLOT="0"

KEYWORDS="x86 amd64"

IUSE=""

DEPEND=" virtual/krb5 "

RDEPEND="${DEPEND}"

S="${WORKDIR}/castor-2.1.13"

src_compile() {
	export MAJOR_CASTOR_VERSION=2.1
	export MINOR_CASTOR_VERSION=13.3

	cd ${S}

	econf || die "configure failed"

	emake client || die "emake failed"
}

src_install() {
	export DESTDIR="${D}"
	emake installclient || die "emake install failed"
}
