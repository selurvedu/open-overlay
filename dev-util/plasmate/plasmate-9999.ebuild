# Copyright open-overlay 2015 by Alex

EAPI=5

DECLARATIVE_REQUIRED="always"
inherit kde4-base

MY_PN=${PN}-latest

DESCRIPTION="IDE for writing KDE Plasma/KWin components (themes, Plasmoids, runners, data engines)"
HOMEPAGE="https://projects.kde.org/projects/extragear/sdk/plasmate"
SRC_URI="http://anongit.kde.org/${PN}/${MY_PN}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="
	app-crypt/gpgme
	dev-libs/libattica
	dev-libs/soprano
	$(add_kdebase_dep kdepimlibs)
	$(add_kdebase_dep knewstuff)
"

RDEPEND="
	${DEPEND}
	dev-vcs/git
"

