# Copyright open-overlay 2015 by Alex

EAPI=5

DESCRIPTION="Official icon theme from the Numix project."
HOMEPAGE="https://gnome-look.org"

SRC_URI="https://github.com/pantera31752/${PN}/archive/master.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0+"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	unpack "${A}"
	mv "${PN}-master" "${P}"
}

src_install() {
	insinto /usr/share/icons
	doins -r bee-cells
	dodoc README.md
}
