# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit mount-boot

DESCRIPTION="Natural Gentoo Blue Curl theme for grub2"
HOMEPAGE=""
SRC_URI="https://www.dropbox.com/s/7hzxmzujw4a8xnr/BlueCurls-0.1.tar.gz"

SLOT=0
LICENSE="Artistic GPL-2 as-is"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="binchecks strip"

DEPEND="sys-boot/grub:2"

S=${WORKDIR}/

src_install() {
	cd ${S}
	dodir /boot/grub2/BlueCurls/
        insinto /boot/grub2/BlueCurls
        doins *.jpg
}
