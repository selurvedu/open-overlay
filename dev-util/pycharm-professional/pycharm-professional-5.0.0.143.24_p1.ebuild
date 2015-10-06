# Copyright open-overlay 2015 by Alex

EAPI="5"

inherit eutils versionator

MY_PV="$(get_version_component_range 1-3)"
MY_STRING_VERSION="$(get_version_component_range 4-5)"
DESCRIPTION="PyCharm"
HOMEPAGE="www.jetbrains.com/pycharm/"
SRC_URI="http://download.jetbrains.com/python/${PN}-${MY_STRING_VERSION}.tar.gz"

LICENSE="Apache-2.0 BSD CDDL MIT-with-advertising"
KEYWORDS="~x86 ~amd64"

DEPEND=">=virtual/jre-1.6"
RDEPEND="${DEPEND}"

SLOT="0"

S="${WORKDIR}/${PN}-${MY_STRING_VERSION}"

QA_PRESTRIPPED="opt/${PN}-${MY_PV}/lib/libpty/linux/x86_64/libpty.so
                opt/${PN}-${MY_PV}/lib/libpty/linux/x86/libpty.so"
src_prepare() {
        if ! use arm; then
		rm bin/fsnotifier-arm
	fi
}
pkg_postinst() {
                echo 
                echo "This is EAP Pycharm 5"
                echo        
}
src_install()
{	
	# copy files
  dodir /opt/${PN}-${MY_PV}
	insinto /opt/${PN}-${MY_PV}
	doins -r *
	
  # fix perms
  fperms a+x /opt/${PN}-${MY_PV}/bin/pycharm.sh || die "fperms failed"
	fperms a+x /opt/${PN}-${MY_PV}/bin/fsnotifier || die "fperms failed"
	fperms a+x /opt/${PN}-${MY_PV}/bin/fsnotifier64 || die "fperms failed"
	fperms a+x /opt/${PN}-${MY_PV}/bin/inspect.sh || die "fperms failed"
	
  # symlink
  dosym /opt/${PN}-${MY_PV}/bin/pycharm.sh /usr/bin/${PN}-${MY_PV}

  # desktop entry
	mv "bin/pycharm.png" "bin/${PN}-${MY_PV}.png"
  doicon "bin/${PN}-${MY_PV}.png"
	make_desktop_entry ${PN}-${MY_PV} "PyCharm (Professional)" /opt/${PN}-${MY_PV}/bin/${PN}-${MY_PV}.png
}

