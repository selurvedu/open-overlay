# Copyright open-overlay 2015 by Alex

EAPI=5
inherit eutils versionator

SLOT="0"
RDEPEND=">=virtual/jdk-1.7
        !dev-util/idea-community"

MY_PV="$(get_version_component_range 1-3)"
MY_VERSION_STRING="$(get_version_component_range 4-6)"
MY_PN="idea"

RESTRICT="strip"
QA_TEXTRELS="opt/${PN}-${MY_PV}/bin/libbreakgen.so"
QA_PRESTRIPPED="opt/${PN}-${MY_PV}/lib/libpty/linux/x86/libpty.so
	opt/${PN}-${MY_PV}/lib/libpty/linux/x86_64/libpty.so
	opt/${PN}-${MY_PV}/bin/libyjpagent-linux.so
	opt/${PN}-${MY_PV}/bin/libyjpagent-linux64.so"

DESCRIPTION="IntelliJ IDEA is an intelligent Java IDE (Ultimate Edition)"
HOMEPAGE="http://jetbrains.com/idea/"
SRC_URI="http://download-cf.jetbrains.com/${MY_PN}/${MY_PN}IU-${MY_PV}.tar.gz"
LICENSE="Apache-2.0"
IUSE=""
KEYWORDS="amd64 x86"
S="${WORKDIR}/${MY_PN}-IU-${MY_VERSION_STRING}"

src_install() {

local dir="/opt/${PN}-{MY_PV}"
insinto "${dir}"
doins -r *
fperms 755 "${dir}/bin/${MY_PN}.sh" "${dir}/bin/fsnotifier" "${dir}/bin/fsnotifier64"
newicon "bin/idea.png" "${PN}.png"
make_wrapper ${PN} ${dir}/bin/${MY_PN}.sh
	# recommended by: https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
	mkdir -p "${D}/etc/sysctl.d/"
	echo "fs.inotify.max_user_watches = 524288" > "${D}/etc/sysctl.d/30-idea-inotify-watches.conf"

make_desktop_entry ${PN} "IntelliJ IDEA(Ultimate Edition)" ${PN} "Development;IDE"
}
