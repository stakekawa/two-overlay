# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils mount-boot

DESCRIPTION="Natural Gentoo theme for grub2"
HOMEPAGE=""
SRC_URI="https://www.dropbox.com/s/qays1uepmmblpci/grub-naturalgentoo-0.3.tar.gz"

SLOT=0
LICENSE="Artistic GPL-2 as-is"
KEYWORDS="amd64 x86"
IUSE="+grub0 grub2"
RESTRICT="binchecks strip"

DEPEND="grub2? ( sys-boot/grub:2 )"

S=${WORKDIR}/

src_install() {
	cd ${S}
	if use grub2 ; then
	  	dodir /boot/grub/naturalgentoo/
          	insinto /boot/grub/naturalgentoo
          	doins *.jpg
        fi
	if use grub0 ; then
		dodir /boot/grub/
        	insinto /boot/grub
        	doins n_gentoo.xpm.gz
	fi
}
