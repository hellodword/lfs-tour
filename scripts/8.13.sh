#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/bc-6.0.1-done" ] && exit 0 || echo

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
[ ! -d "bc-6.0.1" ] && tar -xf bc-6.0.1.tar.xz

cd bc-6.0.1

CC=gcc ./configure --prefix=/usr -G -O3 -r

make

make test

make install

EOT

touch "$LFS/sources/bc-6.0.1-done"