# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

DESCRIPTION="Image warping and dissolving (morphing) programs"

HOMEPAGE="http://xmorph.sf.net"

SRC_URI="https://www.dropbox.com/s/2qwo0xsz91c7dry/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"

SLOT="0"

KEYWORDS="x86 amd64"

IUSE="fftw gtk tk X"

DEPEND=" fftw? ( sci-libs/fftw:3.0 )
	 gtk?  ( >=x11-libs/gtk+-2.4.0 )
	 tk?   ( dev-lang/tk
                 dev-lang/tcl )
	 X?    ( x11-libs/libX11
                 x11-libs/libXext
                 x11-libs/libXpm ) "

RDEPEND="${DEPEND}"

#S=${WORKDIR}/${P}

src_prepare() {
	epatch "${FILESDIR}"/${P}-cstring.patch
}
