# Copyright open-overlay 2015 by Alex

EAPI="5"

inherit multilib

SRC_URI=""
DESCRIPTION="Meta ebuild for MATE, a traditional desktop environment"
HOMEPAGE="http://mate-desktop.org"

LICENSE="metapackage"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+base -bluetooth +themes +extras"

S="${WORKDIR}"

RDEPEND="
	>=mate-base/mate-desktop-1.9.90
	>=mate-base/mate-menus-1.9.90
	>=mate-base/mate-panel-1.9.90
	>=mate-base/mate-session-manager-1.9.90
	>=mate-base/mate-settings-daemon-1.9.90
	>=x11-wm/marco-1.8.2
	base? (
		>=mate-base/caja-1.9.90
		>=mate-base/mate-applets-1.9.1
		>=mate-base/mate-control-center-1.8.3
		>=mate-extra/mate-media-1.9.2
		>=x11-misc/mozo-1.8:0
		>=x11-terms/mate-terminal-1.9.1
	)
	bluetooth? ( net-wireless/blueman:0 )
	themes? (
		>=x11-themes/mate-backgrounds-1.9.90
		>=x11-themes/mate-icon-theme-1.9.90
	 	>=x11-themes/mate-themes-1.9.0
        )
	      
	extras? (
		>=app-arch/engrampa-1.9.2
		>=app-editors/pluma-1.9.1
		>=app-text/atril-1.9.2
		>=mate-extra/mate-calc-1.8:0
		>=mate-extra/mate-power-manager-1.9.0
		>=mate-extra/mate-screensaver-1.9.2
		>=mate-extra/mate-system-monitor-1.9.2
		>=mate-extra/mate-utils-1.9.1
		>=media-gfx/eom-1.9.1
	)
"

PDEPEND="virtual/notification-daemon:0"

# >=x11-themes/mate-themes-gtk-1.9.3 (I will fix later! Thanks open-overlay 2015 by Alex

pkg_postinst() {
        echo 
	elog "For installation, usage and troubleshooting details regarding MATE;"
	elog "read more about it at Gentoo Wiki: https://wiki.gentoo.org/wiki/MATE"
	elog "For support with mate-conf-import see the following MATE forum topic:"
	elog "http://forums.mate-desktop.org/viewtopic.php?f=16&t=1650" 
        elog "Please report bugs on my email:a.xarlanov29@gmail.com"
        elog "Thanks open-overlay 2015 by Alex"
        echo
}
