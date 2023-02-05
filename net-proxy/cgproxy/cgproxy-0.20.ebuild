# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Transparent Proxy with cgroup v2."
HOMEPAGE="https://github.com/springzfx/cgproxy"
SRC_URI="https://github.com/springzfx/cgproxy/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
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
