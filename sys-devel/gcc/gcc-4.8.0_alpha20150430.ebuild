# Copyright open-overlay 2015 by Alex

EAPI="5"
GCC_FILESDIR="${PORTDIR}/sys-devel/gcc/files"

inherit eutils toolchain

KEYWORDS=""
IUSE="debug"

RDEPEND=""
DEPEND="${RDEPEND}
	>=${CATEGORY}/binutils-2.20"

if [[ ${CATEGORY} != cross-* ]] ; then
	PDEPEND="${PDEPEND} elibc_glibc? ( >=sys-libs/glibc-2.12 )"
fi

src_prepare() {
	toolchain_src_prepare

	use debug && GCC_CHECKS_LIST="yes"
}
