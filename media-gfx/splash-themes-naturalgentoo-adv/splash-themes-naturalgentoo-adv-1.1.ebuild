# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Natural Gentoo Advanced theme"
HOMEPAGE="http://kde-look.org/content/show.php/natural_gentoo+advanced+theme?content=124959"
SRC_URI="https://www.dropbox.com/s/e491cuxqdmpv7hc/natural_gentoo_adv-1.1.tar.gz"

SLOT=0
LICENSE="Artistic GPL-2 as-is"
KEYWORDS="~amd64 ~ppc ~x86 amd64 x86"
IUSE=""
RESTRICT="binchecks strip"

DEPEND=">=media-gfx/splashutils-1.5.4"

S="${WORKDIR}/natural_gentoo_adv"

pkg_setup() {
	if ! built_with_use media-gfx/splashutils mng
	then
		ewarn "MNG support is missing from splashutils.  You will not see the"
		ewarn "service icons as services are starting."
	fi
}

src_install() {
	cd ${S}
	rm -rf temp/ metadata.xml
	dodir /etc/splash/natural_gentoo_adv/
	cp -R ${S}/* ${D}/etc/splash/natural_gentoo_adv/
}
