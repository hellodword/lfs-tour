#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/$(basename $0).done" ] && exit 0 || echo

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
[ ! -d "tar-1.34" ] && tar -xf tar-1.34.tar.xz

cd tar-1.34

FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr

make

make check 2>&1 | tee tar-check-log || [ $(cat tar-check-log | grep FAILED | wc -l) == 1 ]

make install
make -C doc install-html docdir=/usr/share/doc/tar-1.34

EOT

touch "$LFS/sources/$(basename $0).done"