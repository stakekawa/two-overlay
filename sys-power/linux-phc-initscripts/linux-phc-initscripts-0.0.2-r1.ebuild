# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Initscript for linux-phc"
HOMEPAGE=""
SRC_URI=""
SLOT=0
LICENSE="GPL-2"
KEYWORDS="amd64 x86"
IUSE=""

src_install() {
        newinitd "${FILESDIR}"/initd-linux-phc linux-phc
        newconfd "${FILESDIR}"/confd-linux-phc linux-phc
}

