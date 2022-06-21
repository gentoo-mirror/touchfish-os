
# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="NVIDIA HPC SDK modulefiles"
SRC_URI=""

SLOT=0
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror strip"

DEPEND="sys-cluster/modules"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install() {
    install -Dm755 "${FILESDIR}/nvhpc.sh" "${D}/etc/profile.d/nvhpc.sh" || die
}
