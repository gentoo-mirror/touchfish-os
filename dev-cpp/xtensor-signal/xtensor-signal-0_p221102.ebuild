# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# broken, request xsimd-9.0.1

EAPI=8

inherit cmake git-r3

DESCRIPTION="Signal processing features based on xtensor"
HOMEPAGE="https://github.com/xtensor-stack/xtensor-signal"
EGIT_REPO_URI="https://github.com/xtensor-stack/${PN}.git"
EGIT_COMMIT=5f5ddb1

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS=""
IUSE=""
RESTRICT="mirror"

DEPEND="
	>=dev-cpp/xtensor-0.24.0
	>=dev-cpp/xsimd-9.0.1"
RDEPEND="${DEPEND}"
BDEPEND=""
