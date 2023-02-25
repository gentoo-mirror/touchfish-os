# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# apt-cache depends --recurse intel-hpckit 2> /dev/null | grep -E "^intel-(hpckit|basekit|oneapi)" | sort | xargs apt download --print-uris 2> /dev/null | awk '{print $1}' | sed "s/'\(.*\)'/\1/" | sort

EAPI=8

inherit unpacker

DESCRIPTION="Intel® oneAPI HPC Toolkit"
HOMEPAGE="https://www.intel.com/content/www/us/en/developer/tools/oneapi/toolkits.html"
SRC_URI="https://apt.repos.intel.com/oneapi/pool/main/intel-basekit-2023.0.0-25537_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-basekit-getting-started-2023.0.0-25537_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-hpckit-2023.0.0-25400_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-hpckit-getting-started-2023.0.0-25400_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-advisor-2023.0.0-25338_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ccl-2021.8.0-2021.8.0-25371_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ccl-devel-2021.8.0-2021.8.0-25371_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ccl-devel-2021.8.0-25371_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-clck-2021.7.3-2021.7.3-29533_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-clck-2021.7.3-29533_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-common-licensing-2023.0.0-2023.0.0-25325_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-common-licensing-2023.0.0-25325_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-common-vars-2023.0.0-25325_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-cpp-eclipse-cfg-2023.0.0-25370_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-2023.0.0-2023.0.0-25370_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-2023.0.0-25370_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-2023.0.0-2023.0.0-25370_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-2023.0.0-25370_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-common-2023.0.0-2023.0.0-25370_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-runtime-2023.0.0-2023.0.0-25370_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-classic-fortran-shared-runtime-2023.0.0-2023.0.0-25370_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-common-2023.0.0-2023.0.0-25370_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-runtime-2023.0.0-2023.0.0-25370_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-eclipse-cfg-2023.0.0-25370_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-fortran-2023.0.0-2023.0.0-25370_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-fortran-2023.0.0-25370_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-fortran-common-2023.0.0-2023.0.0-25370_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-fortran-runtime-2023.0.0-2023.0.0-25370_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-shared-2023.0.0-2023.0.0-25370_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-shared-common-2023.0.0-2023.0.0-25370_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-shared-runtime-2023.0.0-2023.0.0-25370_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-condaindex-2023.0.0-25326_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dal-2023.0.0-2023.0.0-25395_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dal-common-2023.0.0-2023.0.0-25395_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dal-common-devel-2023.0.0-2023.0.0-25395_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dal-devel-2023.0.0-2023.0.0-25395_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dal-devel-2023.0.0-25395_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dev-utilities-2021.8.0-2021.8.0-25328_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dev-utilities-2021.8.0-25328_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dev-utilities-eclipse-cfg-2021.8.0-25328_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-diagnostics-utility-2022.2.0-25337_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dnnl-2023.0.0-25399_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dnnl-devel-2023.0.0-25399_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dpcpp-cpp-2023.0.0-2023.0.0-25370_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dpcpp-ct-2023.0.0-2023.0.0-25483_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dpcpp-ct-2023.0.0-25483_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dpcpp-ct-eclipse-cfg-2023.0.0-25483_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dpcpp-debugger-2023.0.0-2023.0.0-25336_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dpcpp-debugger-2023.0.0-25336_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dpcpp-debugger-eclipse-cfg-2023.0.0-25336_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-icc-eclipse-plugin-cpp-2023.0.0-2023.0.0-25370_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-inspector-2023.0.0-25340_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ipp-2021.7.0-2021.7.0-25396_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ipp-common-2021.7.0-2021.7.0-25396_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ipp-common-devel-2021.7.0-2021.7.0-25396_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ipp-devel-2021.7.0-2021.7.0-25396_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ipp-devel-2021.7.0-25396_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ippcp-2021.6.3-2021.6.3-25343_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ippcp-common-2021.6.3-2021.6.3-25343_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ippcp-common-devel-2021.6.3-2021.6.3-25343_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ippcp-devel-2021.6.3-2021.6.3-25343_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-ippcp-devel-2021.6.3-25343_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-itac-2021.8.0-2021.8.0-25341_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-itac-2021.8.0-25341_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-libdpstd-devel-2022.0.0-2022.0.0-25335_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-libdpstd-devel-2022.0.0-25335_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mpi-2021.8.0-2021.8.0-25329_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mpi-devel-2021.8.0-2021.8.0-25329_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mpi-devel-2021.8.0-25329_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-onevpl-2023.0.0-2023.0.0-25332_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-onevpl-devel-2023.0.0-2023.0.0-25332_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-onevpl-devel-2023.0.0-25332_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-openmp-2023.0.0-2023.0.0-25370_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-openmp-common-2023.0.0-2023.0.0-25370_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-tbb-2021.8.0-2021.8.0-25334_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-tbb-common-2021.8.0-2021.8.0-25334_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-tbb-common-devel-2021.8.0-2021.8.0-25334_all.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-tbb-devel-2021.8.0-2021.8.0-25334_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-tbb-devel-2021.8.0-25334_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-vtune-2023.0.0-25339_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-vtune-eclipse-plugin-vtune-2023.0.0-25339_all.deb
"

LICENSE=EULA
SLOT=0
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror strip"

DEPEND=""
RDEPEND="=sci-libs/mkl-2023.0.0.25398"
BDEPEND=""

QA_PREBUILT="*"
S="${WORKDIR}"

src_unpack() {
	for uri in ${SRC_URI}
	do
		unpack_deb ${uri##*/}
	done
}

src_install() {
    mv "${S}/opt" "${D}" || die
}

src_postinst() {
	/opt/intel/oneapi/modulefiles-setup.sh || die
}
