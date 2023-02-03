# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Fast, disk space efficient package manager"
HOMEPAGE="https://github.com/pnpm/pnpm"
SRC_URI="https://github.com/pnpm/pnpm/releases/download/v${PV}/pnpm-linux-x64 -> pnpm-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RESTRICT="mirror"

DEPEND=""
RDEPEND=""
BDEPEND=""

S="${WORKDIR}"

QA_PREBUILT="*"

src_install() {
	mkdir -p "${D}/usr/bin" || die
	cp "${DISTDIR}/pnpm-${PV}" "${D}/usr/bin/pnpm" || die
	chmod 755 "${D}/usr/bin/pnpm" || die
}
