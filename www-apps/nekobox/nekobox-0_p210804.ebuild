# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd go-module

DESCRIPTION="Anonymous question box"
HOMEPAGE="https://github.com/NekoWheel/NekoBox"
go-module_set_globals

_commit=ef5daf796593ac388f662f6e98102a238afee78c

SRC_URI="https://github.com/NekoWheel/NekoBox/archive/${_commit}.zip -> ${P}.zip
	https://github.com/CHN-beta/gentoo-go-dep/releases/download/${P}/${P}-deps.tar.xz"
RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="dev-lang/go"
DEPEND=""
RDEPEND=""

S="${WORKDIR}/NekoBox-${_commit}"

src_compile() {
	ego build -v -work -o "bin/nekobox" -trimpath -ldflags "-s -w" .
}

src_install() {
	dobin bin/nekobox

	insinto /etc/nekobox
	newins conf/app.sample.conf nekobox.conf
	systemd_dounit "${FILESDIR}/nekobox.service"

	dosym ../../../../etc/nekobox/nekobox.conf /usr/share/nekobox/conf/app.conf
}
