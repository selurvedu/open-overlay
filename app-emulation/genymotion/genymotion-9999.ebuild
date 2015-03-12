# Copyright open-overlay 2015 by Alex
EAPI=5
inherit eutils 

DESCRIPTION="Genymotion Emulator"
HOMEPAGE="http://genymotion.com"
SRC_URI="https://github.com/manson9/${PN}/archive/master.tar.gz -> ${P}.tar.gz"
LICENSE="Genymotion"
SLOT="0"
KEYWORDS="amd64"
RDEPEND="|| ( >=app-emulation/virtualbox-4.3.18 >=app-emulation/virtualbox-bin-4.3.18 )
        >=dev-qt/qtwebkit-4.8.5"      

src_unpack() {
unpack "${A}"
mv "${PN}-master" "${P}"
}
src_install() {
local dir="/opt/${PN}"
insinto ${dir}
doins -r *
fperms 755 "/${dir}/genymotion/genymotion"
newicon "genymotion/icon.png" "genymotion.png" 
make_wrapper ${PN} ${dir}/genymotion/genymotion 
make_desktop_entry ${PN} "Genymotion" ${PN} "System;Emulator"
}
