# Copyright open-overlay 2015 by Alex

EAPI="5"
inherit eutils versionator

SLOT="0"
RDEPEND=">=virtual/jdk-1.7"
MY_PN="idea"

DESCRIPTION="IntelliJ IDEA is an intelligent Java IDE (Community Edition)"
HOMEPAGE="http://www.jetbrains.com/idea"
SRC_URI="http://download-cf.jetbrains.com/${MY_PN}/${MY_PN}IC-14.0.3.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"
IUSE=""
KEYWORDS="~x86 amd64"
S="${WORKDIR}/${P}"

src_install() {
local dir="/opt/${P}"

insinto "${dir}"
doins -r *
fperms 755 "{dir}/bin/${MY_PN}".sh "${dir}/bin/fsontifier" "${dir}/bin/fsontifier64"

newicon "bin/${MY_PN}.png" "idea-community.png"
make_wrapper "idea-community" "/opt/${P}/bin/${MY_PN}.sh"
make_desktop_entry "idea-community" "IntelliJ IDEA(Community Edition)" "idea-community" "Development;IDE"
}