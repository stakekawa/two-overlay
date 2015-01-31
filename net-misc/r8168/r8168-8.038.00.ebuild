# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/r8168/r8168-8.038.00.ebuild,v 1.1 2014/03/18 16:45:02 joker Exp $

EAPI=5

inherit linux-mod eutils

DESCRIPTION="r8168 driver for Realtek 8111/8168 PCI-E NICs"
HOMEPAGE="http://www.realtek.com.tw"
SRC_URI="http://r8168dl.appspot.com/files/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
IUSE=""

KEYWORDS="~amd64 ~x86"

MODULE_NAMES="r8168(net:${S}/src)"
BUILD_TARGETS="modules"

src_prepare() {
	if kernel_is gt 3 15 99 ; then
		epatch ${FILESDIR}/${PN}-build-3.16.patch
	fi
	if kernel_is gt 3 14 99 ; then
		cd ${S}
		sed -i 's/PREPARE_DELAYED_WORK/INIT_DELAYED_WORK/' src/r8168_n.c
	fi
}

pkg_setup() {
	linux-mod_pkg_setup
	BUILD_PARAMS="KERNELDIR=${KV_DIR}"
}

src_install() {
	linux-mod_src_install
	dodoc README
}
