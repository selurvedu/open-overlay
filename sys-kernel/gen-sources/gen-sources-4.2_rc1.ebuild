# Copyright open-overlay 2015 by Alex


EAPI="5"
UNIPATCH_STRICTORDER="yes"
K_NOUSENAME="yes"
K_NOSETEXTRAVERSION="yes"
K_NOUSEPR="yes"
K_SECURITY_UNSUPPORTED="yes"
K_DEBLOB_AVAILABLE=0
K_BASE_VER=4.1
ETYPE="sources"
CKV="${PVR/-r/-git}"

# only use this if it's not an _rc/_pre release
[ "${PV/_pre}" == "${PV}" ] && [ "${PV/_rc}" == "${PV}" ] && OKV="${PV}"
inherit kernel-2
detect_version

KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
HOMEPAGE="http://kernel.org"
IUSE="deblob"

DESCRIPTION="Full sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
SRC_URI="${KERNEL_URI}"

RDEPEND=""
DEPEND="${RDEPEND}
	>=sys-devel/patch-2.7.4"

src_prepare() {
        epatch "${FILESDIR}/1500_XATTR_USER_PREFIX.patch"
        epatch "${FILESDIR}/2900_dev-root-proc-mount-fix.patch"     
        epatch "${FILESDIR}/2905_2disk-resume-image-fix.patch"
        epatch "${FILESDIR}/4567_distro-Gentoo-Kconfig.patch"
        epatch "${FILESDIR}/5000_enable-additional-cpu-optimizations-for-gcc.patch"
}
pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
