# Copyright open-overlay 2015 by Alex

EAPI="5"

DESCRIPTION="Sub-meta package for the core applications integrated with GNOME 3"
HOMEPAGE="http://www.gnome.org/"
LICENSE="metapackage"
SLOT="3.0"
IUSE="+bluetooth +cdr cups"

# when unmasking for an arch
# double check none of the deps are still masked !
KEYWORDS="~amd64 ~arm ~ia64 ~ppc ~ppc64 ~x86"

# Note to developers:
# This is a wrapper for the core apps tightly integrated with GNOME 3
# gtk-engines:2 is still around because it's needed for gtk2 apps
RDEPEND="
	>=gnome-base/gnome-core-libs-${PV}[cups?]

	>=gnome-base/gnome-session-${PV}
	>=gnome-base/gnome-menus-3.10.1:3
	>=gnome-base/gnome-settings-daemon-3.14.2[cups?]
	>=gnome-base/gnome-control-center-3.14.2-r1[cups?]

	>=app-crypt/gcr-3.14.0
	>=gnome-base/nautilus-3.14.2-r1
	>=gnome-base/gnome-keyring-${PV}
	>=gnome-extra/evolution-data-server-3.12.9

	>=app-crypt/seahorse-3.15.92
	>=app-editors/gedit-3.14.3
	>=app-text/evince-3.14.2
	>=gnome-extra/gnome-contacts-3.14.2
	>=media-gfx/eog-${PV}
	>=media-video/totem-${PV}
	>=net-im/empathy-3.12.7
	>=x11-terms/gnome-terminal-${PV}

	>=gnome-extra/gnome-user-docs-3.15.92
	>=gnome-extra/yelp-${PV}

	>=x11-themes/gtk-engines-2.20.2:2
	>=x11-themes/adwaita-icon-theme-${PV}
	>=x11-themes/gnome-themes-standard-${PV}

	bluetooth? ( >=net-wireless/gnome-bluetooth-${PV} )
	cdr? ( >=app-cdr/brasero-3.12.0 )

	!gnome-base/gnome-applets
"
DEPEND=""

S="${WORKDIR}"
