# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Fast, modern C++ DSP framework, FFT, Sample Rate Conversion, FIR/IIR/Biquad Filters"
HOMEPAGE="https://github.com/kfrlib/kfr"
SRC_URI="https://github.com/kfrlib/kfr/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS=""

PATCHES=(
	"${FILESDIR}/install-into-lib64.patch"
)

src_configure() {
	export CXX=clang++
	local mycmakeargs=(
        -DCMAKE_CXX_COMPILER=clang++
        -DKFR_ENABLE_CAPI_BUILD=ON
	)
	cmake_src_configure
}
