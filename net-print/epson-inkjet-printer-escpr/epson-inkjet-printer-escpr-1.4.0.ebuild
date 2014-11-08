# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=4

DESCRIPTION="Epson Inkjet Printer Driver (ESC/P-R) for Linux"
HOMEPAGE="http://avasys.jp/eng/linux_driver/index.php"
SRC_URI="https://www.dropbox.com/s/lzdm83oiikzfjx4/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="net-print/cups"
RDEPEND="${DEPEND}"

RESTRICT=""
