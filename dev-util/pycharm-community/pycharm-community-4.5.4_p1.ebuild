# Copyright open-overlay 2015 by Alex

EAPI="5"

inherit eutils versionator

MY_PV="$(get_version_component_range 1-3)"

DESCRIPTION="PyCharm"
HOMEPAGE="www.jetbrains.com/pycharm/"
SRC_URI="http://download-cf.jetbrains.com/python/${PN}-${MY_PV}.tar.gz"

LICENSE="Apache-2.0 BSD CDDL MIT-with-advertising"
KEYWORDS="x86 amd64"

DEPEND=">=virtual/jre-1.6"
RDEPEND="${DEPEND}"

SLOT="0"

S="${WORKDIR}/${PN}-${MY_PV}"

QA_PRESTRIPPED="opt/pycharm-community/lib/libpty/linux/x86_64/libpty.so
                opt/pycharm-community/lib/libpty/linux/x86/libpty.so"
src_install()
{	
	# copy files
  dodir /opt/${PN}
	insinto /opt/${PN}
	doins -r *
	
  # fix perms
  fperms a+x /opt/${PN}/bin/pycharm.sh || die "fperms failed"
	fperms a+x /opt/${PN}/bin/fsnotifier || die "fperms failed"
	fperms a+x /opt/${PN}/bin/fsnotifier64 || die "fperms failed"
	fperms a+x /opt/${PN}/bin/inspect.sh || die "fperms failed"
	
  # symlink
  dosym /opt/${PN}/bin/pycharm.sh /usr/bin/${PN}

  # desktop entry
	mv "bin/pycharm.png" "bin/${PN}.png"
  doicon "bin/${PN}.png"
	make_desktop_entry ${PN} "PyCharm (Community)" /opt/${PN}/bin/${PN}.png
}
