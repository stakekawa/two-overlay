# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Initscript for synergy"
HOMEPAGE=""
SRC_URI=""
SLOT=0
LICENSE="GPL-2"
KEYWORDS="amd64 x86"
IUSE=""
RDEPEND="x11-misc/synergy"
DEPEND="${RDEPEND}"

src_install() {
        newinitd "${FILESDIR}"/initd-synergys synergys
        newconfd "${FILESDIR}"/confd-synergys synergys
        newinitd "${FILESDIR}"/initd-synergyc synergyc
        newconfd "${FILESDIR}"/confd-synergyc synergyc
}
