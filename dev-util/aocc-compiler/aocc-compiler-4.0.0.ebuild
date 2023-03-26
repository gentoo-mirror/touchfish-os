# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

DESCRIPTION="AMD Optimizing C/C++ and Fortran Compilers"
HOMEPAGE="https://www.amd.com/en/developer/aocc.html"
SRC_URI="https://download.amd.com/developer/eula/aocc-compiler/aocc-compiler-${PV}_1_amd64.deb"

LICENSE=EULA
SLOT="${PV}"
KEYWORDS=""
IUSE=""

RESTRICT="mirror strip"

DEPEND="dev-libs/libxml2 sys-libs/ncurses-compat dev-libs/rocr-runtime"
RDEPEND=""
BDEPEND=""

QA_PREBUILT="*"

src_unpack() {
    unpack_deb aocc-compiler-${PV}_1_amd64.deb
    S="${WORKDIR}"
}

src_install() {
    mv "${S}"/opt "${D}" || die
}

