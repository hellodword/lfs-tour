#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/texinfo-6.8-done" ] && exit 0 || echo

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
[ ! -d "texinfo-6.8" ] && tar -xf texinfo-6.8.tar.xz

cd texinfo-6.8

./configure --prefix=/usr

make

make install

EOT

touch "$LFS/sources/texinfo-6.8-done"