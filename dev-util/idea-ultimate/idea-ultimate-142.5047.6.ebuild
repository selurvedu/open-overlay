# Copyright open-overlay 2015 by Alex

EAPI=5
inherit eutils versionator

SLOT="0"
RDEPEND=">=virtual/jdk-1.7
        !dev-util/idea-community"
MY_PN="idea"
RESTRICT="strip"
QA_TEXTRELS="opt/${P}/bin/libbreakgen.so"
DESCRIPTION="IntelliJ IDEA is an intelligent Java IDE (Ultimate Edition)"
HOMEPAGE="http://jetbrains.com/idea/"
SRC_URI="http://download-cf.jetbrains.com/${MY_PN}/${MY_PN}IU-142.5047.6.tar.gz"
LICENSE="Apache-2.0"
IUSE=""
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/${MY_PN}-IU-142.5047.6"

pkg_postinst() {
               echo 
               echo "This is EAP Intellij Idea 15"
               echo
}
src_install() {
local dir="/opt/${PN}"
insinto "${dir}"
doins -r *
fperms 755 "${dir}/bin/${MY_PN}.sh" "${dir}/bin/fsnotifier" "${dir}/bin/fsnotifier64"
newicon "bin/idea.png" "${PN}.png"
make_wrapper ${PN} ${dir}/bin/${MY_PN}.sh
make_desktop_entry ${PN} "IntelliJ IDEA(Ultimate Edition)" ${PN} "Development;IDE"
}
