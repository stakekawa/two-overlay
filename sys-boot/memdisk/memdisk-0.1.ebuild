# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit mount-boot

DESCRIPTION="Memdisk image from syslinux needed to boot floppy and cdrom images"
HOMEPAGE=""
SRC_URI="https://www.dropbox.com/s/vnqtxu42isak4jn/${P}.7z"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

BOOTDIR=/boot/images

RDEPEND=">=sys-boot/grub-0.95"
DEPEND="app-arch/p7zip"

src_install() {
	insinto ${BOOTDIR}
	doins memdisk
}

pkg_postinst() {
	mount-boot_pkg_postinst
}
