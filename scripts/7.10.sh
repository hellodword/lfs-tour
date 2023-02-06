#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/Python-3.10.6-done" ] && exit 0 || echo

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
[ ! -d "Python-3.10.6" ] && tar -xf Python-3.10.6.tar.xz

cd Python-3.10.6

./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip

make

make install

EOT

touch "$LFS/sources/Python-3.10.6-done"