# Copyright open-overlay 2015 by Alex

EAPI="5"
UNIPATCH_STRICTORDER="yes"
K_NOUSENAME="yes"
K_NOSETEXTRAVERSION="yes"
K_NOUSEPR="yes"
K_SECURITY_UNSUPPORTED="yes"
K_DEBLOB_AVAILABLE=0
ETYPE="sources"
CKV="3.99"

inherit kernel-2
detect_version

DESCRIPTION="Live -git version of the Linux kernel"
HOMEPAGE="https://github.com/torvalds/linux"
EGIT_REPO_URI="git://github.com/torvalds/linux.git"

KEYWORDS=""
IUSE=""

K_EXTRAEINFO="GNU/Linux"

RDEPEND=""
DEPEND="${RDEPEND}
	>=sys-devel/patch-2.7.5"

pkg_postinst() {
	postinst_sources
}
