# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit rpm

DESCRIPTION="CERN VidyoDesktop"
HOMEPAGE="https://vidyoportal.cern.ch/"
SRC_URI="x86? ( https://vidyoportal.cern.ch/upload/VidyoDesktopInstaller-sl5-TAG_VD_3_3_0_027.rpm -> ${P}.rpm )
         amd64? ( https://vidyoportal.cern.ch/upload/VidyoDesktopInstaller-sl564-TAG_VD_3_3_0_027.rpm -> ${P}_amd64.rpm )"

LICENSE="GPL"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT=""

S=${WORKDIR}/

src_unpack() {
	rpm_src_unpack ${A}
	cd ${S}
	sed -i -e 's/libQtGui/qt4\/libQtGui/' usr/bin/VidyoDesktop || die "sed failed"
}

src_install() {
	cd ${S}
	dodir /usr/bin
	exeinto /usr/bin
	doexe usr/bin/VidyoDesktop
	dodir /opt/vidyo/VidyoDesktop
	exeinto /opt/vidyo/VidyoDesktop
	doexe opt/vidyo/VidyoDesktop/VidyoDesktop
	doexe opt/vidyo/VidyoDesktop/vidyo-profile.sh
	doexe opt/vidyo/VidyoDesktop/RenderCheck
	doexe opt/vidyo/VidyoDesktop/VidyoDesktopInstallHelper
	insinto /
	doins -r * || die
	fperms 755 /usr/bin/VidyoDesktop \
		/opt/vidyo/VidyoDesktop/VidyoDesktop /opt/vidyo/VidyoDesktop/vidyo-profile.sh \
		/opt/vidyo/VidyoDesktop/RenderCheck /opt/vidyo/VidyoDesktop/VidyoDesktopInstallHelper
}
