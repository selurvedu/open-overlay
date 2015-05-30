# Copyright open-overlay 2015 by Alex

EAPI="5"
UNIPATCH_STRICTORDER="yes"
K_NOUSENAME="yes"
K_NOSETEXTRAVERSION="yes"
K_NOUSEPR="yes"
K_SECURITY_UNSUPPORTED="yes"
K_DEBLOB_AVAILABLE=0
ETYPE="sources"
CKV="4.99"

inherit kernel-2
detect_version

DESCRIPTION="Live -git version of the Linux kernel"
HOMEPAGE="https://github.com/torvalds/linux"
EGIT_REPO_URI="git://github.com/torvalds/linux.git"

KEYWORDS=""
IUSE=""

K_EXTRAEINFO="This kernel is not supported by Gentoo due to its unstable and
experimental nature. If you have any issues, try a matching vanilla-sources
ebuild -- if the problem is not there, please contact the upstream kernel
developers at http://bugzilla.kernel.org and on the linux-kernel mailing list to
report the problem so it can be fixed in time for the next kernel release."

RDEPEND=""
DEPEND="${RDEPEND}
	>=sys-devel/patch-2.7.5"

pkg_postinst() {
	postinst_sources
}
