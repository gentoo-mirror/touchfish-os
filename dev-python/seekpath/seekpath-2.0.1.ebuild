# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{9,10,11} )

inherit distutils-r1

DESCRIPTION="Obtain and visualize k-vector coefficients and obtain band paths."
HOMEPAGE="https://seekpath.readthedocs.io/en/latest/"
SRC_URI="https://github.com/giovannipizzi/seekpath/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

DEPEND="${PYTHON_DEPS}"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test mirror"
