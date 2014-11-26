# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MYFILE="locale.it.properties-${PV}"

DESCRIPTION="SciTE locale it"
HOMEPAGE="http://www.scintilla.org/"
SRC_URI="http://scite-files.googlecode.com/svn-history/trunk/translations/locale.it.properties -> ${MYFILE}"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"

S=${WORKDIR}

src_unpack() {

	cp ${DISTDIR}/${MYFILE} ${S}/locale.properties

}

src_install() {

	cd ${S}
	insinto /usr/share/scite
	doins locale.properties || die

}
