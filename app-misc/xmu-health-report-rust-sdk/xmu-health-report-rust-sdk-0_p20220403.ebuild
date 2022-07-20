# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aes-0.7.5
	anyhow-1
	base64-0.13.0
	block-modes-0.8.1
	chrono-0.4.19
	clap-3.0.0-beta.4
	rand-0.8.4
	regex-1.5.4
	reqwest-0.11
	tokio-1
	serde-1.0.130
	serde_json-1.0.68
"

inherit cargo

DESCRIPTION="Automatically complete XMU's daily health report."
HOMEPAGE="https://github.com/kirainmoe/auto-daily-health-report"
SRC_URI="$(cargo_crate_uris)"

LICENSE="
	|| ( Apache-2.0 Apache-2.0-with-LLVM-exceptions MIT )
	|| ( Apache-2.0 BSD-2 MIT )
	|| ( Apache-2.0 Boost-1.0 )
	|| ( Apache-2.0 MIT )
	|| ( Apache-2.0 MIT ZLIB )
	|| ( MIT Unlicense )
	Apache-2.0
	BSD
	BSD-2
	CC0-1.0
	ISC
	MIT
	MPL-2.0
	ZLIB
	WTFPL-2
"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND=">=virtual/rust-1.59"
DEPEND=">=dev-libs/libgit2-1.2.0:="
RDEPEND="${DEPEND}"

QA_FLAGS_IGNORED="usr/bin/starship"

src_configure() {
	export PKG_CONFIG_ALLOW_CROSS=1
	export LIBGIT2_SYS_USE_PKG_CONFIG=1
	export OPENSSL_NO_VENDOR=true

	cargo_src_configure
}

src_install() {
	cargo_src_install

	einstalldocs
}
