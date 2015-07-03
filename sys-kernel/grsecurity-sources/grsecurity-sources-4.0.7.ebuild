# Copyright open-overlay 2015 by Alex

EAPI="5"
K_NOUSENAME="yes"
K_NOSETEXTRAVERSION="yes"
K_SECURITY_UNSUPPORTED="1"
K_DEBLOB_AVAILABLE="0"
ETYPE="sources"
inherit kernel-2
detect_version

DESCRIPTION="Full sources including the Grsecurity patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
HOMEPAGE="http://www.grsecurity.net"
SRC_URI="${KERNEL_URI}"

RDEPEND=""
DEPEND="${RDEPEND}
	>=sys-devel/patch-2.7.4"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE="deblob"

src_prepare() {
        epatch "${FILESDIR}/grsecurity-3.1-4.0.7-201506300712.patch"
}
pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
