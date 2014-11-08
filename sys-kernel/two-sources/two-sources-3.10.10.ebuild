# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-kernel/gentoo-sources/gentoo-sources-3.10.10.ebuild,v 1.1 2013/08/30 12:24:46 tomwij Exp $

EAPI="5"
ETYPE="sources"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="17"
K_DEBLOB_AVAILABLE="1"
UNIPATCH_LIST=" ${FILESDIR}/3.10-sched-bfs-440.patch
		${FILESDIR}/3.10-powernow-k8-vcore_list.patch "
inherit kernel-2
detect_version
detect_arch

KEYWORDS="~alpha amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc x86"
HOMEPAGE="http://dev.gentoo.org/~mpagano/genpatches"
IUSE="deblob"

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
