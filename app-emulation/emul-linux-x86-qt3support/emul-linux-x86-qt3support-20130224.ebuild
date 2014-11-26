# Copyright s.takekawa@gmail.com
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit emul-linux-x86

LICENSE="FTL GPL-2 MIT"

SRC_URI="https://www.dropbox.com/s/wo1pl2eq6rwty9r/${P}.tar.xz"

KEYWORDS="-* amd64"
IUSE="opengl"

DEPEND=""
RDEPEND="app-emulation/emul-linux-x86-qtlibs"
