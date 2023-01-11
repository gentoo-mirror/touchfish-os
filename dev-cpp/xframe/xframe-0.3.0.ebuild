# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ multi-dimensional labeled arrays and dataframe based on xtensor"
HOMEPAGE="https://github.com/xtensor-stack/xframe"
SRC_URI="https://github.com/xtensor-stack/xframe/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

DEPEND="
	>=dev-cpp/xtensor-0.21.4"
RDEPEND="${DEPEND}"
BDEPEND=""
