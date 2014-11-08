# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI="5"

DESCRIPTION="Compatibility package for running binaries linked against a gcc 4.7 libstdc++"
HOMEPAGE="http://gcc.gnu.org/libstdc++/"
SRC_URI="https://www.dropbox.com/s/skk7ctwy7f7zb38/${P}.tar.xz"
LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND=""
RDEPEND="sys-libs/glibc"

RESTRICT="strip"

S="${WORKDIR}"

src_install() {
        if use x86 ; then
		rm -rf "${WORKDIR}"/usr/lib64
		mv "${WORKDIR}"/usr/lib32 "${WORKDIR}"/usr/lib
        fi
	cp -pPR "${WORKDIR}"/* "${D}"/ || die "copying files failed!"
}
