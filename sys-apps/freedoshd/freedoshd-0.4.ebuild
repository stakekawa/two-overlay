# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/memtest86+/memtest86+-4.20-r1.ebuild,v 1.3 2012/09/12 12:53:54 johu Exp $

EAPI=4

inherit mount-boot eutils

DESCRIPTION="FreeDOS floppy image with Seagate Tools"
HOMEPAGE=""
SRC_URI="https://www.dropbox.com/s/wzfmhbrd76luuen/${P}.7z"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

BOOTDIR=/boot/images

RDEPEND="sys-boot/memdisk"
DEPEND="app-arch/p7zip"

src_prepare() {
	cat - > "${T}"/42_${PN} <<EOF
#!/bin/sh
exec tail -n +3 \$0

menuentry "Seagate Tools" {
	linux16 ${BOOTDIR}/memdisk
        initrd16 ${BOOTDIR}/${PN}.img
}
EOF

}

src_install() {
	insinto ${BOOTDIR}
	doins ${PN}.img

	exeinto /etc/grub.d
	doexe "${T}"/42_${PN}
}

pkg_postinst() {
	mount-boot_pkg_postinst
	elog
	elog "FreeDOS floppy boot image has been installed in ${BOOTDIR}/"
	elog "You may wish to update your bootloader configs"
	elog "by adding these lines:"
	elog " - For grub2 just run grub-mkconfig, a configuration file is installed"
	elog "   as /etc/grub/42_${PN}"
	elog " - For grub legacy: (replace '?' with correct numbers for your boot partition)"
	elog "    > title = Seagate Tools"
	elog "    > root (hd?,?)"
	elog "    > kernel ${BOOTDIR}/memdisk"
	elog "    > initrd ${BOOTDIR}/${PN}.img"
	elog
}
