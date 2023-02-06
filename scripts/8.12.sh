#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/m4-1.4.19-2nd-done" ] && exit 0 || echo

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
[ ! -d "m4-1.4.19" ] && tar -xf m4-1.4.19.tar.xz

cd m4-1.4.19

./configure --prefix=/usr

make

make check

make install

EOT

touch "$LFS/sources/m4-1.4.19-2nd-done"