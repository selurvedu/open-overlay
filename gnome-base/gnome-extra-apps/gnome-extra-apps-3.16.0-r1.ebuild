# Copyright open-overlay 2015 by Alex

EAPI="5"

DESCRIPTION="Sub-meta package for the applications of GNOME 3"
HOMEPAGE="http://www.gnome.org/"
LICENSE="metapackage"
SLOT="3.0"
IUSE="+games +shotwell +tracker"

# when unmasking for an arch
# double check none of the deps are still masked !
KEYWORDS="~amd64 ~x86"

# Note to developers:
# This is a wrapper for the extra apps integrated with GNOME 3
# New package
RDEPEND="
	>=gnome-base/gnome-core-libs-${PV}

	>=app-admin/gnome-system-log-3.9.90
	>=app-arch/file-roller-${PV}
	>=app-dicts/gnome-dictionary-${PV}
	>=gnome-extra/gconf-editor-3
	>=gnome-extra/gnome-calculator-3.14.1
	>=gnome-extra/gnome-power-manager-${PV}
	>=gnome-extra/gnome-search-tool-3.6
	>=gnome-extra/gnome-system-monitor-${PV}
	>=gnome-extra/gnome-tweak-tool-${PV}
	>=gnome-extra/gnome-weather-${PV}
	>=gnome-extra/gnome-user-share-3.14.2
	>=gnome-extra/gucharmap-3.14.2
	>=gnome-extra/nautilus-sendto-3.8.2
	>=gnome-extra/sushi-3.12.0
	>=mail-client/evolution-3.12.9
	>=media-gfx/gnome-font-viewer-${PV}
	>=media-gfx/gnome-screenshot-${PV}
	>=media-sound/sound-juicer-${PV}
	>=media-video/cheese-${PV}
	>=net-analyzer/gnome-nettool-3.8
	>=net-misc/vinagre-${PV}
	>=net-misc/vino-${PV}
	>=sys-apps/baobab-${PV}
	>=sys-apps/gnome-disk-utility-${PV}
	>=www-client/epiphany-3.12

	games? (
		>=games-arcade/gnome-nibbles-${PV}
		>=games-arcade/gnome-robots-${PV}
		>=games-board/four-in-a-row-${PV}
		>=games-board/gnome-chess-${PV}
		>=games-board/gnome-mahjongg-${PV}
		>=games-board/gnome-mines-${PV}
		>=games-board/iagno-${PV}
		>=games-board/tali-3.14.0
		>=games-puzzle/five-or-more-${PV}
		>=games-puzzle/gnome-klotski-${PV}
		>=games-puzzle/gnome-sudoku-${PV}
		>=games-puzzle/gnome-tetravex-${PV}
		>=games-puzzle/hitori-3.14.3
		>=games-puzzle/lightsoff-${PV}
		>=games-puzzle/quadrapassel-${PV}
		>=games-puzzle/swell-foop-${PV} )
	shotwell? ( >=media-gfx/shotwell-0.20 )
	tracker? (
		>=app-misc/tracker-1.2
		>=gnome-extra/gnome-documents-${PV}
		>=media-gfx/gnome-photos-3.14.2
		>=media-sound/gnome-music-${PV} )
"
DEPEND=""
S=${WORKDIR}
