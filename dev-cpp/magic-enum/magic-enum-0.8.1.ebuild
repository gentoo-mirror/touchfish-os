# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Static reflection for enums for modern C++"
HOMEPAGE="https://github.com/Neargye/magic_enum"
SRC_URI="https://github.com/Neargye/magic_enum/archive/refs/tags/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT="mirror"

S="${WORKDIR}/magic_enum-${PV}"

src_configure() {
	mycmakeargs=(
		-DMAGIC_ENUM_OPT_BUILD_EXAMPLES=OFF
		-DMAGIC_ENUM_OPT_BUILD_TESTS=OFF
	)
	cmake_src_configure
}
