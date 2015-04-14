# Copyright open-overlay 2015 by Alex

EAPI=5

DESCRIPTION="The Xfce Desktop Environment (meta package)"
HOMEPAGE="http://www.xfce.org/"
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 sparc x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~ia64-linux ~x86-linux"
IUSE="minimal +svg"

RDEPEND=">=x11-themes/gtk-engines-xfce-3:0
	x11-themes/hicolor-icon-theme
	=xfce-base/xfce4-appfinder-4.8.0
	=xfce-base/xfce4-panel-4.8.0
	=xfce-base/xfce4-session-4.8.0
	=xfce-base/xfce4-settings-4.8.0
	=xfce-base/xfdesktop-4.8.0
	=xfce-base/xfwm4-4.8.0
	!minimal? (
		media-fonts/dejavu
		virtual/freedesktop-icon-theme
		)
	svg? ( gnome-base/librsvg )"
