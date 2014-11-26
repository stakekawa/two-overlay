# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit emul-linux-x86

SRC_URI="https://www.dropbox.com/s/kaqrfhw733nfze8/${P}.tar.xz"

LICENSE="FTL GPL-2 MIT"

KEYWORDS="-* amd64"
IUSE="opengl"

DEPEND=""
RDEPEND="app-emulation/emul-linux-x86-xlibs
	 app-emulation/emul-linux-x86-gtklibs"
