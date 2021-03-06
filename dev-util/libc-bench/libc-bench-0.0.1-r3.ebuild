# Copyright (c) 2011 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=2
CROS_WORKON_COMMIT="f753ff1b9271342abd3f58dbac13174b936406f3"
CROS_WORKON_TREE="fb0ecd51a4636d40f23ccfc7492087b17e28b1dd"
CROS_WORKON_PROJECT="chromiumos/third_party/libc-bench"

inherit cros-workon toolchain-funcs

DESCRIPTION="libc benchmark originally from
http://www.etalabs.net/src/libc-bench/"
HOMEPAGE="http://www.etalabs.net/src/libc-bench/"
SRC_URI=""
LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE=""

RDEPEND=""
DEPEND=""

src_compile() {
	tc-export CC CXX PKG_CONFIG
	emake || die "end compile failed."
}

src_install() {
	INSTALL_DIR=/usr/local/libc-bench/
	dodir $INSTALL_DIR
	exeinto $INSTALL_DIR
	doexe libc-bench
}
