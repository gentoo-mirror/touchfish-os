# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# apt show intel-hpckit | grep Version | sed -E 's/-([0-9]+)$/\.\1/g'
# apt download --print-uris intel-hpckit
# apt show intel-hpckit | grep Depends | sed 's/: /:\n/g' | sed 's/, /\n/g' | sed -E 's/^(.*) \(>= (.*)\)$/>=\1-\2/g' | sed -E 's/-([0-9]+)$/\.\1/g' | sort

EAPI=8

inherit unpacker

DESCRIPTION="Intel® oneAPI HPC Toolkit"
HOMEPAGE="https://www.intel.com/content/www/us/en/developer/tools/oneapi/toolkits.html"
SRC_URI="https://apt.repos.intel.com/oneapi/pool/main/intel-hpckit-2023.0.0-25400_amd64.deb"

LICENSE=EULA
SLOT=0
KEYWORDS=""
IUSE=""

RESTRICT="mirror strip"

# >=intel-basekit-2023.0.0
# >=intel-hpckit-getting-started-2023.0.0.25400
# >=intel-oneapi-clck-2021.7.2.25333
# >=intel-oneapi-common-licensing-2023.0.0.25325
# >=intel-oneapi-common-vars-2023.0.0.25325
# >=intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-2023.0.0.25370
# >=intel-oneapi-compiler-fortran-2023.0.0.25370
# >=intel-oneapi-dev-utilities-2021.8.0.25328
# >=intel-oneapi-diagnostics-utility-2022.2.0.25337
# >=intel-oneapi-inspector-2023.0.0.25340
# >=intel-oneapi-itac-2021.8.0.25341
# >=intel-oneapi-mpi-devel-2021.8.0.25329

DEPEND="
	>=dev-util/intel-basekit-2023.0.0
	>=dev-util/intel-hpckit-getting-started-2023.0.0.25400
	>=dev-util/intel-oneapi-common-vars-2023.0.0.25325
	>=dev-util/intel-oneapi-common-licensing-2023.0.0.25325
	>=dev-util/intel-oneapi-dev-utilities-2021.8.0.25328
	>=dev-util/intel-oneapi-inspector-2023.0.0.25340
	>=dev-util/intel-oneapi-itac-2021.8.0.25341
	>=dev-util/intel-oneapi-clck-2021.7.2.25333
	>=dev-util/intel-oneapi-diagnostics-utility-2022.2.0.25337
	>=dev-util/intel-oneapi-mpi-devel-2021.8.0.25329
	>=dev-util/intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-2023.0.0.25370
	>=dev-util/intel-oneapi-compiler-fortran-2023.0.0.25370"
RDEPEND="${DEPEND}"
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