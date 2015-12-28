# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit mount-boot

DESCRIPTION="Natural Gentoo theme"
HOMEPAGE="http://www.kde-look.org/content/show.php/Natural+Gentoo?content=49074"
SRC_URI="http://www.kde-look.org/CONTENT/content-files/49074-natural_gentoo-8.0.tar.gz"

SLOT=0
LICENSE="Artistic GPL-2 as-is"
KEYWORDS="~amd64 amd64 ~ppc ~x86 x86"
IUSE="splash"
RESTRICT="binchecks strip"

DEPEND="splash? ( >=media-gfx/splashutils-1.5.4 )"

S="${WORKDIR}/natural_gentoo-8.0"

src_install() {
	mv ${S}/boot/grub/gentoo.xpm.gz ${S}/boot/grub/n_gentoo.xpm.gz
	dodir /boot/grub
	insinto /boot/grub
	doins ${S}/boot/grub/n_gentoo.xpm.gz
	if use splash; then
		dodir /etc/splash/natural_gentoo/
		cp -R ${S}/etc/splash/natural_gentoo/ ${D}/etc/splash/
	fi
}
