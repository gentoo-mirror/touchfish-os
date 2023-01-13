# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{8..10} )
inherit cmake desktop xdg python-single-r1

DESCRIPTION="Open Visualization Tool"
HOMEPAGE="https://www.ovito.org/"
SRC_URI="https://gitlab.com/stuko/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.bz2
    https://www.ovito.org/wp-content/uploads/logo_rgb-768x737.png -> ovito.png"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc "
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RESTRICT="mirror"

DEPEND="sci-libs/fftw dev-lang/python sci-libs/netcdf media-video/ffmpeg dev-qt/qtcore:5"
RDEPEND="${DEPEND} ${PYTHON_DEPS}"
BDEPEND="dev-util/cmake dev-libs/boost x11-libs/qscintilla dev-qt/qtsvg dev-libs/libxslt dev-vcs/git
	doc? ( dev-python/sphinx_rtd_theme[${PYTHON_SINGLE_USEDEP}] )"

S="${WORKDIR}/${PN}-v${PV}"

src_prepare() {
	cp "${FILESDIR}/ovito.desktop" "${S}"
	sed -i 's/Mathematics;//' "${S}/ovito.desktop"
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DOpenGL_GL_PREFERENCE=GLVND
		-DOVITO_BUILD_DOCUMENTATION=$(usex doc ON OFF)
		-DOVITO_USE_PRECOMPILED_HEADERS=OFF
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	
	insinto /usr/share/pixmaps
	insopts -m644
	doins "${DISTDIR}/ovito.png"

	domenu "${S}/ovito.desktop"
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}

pkg_pretend() {
	einfo "OVITO comes with a lot of build options."
	einfo "This ebuild will respect its default settings, that will enable most of the functions, and usually enough to get you started."
	einfo "However, feel free to make issue or pr if you need more use flags."

	ewarn "kde-frameworks/kio comes with a bug that will cause OVITO to crash, see https://bugs.kde.org/show_bug.cgi?id=463309."
	ewarn "Apply this patch to temporarily fix it: https://invent.kde.org/frameworks/kio/-/commit/adad3bec21ebbc886f45ec2ae6065d6b6070fa93"
}
