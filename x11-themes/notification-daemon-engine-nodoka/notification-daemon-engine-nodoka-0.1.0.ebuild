# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

DESCRIPTION="Nodoka notification-daemon Engine"
HOMEPAGE="https://nodoka.fedorahosted.org/"
SRC_URI="https://fedorahosted.org/releases/n/o/nodoka/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

COMMON_DEPEND=">=x11-libs/gtk+-2.10
	x11-libs/libsexy"

RDEPEND="${COMMON_DEPEND}
	virtual/notification-daemon"

DEPEND="${COMMON_DEPEND}
	dev-util/pkgconfig"

src_prepare() {
	epatch "${FILESDIR}"/${P}-relax-daemon-version-restriction.patch
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
	dodoc AUTHORS ChangeLog Credits NEWS README || die "dodoc failed"
}
