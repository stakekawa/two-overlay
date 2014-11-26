# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit latex-package

DESCRIPTION="LaTeX class for creating COMPASS Note"
HOMEPAGE="http://wwwcompass.cern.ch/compass/notes/"
SRC_URI="https://www.dropbox.com/s/346ig9iyihnfw23/${P}.zip"

LICENSE="GPL-2 FDL-1.2 LPPL-1.3c"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 ~sh sparc x86 ~amd64-fbsd ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE="doc examples"

DEPEND="app-arch/unzip
	dev-texlive/texlive-latex"
RDEPEND=">=dev-tex/pgf-1.10
	dev-tex/xcolor
	!dev-tex/translator"

S=${WORKDIR}/compassmemo

src_install() {
	cd ${S}
	insinto /usr/share/texmf-site/tex/latex/compassmemo
	doins *
}
