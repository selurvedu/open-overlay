# Copyright open-overlay 2015 by Alex

EAPI=5


MOZ_FTP_URI="ftp://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/2015/03/2015-03-13-mozilla-aurora-debug//"

inherit eutils

DESCRIPTION="Firefox Developer Edition"
HOMEPAGE="https://www.mozilla.org/en-US/firefox/developer/"
SRC_URI="${SRC_URI}
	amd64? ( ${MOZ_FTP_URI}/firefox-38.0a2.en-US.debug-linux-x86_64.tar.bz2 -> ${P}-x86_64.tar.bz2 )
        x86? ( ${MOZ_FTP_URI}/firefox-38.0a2.en-US.debug-linux-i686.tar.bz2  -> ${P}-i686.tar.bz2 )"

LICENSE="MPL-2.0 GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""


S="${WORKDIR}/firefox"

src_install() {
	dodir /opt
	mv "${S}" "${D}/opt/firefox-developer"

	dodir /usr/bin
	cat <<-EOF >"${D}"/usr/bin/${PN}
	#!/bin/sh
	unset LD_PRELOAD
	LD_LIBRARY_PATH="/opt/firefox-developer/"
	GTK_PATH=/usr/lib/gtk-2.0/
	exec /opt/firefox-developer/firefox-bin "\$@"
	EOF
	fperms 0755 /usr/bin/${PN}
}

