# Copyright open-overlay 2015 by Alex

EAPI=5

inherit eutils versionator

SR=R
RNAME="luna"


DESCRIPTION="Eclipse IDE for C/C++"
HOMEPAGE="http://www.eclipse.org"
SRC_URI="
	amd64? ( http://mirror.tspu.ru/eclipse/technology/epp/downloads/release/${RNAME}/${SR}/eclipse-cpp-${RNAME}-${SR}-linux-gtk-x86_64.tar.gz -> eclipse-cpp-${RNAME}-${SR}-linux-gtk-x86_64-${PV}.tar.gz )
	x86? ( http://mirror.tspu.ru/eclipse/technology/epp/downloads/release/${RNAME}/${SR}/eclipse-cpp-${RNAME}-${SR}-linux-gtk.tar.gz -> eclipse-cpp-${RNAME}-${SR}-linux-gtk-${PV}.tar.gz )"

LICENSE="EPL-1.0"
SLOT="9999"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=virtual/jdk-1.6
	x11-libs/gtk+:2"
        >=sys-devel/gcc-4.8.3

S=${WORKDIR}/eclipse

src_install() {
	local dest=/opt/${PN}-${SLOT}

	insinto ${dest}
	doins -r features icon.xpm plugins artifacts.xml p2 eclipse.ini configuration dropins

	exeinto ${dest}
	doexe eclipse

	dohtml -r about.html about_files epl-v10.html notice.html readme/*

	insinto /etc
	newbin "${T}"/eclipse-cpp-${SLOT} eclipse-cpp-${SLOT}
	make_desktop_entry "eclipse-bin-${SLOT}" "Eclipse ${PV} (bin)" "${dest}/icon.xpm"
}



