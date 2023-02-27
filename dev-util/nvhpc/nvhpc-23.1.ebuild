# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

DESCRIPTION="NVIDIA HPC SDK"
HOMEPAGE="https://developer.nvidia.com/hpc-sdk"
SRC_URI="https://developer.download.nvidia.com/hpc-sdk/ubuntu/amd64/nvhpc-${PV//./-}_${PV}_amd64.deb
    https://developer.download.nvidia.com/hpc-sdk/ubuntu/amd64/nvhpc-${PV//./-}-cuda-multi_${PV}_amd64.deb"
_cuda_version=12.0
_nvhpc_prefix="/opt/nvidia/hpc_sdk/Linux_x86_64/${PV}"

LICENSE=EULA
SLOT="${PV}"
KEYWORDS=""
IUSE=""

RESTRICT="mirror strip"

DEPEND=""
RDEPEND="sys-cluster/rdma-core[neigh]"
BDEPEND=""

QA_PREBUILT="*"

src_unpack() {
    unpack_deb nvhpc-${PV//./-}_${PV}_amd64.deb
    unpack_deb nvhpc-${PV//./-}-cuda-multi_${PV}_amd64.deb
    S="${WORKDIR}"
}

src_prepare() {
    default
    mv ${S}/usr/share/doc/nvhpc-${PV//./-} ${S}/usr/share/doc/nvhpc-${PV} || die
    mv ${S}/usr/share/doc/nvhpc-${PV//./-}-cuda-multi/changelog.gz ${S}/usr/share/doc/nvhpc-${PV}/cuda-multi-changelog.gz || die
    rm -rf ${S}/usr/share/doc/nvhpc-${PV//./-}-cuda-multi || die
    gzip -d ${S}/usr/share/doc/nvhpc-${PV}/*.gz || die

    rm -f ${S}${_nvhpc_prefix}/comm_libs/mpi/lib/lib{ibverbs.so*,rdmacm.so*,nl-3.so*,nl-route-3.so*} || die
}

src_install() {
    mv "${S}"/{opt,usr} "${D}" || die
}

pkg_config() {
    ${_nvhpc_prefix}/compilers/bin/makelocalrc -x ${_nvhpc_prefix}/compilers/bin || die
    rm -f ${_nvhpc_prefix}/compilers/glibc_version || die
    for i in nccl nvshmem; do
        ln -s "${_cuda_version}/$i" "${_nvhpc_prefix}/comm_libs/$i"
    done
    for i in bin include lib64 nvvm; do
        ln -s "${_cuda_version}/$i" "${_nvhpc_prefix}/cuda/$i"
    done
    for i in include lib64; do
        ln -s "${_cuda_version}/$i" "${_nvhpc_prefix}/math_libs/$i"
    done
}

pkg_prerm() {
    # delete localrc
    rm -f ${_nvhpc_prefix}/compilers/bin/localrc* || die

    # delete symlinks
    for i in nccl nvshmem; do
        rm -f "${_nvhpc_prefix}/comm_libs/$i"
    done
    for i in bin include lib64 nvvm; do
        rm -f "${_nvhpc_prefix}/cuda/$i"
    done
    for i in include lib64; do
        rm -f "${_nvhpc_prefix}/math_libs/$i"
    done
}

pkg_postinst() {
    ewarn "Remember to configure the package before use it:"
    ewarn "   emerge --config '=dev-util/${PF}'"
    ewarn "Also remember to re-configure it after gcc is upgraded."
    ewarn ""
    ewarn "I recommend to use sys-cluster/modules to manage environment variables. for example:"
    ewarn "   . /usr/share/Modules/init/zsh"
    ewarn "   module use /opt/nvidia/hpc_sdk/modulefiles"
    ewarn "   module load nvhpc/${PV}"
}
