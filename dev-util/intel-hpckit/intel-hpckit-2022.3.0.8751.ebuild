# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# apt-cache depends --recurse intel-hpckit | grep ^intel | sort | xargs apt download --print-uris | awk '{print $1}' | sed "s/'\(.*\)'/\1/"

EAPI=8

inherit unpacker

DESCRIPTION="Intel® oneAPI HPC Toolkit"
HOMEPAGE="https://www.intel.com/content/www/us/en/developer/tools/oneapi/toolkits.html"
SRC_URI="https://apt.repos.intel.com/oneapi/pool/main/intel-basekit-2022.3.0-8767_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-hpckit-2022.3.0-8751_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-advisor-2022.3.0-8704_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ccl-2021.7.0-2021.7.0-8733_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ccl-devel-2021.7.0-2021.7.0-8733_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ccl-devel-2021.7.0-8733_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-clck-2021.7.0-2021.7.0-8708_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-clck-2021.7.0-8708_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-2022.2.0-2022.2.0-8734_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-2022.2.0-8734_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-2022.2.0-2022.2.0-8734_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-2022.2.0-8734_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-runtime-2022.2.0-2022.2.0-8734_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-classic-fortran-shared-runtime-2022.2.0-2022.2.0-8734_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-runtime-2022.2.0-2022.2.0-8734_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-fortran-2022.2.0-2022.2.0-8734_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-fortran-2022.2.0-8734_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-fortran-runtime-2022.2.0-2022.2.0-8734_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-shared-2022.2.0-2022.2.0-8734_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-shared-runtime-2022.2.0-2022.2.0-8734_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-condaindex-2022.2.0-8695_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dal-2021.7.0-2021.7.0-8746_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dal-daal4py-2021.7.0-2021.7.0-8746_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dal-devel-2021.7.0-2021.7.0-8746_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dal-devel-2021.7.0-8746_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dal-scikit-learn-intelex-2021.7.0-2021.7.0-8746_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dev-utilities-2021.7.0-2021.7.0-8698_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dev-utilities-2021.7.0-8698_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-diagnostics-utility-2022.1.1-8702_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dnnl-2022.2.0-8750_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dnnl-devel-2022.2.0-8750_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dpcpp-cpp-2022.2.0-2022.2.0-8734_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dpcpp-ct-2022.2.0-2022.2.0-8701_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dpcpp-ct-2022.2.0-8701_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dpcpp-debugger-2021.7.0-2021.7.0-8700_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dpcpp-debugger-2021.7.0-8700_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-inspector-2022.3.0-8706_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ipp-2021.6.1-2021.6.1-8749_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ipp-devel-2021.6.1-2021.6.1-8749_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ipp-devel-2021.6.1-8749_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ippcp-2021.6.1-2021.6.1-8714_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ippcp-devel-2021.6.1-2021.6.1-8714_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ippcp-devel-2021.6.1-8714_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-itac-2021.7.0-2021.7.0-8707_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-itac-2021.7.0-8707_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-libdpstd-devel-2021.7.1-2021.7.1-8713_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-libdpstd-devel-2021.7.1-8713_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-2022.2.0-2022.2.0-8748_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-devel-2022.2.0-2022.2.0-8748_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-devel-2022.2.0-8748_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mpi-2021.7.0-2021.7.0-8711_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mpi-devel-2021.7.0-2021.7.0-8711_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mpi-devel-2021.7.0-8711_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-onevpl-2022.2.0-2022.2.0-8703_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-onevpl-devel-2022.2.0-2022.2.0-8703_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-onevpl-devel-2022.2.0-8703_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-openmp-2022.2.0-2022.2.0-8734_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-python-2022.2.0-8762_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-tbb-2021.7.0-2021.7.0-8712_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-tbb-devel-2021.7.0-2021.7.0-8712_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-tbb-devel-2021.7.0-8712_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-vtune-2022.4.0-8705_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-basekit-getting-started-2022.3.0-8767_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-hpckit-getting-started-2022.3.0-8751_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-common-licensing-2022.2.0-2022.2.0-8694_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-common-licensing-2022.2.0-8694_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-common-vars-2022.2.0-8694_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-cpp-eclipse-cfg-2022.2.0-8734_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-common-2022.2.0-2022.2.0-8734_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-common-2022.2.0-2022.2.0-8734_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-eclipse-cfg-2022.2.0-8734_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-fortran-common-2022.2.0-2022.2.0-8734_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-shared-common-2022.2.0-2022.2.0-8734_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dal-common-2021.7.0-2021.7.0-8746_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dal-common-devel-2021.7.0-2021.7.0-8746_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dev-utilities-eclipse-cfg-2021.7.0-8698_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dpcpp-ct-eclipse-cfg-2022.2.0-8701_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dpcpp-debugger-eclipse-cfg-2021.7.0-8700_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-icc-eclipse-plugin-cpp-2022.2.0-2022.2.0-8734_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ipp-common-2021.6.1-2021.6.1-8749_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ipp-common-devel-2021.6.1-2021.6.1-8749_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ippcp-common-2021.6.1-2021.6.1-8714_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ippcp-common-devel-2021.6.1-2021.6.1-8714_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-common-2022.2.0-2022.2.0-8748_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-common-devel-2022.2.0-2022.2.0-8748_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-openmp-common-2022.2.0-2022.2.0-8734_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-tbb-common-2021.7.0-2021.7.0-8712_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-tbb-common-devel-2021.7.0-2021.7.0-8712_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-vtune-eclipse-plugin-vtune-2022.4.0-8705_all.deb"

LICENSE=EULA
SLOT=0
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror strip"

DEPEND="x11-libs/libdrm
	x11-libs/libpciaccess
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXfixes
	virtual/libcrypt"
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PREBUILT="*"

src_unpack() {
	for uri in ${SRC_URI}
	do
		unpack_deb ${uri##*/}
	done
    S="${WORKDIR}"
}

src_install() {
    mv "${S}/opt" "${D}" || die
}































































































