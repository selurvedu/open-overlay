# Copyright open-overlay 2015 by Alex

EAPI=5

inherit eutils versionator

SR="SR2"
RNAME="indigo"

SRC_URI="
	amd64? ( http://mirror.tspu.ru/eclipse/technology/epp/downloads/release/${RNAME}/${SR}/eclipse-jee-${RNAME}-${SR}-linux-gtk-x86_64.tar.gz -> eclipse-jee-${RNAME}-${SR}-linux-gtk-x86_64-${PV}.tar.gz )
	x86? ( http://mirror.tspu.ru/eclipse/technology/epp/downloads/release/${RNAME}/${SR}/eclipse-jee-${RNAME}-${SR}-linux-gtk.tar.gz -> eclipse-jee-${RNAME}-${SR}-linux-gtk-${PV}.tar.gz )
"
DESCRIPTION="Eclipse IDE for Java EE Developers"
HOMEPAGE="http://www.eclipse.org"

LICENSE="EPL-1.0"
SLOT="3.7"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=virtual/jdk-1.6
	 x11-libs/gtk+:2"

S=${WORKDIR}/eclipse

src_install() {
	local dest=/opt/${PN}-${SLOT}

	insinto ${dest}
	doins -r features icon.xpm plugins artifacts.xml p2 eclipse.ini configuration dropins

	exeinto ${dest}
	doexe eclipse

	dohtml -r about.html about_files epl-v10.html notice.html readme/*

	cp "${FILESDIR}"/eclipserc-bin "${T}" || die
	cp "${FILESDIR}"/eclipse-bin "${T}" || die
	sed "s@%SLOT%@${SLOT}@" -i "${T}"/eclipse{,rc}-bin || die

	insinto /etc
	newins "${T}"/eclipserc-bin eclipserc-bin-${SLOT}

	newbin "${T}"/eclipse-bin eclipse-bin-${SLOT}
	make_desktop_entry "eclipse-bin-${SLOT}" "Eclipse ${PV} (bin)" "${dest}/icon.xpm"
}

