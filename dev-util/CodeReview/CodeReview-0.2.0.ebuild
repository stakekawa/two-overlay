# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python{3_3,3_4,3_5} )

inherit distutils-r1 versionator

DESCRIPTION="CodeReview is a Git GUI tool to perform code review written in Python3 and Qt5"
HOMEPAGE="https://github.com/FabriceSalvaire/CodeReview"
SRC_URI="mirror://gentoo/${P}.tar.xz"

LICENSE="GPL-2-with-linking-exception"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	dev-python/pygit2[${PYTHON_USEDEP}]
	dev-python/PyQt5
	dev-python/pyyaml[${PYTHON_USEDEP}]
"

DEPEND="${RDEPEND}"
