# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Provide cpuid.h include for glibc compilation with gcc non providing it"
HOMEPAGE=""
SRC_URI=""
SLOT=0
LICENSE="GPL-2"
KEYWORDS="~amd64 amd64 ~x86 x86"
IUSE=""

src_install() {
	mkdir -p ${D}/usr/include/
	cp ${FILESDIR}/cpuid.h ${D}/usr/include/
}

