# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit fdo-mime gnome2 eutils flag-o-matic toolchain-funcs

DESCRIPTION="An X Viewer for PDF Files"
HOMEPAGE="http://www.foolabs.com/xpdf/"
SRC_URI="ftp://ftp.foolabs.com/pub/xpdf/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc x86 x86-fbsd"
#IUSE="nodrm"
IUSE=""

RDEPEND=">=app-text/poppler-0.18
	>=x11-libs/motif-2.3:0
	x11-libs/libX11
	x11-libs/libXpm"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"

#S=${WORKDIR}/

#PATCHDIR="${WORKDIR}/${PV}"

pkg_setup() {
	#append-flags '-DSYSTEM_XPDFRC="\"/etc/xpdfrc\""'
	append-cppflags '-DSYSTEM_XPDFRC="\"/etc/xpdfrc\""'
	# We know it's there, probably won't get rid of it, so let's make
	# the build output readable by removing it.
	einfo "Suppressing warning overload with -Wno-write-strings"
	append-cxxflags -Wno-write-strings
}

src_prepare() {
	epatch "${FILESDIR}/${P}-ext.patch"
	epatch "${FILESDIR}/${PN}-3.00-core.patch"
	epatch "${FILESDIR}/${PN}-3.00-xfont.patch"
	epatch "${FILESDIR}/${PN}-3.00-papersize.patch"
	epatch "${FILESDIR}/${PN}-3.00-gcc4.patch"
	epatch "${FILESDIR}/${P}-crash.patch"
	epatch "${FILESDIR}/${P}-64bit.patch"
	epatch "${FILESDIR}/${PN}-3.02-fontlist.patch"
	epatch "${FILESDIR}/${PN}-3.02-additionalzoom.patch"
	epatch "${FILESDIR}/${P}-compile-fix.patch"
	epatch "${FILESDIR}/${PN}-permission.patch"
	epatch "${FILESDIR}/${PN}-add_accelerators.patch"
	epatch "${FILESDIR}/${PN}-fix_encodings.patch"
	#use nodrm && epatch "${PATCHDIR}/xpdf-3.02-poppler-nodrm.patch"
	#has_version '>=app-text/poppler-0.16' && epatch	"${FILESDIR}/${P}-poppler-0.16.patch"
	#mv parseargs.c parseargs.cc
}

src_configure() {
	econf \
		--with-freetype2-library=/usr/lib/ \
		--with-freetype2-includes=/usr/include/freetype2/
}

src_compile() {
	tc-export CXX
	emake xpdf
}

src_install() {
	dobin xpdf/xpdf
	doman doc/xpdf.1
	insinto /etc
	newins "${FILESDIR}"/xpdfrc xpdfrc
	dodoc README ANNOUNCE CHANGES
	doicon "${FILESDIR}"/xpdf.png
	insinto /usr/share/applications
	doins "${FILESDIR}"/xpdf.desktop
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update
}
