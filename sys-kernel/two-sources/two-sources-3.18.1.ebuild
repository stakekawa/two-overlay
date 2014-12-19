# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-kernel/gentoo-sources/gentoo-sources-3.18.1.ebuild,v 1.1 2014/12/16 20:04:03 mpagano Exp $

EAPI="5"
ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="3"
K_DEBLOB_AVAILABLE="1"
UNIPATCH_LIST=" ${FILESDIR}/3.16-powernow-k8-vcore_list.patch
                ${FILESDIR}/linux-3.12-xhci-trbspersegment.patch
                ${FILESDIR}/3.18-sched-bfs-460.patch "
inherit kernel-2
detect_version
detect_arch

KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
HOMEPAGE="http://dev.gentoo.org/~mpagano/genpatches"
IUSE="deblob +experimental"

DESCRIPTION="Sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree and BFS scheduler"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI}"

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
