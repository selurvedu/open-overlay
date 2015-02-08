# Copyright open-overlay by Alex

EAPI=5
inherit games

DESCRIPTION="A 2d soccer game"
HOMEPAGE="http://sourceforge.net/projects/tuxfootball/"
SRC_URI="http://garr.dl.sourceforge.net/project/${PN}/0.3/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-libs/sdl-mixer
	media-libs/sdl-image
	media-libs/libsdl"
DEPEND="dev-util/intltool
	sys-devel/gettext
	${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog README || die "dodoc failed"

	make_desktop_entry ${PN} Tuxfootball

	prepgamesdirs
}
