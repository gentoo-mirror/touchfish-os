# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3 udev

DESCRIPTION="Helo keyboard driver for Lenovo Yoga book YB1-X91F"
HOMEPAGE="https://github.com/jekhor/chromiumos_touch_keyboard"
EGIT_REPO_URI="https://github.com/CHN-beta/chromiumos_touch_keyboard.git"
EGIT_COMMIT=f83e374

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	cmake_src_install
	default
	mv "${D}/usr/etc" "${D}/etc" || die
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
