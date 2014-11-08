# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils mount-boot

DESCRIPTION="Natural Gentoo theme"
HOMEPAGE="http://www.kde-look.org/content/show.php/Natural+Gentoo?content=49074"
SRC_URI="http://www.kde-look.org/CONTENT/content-files/49074-natural_gentoo-8.0.tar.gz"

SLOT=0
LICENSE="Artistic GPL-2 as-is"
KEYWORDS="~amd64 amd64 ~ppc ~x86 x86"
IUSE=""
RESTRICT="binchecks strip"

DEPEND=">=media-gfx/splashutils-1.5.4"

S="${WORKDIR}/natural_gentoo-8.0"

pkg_setup() {
	if ! built_with_use media-gfx/splashutils mng
	then
		ewarn "MNG support is missing from splashutils.  You will not see the"
		ewarn "service icons as services are starting."
	fi
}

src_install() {
	mv ${S}/boot/grub/gentoo.xpm.gz ${S}/boot/grub/n_gentoo.xpm.gz
	dodir /boot/grub
	insinto /boot/grub
	doins ${S}/boot/grub/n_gentoo.xpm.gz
	dodir /etc/splash/natural_gentoo/
	cp -R ${S}/etc/splash/natural_gentoo/ ${D}/etc/splash/
}
