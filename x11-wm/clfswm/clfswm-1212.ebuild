#Copyright open-overlay 2015 by Alex

EAPI=5

inherit eutils multilib common-lisp-3 autotools

DESCRIPTION="100% Common Lisp X11 window manager (based on Tinywm and Stumpwm)"
HOMEPAGE="http://common-lisp.net/project/clfswm"
SRC_URI="http://common-lisp.net/project/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND="dev-lisp/clisp 
         dev-lisp/clx"

S=${WORKDIR}/${P}


src_install() {
        emake DESTDIR="${ED}"/usr install 
        dodoc README Changelog 
}

pkg_postinst() {
	elog "Clfswm will compile itself into \$XDG_CACHE_HOME!"
	elog "You make sure the variable is set."
	elog ""
	elog "If you want to use different lisp-implementations"
	elog "change the script '/usr/bin/clfswm'."
        elog "Thanks open-overlay by Alex"
}
