# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Transparent Proxy with cgroup v2."
HOMEPAGE="https://github.com/springzfx/cgproxy"
SRC_URI="https://github.com/springzfx/cgproxy/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""
RESTRICT="mirror"

DEPEND="
	dev-cpp/nlohmann_json
	dev-libs/libbpf"
RDEPEND="${DEPEND}"
BDPEND="dev-util/cmake"

PATCHES=(
	"${FILESDIR}/${PN}-0.20-not-compress-man.patch"
)

src_configure() {
	mycmakeargs=(
		-Dbuild_execsnoop_dl=ON
		-Dbuild_static=OFF
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
}

pkg_postinst() {
	elog "To use cgproxy, the following kernel options might be needed:"
	elog "CONFIG_DEBUG_INFO CONFIG_DEBUG_INFO_BTF CONFIG_FTRACE CONFIG_FTRACE_SYSCALLS"
	elog "You could enable it using the following command and rebuild the kernel."
	elog "To use cgproxy with docker or other programs(that load br_netfilter module),"
	elog "you might need set additional sysctl options and kernel options, see README.md."
	elog "br_netfilter module might should be loaded before set the sysctl options,"
	elog "see example 2 & 3 on https://www.freedesktop.org/software/systemd/man/sysctl.d.html ."
	elog "For more information, please refer to the README.md in the source code."
}
