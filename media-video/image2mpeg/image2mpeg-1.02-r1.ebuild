# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils autotools

DESCRIPTION="A tool to convert digital photos (and other images) into MPEG movie streams"
HOMEPAGE="http://www.gromeck.de/?image2mpeg"
SRC_URI="http://www.gromeck.de/uploads/media/${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"

KEYWORDS="~x86 x86 ~amd64 amd64"

IUSE=""

DEPEND=">=media-gfx/imagemagick-6.8
	>=media-sound/lame-3.98.2-r1
	>=media-sound/madplay-0.15.2b-r1
	>=media-video/ffmpeg-0.5_p20373
	>=media-video/mpeg-tools-1.5b-r3"

RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-imagemagick-6.8.patch
	epatch "${FILESDIR}"/${PN}-gip-imagemagick-6.8.patch

	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
