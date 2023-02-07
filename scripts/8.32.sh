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
[ ! -d "bison-3.8.2" ] && tar -xf bison-3.8.2.tar.xz

cd bison-3.8.2

./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.8.2

make

make check

make install

EOT

touch "$LFS/sources/$(basename $0).done"