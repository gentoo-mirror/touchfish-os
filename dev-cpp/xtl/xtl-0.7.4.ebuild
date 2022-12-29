# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Basic tools (containers, algorithms) used by other quantstack packages"
HOMEPAGE="https://github.com/xtensor-stack/xtl"
SRC_URI="https://github.com/xtensor-stack/xtl/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"
RESTRICT="mirror"
