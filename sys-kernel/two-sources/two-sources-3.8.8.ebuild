# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-kernel/gentoo-sources/gentoo-sources-3.8.8.ebuild,v 1.1 2013/04/17 21:09:10 tomwij Exp $

EAPI="5"
ETYPE="sources"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="11"
K_DEBLOB_AVAILABLE="1"
UNIPATCH_LIST=" ${FILESDIR}/0001-block-cgroups-kconfig-build-bits-for-BFQ-v6-3.8.patch
                ${FILESDIR}/0002-block-introduce-the-BFQ-v6-I-O-sched-for-3.8.patch
                ${FILESDIR}/3.8-sched-bfs-428.patch "
inherit kernel-2
detect_version
detect_arch

KEYWORDS="~alpha amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc x86"
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
