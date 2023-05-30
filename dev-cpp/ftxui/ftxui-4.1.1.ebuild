# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ Functional Terminal User Interface."
HOMEPAGE="https://github.com/ArthurSonzogni/FTXUI"
SRC_URI="https://github.com/ArthurSonzogni/FTXUI/archive/refs/tags/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="example doc"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
S="${WORKDIR}/FTXUI-${PV}"

RESTRICT="mirror"

src_configure() {
	mycmakeargs=(
		-DFTXUI_ENABLE_INSTALL=ON
		-DFTXUI_BUILD_EXAMPLES=$(usex example)
		-DFTXUI_BUILD_TESTS=OFF
		-DFTXUI_BUILD_DOCS=$(usex doc)
		-DCMAKE_BUILD_TYPE=Release
	)
	cmake_src_configure
}
