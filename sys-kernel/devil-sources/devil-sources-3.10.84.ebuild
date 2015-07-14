# Copyright open-overlay 2015 by Alex <a.xarlanov29@gmail.com>
# Distributed under the terms of the GNU General Public License v3 
# $Heaver: $ 


EAPI="5"
K_NOUSENAME="yes"
K_NOSETEXTRAVERSION="yes"
K_SECURITY_UNSUPPORTED="1"
K_DEBLOB_AVAILABLE="1"
ETYPE="sources"
inherit kernel-2
detect_version

DESCRIPTION="Full sources for the Linux kernel with my devil-linux-logo.patch"
HOMEPAGE="https://github.com/pantera31752/open-overlay"
SRC_URI="${KERNEL_URI}"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE="deblob"


src_prepare() {
        epatch "${FILESDIR}/devil-linux-logo.patch"
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
