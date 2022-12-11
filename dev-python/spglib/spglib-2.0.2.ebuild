# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{9,10,11} )

inherit distutils-r1

DESCRIPTION="Python bindings for spglib."
HOMEPAGE="https://spglib.github.io/spglib/"
SRC_URI="https://github.com/spglib/spglib/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/spglib-${PV}/python"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test mirror"

DEPEND="
	${PYTHON_DEPS}
	~sci-libs/spglib-${PV}"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"
