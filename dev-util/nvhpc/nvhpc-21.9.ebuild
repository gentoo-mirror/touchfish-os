# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
_CUDA_VER=11.4

DESCRIPTION="NVIDIA HPC SDK"
HOMEPAGE="https://developer.nvidia.com/hpc-sdk"
SRC_URI="https://developer.download.nvidia.com/hpc-sdk/${PV}/${PN}_20${PV:0:2}_${PV//.}_Linux_x86_64_cuda_${_CUDA_VER}.tar.gz -> ${P}.tar.gz"

LICENSE=EULA
SLOT=${PV}
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror strip"

DEPEND="sys-process/numactl virtual/jre sys-cluster/modules dev-util/nvhpc-modulefiles"
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PREBUILT="*"

S="${WORKDIR}/${PN}_20${PV:0:2}_${PV//.}_Linux_x86_64_cuda_${_CUDA_VER}"

src_configure() {
	default
    sed -i "s/en_US\.UTF\-8/C/g" "install_components/Linux_x86_64/${PV}/compilers/bin/makelocalrc" || die
}

src_install() {
    addpredict /dev/nvidiactl

    NVHPC_SILENT=true \
    NVHPC_INSTALL_DIR="${D}/opt/nvidia" \
    bash ./install || die

    # Remove references to $pkgdir from module files
    cd "${D}/opt/nvidia/modulefiles" || die
    find . -type f -exec sed -i "s@${D}@@g" {} \; || die

    # Install license
    cd "${S}/install_components/Linux_x86_64/${PV}/compilers/license" || die
    install -Dm644 LICENSE.txt "${D}/usr/share/licenses/${P}/LICENSE.txt" || die

    rm -r "${D}/opt/nvidia/Linux_x86_64/20${PV:0:2}" || die
}
