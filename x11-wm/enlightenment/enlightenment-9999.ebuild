# Copyright open-overlay 2015 by Alex

EAPI="5"

inherit enlightenment git-2

DESCRIPTION="Live ebuild for Enlightenment window manager"

LICENSE="BSD-2"
KEYWORDS=""
SLOT="9999"
EGIT_REPO_URI="git://git.enlightenment.org/core/enlightenment.git"

# The @ is just an anchor to expand from
__EVRY_MODS=""
__CONF_MODS="
	+@applications +@comp +@dialogs +@display
	+@interaction +@intl +@menus
	+@paths +@performance +@randr +@shelves +@theme +@wallpaper2
	+@window-manipulation +@window-remembers"
__NORM_MODS="
	@access +@appmenu +@backlight +@bluez4 +@battery +@clock
	+@connman +@contact +@cpufreq +@everything +@fileman
	+@fileman-opinfo +@gadman +@ibar +@ibox +@illume2 +@mixer +@msgbus
	+@music-control +@notification +@pager +@quickaccess +@shot
	+@start +@syscon +@systray +@tasks +@teamwork +@temperature +@tiling
	+@winlist +@wizard @wl-desktop-shell @wl-screenshot +@xkbswitch"
IUSE_E_MODULES="
	${__CONF_MODS//@/enlightenment_modules_conf-}
	${__NORM_MODS//@/enlightenment_modules_}"

IUSE="pam spell static-libs systemd +udev ukit wayland ${IUSE_E_MODULES}"

RDEPEND="
	pam? ( sys-libs/pam )
	systemd? ( sys-apps/systemd )
	wayland? (
		dev-libs/efl[wayland]
		>=dev-libs/wayland-1.2.0
		>=x11-libs/pixman-0.31.1
		>=x11-libs/libxkbcommon-0.3.1
	)
	>=dev-libs/efl-${PV}[X]
	>=media-libs/elementary-${PV}
	x11-libs/xcb-util-keysyms"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PV}

src_prepare() {
	epatch "${FILESDIR}"/quickstart.diff
	enlightenment_src_prepare
}

src_configure() {
	E_ECONF=(
		--disable-install-sysactions
		$(use_enable doc)
		--disable-device-hal
		$(use_enable nls)
		$(use_enable pam)
		$(use_enable systemd)
		--enable-device-udev
		$(use_enable udev mount-eeze)
		$(use_enable ukit mount-udisks)
		$(use_enable wayland wayland-clients)
	)
	local u c
	for u in ${IUSE_E_MODULES} ; do
		u=${u#+}
		c=${u#enlightenment_modules_}
		E_ECONF+=( $(use_enable ${u} ${c}) )
	done
	enlightenment_src_configure
}

src_install() {
	enlightenment_src_install
	insinto /etc/enlightenment
	newins "${FILESDIR}"/gentoo-sysactions.conf sysactions.conf
}
