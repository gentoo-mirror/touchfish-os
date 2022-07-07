# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="a gui frontend to gdb"
HOMEPAGE="https://github.com/epasveer/seer"
SRC_URI="https://github.com/epasveer/seer/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtprintsupport:5
	dev-qt/qtcharts:5"
RDEPEND="${DEPEND}"

S="${WORKDIR}/seer-${PV}/src"
