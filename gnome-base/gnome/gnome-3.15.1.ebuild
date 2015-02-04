# Copyright open-overlay 2015 by Alex

EAPI="5"

DESCRIPTION="Meta package for GNOME 3, merge this package to install"
HOMEPAGE="http://www.gnome.org/"

LICENSE="metapackage"
SLOT="2.0" # Cannot be installed at the same time as gnome-2

# when unmasking for an arch
# double check none of the deps are still masked !
KEYWORDS="~amd64 ~arm"

IUSE="accessibility +bluetooth +classic +cdr cups +extras"

S=${WORKDIR}

# TODO: check accessibility completeness
# GDM-3.0 integrates very nicely with GNOME Shell
RDEPEND="
	>=gnome-base/gnome-core-libs-3.14.1[cups?]
	>=gnome-base/gnome-core-apps-3.14.1[cups?,bluetooth?,cdr?]

	>=gnome-base/gdm-3.14.1

	>=x11-wm/mutter-3.14.3
	>=gnome-base/gnome-shell-3.14.2 [bluetooth?]

	>=x11-themes/gnome-backgrounds-3.14.1
	x11-themes/sound-theme-freedesktop

	accessibility? (
		>=app-accessibility/at-spi2-atk-2.15.3
		>=app-accessibility/at-spi2-core-2.15.1
		>=app-accessibility/caribou-0.4.16
		>=app-accessibility/orca-3.14.3
		>=gnome-extra/mousetweaks-3.12.0 )
	classic? ( >=gnome-extra/gnome-shell-extensions-3.14.3 )
	extras? ( >=gnome-base/gnome-extra-apps-3.14.0 )
"

DEPEND=""

PDEPEND=">=gnome-base/gvfs-1.22.3[udisks]"
