# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
ETYPE="sources"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="4"
K_SECURITY_UNSUPPORTED="1"
K_NOSETEXTRAVERSION="1"
XANMOD_VERSION="1"
XANMOD_URI="https://github.com/xanmod/linux/releases/download/"

HOMEPAGE="https://xanmod.org"
LICENSE+=" CDDL"
KEYWORDS="~amd64"

inherit kernel-2
detect_version

DESCRIPTION="kernel sources including xanmod, gentoo and apparmor(from ubuntu) patches."
SRC_URI="
	${KERNEL_BASE_URI}/linux-${KV_MAJOR}.${KV_MINOR}.tar.xz
	${XANMOD_URI}/${OKV}-xanmod${XANMOD_VERSION}/patch-${OKV}-xanmod${XANMOD_VERSION}.xz
	${GENPATCHES_URI}"

UNIPATCH_LIST+=" ${DISTDIR}/patch-${OKV}-xanmod${XANMOD_VERSION}.xz "

UNIPATCH_LIST+=" ${FILESDIR}/xanmod-apparmor-sources-5.17.0-apparmor-0.patch "
UNIPATCH_LIST+=" ${FILESDIR}/xanmod-apparmor-sources-5.17.0-apparmor-1.patch "
UNIPATCH_LIST+=" ${FILESDIR}/xanmod-apparmor-sources-5.17.0-apparmor-2.patch "

# excluding all minor kernel revision patches; XanMod will take care of that
UNIPATCH_EXCLUDE="${UNIPATCH_EXCLUDE} 1*_linux-${KV_MAJOR}.${KV_MINOR}.*.patch"

# excluding CPU optimizations patches, since it's included in XanMod too
UNIPATCH_EXCLUDE="${UNIPATCH_EXCLUDE} 5*_*cpu-optimization*.patch"
