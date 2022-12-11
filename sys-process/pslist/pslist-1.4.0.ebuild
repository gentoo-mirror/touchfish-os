# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="list all child processes for a given process ID"
HOMEPAGE="https://devel.ringlet.net/sysutils/pslist/"
SRC_URI="https://devel.ringlet.net/files/sys/${PN}/${P}.tar.xz"

LICENSE=('BSD')
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

RDEPEND="dev-lang/perl"

src_install() {
	dobin pslist
	dosym -r /usr/bin/pslist /usr/bin/rkill
	dosym -r /usr/bin/pslist /usr/bin/rrenice
	doman pslist.1
	dodoc README
}
