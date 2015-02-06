# Copyright open-overlay 2015 by Alex

EAPI=5
PYTHON_DEPEND="3:3.2"

DESCRIPTION="Gis Weather applet"
HOMEPAGE="https://github.com/RingOV/gis-weather"
SRC_URI="https://codeload.github.com/RingOV/gis-weather/tar.gz/master -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/pygobject:3
	dev-libs/gobject-introspection[cairo]
	<=x11-libs/gtk+-3.12.2
	gnome-base/librsvg
	dev-libs/libappindicator
	dev-lang/python:3.3"

RDEPEND="${DEPEND}"

src_unpack() {
        unpack ""
	mv "${PN}-master" "${P}"	
}


src_install() {
        insinto /usr/share/icons
        doins -r gis-weather
        dodoc README.md
}
