# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools git-r3 desktop xdg

DESCRIPTION="Vsim visualizes atomic structures such as crystals, grain boundaries, molecules and so on."
HOMEPAGE="https://gitlab.com/l_sim/v_sim"

EGIT_REPO_URI="https://gitlab.com/l_sim/v_sim.git"
EGIT_COMMIT="79d1907"

LICENSE="CeCILL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

src_prepare() {
	default
	./autogen.sh || die
}

src_install() {
	default

	# remove .la files
	find "${D}" -name '*.la' -delete || die

	# delete symlink in doc, then decompress all .bz2 and .gz files
	pushd "${D}/usr/share/doc/${PF}" || die
	find . -type l -delete || die
	find . -name '*.bz2' -exec bunzip2 {} \; || die
	find . -name '*.gz' -exec gunzip {} \; || die
	popd || die

	# create desktop file
	make_desktop_entry v_sim "vsim" "v_sim" "Science;Physics"
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
