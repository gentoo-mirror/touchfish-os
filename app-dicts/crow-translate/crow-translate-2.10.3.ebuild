# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="A simple and lightweight translator."
HOMEPAGE="https://github.com/crow-translate/crow-translate"
EGIT_REPO_URI="https://github.com/crow-translate/crow-translate.git"
EGIT_COMMIT="${PV}"

LICENSE="GPL-3"
SLOT="0"
# KEYWORDS="~amd64"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT="mirror"

src_configure() {
	mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
	)
	cmake_src_configure
}
