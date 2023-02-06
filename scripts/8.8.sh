#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/xz-5.2.6-2nd-done" ] && exit 0 || echo

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
[ ! -d "xz-5.2.6" ] && tar -xf xz-5.2.6.tar.xz

cd xz-5.2.6

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.2.6

make

make check

make install

EOT

touch "$LFS/sources/xz-5.2.6-2nd-done"