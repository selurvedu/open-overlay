#Copyright open-overlay 2015 by Alex

EAPI=5
inherit cmake-utils

DESCRIPTION="Haguichi provides a user friendly GUI to control the Hamachi client on Linux."
LICENSE="GPLv3"
HOMEPAGE="https://www.haguichi.net/"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
SRC_URI="https://launchpadlibrarian.net/214304354/${P}.tar.xz"

RDEPEND="sys-devel/gettext
         dev-util/cmake
         dev-lang/vala:0.26
         dev-libs/glib
         x11-libs/gtk+:3
         x11-libs/libnotify"

DEPEND=${RDEPEND}

src_prepare() {
	cmake-utils_src_prepare
}

src_configure() {
        local mycmakeargs=( .. -DCMAKE_INSTALL_PREFIX=/usr )
        cmake-utils_src_configure          
}

src_install() { 
                  doexe "/usr/bin/haguichi"
}
