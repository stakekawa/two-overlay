# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emulation/emul-linux-x86-xlibs/emul-linux-x86-xlibs-20130224.ebuild,v 1.3 2013/03/16 15:24:19 pacho Exp $

EAPI=5
inherit emul-linux-x86

LICENSE="FTL GPL-2 MIT"

SRC_URI="https://www.dropbox.com/s/wo1pl2eq6rwty9r/${P}.tar.xz"

KEYWORDS="-* amd64"
IUSE="opengl"

DEPEND=""
RDEPEND="app-emulation/emul-linux-x86-qtlibs"
