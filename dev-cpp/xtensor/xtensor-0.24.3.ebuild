# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ tensors with broadcasting and lazy computing"
HOMEPAGE="https://github.com/xtensor-stack/xtensor"
SRC_URI="https://github.com/xtensor-stack/xtensor/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

DEPEND="
	>=dev-cpp/xtl-0.7.0
	>=dev-cpp/xsimd-8.0.3"
RDEPEND="${DEPEND}"
BDEPEND=""
