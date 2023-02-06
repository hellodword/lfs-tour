#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/zlib-1.2.12-done" ] && exit 0 || echo

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
[ ! -d "zlib-1.2.12" ] && tar -xf zlib-1.2.12.tar.xz

cd zlib-1.2.12

./configure --prefix=/usr

make

make check

make install

rm -fv /usr/lib/libz.a

EOT

touch "$LFS/sources/zlib-1.2.12-done"