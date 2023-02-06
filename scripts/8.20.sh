#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/mpfr-4.1.0-done" ] && exit 0 || echo

sudo chown root:root "$LFS/sources"
sudo chown root:root $LFS/sources/*

sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin \
    /bin/bash --login <<"EOT"

set -x
set -e

cd /sources
[ ! -d "mpfr-4.1.0" ] && tar -xf mpfr-4.1.0.tar.xz

cd mpfr-4.1.0

./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.1.0

make
make html

make check

make install
make install-html

EOT

touch "$LFS/sources/mpfr-4.1.0-done"