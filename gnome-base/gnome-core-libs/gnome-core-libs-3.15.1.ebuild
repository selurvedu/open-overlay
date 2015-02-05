EAPI="5"

DESCRIPTION="Sub-meta package for the core libraries of GNOME 3"
HOMEPAGE="http://www.gnome.org/"
LICENSE="metapackage"
SLOT="3.0"
IUSE="cups python"

# when unmasking for an arch
# double check none of the deps are still masked !
KEYWORDS="~amd64 ~arm"

# Note to developers:
# This is a wrapper for the core libraries used by GNOME 3
RDEPEND="
	>=dev-libs/glib-2.42.0:2
	>=x11-libs/gdk-pixbuf-2.30.7:2
	>=x11-libs/pango-1.36.8
	>=media-libs/clutter-1.20.0:1.0
	>=x11-libs/gtk+-${PV}:3[cups?]
	>=dev-libs/atk-2.14.0
	>=x11-libs/libwnck-3.4.9:3
	>=gnome-base/librsvg-2.40.5
	>=gnome-base/gnome-desktop-${PV}:3
	>=x11-libs/startup-notification-0.12

	>=gnome-base/gvfs-1.22.1
	>=gnome-base/dconf-0.22.0

	>=media-libs/gstreamer-1.4.3:1.0
	>=media-libs/gst-plugins-base-1.4.3:1.0
	>=media-libs/gst-plugins-good-1.4.3:1.0
	python? ( >=dev-python/pygobject-3.14.0:3 )
"
DEPEND=""

S="${WORKDIR}"
