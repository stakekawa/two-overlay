# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/gentoo-xcursors/gentoo-xcursors-0.3.1.ebuild,v 1.18 2010/10/17 03:07:26 leio Exp $

EAPI="4"

DESCRIPTION="Stylized oxygen mouse theme created for use with dark desktop"
HOMEPAGE="http://xfce-look.org/content/show.php/Oxygen+Neon?content=137109"
SRC_URI="http://xfce-look.org/CONTENT/content-files/137109-oxy-neon-0.2.tar.gz -> ${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 sh sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

S="${WORKDIR}/"

src_install() {
	dodir /usr/share/cursors/xorg-x11
	cp -pPR "${S}"/oxy-neon "${D}"/usr/share/cursors/xorg-x11/ || die
}

pkg_postinst() {
	einfo "To use this set of cursors, edit or create the file ~/.Xdefaults"
	einfo "and add the following line (for example):"
	einfo "Xcursor.theme: gentoo"
	einfo ""
	einfo "You can change the size by adding a line like:"
	einfo "Xcursor.size: 48"
	einfo ""
	einfo "Also, to globally use this set of mouse cursors edit the file:"
	einfo "   /usr/local/share/cursors/xorg-x11/default/index.theme"
	einfo "and change the line:"
	einfo "    Inherits=[current setting]"
	einfo "to (for example)"
	einfo "    Inherits=gentoo"
	einfo ""
	einfo "Note this will be overruled by a user's ~/.Xdefaults file."
	einfo ""
	ewarn "If you experience flickering, try setting the following line in"
	ewarn ""
	ewarn "the Device section of your xorg.conf file:"
	ewarn "    Option  \"HWCursor\"  \"false\""
	einfo ""
	einfo "The three sets installed are gentoo, gentoo-silver and gentoo-blue."
}
