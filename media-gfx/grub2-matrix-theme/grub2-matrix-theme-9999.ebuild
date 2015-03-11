# Copyright open-overlay 2015 by Alex

EAPI="5"


DESCRIPTION="Grub2 matrix theme"
HOMEPAGE="http://kde-look.org"
SRC_URI="https://github.com/pantera31752/${PN}/archive/master.tar.gz -> ${P}.tar.gz"

LICENSE="Creative Commons by-sa"  
SLOT="0"
KEYWORDS="~amd64 ~x86"  
IUSE=""

src_unpack() {
unpack "{A}"
mv "${PN}-master" "${P}"
}
src_install() {
	insinto "${GRUB2_THEME_DIR}"
	doins -r ${PN}
}
