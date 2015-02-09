# Copyright open-overlay 2015 by Alex

EAPI=5

inherit eutils games

DESCRIPTION="Syndicate Wars Port is a port of the 1996 DOS game Syndicate Wars to modern operating systems."
HOMEPAGE="http://swars.vexillium.org"
SRC_URI="http://swars.vexillium.org/files/${P}.tar.bz2"

LICENSE="GPL-3"

SLOT="0"

KEYWORDS="~x86"

IUSE=""
DEPEND="sys-devel/gcc"
RDEPEND="${DEPEND}
	dev-lang/python
	media-sound/vorbis-tools
	media-sound/cdparanoia
	media-libs/libsdl
	media-libs/openal
	media-libs/libogg
	media-libs/libpng
	sys-libs/zlib"


src_compile() {
	egamesconf || die "egamesconf failed"
	emake || die "emake failed"
}

src_install() {
	dogamesbin src/${PN} || die "dogamesbin failed"

	insinto "${GAMES_DATADIR}"/${PN}
	doins util/install || die "doins failed"
	dodoc doc/installing

	doicon icons/${PN}.ico
	make_desktop_entry ${PN} swars ${PN}.ico

	prepgamesdirs
}
pkg_postinst() {
        echo 
        elog "This port game Syndicate Wars only i386 processors"
        elog "Please report bugs compile swars of ebuild on my email:a.xarlanov@gmail.com"
        elog "or http://vk.com/mm05_01_1969"
        elog "Thanks (open-overlay 2015 by Alex)"
        echo 
}
