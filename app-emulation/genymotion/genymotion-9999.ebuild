# Copyright open-overlay 2015 by Alex
EAPI=5
inherit eutils versionator

DESCRIPTION="Official icon theme vibrancy."
HOMEPAGE="http://gnome-look.org"
SRC_URI="https://github.com/manson9/${PN}/archive/master.tar.gz -> ${P}.tar.gz"
LICENSE="Genymotion"
SLOT="0"
KEYWORDS="amd64"
RDEPEND="
      >=app-emulation/virtualbox-4.3.18
"
src_unpack() {
unpack "${A}"
mv "${PN}-master" "${P}"
}
src_install() {
insinto /usr/share/
doins -r genymotion
fperms 755 "/usr/share/genymotion/genymotion"
newicon "/usr/share/genymotion/icon.png" "${PN}.png"
make_wrapper ${PN} /usr/share/genymotion/genymotion
make_desktop_entry ${PN} "Genymotion" ${PN} "System;Emulator"
