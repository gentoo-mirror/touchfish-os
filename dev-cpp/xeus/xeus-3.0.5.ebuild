# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ implementation of the Jupyter Kernel protocol"
HOMEPAGE="https://github.com/jupyter-xeus/xeus"
SRC_URI="https://github.com/jupyter-xeus/xeus/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

DEPEND="
	>=dev-cpp/xtl-0.7.0
	<dev-cpp/xtl-0.8.0
	>=dev-cpp/nlohmann_json-3.2.0"
RDEPEND="${DEPEND}"
BDEPEND=""
