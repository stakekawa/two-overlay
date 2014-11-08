# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Mailer scripts"
HOMEPAGE=""
SRC_URI=""
SLOT=0
LICENSE="GPL-2"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="binchecks strip"

DEPEND="virtual/mailx"

src_install() {
	dodir /usr/share/mailmessages
        insinto /usr/share/mailmessages
        doins ${FILESDIR}/*.txt
	dodir /etc/local.d/
	exeinto /etc/local.d/
	newexe ${FILESDIR}/mail boot.start
	newexe ${FILESDIR}/mail shutdown.stop
}
