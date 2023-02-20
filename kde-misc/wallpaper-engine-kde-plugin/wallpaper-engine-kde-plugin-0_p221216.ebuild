# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="A kde wallpaper plugin integrating wallpaper engine"
HOMEPAGE="https://github.com/catsout/wallpaper-engine-kde-plugin"
EGIT_REPO_URI="https://github.com/catsout/wallpaper-engine-kde-plugin.git"
EGIT_COMMIT="8f167c3"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""
RESTRICT="mirror"

DEPEND="dev-qt/qtwebsockets
	dev-python/websockets"

src_configure() {
	mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
	)
	cmake_src_configure
}
